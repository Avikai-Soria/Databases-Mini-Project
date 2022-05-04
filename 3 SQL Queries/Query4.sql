Select DepartmentId, Genre
From Zaguri.Department Natural Join ExhibitionAtDepartment Natural Join Exhibition
Group By DepartmentId, Genre
Having count(*) >= 2
