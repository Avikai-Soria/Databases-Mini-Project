# 3000 instance
import random


def getExhibitAtExhibition(n: int):
    r = range(1, n + 1)
    ExhibitAtExhibitionId = r
    ExhibitId = random.sample(range(20000), n)
    ExhibitionId = list(map(lambda a: random.randint(1, 400), r))
    coloms_name = ("ExhibitId", "ExhibitionId", "ExhibitAtExhibitionId")
    t_name = "SORIA.ExhibitAtExhibition"

    data = ""
    for i in r:
        data += (
                f"insert into {t_name} ({', '.join(coloms_name)}) values "
                + f"({ExhibitId[i - 1]} , {ExhibitionId[i - 1]} , {ExhibitAtExhibitionId[i - 1]});\n"
        )

    with open("../sql/gen_ExhibitAtExhibition.sql", "w") as f:
        f.write(data)


getExhibitAtExhibition(3000)
