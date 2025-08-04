unit uEstudante;

interface
  type TEstudante = class
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

constructor TEstudante.Create(id: Integer; nome: String);
begin
  self.id:= id;
  self.nome:= nome;

end;

function TEstudante.getId: Integer;
begin
  result:= self.id;
end;

function TEstudante.getNome: String;
begin
  result:= self.nome
end;

procedure TEstudante.setNome(nome: String);
begin
  self.nome:= nome
end;

end.
