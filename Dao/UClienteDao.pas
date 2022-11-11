unit uClienteDao;

interface

uses
  FireDAC.Comp.Client, uConexao, uClienteModel, System.SysUtils;

type
  TClienteDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;
    function getAllClientes: TFDQuery;
  end;

implementation

uses uSistemaControl;

constructor TClienteDao.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TClienteDao.getAllClientes: TFDQuery;
var
  VQry: TFDQuery;
begin
  VQry := FConexao.CriarQuery();

  VQry.Open('select id_cliente, nome, cidade, uf from clientes order by id_cliente');

  Result := VQry;
end;

end.
