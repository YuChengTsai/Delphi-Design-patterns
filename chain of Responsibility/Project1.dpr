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
  jinli := TCommonmanger.Create('���Q');
  zongjian := TMajordomo.Create('�v�C');
  zhongjingli := TGeneralManger.Create('����');

  jinli.SetSuperior(zongjian);
  zongjian.SetSuperior(zhongjingli);

  request := TRequest.Create;
  request.requestType := '�а�';
  request.requestcontent := '�p��а�';
  request.Number := 1;
  jinli.RequestApplications(request);

  request2 := TRequest.Create;
  request2.requestType := '�а�';
  request2.requestcontent := '�p��а�';
  request2.Number := 4;
  jinli.RequestApplications(request2);

  request3 := TRequest.Create;
  request3.requestType := '�[�~';
  request3.requestcontent := '�p��ШD�[�~';
  request3.Number := 500;
  jinli.RequestApplications(request3);

  request4 := TRequest.Create;
  request4.requestType := '�[�~';
  request4.requestcontent := '�p��ШD�[�~';
  request4.Number := 1000;
  jinli.RequestApplications(request4);

  readln;
  // Insert user code here
end.