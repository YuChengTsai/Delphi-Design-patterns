program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  jiaojiao : TShoolgirl;
  daili : Tproxy;
begin
   jiaojiao := TShoolgirl.Create;
   daili := TProxy.Create;

   jiaojiao.Name := '§õ¼b¼b';
   daili.Proxy(jiaojiao);

   daili.GiveDolls;
   daili.GiveFlowers;
   daili.GiveChocolae;

   readln;

  // Insert user code here
end.