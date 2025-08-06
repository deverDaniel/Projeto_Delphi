unit uMatricula;

interface

uses data.DB, FireDAC.Comp.Client, System.SysUtils, FMX.Dialogs;

type
  TMatricula = class
  private
    id: Integer;
    id_turma: Integer;
    id_estudante: Integer;
    connection: TFDConnection;
  public
    function getId: Integer;
    procedure setId (id: Integer);
    function getIdTurma: Integer;
    procedure setIdTurma(id_turma: Integer);
    function getIdEstudante: Integer;
    procedure setIdEstudante(id_estudante: Integer);
    constructor Create(connection: TFDConnection);
    procedure Adicionar;
    procedure Validar;
    procedure Alterar;
    procedure Deletar;
    procedure SelectTurmaporid;

  end;

implementation

procedure TMatricula.Adicionar;
  var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text :=
        'Insert into Matriculas (id_turma, id_estudante) VALUES (' +
        self.id_turma.ToString + ', ' +
        self.id_estudante.ToString + ')';
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

procedure TMatricula.Alterar;
var
  Query: TFDQuery;
begin
  try
    Validar;
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'UPDATE public.Matriculas SET id_turma= ' +
      self.id_turma.ToString + ', id_estudante =' +
      self.id_estudante.ToString + ' WHERE id = ' + self.id.ToString;
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

constructor TMatricula.Create(connection: TFDConnection);
begin
  self.connection:= connection;

end;

function TMatricula.getIdEstudante: Integer;
begin
  result := self.id_estudante;
end;

procedure TMatricula.Deletar;
var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'DELETE FROM public.Matriculas WHERE id = ' +
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

function TMatricula.getId: Integer;
begin
  result := self.id;
end;

function TMatricula.getIdTurma: Integer;
begin
  result := self.id_turma;
end;

procedure TMatricula.SelectTurmaporid;
var
  Query: TFDQuery;
begin
  try
    try
      Query := TFDQuery.Create(nil);
      Query.connection := self.connection;
      Query.SQL.Text := 'select * from Matriculas WHERE id = ' +
      self.id.ToString;
      Query.Open(Query.SQL.Text);
      self.id := Query.FieldByName('id').AsInteger;
      self.id_turma := Query.FieldByName('id_turma').AsInteger;
      self.id_estudante := Query.FieldByName('id_estudante').AsInteger;
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

procedure TMatricula.setId(id: Integer);
begin
  self.id:= id;
end;

procedure TMatricula.setIdEstudante(id_estudante: Integer);
begin
  self.id_estudante := id_estudante;
end;

procedure TMatricula.setIdTurma(id_turma: Integer);
begin
  self.id_turma := id_turma;
end;

procedure TMatricula.Validar;
begin
  if self.id_turma = 0 then
  begin
    raise Exception.Create('Passe a turma turma');
  end;
  if self.id_estudante = 0 then
  begin
    raise Exception.Create('Passe o Estudante');
  end;
end;

end.
