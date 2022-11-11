unit uSistemaControl;

interface

uses
  uConexao, System.SysUtils, UProdutoModel, UClienteModel, UPedidoModel;

type
  TSistemaControl = class
  private
    FConexao     : TConexao;
    FProdutoModel: TProdutoModel;
    FClienteModel: TClienteModel;
    FPedidoModel : TPedidoModel;

    class var FInstance: TSistemaControl;

  public
    constructor Create();
    destructor Destroy; override;

    class function GetInstance: TSistemaControl;

     property Conexao: TConexao read FConexao write FConexao;
     property ProdutoModel: TProdutoModel read FProdutoModel write FProdutoModel;
     property ClienteModel: TClienteModel read FClienteModel write FClienteModel;
     property PedidoModel: TPedidoModel read FPedidoModel write FPedidoModel;
  end;

implementation

{ TSistemaControl }

constructor TSistemaControl.Create();
begin
  FConexao     := TConexao.Create;
  ProdutoModel := TProdutoModel.Create();
  ClienteModel := TClienteModel.Create();
  PedidoModel  := TPedidoModel.Create();
end;

destructor TSistemaControl.Destroy;
begin
  FProdutoModel.Free;
  FClienteModel.Free;
  FPedidoModel.Free;
  FConexao.Free;
  inherited;
end;

class function TSistemaControl.GetInstance: TSistemaControl;
begin
  if not Assigned(Self.FInstance) then
  begin
    Self.FInstance := TSistemaControl.Create();
  end;

  Result := Self.FInstance;
end;

end.
