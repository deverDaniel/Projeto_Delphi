unit uDisciplinas;

interface

type
  TDisciplina = class
  private
    id: Integer;
    nome: String;
  public
    function getId: Integer;
    function getNome: String;
    procedure setNome(nome: String);
    constructor Create(id: Integer; nome: String);

  end;

implementation

{ Disciplinas }

constructor TDisciplina.Create(id: Integer; nome: String);
begin
  self.id := id;
  self.nome := nome;

end;

function TDisciplina.getId: Integer;
begin
  result := self.id;
end;

function TDisciplina.getNome: String;
begin
  result := self.nome
end;

procedure TDisciplina.setNome(nome: String);
begin
  self.nome := nome
end;

end.
