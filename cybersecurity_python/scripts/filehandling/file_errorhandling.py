#!/usr/bin/env python3

# Error handling for files
# FileNotFoundError
try:
    with open("errorfile.txt", "r") as file:
        content = file.read()
        print(content)

except:
    print("File not found")

# Outcommented Error types
# except FileNotFoundError:
#     print("File not found")
# except PermissionError:
#     print("Access denied")
# except IsADirectoryError:
#     print("File is a directory")
# except OSError: # Open system error
#     print("System Error occured")



# Multiple try/except blocks

try:
    with open("errorfile.txt", "r") as file:
        content = file.read()
        print(content)

except FileNotFoundError:
    print("File not found")
except PermissionError:
    print("Permission denied")
except OSError:
    print("System error occured")
except Exception as e:
    print(f"Unexpected error occured: {e}")

