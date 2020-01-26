from flask import Flask, request, jsonify
import barcode
from parse_water_footprint import *
import fitness_pal
import requests
import json

app = Flask(__name__)

parser = CSVParser()

@app.route('/heartbeat')
def hello():
    return 'hello'

@app.route('/barcode')
def scan_barcode():
    barcode_id = str(request.args.get("barcode_id", ""))
    #might need to use jsonify or .to_json
    return str(barcode.scan(barcode_id, parser))

@app.route('/fitnesspal')
def update_myfitnesspal():
    return jsonify(results=fitness_pal.request_today('karatedkid@gmail.com', parser))

if __name__ == '__main__':
	app.run(debug=True, port=5000)
