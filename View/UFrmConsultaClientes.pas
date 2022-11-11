unit UFrmConsultaClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.Client;

type
  TFrmConsultaClientes = class(TForm)
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
    procedure getAllClientes;
    procedure setCliente;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConsultaClientes: TFrmConsultaClientes;

implementation

{$R *.dfm}

uses
  UDMPedVendas, uClienteControl, USistemaControl;

procedure TFrmConsultaClientes.DBG_ConsultaDblClick(Sender: TObject);
begin
  if DBG_Consulta.DataSource.DataSet.RecordCount = 0 then
    Exit
  else
    setCliente;

  Close;
end;

procedure TFrmConsultaClientes.DBG_ConsultaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = vk_Return) then
  begin
    if DBG_Consulta.DataSource.DataSet.RecordCount = 0 then
      Exit
    else
      setCliente;

    Close;
  end;
end;

procedure TFrmConsultaClientes.EdConsultaChange(Sender: TObject);
begin
  if trim(EdConsulta.Text) = '' then
     exit;

  if RgTipo.ItemIndex = 1 then
    DBG_Consulta.DataSource.DataSet.Locate('id_cliente' ,  EdConsulta.Text, [loPartialKey])
  else
    DBG_Consulta.DataSource.DataSet.Locate('nome' ,  EdConsulta.Text, [loPartialKey]);
end;

procedure TFrmConsultaClientes.EdConsultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_up) then
    DBG_Consulta.SetFocus;

  if (key = 13) then
  begin
    setCliente;
    Close;
  end;
end;

procedure TFrmConsultaClientes.EdConsultaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if RgTipo.ItemIndex = 1 then
  begin
    if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
      key := #0;
  end;
end;

procedure TFrmConsultaClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMPedVendas.FDMClientes.Close;
end;

procedure TFrmConsultaClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = VK_F4) then
    Close;
end;

procedure TFrmConsultaClientes.FormShow(Sender: TObject);
begin
  getAllClientes;
end;

procedure TFrmConsultaClientes.getAllClientes;
var
  vlClienteControl : TClienteControl;
  VFDQClientes     : TFDQuery;
begin
  vlClienteControl := TClienteControl.Create;
  VFDQClientes     := TFDQuery.Create(Self);
  try
    VFDQClientes := vlClienteControl.getAllClientes;
    VFDQClientes.FetchAll;
    DMPedVendas.FDMClientes.Data := VFDQClientes.Data;
  finally
    FreeAndNil(vlClienteControl);
    FreeAndNil(VFDQClientes);
  end;
end;

procedure TFrmConsultaClientes.RgTipoClick(Sender: TObject);
begin
  EdConsulta.Clear;
  DBG_Consulta.DataSource.DataSet.First;
end;

procedure TFrmConsultaClientes.setCliente;
begin
  TSistemaControl.GetInstance.ClienteModel.Codigo := DBG_Consulta.DataSource.DataSet.FieldByName('id_cliente').AsInteger;
  TSistemaControl.GetInstance.ClienteModel.Nome   := DBG_Consulta.DataSource.DataSet.FieldByName('nome').AsString;
end;

end.
