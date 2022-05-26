Select Count(*) as AmountOfStolens
From Exhibit Natural Join ExhibitHistory Natural join Exhibitatexhibition Natural join Exhibitionatdepartment Natural join AHELLER.ROOMS
Where ExhibitHistoryId in(Select ExhibitHistoryId
                            From ExhibitHistory EH
                                Where DateIncome >= ALL(Select DateIncome
                                                           From ExhibitHistory T
                                                                Where EH.ExhibitId = T.ExhibitId))
and Status Like '%stolen%' and room_id > 1000 and room_id < 2000
