# 20,000
from datetime import timedelta
import random
from faker import Faker

FAKE = Faker()


#
# ExhibitId = 0
# Name = "?"
# Price = 0.0
# DatePurchased = 0/0/0/0

def getExhibit(n: int):
    r = range(1, n + 1)
    with open("csv_file/Musical Instrument.csv", 'r') as file:
        Instrument = file.readlines()
    Instrument = Instrument[1:]
    Instrument = list(map(lambda a: a[:-1].split(",")[0], Instrument))

    ExhibitId = r
    Name = list(map(lambda a: Instrument[random.randint(0, 540)], r))
    Price = list(map(lambda a: "{:.1f}".format(random.uniform(10.5, 1000.5)), r))

    DatePurchased = list(map(lambda a: FAKE.date_time_this_decade() - timedelta(days=random.randint(1000, 10000)), r))
    DatePurchased = list(map(lambda a: str(a)[:-9].replace("-", "/"), DatePurchased))

    colums_name = ("ExhibitId", "Name", "Price", "DatePurchased")
    t_name = "SORIA.Exhibit"

    data = ""
    data += ', '.join(colums_name)
    data += "\n"

    for i in r:
        data += (
                f"{ExhibitId[i - 1]},{Name[i - 1]}"
                + f",{Price[i - 1]}"
                + f",{DatePurchased[i - 1]}\n"
        )

    with open("csv_file/gen_Exhibit.csv", "w") as f:
        f.write(data)


getExhibit(20000)
