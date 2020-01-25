import myfitnesspal
import datetime
import sys
import re
from parse_water_footprint import *

def request_today(username, parser):
    """
    To run:
    sudo pip insntall myfitnesspal
    myfitnesspal store-password [USERNAME]
    it'll then ask for your password
    """
    date = datetime.date.today()
    client = myfitnesspal.Client(username)
    day = client.get_date(date.year, date.month, date.day)
    
    food_ate = []
    for meal in day.meals:
        for item in meal:
            # Split by name
            split_1 = item.name.split(', ')

            # split_2 ex: [3, 'stalk']
            split_2 = split_1[1].split(' ')
            quantity = float(split_2[0])
            units = split_2[1]

            food_ate.append(parser.get_water_data('110100a', 
                            name=split_1[0],
                            quantity=quantity,
                            units=units))
    
    for data in food_ate:
        print(data)

if __name__ == '__main__':
    # Add your myfitnesspal username as an argument
    parser = CSVParser()
    request_today(sys.argv[1], parser)
