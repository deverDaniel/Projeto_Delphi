unit uEstudanteController;

interface
uses
  uEstudante, FireDAC.Comp.Client, System.SysUtils;

  type TEstudanteController = class
  private
    FEstudante: TEstudante;
  public
    connection: TFDConnection;
    constructor Create(connection: TFDConnection);
    procedure AdicionarEstudante(nome:String; id: Integer);
    Function SelectEstudantePorId(id: Integer):TEstudante;
  end;


implementation

{ TEstudanteController }

procedure TEstudanteController.AdicionarEstudante(nome:String; id: Integer);
begin
  FEstudante.setId(id);
  FEstudante.setNome(nome);
  FEstudante.Adicionar;
end;

constructor TEstudanteController.Create(connection: TFDConnection);
begin
   FEstudante:= TEstudante.Create(connection);
   self.connection:= connection;
end;



function TEstudanteController.SelectEstudantePorId(id: Integer): TEstudante;
begin
  FEstudante:= TEstudante.Create(connection);
  FEstudante.setId(id);
  FEstudante.SelectEstudanteporid;
  result:= Festudante;
end;

end.
