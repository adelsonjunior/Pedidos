unit UPedVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Buttons, FireDAC.Comp.Client, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet, UPedidoControl,
  Vcl.Mask, Vcl.DBCtrls, UFuncsUtils;

type
  TFrmPedVendas = class(TForm)
    PnlPedido: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btLocalizaProdutos: TSpeedButton;
    Label9: TLabel;
    btLocalizaCliente: TSpeedButton;
    Label10: TLabel;
    EdQuantidade: TDBEdit;
    EdCodProduto: TDBEdit;
    EdPrecoUnit: TDBEdit;
    PnlIntes: TPanel;
    v: TPanel;
    DBG_Itens: TDBGrid;
    lblNPedido: TLabel;
    EdCodCliente: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    btNovoPedido: TBitBtn;
    btSalvarPedido: TBitBtn;
    btAddItem: TBitBtn;
    btCancelarPedido: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    DBText4: TDBText;
    DBText5: TDBText;
    Label6: TLabel;
    PnlPesquisa: TPanel;
    btPesquisarPedido: TBitBtn;
    EdNumPed: TEdit;
    btExcluir: TBitBtn;
    lbNumPedPesq: TLabel;
    procedure btNovoPedidoClick(Sender: TObject);
    procedure btLocalizaProdutosClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdCodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure btLocalizaClienteClick(Sender: TObject);
    procedure btSalvarPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdQuantidadeExit(Sender: TObject);
    procedure EdPrecoUnitExit(Sender: TObject);
    procedure EdCodProdutoExit(Sender: TObject);
    procedure EdQuantidadeKeyPress(Sender: TObject; var Key: Char);
    procedure btAddItemClick(Sender: TObject);
    procedure btCancelarPedidoClick(Sender: TObject);
    procedure DBG_ItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btPesquisarPedidoClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure EdQuantidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdCodClienteExit(Sender: TObject);
  private
    vlPedidoControl : TPedidoControl;
    vlStatus : TStatus;
    procedure habilitaControles(AHabilita: boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedVendas: TFrmPedVendas;

implementation

uses UDMPedVendas, UProdutoControl, USistemaControl, UFrmConsultaProdutos,
  UFrmConsultaClientes;
{$R *.dfm}

procedure TFrmPedVendas.btExcluirClick(Sender: TObject);
var
  vlResposta : Integer;
begin
  if (Trim(EdNumPed.Text) <> '') then
  begin
    if MessageDlg('Deseja realmente excluir o pedido nº '+EdNumPed.Text+' ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      TSistemaControl.GetInstance.PedidoModel.Codigo := StrToInt(EdNumPed.Text);
      if vlPedidoControl.Excluir then
      begin
        DMPedVendas.FDPedidos.Close;
        DMPedVendas.FDPedidos.Open;
        MessageDlg('Pedido Nº '+EdNumPed.Text+ ' excluído com sucesso.', mtConfirmation, [mbOK], 0);
        btSalvarPedido.Enabled     := False;
        btCancelarPedido.Enabled   := False;
        btNovoPedido.Enabled       := True;
        btLocalizaProdutos.Enabled := False;
        btLocalizaCliente.Enabled  := False;
        btAddItem.Enabled          := False;
        PnlPedido.Enabled          := False;
        EdNumPed.Clear;
      end
      else
        MessageDlg('Pedido não localizdo ou excluído anteriormente.', mtConfirmation, [mbOK], 0);
    end;
  end
  else
  begin
    EdNumPed.SetFocus;
    raise Exception.Create('Informe o número do pedido para poder excluir');
  end;
end;

procedure TFrmPedVendas.btAddItemClick(Sender: TObject);
begin
  if (Trim(EdCodProduto.Text) = '') or (Trim(EdCodProduto.Text) = '0') then
  begin
    EdCodProduto.SetFocus;
    btSalvarPedido.Enabled := False;
    raise Exception.Create('Informe o produto para salvar o item!');
  end;

  if (not DMPedVendas.FDTProdutos.Locate('id_produto' ,  EdCodProduto.Text, [])) then
  begin
    EdCodProduto.SetFocus;
    btSalvarPedido.Enabled := False;
    raise Exception.Create('Informe um produto cadastrado para salvar o item!');
  end;

  if (Trim(EdQuantidade.Text) = '') or (Trim(EdQuantidade.Text) = '0') or (Trim(EdQuantidade.Text) = '0,00') then
  begin
    EdQuantidade.SetFocus;
    btSalvarPedido.Enabled := False;
    raise Exception.Create('Informe a quantidade para salvar o item!');
  end;

  if (Trim(EdPrecoUnit.Text) = '') or (Trim(EdQuantidade.Text) = '0') or (Trim(EdPrecoUnit.Text) = '0,00') then
  begin
    EdPrecoUnit.SetFocus;
    btSalvarPedido.Enabled := False;
    raise Exception.Create('Informe o preço unitário para salvar o item!');
  end;

  with DMPedVendas do
  begin
    if vlStatus = tIncluir then
    begin
      fuCalculaVlTotalPedido;
      FDPedidosItens.Append;
    end
    else if vlStatus = tAlterar then
    begin
      FDPedidosItens.Edit;
      FDPedidosItens.Post;
      FDPedidosItens.Append;
    end;
  end;
  vlStatus := tIncluir;
  habilitaControles(True);
  btAddItem.Caption := 'Adicionar Item';
  EdCodProduto.SetFocus;
  btSalvarPedido.Enabled := True;
end;

procedure TFrmPedVendas.btCancelarPedidoClick(Sender: TObject);
begin
  DMPedVendas.cancelarPedido;
  btSalvarPedido.Enabled    := False;
  btCancelarPedido.Enabled  := False;
  btAddItem.Enabled         := False;
  btNovoPedido.Enabled      := True;
  vlStatus                  := tPesquisando;
  habilitaControles(False);
  PnlPesquisa.Visible       := True;
end;

procedure TFrmPedVendas.btLocalizaClienteClick(Sender: TObject);
begin
  try
    FrmConsultaClientes := TFrmConsultaClientes.Create(Self);
    FrmConsultaClientes.showmodal;
  finally
    FreeAndNil(FrmConsultaClientes);
  end;

  if TSistemaControl.GetInstance.ClienteModel.Codigo <> 0 then
  begin
    if not (DMPedVendas.FDPedidos.State in [dsEdit, dsInsert]) then
      DMPedVendas.FDPedidos.edit;

    DMPedVendas.FDPedidos.FieldByName('id_cliente').AsInteger := TSistemaControl.GetInstance.ClienteModel.Codigo;
    EdCodProduto.SetFocus;
  end;

end;

procedure TFrmPedVendas.btLocalizaProdutosClick(Sender: TObject);
begin
  try
    FrmConsultaProdutos := TFrmConsultaProdutos.Create(Self);
    FrmConsultaProdutos.showmodal;
  finally
    FreeAndNil(FrmConsultaProdutos);
  end;

  if TSistemaControl.GetInstance.ProdutoModel.Codigo <> 0 then
  begin
    if not (DMPedVendas.FDPedidosItens.State in [dsEdit, dsInsert]) then
      DMPedVendas.FDPedidosItens.edit;

    DMPedVendas.FDPedidosItens.FieldByName('id_produto').AsInteger      := TSistemaControl.GetInstance.ProdutoModel.Codigo;
    DMPedVendas.FDPedidosItens.FieldByName('vlr_unitario').AsCurrency   := TSistemaControl.GetInstance.ProdutoModel.PrecoVenda;
    EdQuantidade.SetFocus;
  end;
end;

procedure TFrmPedVendas.btSalvarPedidoClick(Sender: TObject);
begin
  if (Trim(EdCodCliente.Text) = '') then
  begin
    EdCodCliente.SetFocus;
    raise Exception.Create('Informe um cliente para salvar o pedido');
  end;

  if (not DMPedVendas.FDTClientes.Locate('id_cliente' ,  EdCodCliente.Text, [])) then
  begin
    EdCodCliente.SetFocus;
    raise Exception.Create('Informe um cliente cadastrado para salvar o pedido');
  end;


  with DMPedVendas do
  begin
    fuCalculaVlTotalPedido;
    FDPedidos.Edit;
    FDPedidos.FieldByName('id_cliente').AsInteger         := StrToInt(EdCodCliente.Text);
    FDPedidos.FieldByName('data_emissao').AsDateTime      := now;
    TSistemaControl.GetInstance.PedidoModel.Codigo        := FDPedidos.FieldByName('id_pedido').AsInteger;
    TSistemaControl.GetInstance.PedidoModel.CodigoCliente := FDPedidos.FieldByName('id_cliente').AsInteger;
    TSistemaControl.GetInstance.PedidoModel.DataEmissao   := FDPedidos.FieldByName('data_emissao').AsDateTime;
    TSistemaControl.GetInstance.PedidoModel.ValorTotal    := FDPedidos.FieldByName('valor_total').AsFloat;
    if vlPedidoControl.Salvar then
    begin
      btNovoPedido.Enabled      := True;
      btAddItem.Enabled         := not btNovoPedido.Enabled;
      btSalvarPedido.Enabled    := not btNovoPedido.Enabled;
      btCancelarPedido.Enabled  := not btNovoPedido.Enabled;
      vlStatus                  := tPesquisando;
      habilitaControles(False);
    end;

  end;
end;

procedure TFrmPedVendas.DBG_ItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if vlStatus <> tPesquisando then
  begin
    if (key = vk_Delete) then
    begin
      if DBG_Itens.DataSource.DataSet.RecordCount > 0 then
      begin
        if MessageDlg('Deseja realmente excluir o item '+DMPedVendas.FDPedidosItens.FieldByName('id_produto').AsString+' - '+DMPedVendas.FDPedidosItens.FieldByName('lk_descricao').AsString+'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          DMPedVendas.FDPedidosItens.Delete;
          DMPedVendas.fuCalculaVlTotalPedido;
          if DMPedVendas.FDPedidosItens.IsEmpty then
            EdCodProduto.SetFocus;
        end;
      end;
    end
    else if (key = 13) then
    begin
      if DBG_Itens.DataSource.DataSet.RecordCount > 0 then
      begin
        vlStatus          := tAlterar;
        btAddItem.Caption := 'Atualizar Item';
        habilitaControles(False);
        Self.KeyPreview := False;
        EdQuantidade.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmPedVendas.btNovoPedidoClick(Sender: TObject);
begin
  with DMPedVendas do
  begin
    FDPedidos.Append;
    FDPedidos.FieldByName('id_pedido').AsInteger := vlPedidoControl.GetIdPedido;
    FDPedidosItens.Append;
  end;
  vlStatus                  := tIncluir;
  habilitaControles(True);
  EdCodCliente.SetFocus;
  btNovoPedido.Enabled      := False;
  btAddItem.Enabled         := not btNovoPedido.Enabled;
  btSalvarPedido.Enabled    := not btNovoPedido.Enabled;
  btCancelarPedido.Enabled  := not btNovoPedido.Enabled;
  PnlPesquisa.Visible       := True;
  EdNumPed.Clear;
end;

procedure TFrmPedVendas.btPesquisarPedidoClick(Sender: TObject);
begin
  if (Trim(EdNumPed.Text) <> '') then
  begin
    vlStatus                                       := tPesquisando;
    DMPedVendas.FDPedidos.Close;
    DMPedVendas.FDPedidos.Open;
    TSistemaControl.GetInstance.PedidoModel.Codigo := StrToInt(EdNumPed.Text);
    DMPedVendas.FDPedidos.CopyDataSet(vlPedidoControl.GetPedidoCodigo);
    if DMPedVendas.FDPedidos.RecordCount = 0 then
    begin
      MessageDlg('Pedido não localizado.', mtWarning, [mbOK], 0);
      EdNumPed.SetFocus;
    end
    else
    begin
      PnlPesquisa.Visible      := False;
      btSalvarPedido.Enabled   := False;
      btCancelarPedido.Enabled := False;
      btAddItem.Enabled        := False;
      PnlPedido.Enabled        := False;
      btNovoPedido.Enabled     := True;
      habilitaControles(False);
    end;
  end
  else
  begin
    EdNumPed.SetFocus;
    raise Exception.Create('Informe o número do pedido para pesquisar');
  end;
end;

procedure TFrmPedVendas.EdCodClienteExit(Sender: TObject);
begin
  PnlPesquisa.Visible       := (Trim(EdCodCliente.Text) = '');
end;

procedure TFrmPedVendas.EdCodClienteKeyPress(Sender: TObject; var Key: Char);
begin
 if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   key := #0;
end;

procedure TFrmPedVendas.EdCodProdutoExit(Sender: TObject);
begin
  if (Trim(EdCodProduto.Text) <> '') and (DMPedVendas.FDTProdutos.Locate('id_produto' ,  EdCodProduto.Text, [])) then
  begin
    if not (DMPedVendas.FDPedidosItens.State in [dsEdit, dsInsert]) then
      DMPedVendas.FDPedidosItens.edit;

    DMPedVendas.FDPedidosItens.FieldByName('vlr_unitario').AsCurrency   := DMPedVendas.FDPedidosItens.FieldByName('lk_preco_unitario').AsCurrency;
    EdQuantidade.SetFocus;
  end;
end;

procedure TFrmPedVendas.EdPrecoUnitExit(Sender: TObject);
begin
   DMPedVendas.fuCalculaVlTotalItem;
end;

procedure TFrmPedVendas.EdQuantidadeExit(Sender: TObject);
begin
  DMPedVendas.fuCalculaVlTotalItem;
end;

procedure TFrmPedVendas.EdQuantidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) then
    Self.KeyPreview := True;
end;

procedure TFrmPedVendas.EdQuantidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = '.') then
    Key := FormatSettings.DecimalSeparator;

  if not (CharInSet(Key, [chr(VK_BACK), '0'..'9', #0..#30, FormatSettings.DecimalSeparator])) then
  begin
    key:=#0;
    beep;
  end
  else if Key = FormatSettings.DecimalSeparator then
  begin
   if pos(Key,TEdit(Sender).Text) <> 0 then
     key := #0;
  end;
end;

procedure TFrmPedVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(vlPedidoControl);
end;

procedure TFrmPedVendas.FormCreate(Sender: TObject);
begin
  vlPedidoControl := TPedidoControl.Create;
  DMPedVendas.setarConexao;
  DMPedVendas.openQuerys;
  habilitaControles(False);
  vlStatus := tPesquisando;
end;

procedure TFrmPedVendas.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    Key := #0;
    Perform(WM_nextdlgctl,0,0)
  end;
  if Key = #27 then
    Perform(WM_nextdlgctl,1,0);
end;

procedure TFrmPedVendas.habilitaControles(AHabilita : boolean);
begin
  EdCodCliente.Enabled       := AHabilita;
  btLocalizaCliente.Enabled  := AHabilita;
  EdCodProduto.Enabled       := AHabilita;
  btLocalizaProdutos.Enabled := AHabilita;
  EdQuantidade.Enabled       := AHabilita;
  EdPrecoUnit.Enabled        := AHabilita;
  PnlPedido.Enabled          := not (vlStatus = tPesquisando);
  if vlStatus = tAlterar then
  begin
    EdQuantidade.Enabled       := True;
    EdPrecoUnit.Enabled        := True;
  end;
end;

end.
