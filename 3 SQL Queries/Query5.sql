Select FirstName, LastName, Email, Rank + 1
From Curator Natural Join CuratorAtExhibition
Where Date_of_birth > to_date('1/1/1980', 'dd/mm/yyyy') and rank < 7 and
CuratorId in (Select CuratorId  From Curator Natural Join CuratorAtExhibition Natural Join Exhibition
                Where StartTime < ADD_MONTHS(EndTime, -1)
                    Group By CuratorId
                        Having count(*) >= 2)
