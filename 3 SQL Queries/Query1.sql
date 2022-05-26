Select StartTime, EndTime, URL
From Exhibition Natural Join ExhibitionAtDepartment
Where Genre LIKE '_b%' and Department_Id < 530 and Department_Id > 330
