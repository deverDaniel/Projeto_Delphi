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



end.
