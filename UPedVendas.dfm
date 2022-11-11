object FrmPedVendas: TFrmPedVendas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pedidos de Vendas'
  ClientHeight = 654
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PnlPedido: TPanel
    Left = 0
    Top = 0
    Width = 591
    Height = 57
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 35
      Width = 42
      Height = 13
      Caption = 'Produto:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 123
      Top = 35
      Width = 22
      Height = 13
      Caption = 'Qtd:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btLocalizaProdutos: TSpeedButton
      Left = 99
      Top = 31
      Width = 23
      Height = 23
      Hint = 'Clique para selecionar o produto'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777770
        0777777777777778877777777777774EC07777777777778F88777770000004EC
        C0077778888888788887777877774ECC770777787777878877877778FFF4ECC7
        F7077778FFF8F887F78777780087CC7FF70777788877887FF7877787E70887FF
        F707778FFF8887FFF78778FE7E707FFFF70778FFFFF87FFFF78778EFE7E07FFF
        F70778FFFFF87FFFF78778FEFE707FFFF70778FFFFF87FFFF787778FEF07FFFF
        F707778FFF87FFFFF7877778807FFFFFF7077778887FFFFFF7877778FFFFFFF0
        00077778FFFFFFF888877778FFFFFFF7F8777778FFFFFFF7F8777778FFFFFFF7
        87777778FFFFFFF7877777788888888877777778888888887777}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btLocalizaProdutosClick
    end
    object Label9: TLabel
      Left = 2
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Cliente:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btLocalizaCliente: TSpeedButton
      Left = 99
      Top = 5
      Width = 23
      Height = 23
      Hint = 'Clique para selecionar o cliente'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777770
        0777777777777778877777777777774EC07777777777778F88777770000004EC
        C0077778888888788887777877774ECC770777787777878877877778FFF4ECC7
        F7077778FFF8F887F78777780087CC7FF70777788877887FF7877787E70887FF
        F707778FFF8887FFF78778FE7E707FFFF70778FFFFF87FFFF78778EFE7E07FFF
        F70778FFFFF87FFFF78778FEFE707FFFF70778FFFFF87FFFF787778FEF07FFFF
        F707778FFF87FFFFF7877778807FFFFFF7077778887FFFFFF7877778FFFFFFF0
        00077778FFFFFFF888877778FFFFFFF7F8777778FFFFFFF7F8777778FFFFFFF7
        87777778FFFFFFF7877777788888888877777778888888887777}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = btLocalizaClienteClick
    end
    object Label10: TLabel
      Left = 216
      Top = 35
      Width = 53
      Height = 13
      Caption = 'Pre'#231'o Unit:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 156
      Top = 6
      Width = 123
      Height = 17
      DataField = 'lk_cliente'
      DataSource = DMPedVendas.DsPedidos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 123
      Top = 8
      Width = 31
      Height = 13
      Caption = 'Nome:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 283
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Cidade:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 320
      Top = 6
      Width = 128
      Height = 17
      DataField = 'lk_cidade'
      DataSource = DMPedVendas.DsPedidos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 468
      Top = 6
      Width = 23
      Height = 17
      DataField = 'lk_uf'
      DataSource = DMPedVendas.DsPedidos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 450
      Top = 8
      Width = 17
      Height = 13
      Caption = 'UF:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdQuantidade: TDBEdit
      Left = 148
      Top = 32
      Width = 65
      Height = 21
      DataField = 'qtd'
      DataSource = DMPedVendas.DsPedidosItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = EdQuantidadeExit
      OnKeyDown = EdQuantidadeKeyDown
      OnKeyPress = EdQuantidadeKeyPress
    end
    object EdCodProduto: TDBEdit
      Left = 46
      Top = 32
      Width = 51
      Height = 21
      DataField = 'id_produto'
      DataSource = DMPedVendas.DsPedidosItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = EdCodProdutoExit
      OnKeyPress = EdCodClienteKeyPress
    end
    object EdPrecoUnit: TDBEdit
      Left = 274
      Top = 32
      Width = 65
      Height = 21
      DataField = 'vlr_unitario'
      DataSource = DMPedVendas.DsPedidosItens
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnExit = EdPrecoUnitExit
      OnKeyPress = EdQuantidadeKeyPress
    end
    object EdCodCliente: TDBEdit
      Left = 46
      Top = 5
      Width = 51
      Height = 21
      DataField = 'id_cliente'
      DataSource = DMPedVendas.DsPedidos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = EdCodClienteExit
    end
    object btAddItem: TBitBtn
      Left = 345
      Top = 27
      Width = 102
      Height = 25
      Cursor = crHandPoint
      Hint = 'Adicionar Item'
      Caption = 'Adicionar Item'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333303333
        333333333337F33333333333333033333333333333373F333333333333090333
        33333333337F7F33333333333309033333333333337373F33333333330999033
        3333333337F337F33333333330999033333333333733373F3333333309999903
        333333337F33337F33333333099999033333333373333373F333333099999990
        33333337FFFF3FF7F33333300009000033333337777F77773333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333309033333333333337F7F333333333333090333
        33333333337F7F33333333333300033333333333337773333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btAddItemClick
    end
  end
  object PnlIntes: TPanel
    Left = 0
    Top = 57
    Width = 591
    Height = 530
    Align = alClient
    TabOrder = 1
    object DBG_Itens: TDBGrid
      Left = 1
      Top = 1
      Width = 589
      Height = 528
      Align = alClient
      DataSource = DMPedVendas.DsPedidosItens
      Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBG_ItensKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'id_produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Courier New'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lk_descricao'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Courier New'
          Title.Font.Style = [fsBold]
          Width = 237
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'qtd'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Qtd.'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Courier New'
          Title.Font.Style = [fsBold]
          Width = 61
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'vlr_unitario'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Prec.Unit'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Courier New'
          Title.Font.Style = [fsBold]
          Width = 83
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'vlr_total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Title.Caption = 'Vlr.Total'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Courier New'
          Title.Font.Style = [fsBold]
          Width = 115
          Visible = True
        end>
    end
  end
  object v: TPanel
    Left = 0
    Top = 587
    Width = 591
    Height = 67
    Align = alBottom
    TabOrder = 2
    object lblNPedido: TLabel
      Left = 7
      Top = 8
      Width = 67
      Height = 16
      Caption = 'N'#186' Pedido:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 88
      Top = 8
      Width = 65
      Height = 17
      DataField = 'id_pedido'
      DataSource = DMPedVendas.DsPedidos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 7
      Top = 40
      Width = 75
      Height = 16
      Caption = 'Valor Total:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 88
      Top = 40
      Width = 65
      Height = 17
      DataField = 'valor_total'
      DataSource = DMPedVendas.DsPedidos
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btNovoPedido: TBitBtn
      Left = 265
      Top = 3
      Width = 105
      Height = 25
      Caption = 'Novo Pedido'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btNovoPedidoClick
    end
    object btSalvarPedido: TBitBtn
      Left = 374
      Top = 3
      Width = 105
      Height = 25
      Hint = 'Gravar Pedido'
      Caption = 'Gravar Pedido'
      Enabled = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333377F3333333333000033334224333333333333
        337337F3333333330000333422224333333333333733337F3333333300003342
        222224333333333373333337F3333333000034222A22224333333337F337F333
        7F33333300003222A3A2224333333337F3737F337F33333300003A2A333A2224
        33333337F73337F337F33333000033A33333A222433333337333337F337F3333
        0000333333333A222433333333333337F337F33300003333333333A222433333
        333333337F337F33000033333333333A222433333333333337F337F300003333
        33333333A222433333333333337F337F00003333333333333A22433333333333
        3337F37F000033333333333333A223333333333333337F730000333333333333
        333A333333333333333337330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btSalvarPedidoClick
    end
    object btCancelarPedido: TBitBtn
      Left = 484
      Top = 3
      Width = 105
      Height = 25
      Cursor = crHandPoint
      Hint = 'Cancelar Pedido'
      Caption = 'Cancelar Pedido'
      Enabled = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btCancelarPedidoClick
    end
    object PnlPesquisa: TPanel
      Left = 265
      Top = 34
      Width = 324
      Height = 28
      TabOrder = 3
      object lbNumPedPesq: TLabel
        Left = 4
        Top = 6
        Width = 67
        Height = 16
        Caption = 'N'#186' Pedido:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btPesquisarPedido: TBitBtn
        Left = 109
        Top = 2
        Width = 105
        Height = 25
        Cursor = crHandPoint
        Hint = 'Pesquisar Pedido'
        Caption = 'Buscar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888880
          0888888888888887788888888888884EC08888888888887F77888880000004EC
          C0088887777777877778888788884ECC880888878888787788788887FFF4ECC8
          F8088887FFF7F778F87888870078CC8FF80888877788778FF8788878E80778FF
          F808887FFF7778FFF87887FE8E808FFFF80887FFFFF78FFFF87887EFE8E08FFF
          F80887FFFFF78FFFF87887FEFE808FFFF80887FFFFF78FFFF878887FEF08FFFF
          F808887FFF78FFFFF8788887708FFFFFF8088887778FFFFFF8788887FFFFFFF0
          00088887FFFFFFF777788887FFFFFFF8F7888887FFFFFFF8F7888887FFFFFFF8
          78888887FFFFFFF8788888877777777788888887777777778888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btPesquisarPedidoClick
      end
      object EdNumPed: TEdit
        Left = 76
        Top = 4
        Width = 30
        Height = 21
        TabOrder = 0
        OnKeyPress = EdCodClienteKeyPress
      end
      object btExcluir: TBitBtn
        Left = 219
        Top = 2
        Width = 105
        Height = 25
        Cursor = crHandPoint
        Hint = 'Excluir Pedido'
        Caption = 'Excluir '
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333000000000
          3333333777777777F3333330F777777033333337F3F3F3F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          33333337F7F7F7F7F3333330F080707033333337F7F7F7F7F3333330F0808070
          333333F7F7F7F7F7F3F33030F080707030333737F7F7F7F7F7333300F0808070
          03333377F7F7F7F773333330F080707033333337F7F7F7F7F333333070707070
          33333337F7F7F7F7FF3333000000000003333377777777777F33330F88877777
          0333337FFFFFFFFF7F3333000000000003333377777777777333333330777033
          3333333337FFF7F3333333333000003333333333377777333333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btExcluirClick
      end
    end
  end
end
