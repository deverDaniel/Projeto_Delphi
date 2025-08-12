object FormDashboard: TFormDashboard
  Left = 0
  Top = 0
  Caption = 'FormDashboard'
  ClientHeight = 518
  ClientWidth = 565
  Color = 16447992
  Font.Charset = DEFAULT_CHARSET
  Font.Color = 15426341
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object lbl_titulo: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 559
    Height = 45
    Align = alTop
    Alignment = taCenter
    Caption = 'Dashboard'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 15426341
    Font.Height = -32
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 154
  end
  object pnl_professores: TPanel
    Left = 32
    Top = 136
    Width = 233
    Height = 137
    ParentColor = True
    TabOrder = 0
    object lbl_professores: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 225
      Height = 69
      Margins.Top = 20
      Align = alClient
      Alignment = taCenter
      Caption = '5'
      Color = 15426341
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitTop = 36
      ExplicitWidth = 26
      ExplicitHeight = 65
    end
    object lbl_qtdd_professores: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 96
      Width = 225
      Height = 37
      Align = alBottom
      Alignment = taCenter
      Caption = 'Professores'
      Color = clLightseagreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitTop = 88
      ExplicitWidth = 134
    end
  end
  object pnl_estudantes: TPanel
    Left = 324
    Top = 136
    Width = 233
    Height = 137
    ParentColor = True
    TabOrder = 1
    object lbl_qtdd_estudantes: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 225
      Height = 69
      Margins.Top = 20
      Align = alClient
      Alignment = taCenter
      Caption = '5'
      Color = 15426341
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitLeft = 24
      ExplicitTop = 74
    end
    object lbl_estudantes: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 96
      Width = 225
      Height = 37
      Align = alBottom
      Alignment = taCenter
      Caption = 'Estudantes'
      Color = clLightseagreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 128
    end
  end
  object pnl_disciplinas: TPanel
    Left = 32
    Top = 336
    Width = 233
    Height = 137
    ParentColor = True
    TabOrder = 2
    object lbl_qtdd_disciplinas: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 225
      Height = 69
      Margins.Top = 20
      Align = alClient
      Alignment = taCenter
      Caption = '5'
      Color = 15426341
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 26
      ExplicitHeight = 65
    end
    object lbl_disciplina: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 96
      Width = 225
      Height = 37
      Align = alBottom
      Alignment = taCenter
      Caption = 'Disciplinas'
      Color = clLightseagreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 126
    end
  end
  object pnl_turmas: TPanel
    Left = 324
    Top = 336
    Width = 233
    Height = 137
    ParentColor = True
    TabOrder = 3
    object lbl_qtdd_turmas: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 21
      Width = 225
      Height = 69
      Margins.Top = 20
      Align = alClient
      Alignment = taCenter
      Caption = '5'
      Color = 15426341
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -48
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 26
      ExplicitHeight = 65
    end
    object lbl_turmas: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 96
      Width = 225
      Height = 37
      Align = alBottom
      Alignment = taCenter
      Caption = 'Turmas'
      Color = clLightseagreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMenuHighlight
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitWidth = 86
    end
  end
end
