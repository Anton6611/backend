from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/submit', methods=['POST'])
def submit():
    data = request.json
    with open('data.txt', 'a') as f:
        f.write(data['data'] + '\n')
    return jsonify({"status": "success"}), 200

@app.route('/data', methods=['GET'])
def get_data():
    try:
        with open('data.txt', 'r') as f:
            content = f.read()
        return content, 200
    except Exception as e:
        return str(e), 500

if __name__ == '__main__':
    app.run(debug=True)
# import os
#
# current_dir = os.path.dirname(os.path.abspath(__file__))  # Получает путь к текущему файлу
# file_path = os.path.join(current_dir, 'data.txt')
