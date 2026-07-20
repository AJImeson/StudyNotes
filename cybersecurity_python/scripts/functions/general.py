##########################
## Random simple functions
##########################

# Calculate Pi
def calculate_radius(radius):
    area = 3.14 * (radius ** 2)
    return area

result = calculate_radius(5)
print (result)

# Describe a person
def describe_person(name, age, city):
    print(f"{name} is {age} years old and lives in {city}.")

describe_person("Axel", 37, "TwatVille")
describe_person(age=30, name="Bob", city="Toronto")

# Values
x = 12 # Global

def modify_variable():
    global x # Modified to global 
    x = 3 # local
    print(x)

modify_variable()

print(x)

# Calculator and reset value, base

def addition(a, b):
    a + b 

def subtraction(a, b):
    a - b

def multiplication(a, b):
    a * b

def division(a, b):
    a / b

def reset_value
    a = 0
    b = 0
