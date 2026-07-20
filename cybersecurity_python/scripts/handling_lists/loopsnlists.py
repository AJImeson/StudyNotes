###############################
# Incorporating loops for lists
###############################

# Login attempts
login_attempts = [2, 4, 6, 8, 10, 12]

high_activity_days = [attempt for attempt in login_attempts if attempt >=8]
print("Days with most activity: ", high_activity_days)

# Assignment reflected on this

login_attempts2 = [3, 5, 1, 6, 9, 2, 8, 10, 3, 12, 4, 15, 1, 2, 6, 8, 4, 7, 20, 5]

low_activity_days = [attempt for attempt in login_attempts2 if attempt <=10]
print ("Days with low activity: ", low_activity_days)

def calculate(login_attempts2):
    return sum(login_attempts2) / len(login_attempts2)

print ("Average activity: ", calculate(login_attempts2))
