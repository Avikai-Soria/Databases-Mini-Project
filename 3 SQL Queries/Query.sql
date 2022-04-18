Select StartTime, EndTime, URL
From Exhibition Natural Join ExhibitionAtDepartment
Where Genre LIKE '_b%' and DepartmentId < 530 and DepartmentId > 330

Select AVG(SalaryForCurator)
From Curator Natural Join CuratorAtExhibition Natural Join Exhibition
Where Rank >= 7 and StartTime >= '1/1/2020' and EndTime <= '1/1/2022'