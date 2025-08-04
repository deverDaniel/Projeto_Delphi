unit uProfessores;

interface
  type TProfessor = class
    private
      id: Integer;
      nome: String;
      cpf: String;
    public
      function getId: Integer;
      function getNome: String;
      procedure setNome(nome: String);
      function getCpf: String;
      procedure setCpf(cpf: String);
      constructor Create (id: Integer; nome: String);

  end;
implementation

{ Professores }

constructor TProfessor.Create(id: Integer; nome: String);
begin
  self.id:= id;
  self.nome:= nome;

end;

function TProfessor.getCpf: String;
begin
  result:= self.cpf;
end;

function TProfessor.getId: Integer;
begin
  result:= self.id;
end;

function TProfessor.getNome: String;
begin
  result:= self.nome
end;

procedure TProfessor.setCpf(cpf: String);
begin
  self.cpf:= cpf;
end;

procedure TProfessor.setNome(nome: String);
begin
  self.nome:= nome
end;

end.
