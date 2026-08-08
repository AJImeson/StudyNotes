# Simple read and ERROR entry append program in python

with open("system_log.txt", "r") as file:
    lines = file.readlines()

with open("error_log.txt", "a") as file:
    for line in lines:
        if "[ERROR]" in line:
            file.write(line)


