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

  end;

implementation

{ TTurma }

constructor TMatricula.Create(connection: TFDConnection);
begin
  self.connection:= connection;

end;

function TMatricula.getIdEstudante: Integer;
begin
  result := self.id_estudante;
end;

function TMatricula.getId: Integer;
begin
  result := self.id;
end;

function TMatricula.getIdTurma: Integer;
begin
  result := self.id_turma;
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

end.
