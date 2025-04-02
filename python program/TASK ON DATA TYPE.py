#Task 1: Calculate the Mean of a List of Numbers
numbers = [10, 20, 30, 40, 50]
total = 0
count = 0
for num in numbers:
    total += num
    count += 1
mean = total / count
print("Mean:", mean)
#OR USING FUNCTION
numbers = [10, 20, 30, 40, 50]
mean = sum(numbers) / len(numbers)
print("Mean:", mean)
##############################################################
#Task 2: Search for an element in a list(LINEAR SEARCH)
numbers = [10, 20, 30, 40, 50]
x = int(input("Enter number to search: "))
found = False
for num in numbers:
    if num == x:
        found = True
        break
if found:
    print("Found")
else:
    print("Not Found")
# OR
numbers = [10, 20, 30, 40, 50]
x = int(input("Enter number to search: "))
print("Found" if x in numbers else "Not Found")
##############################################################
#Task 3: Find max element from two lists and its index
list1 = [10, 20, 30]
list2 = [40, 50, 60]
max1 = list1[0]
index1 = 0
for i in range(1, len(list1)):
    if list1[i] > max1:
        max1 = list1[i]
        index1 = i
max2 = list2[0]
index2 = 0
for i in range(1, len(list2)):
    if list2[i] > max2:
        max2 = list2[i]
        index2 = i
if max1 > max2:
    print("Max:", max1, "Index:", index1, "in list1")
else:
    print("Max:", max2, "Index:", index2, "in list2")
##############################################################
#Task 4: Find the Second Largest Number in a List
numbers = [10, 20, 30, 40, 50]
n=len(numbers)
for i in range(n - 1):
    for j in range(n - i - 1):
        if numbers[j] > numbers[j + 1]:
            numbers[j], numbers[j + 1] = numbers[j + 1], numbers[j]
print("Second Largest:", numbers[-2])
##############################################################
#Task 5: Create a Nested Tuple for Marks
marks = []
for i in range(5):
    student_marks = []
    for j in range(3):
        student_marks.append(int(input(f"Enter mark {j+1} for student {i+1}: ")))
    marks.append(tuple(student_marks))
marks = tuple(marks)
print("Marks:", marks)
##############################################################
#Task 6: Extract Even & Odd Values and Find Their Sum
data = {"a": 10, "b": 15, "c": 20, "d": 25, "e": 30}
evens = []
odds = []
sum_evens = 0
sum_odds = 0
for key in data:
    value = data[key]
    if value % 2 == 0:
        evens.append(value)
        sum_evens += value
    else:
        odds.append(value)
        sum_odds += value
print("Evens:", evens, "Sum:", sum_evens)
print("Odds:", odds, "Sum:", sum_odds)
##############################################################
#Task 7: Find the Highest Two Values from a Dictionary
data = {"a": 10, "b": 50, "c": 30, "d": 40, "e": 60}
values = []
for key in data:
    values.append(data[key])
for i in range(len(values) - 1):
    for j in range(len(values) - i - 1):
        if values[j] < values[j + 1]:
            values[j], values[j + 1] = values[j + 1], values[j]
print("Highest 2 values:", values[:2])
##############################################################
#Task 8: Display Product Information from a Dictionary
products = {
    "Laptop": {"Price": 50000, "Brand": "Dell"},
    "Phone": {"Price": 20000, "Brand": "Samsung"},
    "Tablet": {"Price": 15000, "Brand": "Apple"}
}
for product in products:
    details = products[product]
    print(product, ": Price :", details["Price"], ", Brand :", details["Brand"])
##############################################################








