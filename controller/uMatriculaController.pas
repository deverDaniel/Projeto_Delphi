unit uMatriculaController;
interface
uses
  uMatricula, FireDAC.Comp.Client, System.SysUtils;

  type TMatriculaController = class
  private
    FMatricula: TMatricula;
  public
    connection: TFDConnection;
    constructor Create(connection: TFDConnection);
    procedure AdicionarMatricula(id_turma, id_estudante: integer);
    Function SelectMatriculaPorId(id: Integer):TMatricula;
    procedure AlterarMatricula(id, id_turma, id_estudante: integer);
    procedure DeletarMatricula(id: Integer);
  end;


implementation

{ TDisciplinaController }

procedure TMatriculaController.AdicionarMatricula(id_turma, id_estudante: integer);
begin
  FMatricula.setIdTurma(id_turma);
  FMatricula.setIdEstudante(id_estudante);
  FMatricula.Adicionar;
end;

procedure TMatriculaController.AlterarMatricula(id, id_turma, id_estudante: integer);
begin
  FMatricula := TMatricula.Create(connection);
  FMatricula.setId(id);
  FMatricula.setIdTurma(id_turma);
  FMatricula.setIdEstudante(id_estudante);
  FMatricula.Alterar;
end;

constructor TMatriculaController.Create(connection: TFDConnection);
begin
   FMatricula:= TMatricula.Create(connection);
   self.connection:= connection;
end;



procedure TMatriculaController.DeletarMatricula(id:Integer);
begin
  FMatricula:= TMatricula.Create(connection);
  FMatricula.setId(id);
  FMatricula.Deletar;
end;

function TMatriculaController.SelectMatriculaPorId(id: Integer): TMatricula;
begin
  FMatricula:= TMatricula.Create(connection);
  FMatricula.setId(id);
  FMatricula.SelectTurmaporid;
  result:= FMatricula;
end;

end.
