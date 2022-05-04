Select DepartmentId, Genre
From Department Natural Join ExhibitionAtDepartment Natural Join Exhibition
Group By DepartmentId, Genre
Having count(*) >= 3