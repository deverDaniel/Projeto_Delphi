unit uTurmas;

interface
  uses uProfessores, uDisciplinas;
  type TTurmas = class
    private
      id: Integer;
      professor: TProfessor;
      disciplina: TDisciplina;
    public
      function getId: Integer;
      function getProfessor: TProfessor;
      procedure setProfessor(professor: Tprofessor);
      function getDisciplina: TDisciplina;
      procedure setDisciplina(disciplina: TDisciplina);
      constructor Create (id: Integer; professor: TProfessor);

  end;
implementation

{ TTurma }

constructor TTurmas.Create(id: Integer; professor: TProfessor);
begin
  self.id:= id;
  self.professor:= professor;

end;

function TTurmas.getDisciplina: TDisciplina;
begin
  result:= self.disciplina;
end;

function TTurmas.getId: Integer;
begin
  result:= self.id;
end;

function TTurmas.getProfessor: TProfessor;
begin
  result:= self.professor
end;

procedure TTurmas.setDisciplina(disciplina: TDisciplina);
begin
  self.disciplina:= disciplina;
end;

procedure TTurmas.setProfessor(professor: TProfessor);
begin
  self.professor:= professor
end;

end.
