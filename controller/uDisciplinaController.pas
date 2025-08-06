unit uDisciplinaController;

interface
uses
  uDisciplinas, FireDAC.Comp.Client, System.SysUtils;

  type TDisciplinaController = class
  private
    FDisciplina: TDisciplina;
  public
    connection: TFDConnection;
    constructor Create(connection: TFDConnection);
    procedure AdicionarDisciplina(nome:String);
    Function SelectDisciplinaPorId(id: Integer):TDisciplina;
    procedure AlterarDisciplina(id:integer; nome:String);
    procedure DeletarDisciplina(id: Integer);
  end;


implementation

{ TDisciplinaController }

procedure TDisciplinaController.AdicionarDisciplina(nome:String);
begin
  FDisciplina.setNome(nome);
  FDisciplina.Adicionar;
end;

procedure TDisciplinaController.AlterarDisciplina(id: integer; nome: String);
begin
  FDisciplina:= TDisciplina.Create(connection);
  FDisciplina.setId(id);
  FDisciplina.setNome(nome);
  FDisciplina.Alterar;
end;

constructor TDisciplinaController.Create(connection: TFDConnection);
begin
   FDisciplina:= TDisciplina.Create(connection);
   self.connection:= connection;
end;



procedure TDisciplinaController.DeletarDisciplina(id:Integer);
begin
  FDisciplina:= TDisciplina.Create(connection);
  FDisciplina.setId(id);
  FDisciplina.Deletar;
end;

function TDisciplinaController.SelectDisciplinaPorId(id: Integer): TDisciplina;
begin
  FDisciplina:= TDisciplina.Create(connection);
  FDisciplina.setId(id);
  FDisciplina.SelectDisciplinaporid;
  result:= FDisciplina;
end;

end.
