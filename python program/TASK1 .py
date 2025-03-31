"""# Task 1: Celsius to Fahrenheit
celsius = float(input("Enter temperature in Celsius: "))
fahrenheit = (celsius * 9/5) + 32
print(f"{celsius} Celsius is equal to {fahrenheit} Fahrenheit")
# Task 2: Area of a cube
side = float(input("Enter the side length of the cube: "))
area = 6 * (side ** 2)
print(f"The surface area of the cube is {area}")
# Task 3: Area of a cylinder
radius = float(input("Enter the radius of the cylinder: "))
height = float(input("Enter the height of the cylinder: "))
area = 2 * 3.1416 * radius * (radius + height)
print(f"The surface area of the cylinder is {area}")
# Task 4: Hex, Octal, and Square Root of a number
number = int(input("Enter a number: "))
hex_value = hex(number)
print(f"the hexa value is {hex_value}")
octal_value = oct(number)
print(f"the oct balue is {octal_value}")
square_root = number ** 0.5
print(f"the  square root value is {square_root}")
# Task 5: One's place digit
number = int(input("Enter a number: "))
ones_place = number % 10
print(f"The digit at the one's place is {ones_place}")

# Task 6: Memory location comparison using identity operators
v1 = 10
v2 = 10
if v1 is v2:
    print("Both variables point to the same memory location.")
else:
    print("The variables point to different memory locations.")
# Task 7: Volume of a sphere
radius = float(input("Enter the radius of the sphere: "))
pi=3.1416
volume = (4/3) * pi * (radius ** 3)
print(f"The volume of the sphere is {volume}")
# Task 8: Simple Interest Calculation
P = float(input("Enter the principal amount: "))
N= float(input("Enter the interest rate (as a percentage): "))
R = float(input("Enter the time period in years: "))
simple_interest = (P * R * N) / 100
amount_payable = P + simple_interest
print(f"The amount payable after simple interest is {amount_payable}")
# Task 9: Compound Interest Calculation
P = float(input("Enter the principal amount: "))
R = float(input("Enter the interest rate (as a percentage): "))
N= float(input("Enter the time period in years: "))
compound_interest = P * ((1 + (R/ 100)) ** N) - P
amount_payable = P + compound_interest
print(f"The amount payable after compound interest is {amount_payable}")
"""
import random as rd
a = rd.randrange(0,100)
b=rd.random()
c=rd.randrange(25,79)
print(a,b,c)

