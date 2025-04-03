"""a = open('D:/HEXAWARE/python notes/Class Notes - Day-1FN.txt', 'r')
print(a.read())
a.close()
#read a file using os,sys
import os,sys
b=input("enter the file name:")
if os.path.isfile(b):
    f=open(b,'r')
    print(f.read())
else:
    print(b,"file not found")
    sys.exit()
#read and write a binary file
a1=open('Aaron.png','rb')
a2=open('mickey.png','wb')
b=a1.read()
a2.write(b)
a1.close()
a2.close()
#write a file
with open('file1.txt', 'w') as m:
    m.write('YOUTH ARE NOT USELESS THEY ARE USED LESS!\n')
    m.write('U ARE ONE WHO CAN MAKE YOURSELF THE ONE WHO CAN WIN THIS WORLD')"""
#read the csv file using pandas
import pandas as pd
a=pd.read_csv("E:/data science ,MLand NLP/dataset/cancer.csv")
print(a.head())
#write values into an Excel file using the openpyxl
import openpyxl as px
wb = px.Workbook()
sheet = wb.active
sheet['A1'] = "Name"
sheet['B1'] = "Age"
sheet['A2'] = "Mickey"
sheet['B2'] = 20
sheet['A3'] = "Choki"
sheet['B3'] = 21
sheet['A4'] = "Mickeychoki"
sheet['B4'] = 22
# Save the workbook to a file
wb.save('example.xlsx')

