inherited frmClientes: TfrmClientes
  Caption = 'Cadastro de Clientes'
  TextHeight = 15
  inherited grpPrincipal: TGroupBox
    object labNome: TLabel [0]
      Left = 75
      Top = 64
      Width = 48
      Height = 15
      Caption = 'Nome* : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labCidade: TLabel [1]
      Left = 75
      Top = 107
      Width = 48
      Height = 15
      Caption = 'Cidade* :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labUf: TLabel [2]
      Left = 281
      Top = 107
      Width = 26
      Height = 15
      Caption = 'UF* :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited labIdAtual: TLabel
      Width = 66
      AutoSize = False
      Caption = 'Nenhum'
      Transparent = False
      ExplicitWidth = 66
    end
    object edtNome: TEdit
      Left = 131
      Top = 61
      Width = 302
      Height = 23
      CharCase = ecUpperCase
      Color = clWhite
      TabOrder = 0
    end
    object edtCidade: TEdit
      Left = 131
      Top = 104
      Width = 121
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edtUf: TEdit
      Left = 317
      Top = 104
      Width = 53
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 2
    end
  end
  inherited grpFuncoes: TGroupBox
    inherited btnBuscar: TBitBtn
      OnClick = btnBuscarClick
    end
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
  end
  object XMLDocument1: TXMLDocument
    Left = 304
    Top = 32
  end
end
