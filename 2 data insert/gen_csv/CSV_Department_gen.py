def getDepartment(n: int):
    r = range(1, n + 1)
    DepartmentId = r

    coloms_name = ("DepartmentId")
    t_name = "Department"

    data = ""
    data += "DepartmentId"
    data += "\n"

    for i in r:
        data += (
            f"{DepartmentId[i - 1]}\n"
        )

    with open("../csv_file/gen_Department.csv", "w") as f:
        f.write(data)


getDepartment(800)
