const fInName = 'divizor.in';
      fOutName = 'divizor.out';
      
var nrProd, k, sumMin : longInt;
    fIn,fOut : text;
    prices : array [1..100] of longInt;

procedure swap(var a, b : integer);
var temp :integer;
begin
temp := a;
a := b;
b := temp
end;
  
function sort : integer;
var i, j : integer;
begin
  for i := 1 to nrProd do
    for j := 1 to nrProd - i do
      if prices[j] > prices[j + 1] then
        swap(prices[j], prices[j +1 ]);
  sort := 0;
end;

function extract : integer;
var i, j : integer;
begin
  for i := 1 to nrProd do
    if (i mod 2 = 0) then
      prices[i] := 0;
  extract := 0;
end;

function calculus : integer;
var i, sum : longInt;
begin
  sum := 0;
  for i := 1 to nrProd do
    sum := sum + prices[i];
  sumMin := sum;
  calculus := 0;
end;

function input : longInt;
var i, j : integer;
begin
  assign(fIn, fInName);
  reset(fIn);
  read(fIn, nrProd, k);
  for i := 1 to nrProd do
    readln(fIn, prices[i]);
  close(fIn);
  input := 0;
end;

function output : longInt;
var i :longInt;
begin
  assign(fOut, fOutName);
  rewrite(fOut);
    write(fOut, sumMin);
  close(fOut);
  output := 0;
end;

function solve : longInt;
begin
  sort();
  extract();
  calculus();
  solve := 0;
end;

begin
  input();
  solve();
  output();
end.