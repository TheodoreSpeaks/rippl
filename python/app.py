from flask import Flask
import barcode
from parse_water_footprint import *

app = Flask(__name__)

parser = CSVParser()

@app.route('/barcode/<barcode_id>')
def scan_barcode(barcode_id):
    return str(barcode.scan(barcode_id, parser))
