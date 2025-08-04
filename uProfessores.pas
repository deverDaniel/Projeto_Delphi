unit uProfessores;

interface
  type Professores = class
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

constructor Professores.Create(id: Integer; nome: String);
begin
  self.id:= id;
  self.nome:= nome;

end;

function Professores.getCpf: String;
begin
  result:= self.cpf;
end;

function Professores.getId: Integer;
begin
  result:= self.id;
end;

function Professores.getNome: String;
begin
  result:= self.nome
end;

procedure Professores.setCpf(cpf: String);
begin
  self.cpf:= cpf;
end;

procedure Professores.setNome(nome: String);
begin
  self.nome:= nome
end;

end.
