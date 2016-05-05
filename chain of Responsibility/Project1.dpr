program Project1;
{$APPTYPE CONSOLE}
uses
  SysUtils,
  Unit1 in 'Unit1.pas';

var
  jinli: TCommonmanger;
  zongjian: TMajordomo;
  zhongjingli: TGeneralManger;
  request, request2, request3, request4: TRequest;
begin
  jinli := TCommonmanger.Create('金利');
  zongjian := TMajordomo.Create('宗劍');
  zhongjingli := TGeneralManger.Create('鍾精歷');

  jinli.SetSuperior(zongjian);
  zongjian.SetSuperior(zhongjingli);

  request := TRequest.Create;
  request.requestType := '請假';
  request.requestcontent := '小菜請假';
  request.Number := 1;
  jinli.RequestApplications(request);

  request2 := TRequest.Create;
  request2.requestType := '請假';
  request2.requestcontent := '小菜請假';
  request2.Number := 4;
  jinli.RequestApplications(request2);

  request3 := TRequest.Create;
  request3.requestType := '加薪';
  request3.requestcontent := '小菜請求加薪';
  request3.Number := 500;
  jinli.RequestApplications(request3);

  request4 := TRequest.Create;
  request4.requestType := '加薪';
  request4.requestcontent := '小菜請求加薪';
  request4.Number := 1000;
  jinli.RequestApplications(request4);

  readln;
  // Insert user code here
end.