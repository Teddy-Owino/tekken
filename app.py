from flask import *
import pymysql
import re
from werkzeug.security import generate_password_hash
from flask_mail import Mail, Message  # For sending emails (optional)
from mpesa import *


app = Flask(__name__)

# session key
app.secret_key = "qq@%^&*()"

users ={}

@app.route("/")
def Homepage():
    # establish to your db
    connection= pymysql.connect(host= 'localhost', user='root', password='', database= 'tekken')
    sql = "SELECT * FROM `products` WHERE `product_category` = 'car'"
    sql1 = "SELECT * FROM `products` WHERE `product_category` = 'bicylce'"
    sql2 = "SELECT * FROM `products` WHERE `product_category` = 'motorbike'"
    sql3 = "SELECT * FROM `products` WHERE `product_category` = 'tuktuk'"

    # you need cursor to execute

    cursor = connection.cursor()
    cursor1 = connection.cursor()
    cursor2 = connection.cursor()
    cursor3 = connection.cursor()


    # execute

    cursor.execute(sql)
    cursor1.execute(sql1)
    cursor2.execute(sql2)
    cursor3.execute(sql3)
  


    # get all the machines

    car = cursor.fetchall()
    bicylce = cursor1.fetchall()
    motorbike = cursor2.fetchall()
    tuktuk = cursor3.fetchall()
   

    return render_template("index.html", car = car, bicylce = bicylce, motorbike = motorbike, tuktuk = tuktuk)



@app.route("/single/<product_id>")
def singleP(product_id):
    # connection to db
    connection= pymysql.connect(host= 'localhost', user='root', password='', database= 'tekken')
    # create sql query
    sql = "SELECT * FROM `products` WHERE `product_id` = %s "

    # cursor

    cursor = connection.cursor()
# execute
    cursor.execute(sql, product_id)
# get thye single product
    car = cursor.fetchone()
    # Retrieve phone from session if available
    phone = session.get('phone', '')  # Default to empty string if not found

    return render_template("single.html", car = car, phone = phone)


def is_valid_password(password):
    # Password should be at least 8 characters long and contain:
    # - At least one uppercase letter
    # - At least one lowercase letter
    # - At least one digit
    # - At least one special character
    if (len(password) < 6 or
        re.search(r"[A-Z]", password) or
        re.search(r"[a-z]", password) or
        re.search(r"[!@#$%^&*(),.?\":{}|<>]", password) or
        re.search(r"[0-9]", password)):
        return True
    return False


@app.route("/register", methods =['POST','GET'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        user_type = request.form['user_type']
        phone = request.form['phone']
        gender = request.form['gender']
        password = request.form['password']

#         hashed_password = generate_password_hash(password)


#         response = is_valid_password(password)
#         if response ==True:
#             # password met all the condition
        
#         else:
#             # password did not meet all cond
#             return render_template("register.html", message = "registrstin successful")
#     else:


#         # Validate password
#         if not is_valid_password(password):
#             return render_template("register.html", error='Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one digit, and one special character.')
     
# # conn to db
        connection= pymysql.connect(host= 'localhost', user='root', password='', database= 'tekken')
# create  a cursor
        cursor = connection.cursor()
        sql = "insert into users (username, email, gender, phone, password,user_type) values (%s, %s, %s, %s, %s, %s)"
        
        data = (username, email, gender, phone, password,user_type)
     #execute 
        cursor.execute(sql, data)
        
        # save changes 
        connection.commit()

        if email in users:
            flash('Username already exists!', 'error')
        else:
            users[email] = {
                'username': username,
                'user_type': user_type,
                'phone': phone,
                'gender': gender,
                'password': password  # In practice, use hashing!
            }

        return redirect("/login")

    else:
        return render_template("register.html", error = 'Please register')



@app.route("/login", methods=['POST', 'GET']) 
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        connection = pymysql.connect(host='localhost', user='root', password='', database="tekken")
        cursor = connection.cursor()
        
        # Fetch the user by email and password
        sql = "SELECT * FROM users WHERE email = %s AND password = %s"
        cursor.execute(sql, (email, password))
        
        user = cursor.fetchone()

        if user:
            session['key'] = user[0]  # Set session key (use user ID or similar)
            session['username'] = user[1]  # Assuming username is at index 1
            session['user_type'] = user[6]  # Assuming user type is at index 6
            
            return handle_user_role(session['user_type'])
        else:
            return render_template("login.html", error="Invalid login credentials")
    else:
        return render_template("login.html")



def handle_user_role(user_type):
    if user_type == 'admin':
        return redirect('/admin')
    else:
        return redirect('/')

            


# fashion route helps you see all the fashions

@app.route("/sparepart")
def sparepart():
     connection= pymysql.connect(host= 'localhost', user='root', password='', database= 'tekken')
     sql = "SELECT * FROM `products` WHERE `product_category` = 'carspares'"
     sql1 = "SELECT * FROM `products` WHERE `product_category` = 'bikespares'"
     sql2 = "SELECT * FROM `products` WHERE `product_category` = 'bispares'"
     sql3 = "SELECT * FROM `products` WHERE `product_category` = 'sparetuk'"
    
  
    
    # you need cursor to execute

     cursor = connection.cursor()
     cursor1 = connection.cursor()
     cursor2 = connection.cursor()
     cursor3 = connection.cursor()
    
   

    # execute

     cursor.execute(sql)
     cursor1.execute(sql1)
     cursor2.execute(sql2)
     cursor3.execute(sql3)
     

    # get all the phones

     carspares = cursor.fetchall()
     bikespares = cursor1.fetchall()
     bispares = cursor2.fetchall()
     sparetuk = cursor3.fetchall()
   

     return render_template("sparepart.html", carspares = carspares, bikespares = bikespares, bispares = bispares, sparetuk = sparetuk)


# To  upload fashion
@app.route("/user2_page")
def user2_page():
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')
    cursor = connection.cursor()
    
    cursor.execute("SELECT * FROM users")  # Adjust query as needed
    users = cursor.fetchall()
    
    cursor.close()
    connection.close()
    
    return render_template("user2_page.html", users=users)
@app.route("/all_bicycle")
def all_bicycle():
    """
    Render the page displaying all motorbikes.
    """
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')

    cursor = connection.cursor()
    sql = "SELECT * FROM products WHERE product_category = 'bicylce'" # Fetch all motorbikes
    cursor.execute(sql)
    bicycle = cursor.fetchall()
    cursor.close()
    return render_template('all_bicycle.html', bicycle=bicycle)


@app.route("/faqs")
def faqs():
    return render_template("faqs.html")


@app.route("/uploadmachinery", methods =['POST', 'GET'])
def uploadMachinery():
    if request.method == 'POST':
        # user can add the products
        product_name = request.form['product_name']
        product_desc = request.form['product_desc']
        product_cost = request.form['product_cost']
        product_category = request.form['product_category']
        product_image_name = request.files['product_image_name']
        product_image_name.save('static/images/' + product_image_name.filename)
# conn to db
        connection= pymysql.connect(host= 'localhost', user='root', password='', database= 'tekken')
# create  a cursor
        cursor = connection.cursor()
        sql = "insert into products (product_name, product_desc, product_cost, product_category, product_image_name) values (%s, %s, %s, %s, %s)"
        
        data = (product_name, product_desc, product_cost, product_category,product_image_name.filename)
     #execute 
        cursor.execute(sql, data)
        
        # save changes
        connection.commit()

        return render_template("uploadmachinery.html", message = ' Items added successfully')

    else:
        return render_template("uploadmachinery.html", error = 'Please add any product')
    

@app.route("/all_bikespares")
def all_bikespares():
    """
    Render the page displaying all motorbikes.
    """
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')

    cursor = connection.cursor()
    sql = "SELECT * FROM products WHERE product_category = 'bikespares'" # Fetch all motorbikes
    cursor.execute(sql)
    bikespares = cursor.fetchall()
    cursor.close()
    return render_template('all_bikespares.html', bikespares=bikespares)

@app.route("/contact")
def contact():
    return render_template("contact.html")

@app.route("/services")
def services():
    return render_template("services.html")

@app.route("/all_carspares")
def all_carspares():
    """
    Render the page displaying all motorbikes.
    """
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')

    cursor = connection.cursor()
    sql = "SELECT * FROM products WHERE product_category = 'carspares'" # Fetch all motorbikes
    cursor.execute(sql)
    carspares = cursor.fetchall()
    cursor.close()
    return render_template('all_carspares.html', carspares=carspares)

@app.route("/add_item", methods=['POST'])
def add_item():
    # Logic to add the item to the database or session
    # Example: 
    if 'item_count' not in session:
        session['item_count'] = 0
    session['item_count'] += 1

    # You might want to return some response
    return jsonify({'count': session['item_count']})
@app.route("/all_bispares")
def all_bispares():
    """
    Render the page displaying all motorbikes.
    """
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')

    cursor = connection.cursor()
    sql = "SELECT * FROM products WHERE product_category = 'bispares'" # Fetch all motorbikes
    cursor.execute(sql)
    bispares = cursor.fetchall()
    cursor.close()
    return render_template('all_bispares.html', bispares=bispares)


@app.route("/logout")
def logout():
    session.clear()  
  
    return redirect("/login")

@app.route("/all_tuk")
def all_tuk():
    """
    Render the page displaying all motorbikes.
    """
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')

    cursor = connection.cursor()
    sql = "SELECT * FROM products WHERE product_category = 'tuktuk'" # Fetch all motorbikes
    cursor.execute(sql)
    tuktuk = cursor.fetchall()
    cursor.close()
    return render_template('all_tuk.html', tuktuk=tuktuk)


@app.route("/all_sparetuk")
def all_sparetuk():
    """
    Render the page displaying all motorbikes.
    """
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')

    cursor = connection.cursor()
    sql = "SELECT * FROM products WHERE product_category = 'sparetuk'" # Fetch all motorbikes
    cursor.execute(sql)
    sparetuktuk = cursor.fetchall()
    cursor.close()
    return render_template('all_sparetuk.html', sparetuktuk=sparetuktuk)


@app.route("/settings")
def settings():
    
    return render_template("settings.html")

# @app.route("/admin_dashboard")
# def admin_dashboard():
    
#     return render_template("admin_dashboard.html", users=users) 

@app.route("/delete_products")
def delete_products():
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')
    cursor = connection.cursor()
    
    cursor.execute("SELECT * FROM products")  # Adjust query as needed
    products = cursor.fetchall()
    
    cursor.close()
    connection.close()
    
    return render_template("delete_product.html", products=products)

@app.route("/user_page")
def user_page():
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')
    cursor = connection.cursor()
    
    cursor.execute("SELECT * FROM users")  # Adjust query as needed
    users = cursor.fetchall()
    
    cursor.close()
    connection.close()
    
    return render_template("user_page.html", users=users)
@app.route("/all_cars")
def all_cars():
    """
    Render the page displaying all motorbikes.
    """
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')

    cursor = connection.cursor()
    sql = "SELECT * FROM products WHERE product_category = 'car'" # Fetch all motorbikes
    cursor.execute(sql)
    cars = cursor.fetchall()
    cursor.close()
    return render_template('all_cars.html', cars= cars)



@app.route("/edit_user/<int:user_id>", methods=['GET', 'POST'])
def edit_user(user_id):
    # Connect to the database
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')
    cursor = connection.cursor()

    if request.method == 'POST':
        # Get the updated data from the form
        username = request.form['username']
        email = request.form['email']
        # gender = request.form['gender']
        phone = request.form['phone']
        user_type = request.form['user_type']

        # Update the user in the database
        sql = "UPDATE users SET username = %s, email = %s, phone = %s, user_type = %s WHERE id = %s"
        cursor.execute(sql, (username, email, phone, user_type, user_id))
        connection.commit()
        connection.close()
        
        return redirect('/admin_dashboard')  # Redirect back to admin dashboard

    else:
        # Get the current user data
        sql = "SELECT * FROM users WHERE id = %s"
        cursor.execute(sql, (user_id,))
        user = cursor.fetchone()
        connection.close()

        if user:
            return render_template("edit_user.html", user=user)
        else:
            return "User not found", 404

@app.route("/delete_product/<int:product_id>")
def delete_product(product_id):
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')
    cursor = connection.cursor()

    # Execute the delete query
    cursor.execute("DELETE FROM products WHERE product_id = %s", (product_id,))
    connection.commit()
    
    flash('Product deleted successfully!', 'success')

    cursor.close()
    connection.close()
    
    return redirect(url_for('admin_dashboard'))

@app.route("/all_motorbikes")
def all_motorbikes():
    """
    Render the page displaying all motorbikes.
    """
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')

    cursor = connection.cursor()
    sql = "SELECT * FROM products WHERE product_category = 'motorbike'" # Fetch all motorbikes
    cursor.execute(sql)
    motorbikes = cursor.fetchall()
    cursor.close()
    return render_template('all_motorbikes.html', motorbikes=motorbikes)

@app.route("/delete_user/<int:user_id>")
def delete_user(user_id):
    connection = pymysql.connect(host='localhost', user='root', password='', database='tekken')
    cursor = connection.cursor()
    cursor.execute("DELETE FROM users WHERE id = %s", (user_id,))
    connection.commit()
    flash('User deleted successfully!')
    return redirect('/admin_dashboard')


# mpesa
# implement STK PUSH
@app.route("/mpesa", methods=['POST'])
def mpesa():
    phone = request.form["phone"]
    amount = request.form["amount"]

    # Use the mpesa_payment function
    payment_success = mpesa_payment(amount, phone)

    if payment_success:
        return render_template("payment_success.html", phone=phone, amount=amount)
    else:
        return '<h1>Payment failed. Please try again.</h1>' \
               '<a href="/" class="btn btn-dark btn-sm">Go Back to products</a>'




def mpesa_payment(amount, phone):
    # Simulate payment processing logic
    payment_success = True  # Simulate success for now
    
    if payment_success:
        # Store payment record in the database
        with pymysql.connect(host='localhost', user='root', password='', database="tekken") as connection:
            with connection.cursor() as cursor:
                username = session['username']  # Get the username from the session
                sql = "INSERT INTO payment_records (username, phone, amount, status) VALUES (%s, %s, %s, %s)"
                cursor.execute(sql, (username, phone, amount, 'Completed'))
                connection.commit()

                # Store phone in session
                session['phone'] = phone
    
    return payment_success


@app.route("/payment_records")
def payment_records():
    if 'username' not in session:
        return redirect(url_for('login'))  # Redirect if not logged in

    username = session['username']
    
    with pymysql.connect(host='localhost', user='root', password='', database="tekken") as connection:
        with connection.cursor() as cursor:
            sql = "SELECT * FROM payment_records WHERE username = %s"
            cursor.execute(sql, (username,))
            records = cursor.fetchall()

    return render_template("payment_records.html", records=records)

# admin user access dashbord route
@app.route('/admin')
def admin_dashboard():
    return render_template('/admin/dashboard.html')


if __name__== "__main__":
    app.run(debug=True, port=4001)





