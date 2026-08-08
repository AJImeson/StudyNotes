## For handling files creation and reading
## open() function handles closing files automatically 

# with open("example.txt", "w") as file: # Writes string to file
#    file.write("Hello world")

# with open("example.txt", "r") as file: # Reads from file
#     content = file.read()
#     print(content)

# Handling files without the open() function
# file = open("example.txt", "w") 
# file.write("Hello World")
# file.close

# Reading and Writing inputs to text files
username = input("Enter username")

with open("users.txt", "a") as file:
    file.write(username + "\n")
    print("Username added to file")

with open("users.txt", "r") as file:
    for name in file:
        print("Username: ", name.strip())
