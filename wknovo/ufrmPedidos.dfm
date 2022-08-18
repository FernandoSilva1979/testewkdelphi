inherited frmPedidos: TfrmPedidos
  Caption = 'Pedidos'
  TextHeight = 15
  inherited grpPrincipal: TGroupBox
    object labTotal: TLabel [0]
      Left = 407
      Top = 372
      Width = 43
      Height = 15
      Caption = 'labTotal'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labEmissao: TLabel [1]
      Left = 33
      Top = 51
      Width = 57
      Height = 15
      Caption = 'Emiss'#227'o* : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object labCliente: TLabel [2]
      Left = 37
      Top = 85
      Width = 53
      Height = 15
      Caption = 'Cliente* : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 200
      Width = 458
      Height = 166
      DataSource = dsTemp
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgColumnResize, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      OnKeyDown = DBGrid1KeyDown
    end
    object edtCliente: TEdit
      Left = 99
      Top = 78
      Width = 46
      Height = 23
      TabOrder = 1
      OnExit = edtClienteExit
      OnKeyPress = edtClienteKeyPress
    end
    object dtEmissao: TDateTimePicker
      Left = 99
      Top = 49
      Width = 131
      Height = 23
      Date = 44784.000000000000000000
      Time = 0.838210428242746300
      TabOrder = 2
    end
    object btnIncluiritens: TButton
      Left = 320
      Top = 169
      Width = 130
      Height = 25
      Caption = 'Incluir Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnIncluiritensClick
    end
    object edtDesccliente: TEdit
      Left = 151
      Top = 80
      Width = 276
      Height = 23
      Color = clGradientInactiveCaption
      Enabled = False
      TabOrder = 4
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
  object panNovoItem: TPanel [2]
    Left = 160
    Top = 129
    Width = 409
    Height = 290
    TabOrder = 2
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 407
      Height = 288
      Align = alClient
      TabOrder = 0
      OnExit = GroupBox1Exit
      object Label1: TLabel
        Left = 12
        Top = 46
        Width = 60
        Height = 15
        Caption = 'Cod Item : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 18
        Top = 86
        Width = 54
        Height = 15
        Caption = 'Produto : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 31
        Top = 127
        Width = 41
        Height = 15
        Caption = 'Pre'#231'o : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 39
        Top = 163
        Width = 30
        Height = 15
        Caption = 'Qtd  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtCoditem: TEdit
        Left = 78
        Top = 42
        Width = 69
        Height = 23
        TabOrder = 0
        OnExit = edtCoditemExit
        OnKeyPress = edtCoditemKeyPress
      end
      object edtDescricaoitem: TEdit
        Left = 78
        Top = 81
        Width = 307
        Height = 23
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 1
      end
      object edtPrecoitem: TEdit
        Left = 78
        Top = 119
        Width = 69
        Height = 23
        Color = clWhite
        TabOrder = 2
      end
      object edtQtd: TEdit
        Left = 78
        Top = 155
        Width = 69
        Height = 23
        TabOrder = 3
      end
      object Button2: TButton
        Left = 77
        Top = 250
        Width = 90
        Height = 25
        Caption = 'Confirmar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        PopupMenu = PopupMenu1
        TabOrder = 4
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 217
        Top = 251
        Width = 87
        Height = 25
        Caption = 'Cancelar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = Button3Click
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 243
        Width = 404
        Height = 1
        TabOrder = 6
      end
    end
  end
  inherited PopupMenu1: TPopupMenu
    Left = 376
    Top = 112
  end
  object tableTempItens: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'descricao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'preco'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'qtd'
        DataType = ftFloat
      end
      item
        Name = 'total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 320
    Top = 161
    object tableTempItensid: TIntegerField
      DisplayWidth = 10
      FieldName = 'id'
    end
    object tableTempItensdescricao: TStringField
      DisplayWidth = 20
      FieldName = 'descricao'
    end
    object tableTempItenspreco: TStringField
      DisplayWidth = 17
      FieldName = 'preco'
    end
    object tableTempItensqtd: TFloatField
      DisplayWidth = 10
      FieldName = 'qtd'
    end
    object tableTempItenstotal: TFloatField
      DisplayWidth = 10
      FieldName = 'total'
    end
  end
  object dsTemp: TDataSource
    DataSet = tableTempItens
    Left = 376
    Top = 169
  end
end
