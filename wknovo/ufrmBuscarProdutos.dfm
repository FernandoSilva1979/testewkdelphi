inherited frmBuscarProdutos: TfrmBuscarProdutos
  Caption = 'Buscar Produtos'
  TextHeight = 15
  inherited grpPrincipal: TGroupBox
    inherited btnBuscar: TBitBtn
      Left = 304
      OnClick = btnBuscarClick
      ExplicitLeft = 304
    end
  end
  inherited grpFuncoes: TGroupBox
    inherited gridBusca: TDBGrid
      OnDblClick = gridBuscaDblClick
    end
  end
  inherited dsTemp: TDataSource
    DataSet = tableTemp
  end
  object tableTemp: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'cod_produto'
        DataType = ftString
        Size = 20
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
    Left = 152
    Top = 185
    object tableTempid: TIntegerField
      FieldName = 'id'
    end
    object tableTempcod_produto: TStringField
      FieldName = 'cod_produto'
    end
    object tableTempdescricao: TStringField
      FieldName = 'descricao'
    end
    object tableTemppreco: TStringField
      FieldName = 'preco'
    end
  end
end
