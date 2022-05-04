Select AVG(SalaryForCurator), rank
From Curator Natural Join CuratorAtExhibition Natural Join Exhibition
Where Rank >= 7 and StartTime >= to_date('1/1/2020', 'dd/mm/yyyy') and EndTime <= to_date('1/1/2022', 'dd/mm/yyyy') and Genre LIKE '%pop%'
Group By Rank