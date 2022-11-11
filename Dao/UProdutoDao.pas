unit UProdutoDao;

interface

uses
  UProdutoModel, FireDAC.Comp.Client, System.SysUtils, uConexao;

type
  TProdutoDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;
    function getAllProdutos: TFDQuery;
  end;

implementation

uses uSistemaControl;

constructor TProdutoDao.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TProdutoDao.getAllProdutos: TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry   := FConexao.CriarQuery();
  VQry.Open('select id_produto, descricao, preco_venda from produtos');
  Result := VQry;
end;

end.
