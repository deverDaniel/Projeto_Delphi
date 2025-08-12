object FormTurmas: TFormTurmas
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  Caption = 'FormTurmas'
  ClientHeight = 557
  ClientWidth = 581
  Color = 16447992
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lbl_titulo: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 575
    Height = 45
    Align = alTop
    Alignment = taCenter
    Caption = 'Turmas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 104
  end
  object btn_adicionar: TButton
    Left = 359
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btn_adicionarClick
  end
  object btnExcluir: TButton
    Left = 440
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnExcluirClick
  end
  object GridTurmas: TStringGrid
    AlignWithMargins = True
    Left = 50
    Top = 151
    Width = 481
    Height = 306
    Margins.Left = 50
    Margins.Top = 100
    Margins.Right = 50
    Margins.Bottom = 100
    Align = alClient
    ColCount = 3
    DefaultColWidth = 240
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 2
    ExplicitLeft = 45
  end
  object pnlExcluirConfirm: TPanel
    Left = 168
    Top = 216
    Width = 241
    Height = 97
    TabOrder = 3
    Visible = False
    object btn_nao: TBitBtn
      Left = 16
      Top = 64
      Width = 75
      Height = 25
      Caption = 'N'#227'o'
      TabOrder = 0
      OnClick = btn_naoClick
    end
    object BtnConfirmaExclusao: TBitBtn
      Left = 144
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Sim'
      TabOrder = 1
      OnClick = BtnConfirmaExclusaoClick
    end
  end
  object pnlAdicionarTurma: TPanel
    Left = 50
    Top = 153
    Width = 481
    Height = 121
    TabOrder = 4
    Visible = False
    object lblDisciplina: TLabel
      Left = 24
      Top = 56
      Width = 51
      Height = 15
      Caption = 'Disciplina'
    end
    object lblEditaTurma: TLabel
      Left = 1
      Top = 1
      Width = 479
      Height = 25
      Align = alTop
      Alignment = taCenter
      Caption = 'Adicionar Professor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 165
    end
    object lblProfessor: TLabel
      Left = 24
      Top = 85
      Width = 49
      Height = 15
      Caption = 'Professor'
    end
    object btnAdicionaTurma: TButton
      Left = 315
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
    end
    object btn_cancelar: TButton
      Left = 396
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btn_cancelarClick
    end
    object Cbox_Disciplina: TComboBox
      Left = 88
      Top = 48
      Width = 169
      Height = 23
      TabOrder = 2
      Text = 'Selecione Uma Disciplina'
    end
    object cbox_professor: TComboBox
      Left = 88
      Top = 77
      Width = 169
      Height = 23
      TabOrder = 3
      Text = 'Selecione Um Professor'
    end
  end
end
