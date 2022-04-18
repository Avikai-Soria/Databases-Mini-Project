# 3000 instance
import random


def getExhibitAtExhibition(n: int):
    r = range(1, n + 1)
    ExhibitAtExhibitionId = r
    ExhibitId = random.sample(range(50000), n)
    ExhibitionId = list(map(lambda a: random.randint(1, 800), r))
    coloms_name = ("ExhibitId", "ExhibitionId", "ExhibitAtExhibitionId")
    t_name = "SORIA.ExhibitAtExhibition"

    data = ""
    data += ', '.join(coloms_name)
    data += "\n"

    for i in r:
        data += (
                f"{ExhibitId[i - 1]},{ExhibitionId[i - 1]},{ExhibitAtExhibitionId[i - 1]}\n"
        )


    with open("../csv_file/gen_ExhibitAtExhibition.csv", "w") as f:
        f.write(data)


getExhibitAtExhibition(3000)
