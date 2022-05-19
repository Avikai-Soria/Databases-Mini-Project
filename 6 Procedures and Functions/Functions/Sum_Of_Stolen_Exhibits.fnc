create or replace function Sum_Of_Stolen_Exhibits(MinPrice int) return number is
  l_sum_value Number := 0;
begin
  Select Sum(Sum(Price))
  Into l_sum_value
  From Exhibit Natural Join ExhibitHistory
  Where Status LIKE '%stolen%'
  Group By ExhibitId, Name, DatePurchased, Price
  Having Price > MinPrice;
  
  return l_sum_value;
end Sum_Of_Stolen_Exhibits;
/
