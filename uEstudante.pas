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

constructor TEstudantes.Create(id: Integer; nome: String);
begin
  self.id:= id;
  self.nome:= nome;

end;

function TEstudantes.getId: Integer;
begin
  result:= self.id;
end;

function TEstudantes.getNome: String;
begin
  result:= self.nome
end;

procedure TEstudantes.setNome(nome: String);
begin
  self.nome:= nome
end;

end.
