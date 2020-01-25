import pandas as pd

class WaterData():
    def __init__(self, name=None, water_usage=0):
        self.name = name
        self.water_usage = water_usage

    def __str__(self):
        return f"{self.name}: {self.water_usage}"

class CSVParser():
    def __init__(self):
        self.df = pd.read_csv('water_footprint.csv')

    def get_product(self, code: str):
        code_col = 'Product code (HS)'
        row = (self.df.loc[self.df[code_col] == code]).iloc[0]

        to_return = WaterData(
                name=str(row['Product description (HS)']),
                water_usage=int(row['Global average']))
        return to_return

if __name__ == '__main__':
    parser = CSVParser()
    print(parser.get_product('110100'))
