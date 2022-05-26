Select StartTime, EndTime, URL
From Exhibition Natural Join ExhibitionAtDepartment
Where Genre LIKE '_b%' and DepartmentId < 530 and DepartmentId > 330
