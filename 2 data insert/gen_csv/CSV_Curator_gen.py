# 20,000 instance
import datetime
import random
import time

from faker import Faker

FAKE = Faker()

CuratorId = 0
FirstName = '?'
SecondName = '?'
Email = '?'
Rank = 0

def getCurator(n: int):
    r = range(1, n + 1)
    CuratorId = r
    Rank = list(map(lambda a: random.randint(1, 10), r))
    FirstName = list(map(lambda a: FAKE.first_name(), r))
    LastName  = list(map(lambda a: FAKE.last_name(), r))
    Email = list(map(lambda a: FAKE.ascii_email(), r))
    Date_of_birth = list(map(lambda a: FAKE.date_time_this_decade() - datetime.timedelta(days=random.randint(9000, 20000)), r))
    Date_of_birth = list(map(lambda a: str(a)[:-9].replace("-", "/"), Date_of_birth))

    coloms_name = ("CuratorId", "FIRSTNAME","LastName","Email","RANK","Date_of_birth")
    t_name = "SORIA.CURATOR"

    data = ""
    data += ', '.join(coloms_name)
    data += "\n"

    for i in r:
        data += (
                f"{CuratorId[i - 1]},'{FirstName[i - 1]}','{LastName[i - 1]}','{Email[i - 1]}',{Rank[i - 1]},{Date_of_birth[i - 1]} \n"
        )


    with open("../csv_file/gen_Curator.csv", "w") as f:
        f.write(data)


getCurator(20000)
