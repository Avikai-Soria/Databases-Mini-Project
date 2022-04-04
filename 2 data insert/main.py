from datetime import timedelta
from random import random
import csv
from faker import Faker

#
# def main():
#
#
# if __name__ == "__main__":
#     main()

# from datetime import timedelta
# from faker import Faker
#
# FAKE = Faker()
#
# CuratorId = 0
# FirstName = '?'
# SecondName = '?'
# Specialization = '?'
# Rank = 0
# time = FAKE.date_time_this_decade()
# ttime = time + timedelta(days=40)
# print(f"I love {time} for \"{ttime}!\"")

# FAKE = Faker()
# n = 10
# r = range(1, n + 1)
# StartTime = list(map(lambda a: FAKE.date_time_this_decade(), r))
# EndTime = list(map(lambda a: a + timedelta(days=random.randint(10, 100)), StartTime))

    # with open("csv_file/music_type.csv", 'r') as file:
    #     content = file.readlines()
    # rows = content[1:]
    # rows = list(map(lambda a: a[:-1], rows))
    # print(rows)



# flight
MAX_PLANE_ID = 500
from random import randint, choice
from datetime import datetime, timedelta

flight_sql_file = open("gen_flightdata.sql", "w+")
SIZE = 20000
PLAIN_COUNT = 4000


def main():
    for id in range(1, SIZE):
        flight_date = datetime.now() + timedelta(
            days=randint(-50, 100), hours=randint(-100, 100)
        )
        flight_date = flight_date.replace(
            second=0, minute=choice([0, 15, 30, 45, 0, 30, 0, 30, 0])
        )
        flight_time = randint(30, 1050)
        # take only 2021-06-29 11:00 from 2021-06-29 11:00:00.977900
        flight_date = str(flight_date)[:-10].replace("-", "/")
        plane_id = randint(1, MAX_PLANE_ID)
        src_airport_id = randint(1, PLAIN_COUNT)
        dst_airport_id = src_airport_id
        while dst_airport_id == src_airport_id:
            dst_airport_id = randint(1, PLAIN_COUNT)
        to_print = f"INSERT INTO FLIGHT(flightid, takeoffdatetime, flighttime, planeid, srcairportid, dstairportid) values ({id},to_date('{flight_date}', 'YYYY/MM/DD HH24:MI'),{flight_time},{plane_id},{src_airport_id},{dst_airport_id});\n"
        flight_sql_file.write(to_print)


if __name__ == "__main__":
    main()