# 400 instance
from datetime import timedelta
import random
from faker import Faker

FAKE = Faker()

ExhibitionId = 0
URL = "?"
Genre = "?"
StartTime = 0
EndTime = 0


# =================================

def getExhibition(n: int):
    r = range(1, n + 1)
    ExhibitionId = r
    URL = list(map(lambda a: FAKE.url(), r))
    StartTime = list(map(lambda a: FAKE.date_time_this_decade(), r))
    EndTime = list(map(lambda a: a + timedelta(days=random.randint(10, 100)), StartTime))
    StartTime = list(map(lambda a: str(a)[:-9].replace("-", "/"), StartTime))
    EndTime = list(map(lambda a: str(a)[:-9].replace("-", "/"), EndTime))

    with open("csv_file/music_type.csv", 'r') as file:
        Genre = file.readlines()
    Genre = Genre[1:]
    Genre = list(map(lambda a: a[:-1], Genre))

    colums_name = ("ExhibitionId", "URL", "Genre", "StartTime", "EndTime")
    t_name = "SORIA.Exhibition"

    data = ""
    for i in r:
        data += (
                f"insert into {t_name} ({', '.join(colums_name)}) values "
                + f"({ExhibitionId[i - 1]},'{URL[i - 1]}', {Genre[i - 1]}"
                + f",to_date('{StartTime[i - 1]}', 'YYYY/MM/DD')"
                + f",to_date('{EndTime[i - 1]}', 'YYYY/MM/DD'));\n"
        )

    with open("sql/gen_Exhibition.sql", "w") as f:
        f.write(data)


getExhibition(400)
