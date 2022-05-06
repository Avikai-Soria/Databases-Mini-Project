Select FirstName
From Curator C
Where Not Exists ((Select ExhibitionId
                   From Exhibition Natural Join ExhibitionAtDepartment
                   Where DepartmentId = 50)
                   Minus
                   (Select ExhibitionId
                   From Curatoratexhibition CAE
                   Where C.CuratorId = CAE.CuratorId)
)
