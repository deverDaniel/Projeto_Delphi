# Projeto\_Delphi

#Daniel Afonso Santos Ferreira

📚 Sistema de Gestão Acadêmica

Um sistema simples de cadastro e listagem de estudantes, professores, disciplinas, turmas e matrículas.



🚀 Funcionalidades

Cadastro de estudantes



Cadastro de professores



Cadastro de disciplinas



Criação de turmas



Matrícula de estudantes em turmas



Listagem de:

Estudantes

Professores

Disciplinas

Turmas

Matrículas


Relações:
matriculas.id_estudante = Estudantes.id (1,N)
matriculas.id_turma = Turmas.id (n, 1)
turmas.id_professor = professores.id (n, 1)
turmas.id_disciplina = Disciplinas.id (n, 1)



