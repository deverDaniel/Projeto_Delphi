unit uEstudante;

interface
  type Estudantes = class
    private
      id: Integer;
      nome: String;
    public
      function getId: Integer;
      function getNome: String;
      procedure setNome(nome: String);
      constructor Create (id: Integer; nome: String);

  end;
implementation

{ Estudantes }

constructor Estudantes.Create(id: Integer; nome: String);
begin
  self.id:= id;
  self.nome:= nome;

end;

function Estudantes.getId: Integer;
begin
  result:= self.id;
end;

function Estudantes.getNome: String;
begin
  result:= self.nome
end;

procedure Estudantes.setNome(nome: String);
begin
  self.nome:= nome
end;

end.
