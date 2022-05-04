Select Sum(Price) as Loses
From Exhibit Natural Join ExhibitHistory
Where ExhibitHistoryId in(Select ExhibitHistoryId
                            From ExhibitHistory EH
                                Where DateIncome >= ALL(Select DateIncome
                                                           From ExhibitHistory T
                                                                Where EH.ExhibitId = T.ExhibitId))
and Status = '%stolen%'