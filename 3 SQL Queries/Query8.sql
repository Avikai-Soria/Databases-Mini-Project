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
