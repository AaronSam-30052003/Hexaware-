#Task -1
n=5
for i in range(n):
    for j in range(i,n):
        print("*",end=" ")
    print()
#########################################
#Task-2
for i in range(5, 0, -1):
    for j in range(1, i + 1):
        print(j, end=" ")
    print()
#########################################
#Task-3
for i in range(1, 6):
    
    for j in range(1, i + 1):
        if j == 1 or j == i:
            print(1, end=' ')
        else:
            print(2, end=' ')
    print()
#########################################
#Task -4
n=5
for i in range(5,0,-1):
    for j in range(i):
        print(i,end=' ')
    print()
#########################################
#Task -5
n=5
a=1
for i in range(1,n):
    for j in range(i):
        print(a,end=" ")
        a+=1
    print()
#########################################
# Task 6
even_sum = 0
odd_sum = 0
for i in range(5):
    num = int(input("Enter a number: "))
    if num % 2 == 0:
        even_sum += num
    else:
        odd_sum += num
print("Sum of even numbers:", even_sum)
print("Sum of odd numbers:", odd_sum)
#########################################
# Task 7
n = int(input("Enter the number of terms in Fibonacci series: "))
a, b = 0, 1
for i in range(n):
    print(a, end=" ")
    a, b = b, a + b
#########################################
# Task 8
while True:
    print("\nMenu:")
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Exit")
    choice = input("Enter choice (1/2/3/4/5): ")
    if choice == '5':
        print("Exiting...")
        break
    num1 = float(input("Enter first number: "))
    num2 = float(input("Enter second number: "))
    match choice:
        case '1':
            print("Result:", num1 + num2)
        case '2':
            print("Result:", num1 - num2)
        case '3':
            print("Result:", num1 * num2)
        case '4':
            if num2 != 0:
                print("Result:", num1 / num2)
            else:
                print("Cannot divide by zero!")
        case _:
            print("Invalid input! Please select a valid option.")
#########################################
#Task-9
s=input("enter the word:")
if s==s[::-1]:
    print("The given word is palindrome")
else:
    print("The given word is not palindrome")
#########################################