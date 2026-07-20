########################################
# Script that checks password is correct
########################################

# Value for password
set_password = "password123"

# User input
password_input = input("Enter your password: ")

# Matching incorrect

if password_input == set_password:
    print ("Correct Password, access granted")

else:
    print ("Incorrect Password, access denied")

