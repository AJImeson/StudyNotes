##############################################################
# Basic guessing game and loop logic
##############################################################

guess_list = [-5, -64, 105, 260, 20, 30, 40, 60 ,70 ,80, 90, 50]
correct_guess = 50

print("Welcome to the guessing game") 

for guess in guess_list:

    if not 0 <= guess <= 100:
        print(f"Value is out of allowed range, choose between 1-100")

    if guess < correct_guess:
        print(f"That was too low [{guess}], try again")
        continue

    elif guess > correct_guess:
        print(f"That was too high [{guess}], try again")
        continue

    else:
        print(f"Well done, {guess} is correct!")
        break 
