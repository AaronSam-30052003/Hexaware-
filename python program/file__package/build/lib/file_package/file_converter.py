#convert csv to excel
import pandas as pd
def convert_csv_to_excel(csv_file_path, excel_file_path):
    df = pd.read_csv(csv_file_path)
    df.to_excel(excel_file_path, index=False)
