unit uEstudantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,  uEstudanteController, uEstudante, System.Generics.Collections,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, VCL.ExtCtrls,
  FireDAC.Phys.PGDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.PG, uConexao;

type
  TFormEstudantes = class(TForm)
    lbl_titulo: TLabel;
    lsvEstudantes: TListView;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    connection: TFDConnection;
  end;

var
  FormEstudantes: TFormEstudantes;

implementation

{$R *.dfm}

procedure TFormEstudantes.FormShow(Sender: TObject);
var
  estudantecontroller: TEstudanteController;
  estudante: Testudante;
  ListaEstudantes: TObjectList<Testudante>;
  item: TListView;
begin
  connection:= form2.FDConnection1;
  connection.Connected := true;
  lsvEstudantes.Items.Clear;
  estudantecontroller:= estudantecontroller.Create(connection);
  ListaEstudantes:= estudantecontroller.ListarEstudantes;
  for estudante in ListaEstudantes do
  begin
    with LsvEstudantes.Items.Add do
      Caption:= estudante.getNome;
  end;
end;

end.
