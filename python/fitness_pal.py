import myfitnesspal
import datetime
import sys
import os
from parse_water_footprint import *
import json

name_to_code = {
        'Rice - Rice': '100630',
        'Egg': '40700',
        'Peas - Peas': '071021',
        'Corn - Corn': '071040'
}

def request_today(username, parser):
    """
    To run:
    sudo pip insntall myfitnesspal
    myfitnesspal store-password [USERNAME]
    it'll then ask for your password
    """
    date = datetime.date.today()
    client = myfitnesspal.Client(username, os.getenv('PASSWORD'))

    day = client.get_date(date.year, date.month, date.day)
    
    food_ate = []
    for meal in day.meals:
        for item in meal:
            # Split by name
            split_1 = item.name.split(', ')
            name = split_1[0]

            # split_2 ex: [3, 'stalk']
            split_2 = split_1[1].split(' ')
            quantity = float(split_2[0])
            units = split_2[1]

            food_ate.append(parser.get_water_data(
                            name_to_code[name], 
                            name=name,
                            quantity=quantity,
                            units=units))
    return [json.loads(str(item)) for item in food_ate]

if __name__ == '__main__':
    # Add your myfitnesspal username as an argument
    parser = CSVParser()
    print(request_today(sys.argv[1], parser))
