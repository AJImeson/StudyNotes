##################################
# For understanding the purpose of
# using sets instead of lists
#################################

# Simple set base
set1 = {"192.186.1.101", "10.0.0.1"}
set2 = {"192.168.1.102", "10.0.0.1"}

set1.add("192.168.0.10") # Adds value to set

# common_ips = set1 & set2
# common_ips = set1 | set2 # Union operator 
# common_ips = set1 - set2 # What can be found in set1 but not in set2 
#print(common_ips)

#############################################################
# Prints and looks for unique values, counts failed logins
#############################################################

# Data

logs = [
    {"username": "axel", "ip": "192.168.1.1", "status": "Success"},
    {"username": "göran", "ip": "192.168.1.2", "status": "Failure"},
    {"username": "sara", "ip": "192.168.1.3", "status": "Failure"},
    {"username": "anna", "ip": "192.168.1.4", "status": "Success"},
    {"username": "collin", "ip": "192.168.1.1", "status": "Failure"},
    {"username": "lena", "ip": "192.168.1.5", "status": "Success"}
]

# Printing unique ip

unique_ips = {log["ip"] for log in logs}
print ("Unique Ips: ", unique_ips)

# Special ip 

special_ip = "192.168.1.4"
if special_ip in unique_ips:
    print ("Special IP Address: ", special_ip)
else:
    print("Special IP not found")

# Failed log in attempts 

failed_attempts = {}

for log in logs:
    if log["status"] == "Failure":
        username = log["username"]
        if username not in failed_attempts:
            failed_attempts[username] = 0
        failed_attempts[username] += 1

print ("Failed login attempts per user: ", failed_attempts)



