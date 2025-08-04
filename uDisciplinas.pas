unit uDisciplinas;

interface
  type Disciplinas = class
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

{ Disciplinas }

constructor Disciplinas.Create(id: Integer; nome: String);
begin
  self.id:= id;
  self.nome:= nome;

end;

function Disciplinas.getId: Integer;
begin
  result:= self.id;
end;

function Disciplinas.getNome: String;
begin
  result:= self.nome
end;

procedure Disciplinas.setNome(nome: String);
begin
  self.nome:= nome
end;

end.
