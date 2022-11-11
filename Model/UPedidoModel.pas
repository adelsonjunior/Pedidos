unit UPedidoModel;

interface

uses
  FireDAC.Comp.Client;

type
  TPedidoModel = class
  private
    FCodigo: Integer;
    FDataEmissao: TDate;
    FCodigoCliente : Integer;
    FValorTotal : Real;

    procedure SetCodigo(const Value: Integer);
    procedure SetDataEmissao(const Value: TDate);
    procedure SetCodigoCliente(const Value: Integer);
    procedure SetValorTotal(const Value: Real);
public
    function Salvar: Boolean;
    function Excluir: Boolean;
    function GetIdPedido: Integer;
    function GetPedidoCodigo: TFDQuery;


    property Codigo: Integer read FCodigo write SetCodigo;
    property DataEmissao: TDate read FDataEmissao write SetDataEmissao;
    property CodigoCliente: Integer read FCodigoCliente write SetCodigoCliente;
    property ValorTotal: Real read FValorTotal write SetValorTotal;
  end;

implementation

uses UPedidoDao, USistemaControl;

function TPedidoModel.Salvar: Boolean;
var
  vlPedidoDao: TPedidoDao;
begin
  Result := False;

  vlPedidoDao := TPedidoDao.Create;
  try
    Self := TSistemaControl.GetInstance.PedidoModel;
    Result := vlPedidoDao.Incluir(Self);
  finally
    vlPedidoDao.Free;
  end;
end;

function TPedidoModel.Excluir: Boolean;
var
  vlPedidoDao: TPedidoDao;
begin
  Result := False;

  vlPedidoDao := TPedidoDao.Create;
  try
    Self := TSistemaControl.GetInstance.PedidoModel;
    Result := vlPedidoDao.Excluir(Self);
  finally
    vlPedidoDao.Free;
  end;
end;

function TPedidoModel.GetIdPedido: Integer;
var
  vlPedidoDao: TPedidoDao;
begin
  vlPedidoDao := TPedidoDao.Create;
  try
    Result := vlPedidoDao.GetIdPedido;
  finally
    vlPedidoDao.Free;
  end;
end;

function TPedidoModel.GetPedidoCodigo: TFDQuery;
var
  vlPedidoDao: TPedidoDao;
begin
  vlPedidoDao := TPedidoDao.Create;
  try
    Self := TSistemaControl.GetInstance.PedidoModel;
    Result := vlPedidoDao.GetPedidoCodigo(Self);
  finally
    vlPedidoDao.Free;
  end;
end;

procedure TPedidoModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TPedidoModel.SetCodigoCliente(const Value: Integer);
begin
  FCodigoCliente := Value;
end;

procedure TPedidoModel.SetDataEmissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

procedure TPedidoModel.SetValorTotal(const Value: Real);
begin
  FValorTotal := Value;
end;

end.


