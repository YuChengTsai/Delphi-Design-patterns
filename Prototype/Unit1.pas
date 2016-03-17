unit Unit1;

interface

uses
  SysUtils, classes;

type
TResume = class(TPersistent)
private
  name : string;
  sex: string;
  age: string;
  timeArea : string;
  company : string;
public
  procedure Resume(name: string);
  procedure SetPersonalinfo(sex,age :string);
  procedure SetWorkExperience(timeArea, Company : string);
  procedure Display();
end;

implementation

{ TResume }

procedure TResume.Display;
begin
  writeln(name + ' ' + sex + ' ' + age);
  writeln('¤u§@¸g¾ú: ' + timeArea + ' ' + company);
end;

procedure TResume.Resume(name: string);
begin
 self.name := name;
end;

procedure TResume.SetPersonalinfo(sex, age: string);
begin
  self.sex := sex;
  self.age := age;
end;

procedure TResume.SetWorkExperience(timeArea, Company: string);
begin
  self.timeArea := timeArea;
  self.company := Company;
end;

end.
