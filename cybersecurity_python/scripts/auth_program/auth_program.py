import os
import sys

def clear_terminal():
    os.system('cls' if os.name == 'nt' else 'clear')

# Authentication program
#!/usr/bin/env python3

user_info = {}

while true 

def register_user(): # Register function
    
    clear_terminal()
    username = input("Enter User: ")
    if username in user_info: # Checks for existing username 
        print("Username Taken. Choose a different one")
    else:
        password = input("Enter password: ")
        user_info[username] = password
        print("Successfull Registration")
        input("Press Enter for new registration ")

def login(): # Login function
    username = input("Enter your username ")
    password = input("Enter your password ")
    
    if username in user_info and user_info[username] == password:
        print("Welcome baxk ")
    else:
        print("Invalid credentials. Please try again") 




register_user()
login()




