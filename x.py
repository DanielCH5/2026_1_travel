from flask import request, make_response
import mysql.connector
import re # Regular expressions also called Regex
from functools import wraps
from icecream import ic
##############################
def db():
    try:
        db = mysql.connector.connect(
            host = "mariadb",
            user = "root",  
            password = "password",
            database = "2026_1_travel"
        )
        cursor = db.cursor(dictionary=True)
        return db, cursor
    except Exception as e:
        print(e, flush=True)
        raise Exception("Database under maintenance", 500)


##############################
def no_cache(view):
    @wraps(view)
    def no_cache_view(*args, **kwargs):
        response = make_response(view(*args, **kwargs))
        response.headers["Cache-Control"] = "no-store, no-cache, must-revalidate, max-age=0"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "0"
        return response
    return no_cache_view

################################################### USERS VALIDATION ####################################################

##############################
REGEX_USER_EMAIL = "^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$"
def validate_user_email():
    user_email = request.form.get("user_email").strip()
    if not re.match(REGEX_USER_EMAIL, user_email):
        raise Exception("company_exception user_email")
    return user_email

##############################
USER_PASSWORD_MIN = 8
USER_PASSWORD_MAX = 50 # Should be hashed, set to 255 in DB
REGEX_USER_PASSWORD = f"^.{{{USER_PASSWORD_MIN},{USER_PASSWORD_MAX}}}$"
def validate_user_password():
    user_password = request.form.get("user_password").strip()
    if not re.match(REGEX_USER_PASSWORD, user_password):
        raise Exception("company_exception user_password")
    return user_password

##############################
USER_FIRST_NAME_MIN = 2
USER_FIRST_NAME_MAX = 20
REGEX_USER_FIRST_NAME = f"^.{{{USER_FIRST_NAME_MIN},{USER_FIRST_NAME_MAX}}}$"
def validate_user_first_name():
    user_first_name = request.form.get("user_first_name", "").strip()
    if not re.match(REGEX_USER_FIRST_NAME, user_first_name):
        raise Exception("company_exception user_first_name")
    return user_first_name
##############################
USER_LAST_NAME_MIN = 2
USER_LAST_NAME_MAX = 20
REGEX_USER_LAST_NAME = f"^.{{{USER_LAST_NAME_MIN},{USER_LAST_NAME_MAX}}}$"
def validate_user_last_name():
    user_last_name = request.form.get("user_last_name", "").strip()
    if not re.match(REGEX_USER_LAST_NAME, user_last_name):
        raise Exception("company_exception user_last_name")
    return user_last_name

################################################### TRAVELS VALIDATION ####################################################
TRAVEL_TITLE_MIN = 2
TRAVEL_TITLE_MAX = 100
REGEX_TRAVEL_TITLE = f"^.{{{TRAVEL_TITLE_MIN},{TRAVEL_TITLE_MAX}}}$"
def validate_travel_title():
    travel_title = request.form.get("travel_title", "").strip()
    if not re.match(REGEX_TRAVEL_TITLE, travel_title):
        raise Exception("company_exception travel_title")
    return travel_title
##############################  (Maybe ask Santiago how he would validate something like this)
TRAVEL_DESCRIPTION_MIN = 50
TRAVEL_DESCRIPTION_MAX = 65535
REGEX_TRAVEL_DESCRIPTION = f"^.{{{TRAVEL_DESCRIPTION_MIN},{TRAVEL_DESCRIPTION_MAX}}}$"
def validate_travel_description():
    travel_description = request.form.get("travel_description", "").strip()
    if not re.match(REGEX_TRAVEL_DESCRIPTION, travel_description):
        raise Exception("company_exception travel_description")
    return travel_description
################################################### CITY VALIDATION ####################################################
CITY_NAME_MIN = 2
CITY_NAME_MAX = 100
REGEX_CITY_NAME = f"^.{{{CITY_NAME_MIN},{CITY_NAME_MAX}}}$"
def validate_city_name():
    city_name = request.form.get("city_name", "").strip()
    if not re.match(REGEX_CITY_NAME, city_name):
        raise Exception("company_exception city_name")
    return city_name
##############################
CITY_REGION_MIN = 2
CITY_REGION_MAX = 100
REGEX_CITY_REGION = f"^.{{{CITY_REGION_MIN},{CITY_REGION_MAX}}}$"
def validate_city_region():
    city_region = request.form.get("city_region", "").strip()
    if not re.match(REGEX_CITY_REGION, city_region):
        raise Exception("company_exception city_region")
    return city_region
################################################### VALIDATIONS END ####################################################
