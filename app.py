from flask import Flask, render_template, request, session, redirect, jsonify
import x
import uuid
import time, calendar
from icecream import ic
from flask_session import Session
from werkzeug.security import generate_password_hash
from werkzeug.security import check_password_hash
ic.configureOutput(prefix=f'----- | ', includeContext=True)

app = Flask(__name__)

app.config['SESSION_TYPE'] = 'filesystem'
Session(app)

##############################
@app.get("/signup")
@x.no_cache
def show_signup():
    try:
        user = session.get("user", "")
        return render_template("page_signup.html", user=user, x=x)
    except Exception as ex:
        ic(ex)
        return "ups"
##############################
@app.get("/")
@x.no_cache
def show_index():
    try:
        user = session.get("user", "")
        return render_template("page_index.html", user=user)
    except Exception as ex:
        ic(ex)
        return "ups"
##############################
@app.get("/login")
@x.no_cache
def show_login():
    try:
        user = session.get("user", "")
        if user: return redirect("/profile")  # TODO: Redirect to profile page if logged in
        return render_template("page_login.html", x=x)
    except Exception as ex:
        ic(ex)
        return "ups", 500
##############################
@app.get("/create-travel")
@x.no_cache
def show_create_travel():
    try:
        user = session.get("user", "")
        return render_template("page_create_travel.html", user=user, x=x)
    except Exception as ex:
        ic(ex)
        return "ups", 500
##############################
@app.get("/travel/<travel_pk>")
@x.no_cache
def show_travel_by_travel_pk(travel_pk):
    try:
        travel_pk = x.validate_uuid4()
        
        db, cursor = x.db()

        q = """SELECT travels.*, cities.*, countries.*, 
        users.user_first_name, users.user_last_name
        FROM travels
        INNER JOIN cities ON travels.city_fk = cities.city_pk
        INNER JOIN countries ON cities.country_fk = countries.country_pk
        INNER JOIN users ON travels.user_fk = users.user_pk
        WHERE travel_pk = %s
        ORDER BY travels.travel_created_at DESC;"""
        cursor.execute(q, (travel_pk,))
        travel = cursor.fetchone()
        if not travel:
            return "Travel not found", 404
        user = session.get("user", "")
        return render_template("page_travel.html", user=user, x=x, travel=travel)
    except Exception as ex:
        ic(ex)
        return "ups", 500
    finally:
        if "cursor" in locals(): cursor.close()
        if "db" in locals(): db.close()
    
##############################
@app.post("/api-create-user")
def api_create_user():
    try:
        user_email = x.validate_user_email()
        user_password = x.validate_user_password()
        user_first_name = x.validate_user_first_name()
        user_last_name = x.validate_user_last_name()
        user_hashed_password = generate_password_hash(user_password)
        user_created_at = int(time.time())
        user_updated_at = user_created_at # Don't like empty cells + creation = update?

        user_pk = uuid.uuid4().hex

        db, cursor = x.db()

        q = "INSERT INTO users VALUES(%s, %s, %s, %s, %s, %s, %s)"
        
        cursor.execute(q, (user_pk, user_email, user_hashed_password, user_first_name, user_last_name, user_created_at, user_updated_at))
        db.commit()

        q2 = "SELECT * FROM users WHERE user_pk = %s"
        cursor.execute(q2, (user_pk,))
        user = cursor.fetchone()
        user.pop("user_password")
        session["user"] = user
        return f"""
                <browser mix-redirect="/"></browser>
                """ # TODO: Make it login and create session 
    except Exception as ex:
        ic(ex)
        if "Duplicate entry" in str(ex) and "user_email" in str(ex):
            return "Email already in the system", 400

        if "company_exception user_email" in str(ex):
            ic(ex)
            return "User email invalid", 400

        if "company_exception user_password" in str(ex):
            tip = render_template("___tip.html", message="Invalid password, password must be between 8-60 characters", status="error")
            return f"""<browser mix-update="#tooltip">{tip}</browser>""", 400

        if "company_exception user_first_name" in str(ex):
            tip = render_template("___tip.html", message="Invalid first name, first name must be between 2-20 characters", status="error")
            return f"""<browser mix-update="#tooltip">{tip}</browser>""", 400

        if "company_exception user_last_name" in str(ex):
            tip = render_template("___tip.html", message="Invalid last name, last name must be between 2-20 characters", status="error")
            return f"""<browser mix-update="#tooltip">{tip}</browser>""", 400

        return "Service under maintenance", 500
        
    finally:
        if "cursor" in locals(): cursor.close()
        if "db" in locals(): db.close()
##############################
@app.get("/api-get-countries")
def get_countries():
    try:
        db, cursor = x.db()
        q = "SELECT country_name FROM countries"
        cursor.execute(q)
        countries = cursor.fetchall()
        return jsonify(countries)
    except Exception as ex:
        ic(ex)
        return "ups"
    finally:
        if "cursor" in locals(): cursor.close()
        if "db" in locals(): db.close()
##############################
@app.get("/api-get-current-user")
def api_get_current_user():
    try:
        user = session.get("user", "")
        return jsonify(user)
    except Exception as ex:
        ic(ex)
        return "ups", 500
##############################
@app.get("/api-get-travel/<travel_pk>")
def get_travel_by_travel_pk(travel_pk):
    try:
        travel_pk = x.validate_uuid4()
        db, cursor = x.db()
        q = """
        SELECT travels.*, cities.*, countries.*, 
        users.user_first_name, users.user_last_name
        FROM travels
        INNER JOIN cities ON travels.city_fk = cities.city_pk
        INNER JOIN countries ON cities.country_fk = countries.country_pk
        INNER JOIN users ON travels.user_fk = users.user_pk
        WHERE travel_pk = %s
        ORDER BY travels.travel_created_at DESC;  
        """
        cursor.execute(q, (travel_pk,))
        travel = cursor.fetchone()
        return jsonify(travel)
    except Exception as ex:
        ic(ex)
        return "ups", 500
    finally:
        if "cursor" in locals(): cursor.close()
        if "db" in locals(): db.close()
#########################################
@app.get("/api-get-travels-by-user")
def get_travels_by_user():
    try:
        user = session.get("user", "")
        db, cursor = x.db()
        q = """
        SELECT travels.*, cities.*, countries.*, 
        users.user_first_name, users.user_last_name
        FROM travels
        INNER JOIN cities ON travels.city_fk = cities.city_pk
        INNER JOIN countries ON cities.country_fk = countries.country_pk
        INNER JOIN users ON travels.user_fk = users.user_pk
        WHERE users.user_pk = %s
        ORDER BY travels.travel_created_at DESC;  
        """
        cursor.execute(q, (user["user_pk"],))
        travels = cursor.fetchall()
        return jsonify(travels)
    except Exception as ex:
        ic(ex)
        return "ups", 500
    finally:
        if "cursor" in locals(): cursor.close()
        if "db" in locals(): db.close()
##############################
@app.get("/api-get-travels")
def get_travels():
    try:
        db, cursor = x.db()
        q = """SELECT travels.*, cities.*, countries.*, 
        users.user_first_name, users.user_last_name
        FROM travels
        INNER JOIN cities ON travels.city_fk = cities.city_pk
        INNER JOIN countries ON cities.country_fk = countries.country_pk
        INNER JOIN users ON travels.user_fk = users.user_pk
        ORDER BY travels.travel_created_at DESC;"""
        cursor.execute(q)
        travels = cursor.fetchall()
        return jsonify(travels)

    except Exception as ex:
        ic(ex)
        return "ups"
    finally:
        if "cursor" in locals(): cursor.close()
        if "db" in locals(): db.close()
####################################
@app.post("/api-create-travel")
def api_create_travel():
    try:
        user = session.get("user", "")
        # Validations first
        city_name = x.validate_city_name()
        city_region = x.validate_city_region()
        ic(user)
        country_name = x.validate_country_name()

        travel_title = x.validate_travel_title()
        travel_description = x.validate_travel_description()
        db, cursor = x.db()

        travel_date_from = x.validate_travel_date_from() 
        travel_date_to   = x.validate_travel_date_to()
        travel_created_at   = int(time.time())

        # Change to epoch format
        travel_date_from = calendar.timegm(time.strptime(travel_date_from, "%Y-%m-%d"))
        travel_date_to = calendar.timegm(time.strptime(travel_date_to, "%Y-%m-%d"))

        # TODO: Add validation to check that the travel_date_to is NOT before travel
        # _date_from


        country_q = "SELECT country_pk FROM countries WHERE country_name = %s"
        cursor.execute(country_q, (country_name,))
        country_row = cursor.fetchone()

        country_fk = country_row["country_pk"]

        city_fk_q = "SELECT city_pk FROM cities WHERE city_name = %s AND city_region = %s"
        cursor.execute(city_fk_q, (city_name, city_region))
        city_row = cursor.fetchone()

        if not city_row:
            city_q = "INSERT INTO cities VALUES(NULL, %s, %s, %s)"
            cursor.execute(city_q, (country_fk, city_name, city_region))
            db.commit()
            cursor.execute(city_fk_q, (city_name, city_region))
            city_row = cursor.fetchone()
        
        city_fk = city_row["city_pk"]

        travel_pk = uuid.uuid4().hex
        user_updated = int(time.time())
        travel_q = """INSERT INTO travels VALUES(%s, %s, %s, %s, %s, %s, %s, %s);""" 
        cursor.execute(travel_q, (travel_pk, travel_title, city_fk, user["user_pk"], travel_date_from, travel_date_to, travel_description, travel_created_at))
        db.commit()
        user_q = "UPDATE users SET user_updated_at = %s WHERE user_pk = %s"
        cursor.execute(user_q, (user_updated, user["user_pk"]))
        db.commit()  
        # There's gotta be an easier way to make the queries lol
        return f"""<browser mix-replace="form"></browser>
                <browser mix-redirect="/travel/{travel_pk}"></browser>""" # TODO: Make it redirect to created travel post 
    except Exception as ex:
        ic(ex)
        if "Duplicate entry" in str(ex) and "user_email" in str(ex):
            return "Email already in the system", 400

        if "company_exception user_email" in str(ex):
            ic(ex)
            return "User email invalid", 400

        if "company_exception user_password" in str(ex):
            tip = render_template("___tip.html", message="Invalid password, password must be between 8-60 characters", status="error")
            return f"""<browser mix-update="#tooltip">{tip}</browser>""", 400

        if "company_exception user_first_name" in str(ex):
            tip = render_template("___tip.html", message="Invalid first name, first name must be between 2-20 characters", status="error")
            return f"""<browser mix-update="#tooltip">{tip}</browser>""", 400

        if "company_exception user_last_name" in str(ex):
            tip = render_template("___tip.html", message="Invalid last name, last name must be between 2-20 characters", status="error")
            return f"""<browser mix-update="#tooltip">{tip}</browser>""", 400

        return "Service under maintenance", 500
        
    finally:
        if "cursor" in locals(): cursor.close()
        if "db" in locals(): db.close()
##############################
@app.delete("/api-delete-travel/<travel_pk>")
@x.no_cache
def api_delete_travel(travel_pk):
    try:
        travel_pk = x.validate_uuid4()
        user = session.get("user", "")
        db, cursor = x.db()

        q = "SELECT * FROM travels WHERE travel_pk = %s"
        cursor.execute(q, (travel_pk,))
        travel = cursor.fetchone()
        ic(travel)
        if user["user_pk"] != travel["user_fk"]:
            raise Exception("User not allowed to delete")

        delete_q = "DELETE FROM travels WHERE travel_pk = %s"
        cursor.execute(delete_q, (travel_pk,))
        db.commit()
        
        return "",204
    except Exception as ex:
        ic(ex)
        return "ups", 500
    finally:
        if "cursor" in locals(): cursor.close()
        if "db" in locals(): db.close()
##############################
@app.post("/api-login")
def api_login():
    try:
        user_email = x.validate_user_email()
        user_password = x.validate_user_password()

        db, cursor = x.db()
        q = "SELECT * FROM users WHERE user_email = %s"
        cursor.execute(q, (user_email,))
        user = cursor.fetchone()
        if not user:
            error_message = "Invalid credentials"
            return jsonify({
                "error_message" : error_message
            }), 400
            
        if not check_password_hash(user["user_password"], user_password):
            error_message = "Invalid credentials"
            return jsonify({"error_message": error_message}), 400            

        user.pop("user_password")
        user.pop("user_email")
        session["user"] = user
        
        return jsonify({"error_message": "Logging in..."})

    except Exception as ex:
        ic(ex)


        if "company_exception user_email" in str(ex):
            error_message = f"User email invalid"
            return jsonify({"error_message": error_message}), 400

        if "company_exception user_password" in str(ex):
            error_message = f"Password must be {x.USER_PASSWORD_MIN} to {x.USER_PASSWORD_MAX} characters"
            return jsonify({"error_message": error_message}), 400

        # Worst case
        error_message = "System under maintenance"
        return jsonify({"error_message": error_message}), 500


    finally:
        if "cursor" in locals(): cursor.close()
        if "db" in locals(): db.close()

##############################
@app.get("/profile")
@x.no_cache # Decorator
def profile():
    try:
        user = session.get("user", "")
        if not user: return redirect("/login")
        ic(user)
        return render_template("page_profile.html", user=user)
    except Exception as ex:
        ic(ex)
        return "error"

##############################
@app.get("/logout")
def logout():
    try:
        session.clear()
        return redirect("/login")
    except Exception as ex:
        ic(ex)
        return "ups"
