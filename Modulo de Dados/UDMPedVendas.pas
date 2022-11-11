unit UDMPedVendas;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDMPedVendas = class(TDataModule)
    FDPedidos: TFDQuery;
    DsPedidos: TDataSource;
    FDPedidosItens: TFDQuery;
    DsPedidosItens: TDataSource;
    FDMProdutos: TFDMemTable;
    DsDMProdutos: TDataSource;
    FDMClientes: TFDMemTable;
    DsDMClientes: TDataSource;
    FDPedidosItensid_pedido_itens: TFDAutoIncField;
    FDPedidosItensid_pedido: TIntegerField;
    FDPedidosItensid_produto: TIntegerField;
    FDPedidosItensqtd: TSingleField;
    FDPedidosItensvlr_unitario: TSingleField;
    FDPedidosItensvlr_total: TSingleField;
    FDTProdutos: TFDTable;
    FDPedidosItenslk_descricao: TStringField;
    FDTClientes: TFDTable;
    FDPedidosid_pedido: TIntegerField;
    FDPedidosdata_emissao: TDateField;
    FDPedidosid_cliente: TIntegerField;
    FDPedidosvalor_total: TSingleField;
    FDPedidoslk_cliente: TStringField;
    FDPedidosItenslk_preco_unitario: TFloatField;
    FDPedidoslk_cidade: TStringField;
    FDPedidoslk_uf: TStringField;
    procedure FDPedidosAfterOpen(DataSet: TDataSet);
    procedure FDPedidosItensAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure salvarPedidoItens;
    procedure setarConexao;
    procedure openQuerys;
    procedure fuCalculaVlTotalItem;
    procedure fuCalculaVlTotalPedido;
    procedure cancelarPedido;
    { Public declarations }
  end;

var
  DMPedVendas: TDMPedVendas;

implementation

uses
  UFuncsUtils, USistemaControl;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMPedVendas.salvarPedidoItens;
var
  FDMTPedItens   : TFDMemTable;
  vlSQL : String;
begin
  FDMTPedItens := TFDMemTable.Create(Self);
  try
    FDMTPedItens.FilterChanges := [rtModified, rtInserted, rtDeleted];
    FDMTPedItens.Data := DMPedVendas.FDPedidosItens.Delta;
    try
      FDMTPedItens.First;
      while not FDMTPedItens.Eof do
      begin
        if FDMTPedItens.UpdateStatus = usInserted then
        begin
          vlSQL := ' INSERT INTO pedidos_itens (id_pedido, id_produto, qtd, vlr_unitario, vlr_total)' +
                   ' VALUES ('+QuotedStr(FDMTPedItens.FieldByName('id_pedido').AsString) +','+
                              QuotedStr(FDMTPedItens.FieldByName('id_produto').AsString) +','+
                              QuotedStr(fuCommaToPoint(FloatToStr(FDMTPedItens.FieldByName('qtd').AsFloat))) +','+
                              QuotedStr(fuCommaToPoint(FloatToStr(FDMTPedItens.FieldByName('vlr_unitario').AsFloat))) +','+
                              QuotedStr(fuCommaToPoint(FloatToStr(FDMTPedItens.FieldByName('vlr_total').AsFloat))) +');';
          TSistemaControl.GetInstance().Conexao.GetConn.ExecSQL(vlSQL);
        end
        else if FDMTPedItens.UpdateStatus = usModified then
        begin
          vlSQL := ' UPDATE pedidos_itens SET qtd = '+ QuotedStr(FloatToStr(FDMTPedItens.FieldByName('qtd').AsFloat))+','+
                  ' vlr_unitario = '+ QuotedStr(fuCommaToPoint(FloatToStr(FDMTPedItens.FieldByName('vlr_unitario').AsFloat)))+','+
                  ' valor_total = '+ QuotedStr(fuCommaToPoint(FloatToStr(FDMTPedItens.FieldByName('valor_total').AsFloat)))+
            ' WHERE id_pedido_itens = ' + FDMTPedItens.FieldByName('id_pedido_itens').AsString;
          TSistemaControl.GetInstance().Conexao.GetConn.ExecSQL(vlSQL);
        end;
        FDMTPedItens.Next;
      end;
    except
      raise;
    end;
  finally
    FreeAndNil(FDMTPedItens);
  end;
end;

procedure TDMPedVendas.setarConexao;
begin
  FDPedidos.Connection      := TSistemaControl.GetInstance().Conexao.GetConn;
  FDPedidosItens.Connection := TSistemaControl.GetInstance().Conexao.GetConn;
  FDTProdutos.Connection    := TSistemaControl.GetInstance().Conexao.GetConn;
  FDTClientes.Connection    := TSistemaControl.GetInstance().Conexao.GetConn;
end;

procedure TDMPedVendas.openQuerys;
begin
  FDTProdutos.Close;
  FDTProdutos.Open;
  FDTClientes.Close;
  FDTClientes.Open;
  FDPedidos.Close;
  FDPedidos.Open;
  FDPedidosItens.Close;
  FDPedidosItens.Open;
end;

procedure TDMPedVendas.FDPedidosAfterOpen(DataSet: TDataSet);
begin
  TFloatField(DataSet.FieldByName('valor_total')).DisplayFormat := '###,##0.00';
end;

procedure TDMPedVendas.FDPedidosItensAfterOpen(DataSet: TDataSet);
begin
  TFloatField(DataSet.FieldByName('qtd')).DisplayFormat          := '###,##0.00';
  TFloatField(DataSet.FieldByName('vlr_unitario')).DisplayFormat := '###,##0.00';
  TFloatField(DataSet.FieldByName('vlr_total')).DisplayFormat    := '###,##0.00';
end;

procedure TDMPedVendas.fuCalculaVlTotalItem;
begin
  if (FDPedidosItens.FieldByName('qtd').AsFloat > 0) and (FDPedidosItens.FieldByName('vlr_unitario').AsFloat > 0) then
  begin
    if not (FDPedidosItens.State in [dsEdit, dsInsert]) then
      FDPedidosItens.edit;

    FDPedidosItens.FieldByName('vlr_total').AsFloat    := FDPedidosItens.FieldByName('qtd').AsFloat * FDPedidosItens.FieldByName('vlr_unitario').AsFloat;
    fuCalculaVlTotalPedido;
  end;
end;

procedure TDMPedVendas.fuCalculaVlTotalPedido;
var
  vlBook : TBookmark;
  vlTotal : Real;
begin
  vlTotal := 0;
  DisabledDataset(FDPedidosItens, vlBook);
  try
    FDPedidosItens.First;
    while not FDPedidosItens.Eof do
    begin
      vlTotal := vlTotal + FDPedidosItens.FieldByName('vlr_total').AsCurrency;
      FDPedidosItens.Next;
    end;

    if not (FDPedidos.State in [dsEdit, dsInsert]) then
      FDPedidos.edit;

    FDPedidos.FieldByName('valor_total').AsFloat    := vlTotal;
  finally
    EnabledDataset(FDPedidosItens, vlBook);
  end;
end;

procedure TDMPedVendas.cancelarPedido;
begin
  if (FDPedidos.State in [dsEdit, dsInsert]) then
    FDPedidos.Cancel;
  FDPedidos.CancelUpdates;
  if (FDPedidosItens.State in [dsEdit, dsInsert]) then
    FDPedidosItens.Cancel;
  FDPedidosItens.CancelUpdates;
end;

end.
