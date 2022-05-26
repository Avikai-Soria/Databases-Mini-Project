Select FirstName
From Curator C
Where Not Exists ((Select ExhibitionId
                   From Exhibition Natural Join ExhibitionAtDepartment
                   Where Department_Id = 50)
                   Minus
                   (Select ExhibitionId
                   From Curatoratexhibition CAE
                   Where C.CuratorId = CAE.CuratorId)
)
