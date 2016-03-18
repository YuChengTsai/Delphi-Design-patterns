unit Unit1;

interface

uses
  SysUtils, classes;

type
  TWorkExperience = class(TPersistent)
  private
    _WorkDate, _Company : string;
    function getcompany: string;
    function getworkdate: string;
    procedure setcompany(const Value: string);
    procedure setworkdate(const Value: string);
  published
    property workdate: string read getworkdate write setworkdate;
    property company: string read getcompany write setcompany;
  public
    procedure Assign(Source: TPersistent); override;
  end;

  TResume = class(TPersistent)
  private
    name: string;
    sex: string;
    age: string;
    work: TWorkExperience;
    procedure _Resume(work: TWorkExperience);
  public
    procedure Resume(name: string);
    procedure SetPersonalinfo(sex, age: string);
    procedure SetWorkExperience(timeArea, Company: string);
    procedure Display();
    procedure Assign(Source: TPersistent); override;
  end;
implementation

{ TResume }

procedure TResume.Assign(Source: TPersistent);
begin
  if source is TResume then
  begin
    name := TResume(Source).name;
    sex := TResume(Source).sex;
    age := TResume(Source).age;
    work := Source._Resume(work);
  end
  else inherited Assign(source);
end;

procedure TResume.Display;
begin
  writeln(name + ' ' + sex + ' ' + age);
  writeln('¤u§@¸g¾ú: ' + work.workdate + ' ' + work.company);
end;

procedure TResume.Resume(name: string);
begin
  self.name := name;
  work := TWorkExperience.Create;
end;

procedure TResume.SetPersonalinfo(sex, age: string);
begin
  self.sex := sex;
  self.age := age;
end;

procedure TResume.SetWorkExperience(timeArea, Company: string);
begin
  work.workdate := timeArea;
  work.company := Company;
end;

procedure TResume._Resume(work: TWorkExperience);
begin
  work.Assign(TWorkExperience);
end;

{ TWorkExperience }

function TWorkExperience.getcompany: string;
begin
  Result := _company;
end;

function TWorkExperience.getworkdate: string;
begin
  Result := _workdate;
end;

procedure TWorkExperience.setcompany(const Value: string);
begin
  _company := value;
end;

procedure TWorkExperience.setworkdate(const Value: string);
begin
  _workdate := value;
end;

end.

