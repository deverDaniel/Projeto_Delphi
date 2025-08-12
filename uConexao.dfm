object FormConexao: TFormConexao
  Left = 0
  Top = 0
  Caption = 'FormConexao'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=db_sistema_academico'
      'User_Name=postgres '
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 168
    Top = 53
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 80
    Top = 53
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Daniel Ferreira\Documents\Delphi\projeto_delphi\Projeto' +
      '_Delphi\Win32\Debug\dll\lib\libpq.dll'
    Left = 288
    Top = 53
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 384
    Top = 53
  end
end
