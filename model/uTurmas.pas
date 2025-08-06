unit uTurmas;

interface

uses uProfessores, uDisciplinas, uProfessorController, data.DB,
  FireDAC.Comp.Client, System.SysUtils, FMX.Dialogs;

type
  TTurma = class
  private
    id: Integer;
    id_professor: Integer;
    id_disciplina: Integer;
    connection: TFDConnection;
  public
    function getId: Integer;
    procedure setId(id: Integer);
    function getIdProfessor: Integer;
    procedure setIdProfessor(id_professor: Integer);
    function getIdDisciplina: Integer;
    procedure setIdDisciplina(id_disciplina: Integer);
    constructor Create(connection: TFDConnection);
    procedure Adicionar;
    procedure Validar;
    procedure Alterar;
    procedure Deletar;
    procedure SelectTurmaporid;

  end;

implementation

procedure TTurma.Adicionar;
var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text :=
        'Insert into Turmas (id_professor, id_disciplina) VALUES (' +
        self.id_professor.ToString + ', ' +
        self.id_disciplina.ToString + ')';
      Query.ExecSQL;
    finally
      Query.Close;
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      raise;
    end;
  end;
end;

procedure TTurma.Alterar;
var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'UPDATE public.Turmas SET id_professor= ' +
      self.id_professor.ToString + ', id_disciplina =' +
      self.id_disciplina.ToString + ' WHERE id = ' + self.id.ToString;
      Query.ExecSQL;
    finally
      Query.Close;
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      raise;
    end;
  end;
end;

{ TTurma }

constructor TTurma.Create(connection: TFDConnection);
begin
  self.connection := connection;

end;

procedure TTurma.Deletar;
var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'DELETE FROM public.Turmas WHERE id = ' +
        self.id.ToString;
      Query.ExecSQL;
    finally
      Query.Close;
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      raise;
    end;
  end;
end;

function TTurma.getIdDisciplina: Integer;
begin
  result := self.id_disciplina;
end;

function TTurma.getId: Integer;
begin
  result := self.id;
end;

function TTurma.getIdProfessor: Integer;
begin
  result := self.id_professor;
end;

procedure TTurma.SelectTurmaporid;
var
  Query: TFDQuery;
  professorcontroller: TProfessorController;
begin
  try
    try
      professorcontroller := TProfessorController.Create(self.connection);
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * from Turmas WHERE id = ' +
      self.id.ToString;
      Query.Open(Query.SQL.Text);
      self.id := Query.FieldByName('id').AsInteger;
      self.id_professor := Query.FieldByName('id_professor').AsInteger;
      self.id_disciplina := Query.FieldByName('id_disciplina').AsInteger;
    finally
      Query.Close;
      Query.Free;
    end;
  except
    on E: Exception do
    begin
      raise;
    end;
  end;
end;

procedure TTurma.setIdDisciplina(id_disciplina: Integer);
begin
  self.id_disciplina := id_disciplina;
end;

procedure TTurma.setId(id: Integer);
begin
  self.id := id;
end;

procedure TTurma.setIdProfessor(id_professor: Integer);
begin
  self.id_professor := id_professor;
end;

procedure TTurma.Validar;
begin
  if self.id_professor = 0 then
  begin
    raise Exception.Create('Passe o professor da turma');
  end;
  if self.id_disciplina = 0 then
  begin
    raise Exception.Create('Passe a Disciplina da turma');
  end;
end;

end.
