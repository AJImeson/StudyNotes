#################################
# For understanding how to append
# and work with lists
#################################

# General list work 
compromised_passwords = ["1234", "Happy", "Sad", "dig8899"]
new_compromised_passwords = ["bitter", "EastKentGolding"]
# compromised_password.reverse() # Prints last to first
# compromised_passwords.clear() # Clears entire list of passwords
# compromised_passwords.remove("1234", "Happy") # Remove specific passwords
# compromised_passwords.extend(new_compromised_passwords) # Adds passwords to current compromised passwords list
# compromised_passwords.append("dugging") # Appends parameter password to compromised list

print(compromised_passwords)

# Backup, safety storing

backup_account = compromised_passwords.copy()

print(backup_account)
