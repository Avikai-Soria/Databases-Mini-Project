# 3000 instance
import random


def getCuratorAtExhibition(n: int):
    r = range(1, n + 1)
    CuratorAtExhibitionId = r
    SalaryForCurator = list(map(lambda a: random.randint(1, 100000), r))
    CuratorId = list(map(lambda a: random.randint(1, 20000), r))
    ExhibitionId = list(map(lambda a: random.randint(1, 400), r))
    colums_name = ("CuratorAtExhibitionId", "SalaryForCurator", "CuratorId", "ExhibitionId")
    t_name = "SORIA.ExhibitAtExhibition"

    data = ""
    for i in r:
        data += (
                f"insert into {t_name} ({', '.join(colums_name)}) values "
                + f"({CuratorAtExhibitionId[i - 1]} , {SalaryForCurator[i - 1]},{CuratorId[i - 1]} , {ExhibitionId[i - 1]});\n"
        )

    with open("sql/gen_CuratorAtExhibition.sql", "w") as f:
        f.write(data)


getCuratorAtExhibition(3000)
