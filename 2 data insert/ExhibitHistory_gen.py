# 1000 instance

import random
from datetime import timedelta

from faker import Faker

FAKE = Faker()


def getExhibitHistory(n: int):
    r = range(1, n + 1)
    status_list = ["in repair", "displayed in exhibition", "in warehouse", "out of order", "stolen", "for auction"]
    Status = list(map(lambda a: status_list[random.randint(0, len(status_list) - 1)], r))
    ExhibitHistoryId = r
    ExhibitId = list(map(lambda a: random.randint(1, 20000), r))
    DateIncome = list(map(lambda a: FAKE.date_time_this_decade() - timedelta(days=random.randint(0,1000)), r))
    DateIncome = list(map(lambda a: str(a)[:-3].replace("-", "/"), DateIncome))

    colums_name = ("ExhibitHistoryId", "ExhibitId", "Status", "DateIncome")
    t_name = "SORIA.CURATOR"

    data = ""
    for i in r:
        data += (
                f"insert into {t_name} ({', '.join(colums_name)}) values "
                + f"({ExhibitHistoryId[i - 1]}, {ExhibitId[i - 1]} , '{Status[i - 1]}',to_date('{DateIncome[i - 1]}', 'YYYY/MM/DD HH24:MI');\n"
        )

    with open("sql/gen_ExhibitHistory.sql", "w") as f:
        f.write(data)


getExhibitHistory(1000)
