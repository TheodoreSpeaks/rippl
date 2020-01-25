import myfitnesspal
import datetime
import sys

def request_today(username):
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
            food_ate.append(item)
    
    print(food_ate)

if __name__ == '__main__':
    request_today(sys.argv[1])
