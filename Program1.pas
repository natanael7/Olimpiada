const fInName = 'hotel.in';
      fOutName = 'hotel.out';
      
var nrPers, nr3, nr2 : integer;
    fIn,fOut : text;

function input : integer;
begin
  assign(fIn, fInName);
  reset(fIn);
  while not eof(fIn) do
    readln(fIn, nrPers);
  close(fIn);
  input := 0;
end;

function output : integer;
begin
  assign(fOut, fOutName);
  rewrite(fOut);
  write(fOut, nr3,' ',nr2);
  close(fOut);
  output := 0;
end;

function solve : integer;
begin
  if nrPers mod 3 = 0
  then
  begin
    nr3 := nrPers div 3;
    nr2 := 0;
  end
  else
  begin
    nr3 := nrPers div 3;
    nr2 := 1;
  end;
  solve := 0;

end;

begin
  input();
  solve();
    if (nrPers = 2) then   
  begin 
    nr2 := 1;
    nr3 := 0;
  end;
   if (nrPers = 4) then   
  begin 
    nr2 := 2;
    nr3 := 0;
  end;
  output();
end.