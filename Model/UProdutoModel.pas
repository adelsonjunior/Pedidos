unit UProdutoModel;

interface

uses
  System.SysUtils, FireDAC.Comp.Client;

type
  TProdutoModel = class
  private
    FCodigo: Integer;
    FDescricao: string;
    FPrecoVenda : Real;

    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetPrecoVenda(const Value: Real);
  public
    function getAllProdutos: TFDQuery;

    property Codigo: Integer read FCodigo write SetCodigo;
    property Descricao: string read FDescricao write SetDescricao;
    property PrecoVenda: Real read FPrecoVenda write FPrecoVenda;
  end;

implementation

uses uProdutoDao;

function TProdutoModel.getAllProdutos: TFDQuery;
var
  VProdutoDao: TProdutoDao;
begin
  VProdutoDao := TProdutoDao.Create;
  try
    Result := VProdutoDao.getAllProdutos;
  finally
    VProdutoDao.Free;
  end;
end;

procedure TProdutoModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProdutoModel.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProdutoModel.SetPrecoVenda(const Value: Real);
begin
  PrecoVenda := Value;
end;

end.
