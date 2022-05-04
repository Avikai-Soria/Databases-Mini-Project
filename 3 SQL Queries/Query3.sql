Select Name, Price, DatePurchased
From Exhibit Natural Join ExhibitHistory
Where Status LIKE '%stolen%'
Group By ExhibitId, Name, DatePurchased, Price
Having count(*) > 1 and Price > 100