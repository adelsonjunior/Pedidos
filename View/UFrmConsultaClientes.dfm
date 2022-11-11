object FrmConsultaClientes: TFrmConsultaClientes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Consulta de Clientes'
  ClientHeight = 603
  ClientWidth = 817
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PlnProdutos: TPanel
    Left = 0
    Top = 0
    Width = 817
    Height = 549
    Align = alClient
    TabOrder = 0
    object DBG_Consulta: TDBGrid
      Left = 1
      Top = 1
      Width = 815
      Height = 547
      Align = alClient
      DataSource = DMPedVendas.DsDMClientes
      FixedColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBG_ConsultaDblClick
      OnKeyDown = DBG_ConsultaKeyDown
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_CLIENTE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Courier New'
          Title.Font.Style = [fsBold]
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Title.Caption = 'Nome'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Courier New'
          Title.Font.Style = [fsBold]
          Width = 415
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CIDADE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Title.Caption = 'Cidade'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Courier New'
          Title.Font.Style = [fsBold]
          Width = 116
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Courier New'
          Title.Font.Style = [fsBold]
          Width = 20
          Visible = True
        end>
    end
  end
  object PnlBusca: TPanel
    Left = 0
    Top = 549
    Width = 817
    Height = 54
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 6
      Top = 7
      Width = 64
      Height = 16
      Caption = 'Cliente:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object EdConsulta: TEdit
      Left = 1
      Top = 29
      Width = 573
      Height = 22
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnChange = EdConsultaChange
      OnKeyDown = EdConsultaKeyDown
      OnKeyPress = EdConsultaKeyPress
    end
    object RgTipo: TRadioGroup
      Left = 580
      Top = 3
      Width = 218
      Height = 49
      Caption = 'Tipo de  Consulta'
      Columns = 2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Nome'
        'C'#243'digo')
      ParentFont = False
      TabOrder = 1
      OnClick = RgTipoClick
    end
  end
end
