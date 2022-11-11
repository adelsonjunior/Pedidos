unit UPedidoControl;

interface

uses
  UPedidoModel, System.SysUtils, FireDAC.Comp.Client;

type
  TPedidoControl = class
  private
    FPedidoModel: TPedidoModel;

  public
    constructor Create;
    destructor Destroy; override;

    function Salvar: Boolean;
    function GetPedidoCodigo: TFDQuery;
    function GetIdPedido: Integer;
    function Excluir: Boolean;

    property PedidoModel: TPedidoModel read FPedidoModel write FPedidoModel;
  end;

implementation

{ TPedidoControl }

constructor TPedidoControl.Create;
begin
  FPedidoModel := TPedidoModel.Create;
end;

destructor TPedidoControl.Destroy;
begin
  FPedidoModel.Free;
  inherited;
end;

function TPedidoControl.Excluir: Boolean;
begin
  Result := FPedidoModel.Excluir;
end;

function TPedidoControl.GetIdPedido: Integer;
begin
  Result := FPedidoModel.GetIdPedido;
end;

function TPedidoControl.GetPedidoCodigo: TFDQuery;
begin
  Result := FPedidoModel.GetPedidoCodigo;
end;

function TPedidoControl.Salvar: Boolean;
begin
  Result := FPedidoModel.Salvar;
end;

end.
