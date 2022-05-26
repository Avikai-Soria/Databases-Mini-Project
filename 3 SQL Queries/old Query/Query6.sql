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
