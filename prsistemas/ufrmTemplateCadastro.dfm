object frmTemplateCadastro: TfrmTemplateCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  ClientHeight = 441
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PopupMenu = PopupMenu1
  Position = poMainFormCenter
  OnActivate = FormActivate
  TextHeight = 15
  object grpPrincipal: TGroupBox
    Left = 0
    Top = 0
    Width = 464
    Height = 400
    Align = alClient
    TabOrder = 0
    object labCodigo: TLabel
      Left = 21
      Top = 10
      Width = 44
      Height = 15
      Caption = 'C'#243'digo :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labCodigoAtual: TLabel
      Left = 71
      Top = 10
      Width = 3
      Height = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object grpFuncoes: TGroupBox
    Left = 0
    Top = 400
    Width = 464
    Height = 41
    Align = alBottom
    TabOrder = 1
    object btnNovo: TBitBtn
      Left = 57
      Top = 6
      Width = 99
      Height = 25
      Caption = 'F2 - Novo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnBuscar: TBitBtn
      Left = 196
      Top = 6
      Width = 99
      Height = 25
      Caption = 'F3 - Buscar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object btnExcluir: TBitBtn
      Tag = 1
      Left = 226
      Top = 7
      Width = 99
      Height = 25
      Caption = 'F6 - Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object btnSalvar: TBitBtn
      Tag = 1
      Left = 16
      Top = 7
      Width = 99
      Height = 25
      Caption = 'F4 - Salvar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object btnCancelar: TBitBtn
      Tag = 1
      Left = 121
      Top = 7
      Width = 99
      Height = 25
      Caption = 'F5 - Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnCancelarClick
    end
    object btnSair: TBitBtn
      Left = 334
      Top = 7
      Width = 99
      Height = 25
      Caption = 'F12 -  Sair'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnSairClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 184
    Top = 136
    object Novo1: TMenuItem
      Caption = 'Novo'
      ShortCut = 113
      OnClick = Novo1Click
    end
    object Buscar1: TMenuItem
      Caption = 'Buscar'
      ShortCut = 114
      OnClick = Buscar1Click
    end
    object Salvar1: TMenuItem
      Caption = 'Salvar'
      ShortCut = 115
      OnClick = Salvar1Click
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 116
    end
    object Excluir1: TMenuItem
      Caption = 'Excluir'
      ShortCut = 117
      OnClick = Excluir1Click
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      ShortCut = 123
      OnClick = Sair1Click
    end
  end
end
