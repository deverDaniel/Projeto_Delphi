unit uMatricula;

interface

uses uTurmas, uEstudante;

type
  TTurma = class
  private
    id: Integer;
    turma: TTurma;
    estudante: TEstudante;
  public
    function getId: Integer;
    function getTurma: TTurma;
    procedure setTurma(turma: TTurma);
    function getEstudante: TEstudante;
    procedure setEstudante(estudante: TEstudante);
    constructor Create(id: Integer; turma: TTurma; estudante: TEstudante);

  end;

implementation

{ TTurma }

constructor TTurma.Create(id: Integer; turma: TTurma; estudante: TEstudante);
begin
  self.id := id;
  self.turma := turma;
  self.estudante := estudante;

end;

function TTurma.getEstudante: TEstudante;
begin
  result := self.estudante;
end;

function TTurma.getId: Integer;
begin
  result := self.id;
end;

function TTurma.getTurma: TTurma;
begin
  result := self.turma
end;

procedure TTurma.setEstudante(estudante: TEstudante);
begin
  self.estudante := estudante;
end;

procedure TTurma.setTurma(turma: TTurma);
begin
  self.turma := turma
end;

end.
