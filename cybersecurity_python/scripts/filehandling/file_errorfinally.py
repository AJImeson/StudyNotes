#!/usr/bin/env python3

# Finally statement

file = None

try:
    file = open("errorfile2.txt", "r")
    content = file.read()

except: FileNotFoundError:
    print("File Not Found")

finally:
    if file:
        print(content)
        file.close()
        print("File closed")
