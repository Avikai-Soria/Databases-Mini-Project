
def getDepartment(n: int):
    r = range(1, n + 1)
    DepartmentId = r

    coloms_name = ("DepartmentId")
    t_name = "Department"

    data = ""
    for i in r:
        data += (
                f"insert into {t_name} (DepartmentId) values "
                + f"({DepartmentId[i - 1]});\n"
        )

    with open("../sql/gen_Department.sql", "w") as f:
        f.write(data)


getDepartment(400)