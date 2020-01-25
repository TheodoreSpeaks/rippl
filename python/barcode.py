from parse_water_footprint import *

code_conversion = {
        '0': ('110100a', 'pounds')
}

def scan(barcode: int, parser):
    code, units = code_conversion[barcode]
    return parser.get_water_data(code, units=units)

if __name__ == '__main__':
    parser = CSVParser()
    print(scan('0', parser))
