#Task -1 To calculate the tax
a = float(input("Enter the income: "))
tax = 0
if a <= 150000:
    print("No tax")
elif a > 150001 and a <= 300000:
    tax = a * 0.10
    print(f"Tax is: {tax}")
elif a > 300001 and a <= 500000:
    tax = a * 0.20
    print(f"Tax is: {tax}")
elif a > 500001:
    tax = a * 0.30
    print(f"Tax is: {tax}")
#######################################################
# Task 2: Roots of a quadratic equation
a = float(input("Enter coefficient a: "))
b = float(input("Enter coefficient b: "))
c = float(input("Enter coefficient c: "))
d = b**2 - 4*a*c
if d> 0:
    root1 = (-b + d**0.5) / (2*a)
    root2 = (-b - d**0.5) / (2*a)
    print(f"The roots are real and distinct: {root1} and {root2}")
elif d == 0:
    root = -b / (2*a)
    print(f"The roots are real and equal: {root}")
else:
    real_part = -b / (2*a)
    imaginary_part = (abs(d)**0.5) / (2*a)
    print(f"The roots are imaginary: {real_part} + {imaginary_part}i and {real_part} - {imaginary_part}i")
########################################################
# Task 3: Total marks, average, and grade
marks1 = float(input("Enter marks for subject 1: "))
marks2 = float(input("Enter marks for subject 2: "))
marks3 = float(input("Enter marks for subject 3: "))
total_marks = marks1 + marks2 + marks3
average = total_marks / 3
if average >= 80:
    grade = "A"
elif average >= 70:
    grade = "B"
elif average >= 60:
    grade = "C"
else:
    grade = "Fail"
print(f"Total Marks: {total_marks}")
print(f"Average: {average}")
print(f"Grade: {grade}")
########################################################
#Task 4: Bonus based on years of service
salary = float(input("Enter the employee's salary: "))
years_of_service = int(input("Enter the years of service: "))
if years_of_service >= 10:
    bonus = salary * 0.10
elif years_of_service >= 5:
    bonus = salary * 0.05
elif years_of_service >= 3:
    bonus = salary * 0.03
else:
    bonus = 0
total_salary = salary + bonus
print(f"Bonus: {bonus}")
print(f"Total salary with bonus is: {total_salary}")
########################################################
# Task 5: Match case statement with arithmetic operators
operation = input("Enter add for addition, sub for subtraction, mul for multiplication, div for division: ")
num1 = float(input("Enter first number: "))
num2 = float(input("Enter second number: "))
match operation:
    case 'add':
        result = num1 + num2
        print(f"Addition: {result}")
    case 'sub':
        result = num1 - num2
        print(f"Subtraction: {result}")
    case 'mul':
        result = num1 * num2
        print(f"Multiplication: {result}")
    case 'div':
        if num2 != 0:
            result = num1 / num2
            print(f"Division: {result}")
        else:
            print("Cannot divide by zero")
    case _:
        print("Invalid operation")
########################################################
# Task 6: Area calculation based on user choice using match-case
choice = int(input("Enter 1 for area of circle, 2 for area of triangle, 3 for area of rectangle: "))
match choice:
    case 1:
        radius = float(input("Enter the radius of the circle: "))
        area = 3.1416 * radius**2
        print(f"Area of the circle: {area}")
    case 2:
        side1 = float(input("Enter the first side of the triangle: "))
        side2 = float(input("Enter the second side of the triangle: "))
        side3 = float(input("Enter the third side of the triangle: "))
        s = (side1 + side2 + side3) / 2
        area = (s * (s - side1) * (s - side2) * (s - side3))**0.5
        print(f"Area of the triangle: {area}")
    case 3:
        length = float(input("Enter the length of the rectangle: "))
        width = float(input("Enter the width of the rectangle: "))
        area = length * width
        print(f"Area of the rectangle: {area}")
    case _:
        print("Invalid choice")
########################################################
# Task 7: Sum of numbers from m to n
n = int(input("Enter the starting number: "))
n1 = int(input("Enter the ending number : "))
sum_of_numbers = 0
for i in range(n, n1+ 1):
    sum_of_numbers += i
print(f"The sum of numbers from {n} to {n1} is: {sum_of_numbers}")
########################################################
# Task 8-Amstrong number
n=int(input("enter a number:"))
s=0
t=n
while n>0:
    r=n%10
    s+=r**3
    n=n//10
if t==s:
    print(f"The given number {t} is a amstrong number")
else:
    print(f"The given number {t} is not a amstrong number")
########################################################
# Task 9: Convert a decimal number to binary
d = int(input("Enter a decimal number: "))
binary = bin(d)[2:]
print(f"The binary equivalent of {d} is: {binary}")
########################################################
# Task 10: Check if a number is a palindrome
n = int(input("Enter a number: "))
t = n
r= 0
while n > 0:
    s = n % 10
    r = r * 10 + s
    n= n // 10
if t == r:
    print(f"The given number {n} is Palindrome number")
else:
    print(f"The given number {n} is Not a palindrome")
########################################################
