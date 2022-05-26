Select Department_Id, Genre
From Department Natural Join ExhibitionAtDepartment Natural Join Exhibition
Group By Department_Id, Genre
Having count(*) >= 2
