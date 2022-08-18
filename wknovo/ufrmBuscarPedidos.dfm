inherited frmBuscarPedidos: TfrmBuscarPedidos
  Caption = 'Pedidos'
  TextHeight = 15
  inherited grpPrincipal: TGroupBox
    inherited btnBuscar: TBitBtn
      OnClick = btnBuscarClick
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
        Name = 'emissao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'codcliente'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cliente'
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
    object tableTempemissao: TStringField
      FieldName = 'emissao'
    end
    object tableTempcodcliente: TStringField
      FieldName = 'codcliente'
    end
    object tableTempcliente: TStringField
      FieldName = 'cliente'
    end
  end
end
