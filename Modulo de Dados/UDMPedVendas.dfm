object DMPedVendas: TDMPedVendas
  OldCreateOrder = False
  Height = 429
  Width = 425
  object FDPedidos: TFDQuery
    AfterOpen = FDPedidosAfterOpen
    CachedUpdates = True
    SQL.Strings = (
      'SELECT * FROM pedidos'
      'where 1 = 2 ')
    Left = 39
    Top = 20
    object FDPedidosid_pedido: TIntegerField
      FieldName = 'id_pedido'
      Origin = 'id_pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDPedidosdata_emissao: TDateField
      FieldName = 'data_emissao'
      Origin = 'data_emissao'
    end
    object FDPedidosid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
    end
    object FDPedidosvalor_total: TSingleField
      FieldName = 'valor_total'
      Origin = 'valor_total'
    end
    object FDPedidoslk_cliente: TStringField
      FieldKind = fkLookup
      FieldName = 'lk_cliente'
      LookupDataSet = FDTClientes
      LookupKeyFields = 'id_cliente'
      LookupResultField = 'nome'
      KeyFields = 'id_cliente'
      Size = 100
      Lookup = True
    end
    object FDPedidoslk_cidade: TStringField
      FieldKind = fkLookup
      FieldName = 'lk_cidade'
      LookupDataSet = FDTClientes
      LookupKeyFields = 'id_cliente'
      LookupResultField = 'cidade'
      KeyFields = 'id_cliente'
      Size = 50
      Lookup = True
    end
    object FDPedidoslk_uf: TStringField
      FieldKind = fkLookup
      FieldName = 'lk_uf'
      LookupDataSet = FDTClientes
      LookupKeyFields = 'id_cliente'
      LookupResultField = 'uf'
      KeyFields = 'id_cliente'
      Size = 2
      Lookup = True
    end
  end
  object DsPedidos: TDataSource
    DataSet = FDPedidos
    Left = 118
    Top = 21
  end
  object FDPedidosItens: TFDQuery
    AfterOpen = FDPedidosItensAfterOpen
    CachedUpdates = True
    AggregatesActive = True
    MasterSource = DsPedidos
    MasterFields = 'id_pedido'
    DetailFields = 'id_pedido'
    FetchOptions.AssignedValues = [evCache]
    SQL.Strings = (
      'select * from pedidos_itens'
      'where id_pedido = :id_pedido')
    Left = 39
    Top = 81
    ParamData = <
      item
        Name = 'ID_PEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
    object FDPedidosItensid_pedido_itens: TFDAutoIncField
      FieldName = 'id_pedido_itens'
      Origin = 'id_pedido_itens'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDPedidosItensid_pedido: TIntegerField
      FieldName = 'id_pedido'
      Origin = 'id_pedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDPedidosItensid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
    end
    object FDPedidosItensqtd: TSingleField
      FieldName = 'qtd'
      Origin = 'qtd'
    end
    object FDPedidosItensvlr_unitario: TSingleField
      FieldName = 'vlr_unitario'
      Origin = 'vlr_unitario'
    end
    object FDPedidosItensvlr_total: TSingleField
      FieldName = 'vlr_total'
      Origin = 'vlr_total'
    end
    object FDPedidosItenslk_descricao: TStringField
      FieldKind = fkLookup
      FieldName = 'lk_descricao'
      LookupDataSet = FDTProdutos
      LookupKeyFields = 'id_produto'
      LookupResultField = 'descricao'
      KeyFields = 'id_produto'
      Size = 100
      Lookup = True
    end
    object FDPedidosItenslk_preco_unitario: TFloatField
      FieldKind = fkLookup
      FieldName = 'lk_preco_unitario'
      LookupDataSet = FDTProdutos
      LookupKeyFields = 'id_produto'
      LookupResultField = 'preco_venda'
      KeyFields = 'id_produto'
      Lookup = True
    end
  end
  object DsPedidosItens: TDataSource
    DataSet = FDPedidosItens
    Left = 125
    Top = 81
  end
  object FDMProdutos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 266
    Top = 14
  end
  object DsDMProdutos: TDataSource
    DataSet = FDMProdutos
    Left = 349
    Top = 13
  end
  object FDMClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 273
    Top = 75
  end
  object DsDMClientes: TDataSource
    DataSet = FDMClientes
    Left = 356
    Top = 74
  end
  object FDTProdutos: TFDTable
    IndexFieldNames = 'id_produto'
    UpdateOptions.UpdateTableName = 'vendas.produtos'
    TableName = 'vendas.produtos'
    Left = 42
    Top = 137
  end
  object FDTClientes: TFDTable
    IndexFieldNames = 'id_cliente'
    UpdateOptions.UpdateTableName = 'clientes'
    TableName = 'clientes'
    Left = 39
    Top = 202
  end
end
