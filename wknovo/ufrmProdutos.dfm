inherited frmProdutos: TfrmProdutos
  Caption = 'Cadastro de Produtos'
  TextHeight = 15
  inherited grpPrincipal: TGroupBox
    object labNome: TLabel [0]
      Left = 47
      Top = 104
      Width = 68
      Height = 15
      Caption = 'Descri'#231#227'o* : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 69
      Top = 144
      Width = 46
      Height = 15
      Caption = 'Pre'#231'o* : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labCodProduto: TLabel
      Left = 63
      Top = 64
      Width = 52
      Height = 15
      Caption = 'Codigo* : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDescricao: TEdit
      Left = 121
      Top = 101
      Width = 312
      Height = 23
      CharCase = ecUpperCase
      Color = clWhite
      TabOrder = 0
    end
    object edtPreco: TEdit
      Left = 121
      Top = 141
      Width = 80
      Height = 23
      CharCase = ecUpperCase
      Color = clWhite
      TabOrder = 1
    end
    object edtCodProduto: TEdit
      Left = 121
      Top = 61
      Width = 112
      Height = 23
      CharCase = ecUpperCase
      Color = clWhite
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
end
