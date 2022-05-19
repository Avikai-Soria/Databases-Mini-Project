create or replace procedure Inflation_Old_Exhibits(Inflition_Precent in int) is
begin
  Update Exhibit
  Set Price = Price + (Price * Inflition_Precent / 100)
  Where DATEPURCHASED < to_date('1/1/2000', 'dd/mm/yyyy');
end Inflation_Old_Exhibits;
/
