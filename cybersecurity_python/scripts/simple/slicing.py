############################################
# Slicing and masking, usefull for passwords
############################################

password = "swordfish123"
masked_password = "*" * len(password)

print(password)
print(len(masked_password))

password = "Cybersecurity"
first_char = password[0:5]
print(first_char)

filename = "cmdlop.exe"

if filename[-4] == ".exe":
    print("Malware found")
    
text = "Cyber Security"

words = text.split() 
print (words)
