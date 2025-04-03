import json
def create_json_file(data, file_path):
    with open(file_path, 'w') as json_file:
        json.dump(data, json_file, indent=4)

def json_to_text_file(json_file_path, text_file_path):
    with open(json_file_path, 'r') as json_file:
        data = json.load(json_file)

    with open(text_file_path, 'w') as text_file:
        text_file.write(json.dumps(data, indent=4))
