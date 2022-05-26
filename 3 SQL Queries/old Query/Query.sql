Select StartTime, EndTime, URL
From Exhibition Natural Join ExhibitionAtDepartment
Where Genre LIKE '_b%' and DepartmentId < 530 and DepartmentId > 330

Select AVG(SalaryForCurator), rank
From Curator Natural Join CuratorAtExhibition Natural Join Exhibition
Where Rank >= 7 and StartTime >= to_date('1/1/2020', 'dd/mm/yyyy') and EndTime <= to_date('1/1/2022', 'dd/mm/yyyy') and Genre LIKE '%pop%'
Group By Rank

Select Name, Price, DatePurchased
From Exhibit Natural Join ExhibitHistory
Where Status LIKE '%stolen%'
Group By ExhibitId, Name, DatePurchased, Price
Having count(*) > 1 and Price > 100

Select DepartmentId, Genre
From Department Natural Join ExhibitionAtDepartment Natural Join Exhibition
Group By DepartmentId, Genre
Having count(*) >= 3

Select FirstName, LastName, Email, Rank + 1
From Curator Natural Join CuratorAtExhibition
Where Date_of_birth > to_date('1/1/1980', 'dd/mm/yyyy') and rank < 7 and
CuratorId in (Select CuratorId  From Curator Natural Join CuratorAtExhibition Natural Join Exhibition
                Where StartTime < ADD_MONTHS(EndTime, -1)
                    Group By CuratorId
                        Having count(*) >= 2)

Select Name, Price
From Exhibit Natural Join ExhibitHistory Natural Join ExhibitAtExhibition
Where Price < 1000 and DatePurchased < to_date('1/1/2010', 'dd/mm/yyyy')
and Where ExhibitId in (Select ExhibitId
                            From Exhibit Natural Join ExhibitAtExhibition Natural Join Exhibition
                                Where StartTime < ADD_MONTHS(EndTime, -2)
and ExhibitHistoryId in(Select ExhibitHistoryId
                            From ExhibitHistory EH
                                Where DateIncome >= ALL(Select DateIncome
                                                           From ExhibitHistory T
                                                                Where EH.ExhibitId = T.ExhibitId))

Select Sum(Price) as Loses
From Exhibit Natural Join ExhibitHistory
Where ExhibitHistoryId in(Select ExhibitHistoryId
                            From ExhibitHistory EH
                                Where DateIncome >= ALL(Select DateIncome
                                                           From ExhibitHistory T
                                                                Where EH.ExhibitId = T.ExhibitId))
and Status = '%stolen%'

Select Sum(Price) as Profit
From Exhibit Natural Join ExhibitHistory
Where ExhibitHistoryId in(Select ExhibitHistoryId
                            From ExhibitHistory EH
                                Where DateIncome >= ALL(Select DateIncome
                                                           From ExhibitHistory T
                                                                Where EH.ExhibitId = T.ExhibitId))
and Status = '%for auction%'


Select Name, Price
From Exhibit E
Where Not Exists ((Select ExhibitionId
                   From Exhibition Natural Join ExhibitionAtDepartment
                   Where DepartmentId = 53)
                   Minus
                   (Select ExhibitionId
                   From ExhibitAtExhibition EAE
                   Where E.ExhibitId = EAE.ExhibitId)
)



