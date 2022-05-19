create or replace view stolen_items_history
(itemname, itemprice)
as
Select Name, Price
From Exhibit Natural Join ExhibitHistory
Where Status LIKE '%stolen%';
