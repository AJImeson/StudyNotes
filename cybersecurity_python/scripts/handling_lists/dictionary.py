#####################################
# Dictionary coding and understanding
# its difference compared to lists
#####################################

# General coding for dicts

user_info = { # Dictionary
        "username": "admin",
        "password": "letmein",
        "last_login": "2025-12-18"

}


user_info["email"] = "admin@labcyber.com" # Key appended with value
user_info["password"] = "stockholm" # Key value changed 
print(user_info) # Print all key values in dict 
print(user_info["username"]) # Key value printed
print(user_info.get("username")) # All key values printed

for key, value in user_info.items(): # Loops through dict items
    print(f"{key}:{value}")

print(user_info.values)


