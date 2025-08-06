unit uProfessorController;

interface
uses
  uProfessores, FireDAC.Comp.Client, System.SysUtils;

  type TProfessorController = class
  private
    FProfessor: TProfessor;
  public
    connection: TFDConnection;
    constructor Create(connection: TFDConnection);
    procedure AdicionarProfessor(nome, cpf:String);
    Function SelectProfessorPorId(id: Integer):TProfessor;
    procedure Alterarprofessor(id:integer; nome, cpf:String);
    procedure DeletarProfessor(id: Integer);
  end;


implementation

{ TEstudanteController }

procedure TProfessorController.AdicionarProfessor(nome, cpf:String);
begin
  FProfessor.setNome(nome);
  FProfessor.setCpf(cpf);
  FProfessor.Adicionar;
end;

procedure TProfessorController.AlterarProfessor(id: integer; nome, cpf: String);
begin
  FProfessor:= TProfessor.Create(connection);
  FProfessor.setId(id);
  FProfessor.setNome(nome);
  FProfessor.setCpf(cpf);
  FProfessor.AlterarProfessor;
end;

constructor TProfessorController.Create(connection: TFDConnection);
begin
   FProfessor:= TProfessor.Create(connection);
   self.connection:= connection;
end;



procedure TProfessorController.DeletarProfessor(id:Integer);
begin
  FProfessor:= TProfessor.Create(connection);
  FProfessor.setId(id);
  FProfessor.DeletarProfessor;
end;

function TProfessorController.SelectProfessorPorId(id: Integer): TProfessor;
begin
  FProfessor:= TProfessor.Create(connection);
  FProfessor.setId(id);
  FProfessor.SelectProfessorporid;
  result:= FProfessor;
end;

end.
