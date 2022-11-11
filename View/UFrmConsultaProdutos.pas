unit UFrmConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client;

type
  TFrmConsultaProdutos = class(TForm)
    PlnProdutos: TPanel;
    PnlBusca: TPanel;
    DBG_Consulta: TDBGrid;
    Label1: TLabel;
    EdConsulta: TEdit;
    RgTipo: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure EdConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBG_ConsultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBG_ConsultaDblClick(Sender: TObject);
    procedure EdConsultaChange(Sender: TObject);
    procedure EdConsultaKeyPress(Sender: TObject; var Key: Char);
    procedure RgTipoClick(Sender: TObject);
  private
    procedure getAllProdutos;
    procedure setProduto;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaProdutos: TFrmConsultaProdutos;

implementation

{$R *.dfm}

uses
  UDMPedVendas, UProdutoControl, USistemaControl;

procedure TFrmConsultaProdutos.DBG_ConsultaDblClick(Sender: TObject);
begin
  if DBG_Consulta.DataSource.DataSet.RecordCount = 0 then
    Exit
  else
    setProduto;

  Close;
end;

procedure TFrmConsultaProdutos.DBG_ConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) then
  begin
    if DBG_Consulta.DataSource.DataSet.RecordCount = 0 then
      Exit
    else
      setProduto;

    Close;
  end;
end;

procedure TFrmConsultaProdutos.EdConsultaChange(Sender: TObject);
begin
  if trim(EdConsulta.Text) = '' then
     exit;

  if RgTipo.ItemIndex = 1 then
    DBG_Consulta.DataSource.DataSet.Locate('id_produto' ,  EdConsulta.Text, [loPartialKey])
  else
    DBG_Consulta.DataSource.DataSet.Locate('descricao' ,  EdConsulta.Text, [loPartialKey]);
end;

procedure TFrmConsultaProdutos.EdConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_up) then
    DBG_Consulta.SetFocus;

  if (key = 13) then
  begin
    setProduto;
    Close;
  end;
end;

procedure TFrmConsultaProdutos.EdConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if RgTipo.ItemIndex = 1 then
  begin
    if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
      key := #0;
  end;
end;

procedure TFrmConsultaProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMPedVendas.FDMProdutos.Close;
end;

procedure TFrmConsultaProdutos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_F4) then
    Close;
end;

procedure TFrmConsultaProdutos.FormShow(Sender: TObject);
begin
  getAllProdutos;
end;

procedure TFrmConsultaProdutos.getAllProdutos;
var
  vlProdutoControl : TProdutoControl;
  VFDQProdutos     : TFDQuery;
begin
  vlProdutoControl := TProdutoControl.Create;
  VFDQProdutos     := TFDQuery.Create(Self);
  try
    VFDQProdutos := vlProdutoControl.getAllProdutos;
    VFDQProdutos.FetchAll;
    DMPedVendas.FDMProdutos.Data := VFDQProdutos.Data;
  finally
    FreeAndNil(vlProdutoControl);
    FreeAndNil(VFDQProdutos);
  end;
end;

procedure TFrmConsultaProdutos.RgTipoClick(Sender: TObject);
begin
  EdConsulta.Clear;
  DBG_Consulta.DataSource.DataSet.First;
end;

procedure TFrmConsultaProdutos.setProduto;
begin
  TSistemaControl.GetInstance.ProdutoModel.Codigo     := DBG_Consulta.DataSource.DataSet.FieldByName('id_produto').AsInteger;
  TSistemaControl.GetInstance.ProdutoModel.Descricao  := DBG_Consulta.DataSource.DataSet.FieldByName('descricao').AsString;
  TSistemaControl.GetInstance.ProdutoModel.PrecoVenda := DBG_Consulta.DataSource.DataSet.FieldByName('preco_venda').AsFloat;
end;

end.
