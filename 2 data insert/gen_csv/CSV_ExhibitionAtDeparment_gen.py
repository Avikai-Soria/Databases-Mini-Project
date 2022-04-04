# 400 instance
import random

DepartmentId = 0
ExhibitionId = 0


def getExhibitionAtDepartment(n: int):
    r = range(1, n + 1)
    DepartmentId = random.sample(range(400), n)
    ExhibitionId = random.sample(range(400), n)
    ExhibitionAtDepartmentId = r
    coloms_name = ("DepartmentId", "ExhibitionId" , "ExhibitionAtDepartmentId")
    t_name = "SORIA.ExhibitionAtDepartment"

    data = ""
    data += ', '.join(coloms_name)
    data += "\n"

    for i in r:
        data += (
                f"{DepartmentId[i - 1]},{ExhibitionId[i - 1]},{ExhibitionAtDepartmentId[i - 1]}\n"
        )


    with open("../csv_file/gen_ExhibitionAtDepartment.csv", "w") as f:
        f.write(data)


getExhibitionAtDepartment(400)
