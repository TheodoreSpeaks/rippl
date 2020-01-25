import pandas as pd
import json

class WaterData():
    # UNIT to tons
    conversions = {
        'g': 1e-6,
        'cup': .000225,
        'large': .00068,
        'pounds': .0004536
    }

    def get_gallons(self, quantity, cubes_per_ton, units):
        gallon_factor = 265.172 # Multiply this to go from m^3 to gallons
        return cubes_per_ton * quantity * gallon_factor * WaterData.conversions[units]

    def __init__(self, name=None, quantity=1, water_usage=0, units='pounds'):
        self.name = name
        self.quantity = quantity
        self.gallons = self.get_gallons(quantity, water_usage, units)
        self.units = units

    def __str__(self):
        return json.dumps(self.__dict__)

class CSVParser():

    def __init__(self):
        self.df = pd.read_csv('water_footprint.csv')


    def get_water_data(self, code: str, name=None, quantity=1,units="pounds"):
        code_col = 'Product code (HS)'
        row = (self.df.loc[self.df[code_col] == code]).iloc[0]

        to_return = WaterData(
                name=name or row['Product description (HS)'],
                quantity=quantity,
                water_usage=int(row['Global average']),
                units=units)

        return to_return

if __name__ == '__main__':
    parser = CSVParser()
    print(parser.get_water_data('110100', name="Hi", quantity=2))
