object FormProfessores: TFormProfessores
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'FormProfessores'
  ClientHeight = 557
  ClientWidth = 581
  Color = clBtnFace
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
    Caption = 'Professores'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 164
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
  object GridProfessores: TStringGrid
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
    OnExit = GridProfessoresExit
    OnKeyDown = GridProfessoresKeyDown
    OnSelectCell = GridProfessoresSelectCell
    OnSetEditText = GridProfessoresSetEditText
    ExplicitLeft = 55
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
  object pnlAdicionarProfessor: TPanel
    Left = 50
    Top = 153
    Width = 481
    Height = 121
    TabOrder = 4
    Visible = False
    object lbl_nome: TLabel
      Left = 24
      Top = 56
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object lblEditaProfessor: TLabel
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
    object lblProfessorCpf: TLabel
      Left = 24
      Top = 85
      Width = 17
      Height = 15
      Caption = 'cpf'
    end
    object EdtProfessorNome: TEdit
      Left = 70
      Top = 51
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object btnAdicionaProfessor: TButton
      Left = 315
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 1
      OnClick = btnAdicionaProfessorClick
    end
    object btn_cancelar: TButton
      Left = 396
      Top = 88
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btn_cancelarClick
    end
    object EdtProfessorCpf: TEdit
      Left = 70
      Top = 80
      Width = 121
      Height = 23
      TabOrder = 3
    end
  end
end
