from file_package import (
    read_text_file,
    read_excel_file,
    read_csv_file,
    create_json_file,
    json_to_text_file,
    convert_csv_to_excel
)

# Read a text file
text_content = read_text_file('D:/HEXAWARE/python program/file.txt')
print(text_content)

# Read CSV file
csv_data = read_csv_file('E:/data science ,MLand NLP/dataset/cancer.csv')
print(csv_data)

# Create a JSON file and convert it to a text file
data = [
    {"name": "Aaron", "age": 20, "city": "Madurai"},
    {"name": "Mickey", "age": 25, "city": "Paris"},
    {"name": "Choki", "age": 21, "city": "Paris"},
    {"name": "Tomie", "age": 22, "city": "Chennai"},
    {"name": "Mickeychoki", "age": 21, "city": "Dream land"}
]

create_json_file(data, 'data.json')
json_to_text_file('data.json', 'output.txt')

# Convert CSV to Excel
convert_csv_to_excel('E:/data science ,MLand NLP/dataset/cancer.csv', 'output.xlsx')
