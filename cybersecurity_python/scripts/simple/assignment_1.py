###########################################################################################
# Create a program that asks for a positive number, append to a list, and to exit type done
###########################################################################################

saved_numbers = []

while true:

    integer_input = input("Enter a positive number, type 'done' to exit")

    if integer_input == "done":
        break

    num = int(integer_input)
    saved_numbers.append(num)


for num in saved_numbers:
    if num % 2 == 0:
        print (f"First even number submitted: {num}")
        break
    else:
        print("No even numbers have been submitted") 

if saved_numbers:
    print(f"The submitted numbers are the following: {saved_integers}")

else:
    print(f"No number has been submitted by the user") 
