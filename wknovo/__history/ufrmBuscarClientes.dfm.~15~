inherited frmBuscarClientes: TfrmBuscarClientes
  Caption = 'Buscar Clientes'
  TextHeight = 15
  inherited grpPrincipal: TGroupBox
    inherited btnBuscar: TBitBtn
      OnClick = btnBuscarClick
    end
  end
  inherited grpFuncoes: TGroupBox
    inherited gridBusca: TDBGrid
      OnDblClick = gridBuscaDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uf'
          Visible = True
        end>
    end
  end
  inherited dsTemp: TDataSource
    DataSet = tableTemp
    Left = 168
    Top = 257
  end
  object tableTemp: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'nome'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'cidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'uf'
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
    object tableTempnome: TStringField
      FieldName = 'nome'
    end
    object tableTempcidade: TStringField
      FieldName = 'cidade'
    end
    object tableTempuf: TStringField
      FieldName = 'uf'
    end
  end
end
