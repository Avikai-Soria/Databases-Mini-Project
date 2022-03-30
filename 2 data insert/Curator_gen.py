import datetime
import random
import time

from faker import Faker

FAKE = Faker()

CuratorId = 0
FirstName = '?'
SecondName = '?'
Specialization = '?'
Rank = 0


def getCurator(n: int):
    r = range(1, n + 1)
    shuttleID = r
    busCount = list(map(lambda a: random.randint(1, 60), r))
    startTime, endTime = list(zip(*map(times, r)))
    description = list(map(lambda a: FAKE.text().replace("\n", " "), r))

    srcAirportID = list(map(lambda a: random.randint(1, n), r))
    dstCityID = list(map(lambda a: random.randint(1, n), r))
    coloms_name = ("shuttleID", "busCount", "startTime", "endTime", "description", "dstCityID", "srcAirportID")
    t_name = "ShuttleBusLine"

    data = ""
    for i in r:
        data += (
                f"insert into {t_name} ({', '.join(coloms_name)}) values "
                + f"({shuttleID[i - 1]}, '{busCount[i - 1]}', to_date('{startTime[i - 1]}','HH24:MI'), to_date('{endTime[i - 1]}','HH24:MI'), '{description[i - 1]}', {srcAirportID[i - 1]}, {dstCityID[i - 1]});\n"
        )

    with open("gen_Suttle.sql", "w") as f:
        f.write(data)


getCurator(4000)
