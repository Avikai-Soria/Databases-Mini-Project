create or replace function Average_Price_Department(DepID in int) return
 Number is
 l_avg_price Number := 0;
begin
  Select AVG(Price) into l_avg_price
  From Exhibit E
  Where Not Exists ((Select ExhibitionId
                   From Exhibition Natural Join ExhibitionAtDepartment
                   Where DepartmentId = DepID)
                   Minus
                   (Select ExhibitionId
                   From ExhibitAtExhibition EAE
                   Where E.ExhibitId = EAE.ExhibitId));

  return l_avg_price;
end Average_Price_Department;
/
