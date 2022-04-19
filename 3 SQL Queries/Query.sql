Select StartTime, EndTime, URL
From Exhibition Natural Join ExhibitionAtDepartment
Where Genre LIKE '_b%' and DepartmentId < 530 and DepartmentId > 330

Select AVG(SalaryForCurator), rank
From Curator Natural Join CuratorAtExhibition Natural Join Exhibition
Where Rank >= 7 and StartTime >= to_date('1/1/2020', 'dd/mm/yyyy') and EndTime <= to_date('1/1/2022', 'dd/mm/yyyy') and Genre LIKE '%pop%'
Group By Rank

Select Name, DatePurchased
From Exhibit Natural Join ExhibitHistory
Where Price > 700 and Status LIKE '%stolen%'
Group By ExhibitId, Name, DatePurchased
Having count(*) > 1

Select DepartmentId, Genre
From Department Natural Join ExhibitionAtDepartment Natural Join Exhibition
Group By DepartmentId, Genre
Having count(*) >= 3

Select FirstName, LastName, Email, Rank + 1
From Curator Natural Join CuratorAtExhibition
Where Date_of_birth > to_date('1/1/1980', 'dd/mm/yyyy') and
CuratorId in (Select CuratorId  From Curator Natural Join CuratorAtExhibition
                Group By CuratorId
                    Having count(*) >= 3)


