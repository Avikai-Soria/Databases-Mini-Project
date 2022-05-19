create or replace procedure Promote_Curator(Cid in Int) is
begin
  Update CURATOR
  set Rank = Rank + 1
  Where CuratorID = Cid
end;
/
/
