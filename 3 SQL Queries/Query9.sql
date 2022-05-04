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
