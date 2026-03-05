from flask import Flask, render_template, request, session, redirect, jsonify
import x
import uuid
import time
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
def show_signup():
    try:
        user = session.get("user", "")
        return render_template("page_signup.html", user=user, x=x)
    except Exception as ex:
        ic(ex)
        return "ups"
##############################
@app.get("/")
def show_index():
    try:
        user = session.get("user", "")
        return render_template("page_index.html", user=user)
    except Exception as ex:
        ic(ex)
        return "ups"
@app.get("/login")
def show_login():
    try:
        user = session.get("user", "")
        if user: return redirect("/profile")  # TODO: Redirect to profile page if logged in
        return render_template("page_login.html", x=x)
    except Exception as ex:
        ic(ex)
        return "ups", 500

    
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
        return "ok" # TODO: Make it login and create session 
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
