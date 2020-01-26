import pandas as pd
import json
import math

def _convert_to_int(a):
    return a if not math.isnan(a) else 0 

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

    def __init__(self, name=None, quantity=1, water_usage=0, units='pounds', blue_water=0, green_water=0, grey_water=0):
        self.name = name
        self.quantity = quantity
        self.gallons = self.get_gallons(quantity, water_usage, units)
        self.units = units
        self.blue_water = blue_water
        self.green_water = green_water
        self.grey_water = grey_water

    def __str__(self):
        return json.dumps(self.__dict__)

class CSVParser():
    def __init__(self):
        meat_df = pd.read_csv("meat_data.csv")
        food_df = pd.read_csv("water-consumption-food.csv")
        df_products = pd.DataFrame(columns=['HS', 'product_name', 'green_world_average', 'blue_world_average', 'grey_world_average'])

        i = 1
        for item in (meat_df[meat_df['Country'] == 'Green']['Product discription (HS)']) :
            df_products = df_products.append({'HS': str(int(meat_df['HS (PC-TAS) code'][i])),'product_name': str(item), 'green_world_average': int(meat_df['World Average'][i]), 'blue_world_average': int(meat_df['World Average'][i+1]),  'grey_world_average': int(meat_df['World Average'][i+2])}, ignore_index=True)
            i+=3

        i = 1
        for item in (food_df[food_df["Province/ state >>>"]=='Green']['Product description (HS)']) :
            df_products = df_products.append({'HS': food_df['Product code (HS)'][i],'product_name': str(item), 'green_world_average': _convert_to_int(food_df['Global average'][i]), 'blue_world_average': _convert_to_int(food_df['Global average'][i+1]),  'grey_world_average': _convert_to_int(food_df['Global average'][i+2])}, ignore_index=True)
            i+=3
            
        self.df = df_products

        self.df.to_csv('combined.csv', sep=',')

    def get_water_data(self, code: str, name=None, quantity=1, units="pounds"):
        code_col = 'HS'
        row = (self.df.loc[self.df[code_col] == code]).iloc[0]

        to_return = WaterData(
                name=name or row['product_name'],
                quantity=quantity,
                water_usage=int(row['blue_world_average']) + int(row['grey_world_average']),
                units=units,
                blue_water=row['blue_world_average'],
                grey_water=row['grey_world_average'],
                green_water=row['green_world_average'])

        return to_return

if __name__ == '__main__':
    parser = CSVParser()
    print(parser.get_water_data('110100', name="Hi", quantity=2))
