import random

from faker import Faker

FAKE = Faker()


def getDepartment(n: int):
    r = range(1, n + 1)
    DepartmentId = r
    Contributor = list(map(lambda a: FAKE.last_name(), r))
    Floor = list(map(lambda a: random.randint(1, 10), r))
    coloms_name = ("Department_Id", "Contributor", "Floor")
    t_name = "Department"

    data = ""
    for i in r:
        data += (
                f"insert into {t_name} ({', '.join(coloms_name)}) values "
                + f"({DepartmentId[i - 1]}, '{Contributor[i-1]}', '{Floor[i-1]}');\n"
        )

    with open("../sql/gen_Department.sql", "w") as f:
        f.write(data)


getDepartment(800)
