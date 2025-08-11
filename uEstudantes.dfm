object FormEstudantes: TFormEstudantes
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'FormEstudantes'
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object lbl_titulo: TLabel
    Left = 8
    Top = 8
    Width = 154
    Height = 45
    Alignment = taCenter
    Caption = 'Estudantes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object GridEstudantes: TStringGrid
    Left = 48
    Top = 192
    Width = 457
    Height = 129
    ColCount = 3
    DefaultColWidth = 150
    FixedCols = 0
    RowCount = 2
    TabOrder = 0
  end
end
