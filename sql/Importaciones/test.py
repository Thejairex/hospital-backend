import json
from datetime import datetime


traffics = json.load(open('sql/dataPaciente.json'))

print(traffics)
def current_time():
    now = datetime.now()
    return now.strftime("%Y/%m/%d")
    
    return day
for traffic in traffics:
    print(current_time())