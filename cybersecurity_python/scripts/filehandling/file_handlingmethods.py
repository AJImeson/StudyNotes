# More "advanced" file handling methods 

names = ["Axel", "Lina", "Motherfucker", "Roland"]

with open("example2.txt", "a") as file: # Writing multiple strings
    file.writelines(name + "\n" for name in names)

with open("example2.txt", "r") as file: # Append and trim for a comprehensive list
    for line in file:
        print("Username: ", line.strip())

with open("example2.txt", "r") as file: # Stores each line as individial elements and returns as a string 
    lines = file.readlines()
    for line in lines:
        print("Username: ", line.strip())

with open("example2.txt", "w") as file: # Clears file content
    pass
