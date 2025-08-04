object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 471
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 646
    Height = 471
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=db_sistema_academico'
      'User_Name=postgres '
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Left = 592
    Top = 328
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 584
    Top = 408
  end
  object DataSource1: TDataSource
    Left = 504
    Top = 416
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\Daniel Ferreira\Documents\Delphi\projeto_delphi\Projeto' +
      '_Delphi\Win32\Debug\dll\lib\libpq.dll'
    Left = 512
    Top = 344
  end
end
