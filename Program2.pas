const fInName = 'divizor.in';
      fOutName = 'divizor.out';
      
var nrInit, solsCount : longInt;
    fIn,fOut : text;
    combs : array [1..100] of longInt;
    sols : array [1..100] of longInt;

function divsCount(nr :longInt) : integer;
var k, i :longInt;
begin
  for i := 1 to nr do
    if (nr mod i = 0) then
      inc(k);
  divsCount := k;
end;

function power(base, exp :longInt) : longInt;
var i, res : longInt;
begin
  res := 1;
  for i := 1 to exp do
    res := res * base;
  power := res;
end;

function len(nr :longInt) : longInt;
var aux, count :longInt;
begin
  aux := nr;
  count := 0;
  while nr > 0 do
  begin
    nr := nr div 10;
    inc(count);
  end;
  len := count;
end;

function reverse(inNr : longInt) : longInt;
var outNr, lastDigit : longInt;
begin
  lastDigit := inNr mod 10;
  outNr := (inNr - lastDigit) div 10 + lastDigit * power(10, len(nrInit)-1);
  reverse := outNr;
end;

function combsFilter : longInt;
var i, max, solIterator :longInt;
begin
  max := 0;
  solsCount := 0;
  solIterator := 1;
  
  for i := 1 to len(nrInit) do
    if divsCount(combs[i]) > max then
      max := divsCount(combs[i]);
  
  for i := 1 to len(nrInit) do
    if divsCount(combs[i]) = max then
      inc(solsCount);
      
  for i := 1 to len(nrInit) do
    if divsCount(combs[i]) = max then
    begin  
      inc(solIterator);
      sols[solIterator] := combs[i];
    end;
    
  combsFilter := 0;
end;

function combsGenerator : longInt;
var i :longInt;
begin
  combs[1] := nrInit;
  for i := 1 to len(nrInit) do 
  begin
    combs[i + 1] := reverse(combs[i])
  end;
  combsGenerator := 0;
end;

function input : longInt;
begin
  assign(fIn, fInName);
  reset(fIn);
  while not eof(fIn) do
    readln(fIn, nrInit);
  close(fIn);
  input := 0;
end;

function output : longInt;
var i :longInt;
begin
  assign(fOut, fOutName);
  rewrite(fOut);
  for i := 2 to solsCount + 1 do
    write(fOut, sols[i], ' ');
  close(fOut);
  output := 0;
end;

function solve : longInt;
begin
  combsGenerator();
  combsFilter();
  solve := 0;
end;

begin
  input();
  solve();
  output();
end.