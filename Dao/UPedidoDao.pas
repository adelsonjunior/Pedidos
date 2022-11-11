unit UPedidoDao;

interface

uses
  FireDAC.Comp.Client, uConexao, uPedidoModel, System.SysUtils;

type
  TPedidoDao = class
  private
    FConexao: TConexao;
  public
    constructor Create;

    function Incluir(APedidoModel: TPedidoModel): Boolean;
    function Alterar(APedidoModel: TPedidoModel): Boolean;
    function Excluir(APedidoModel: TPedidoModel): Boolean;
    function GetIdPedido: Integer;
    function GetPedidoCodigo(APedidoModel: TPedidoModel): TFDQuery;
  end;

implementation

uses uSistemaControl, UFuncsUtils, UDMPedVendas;

constructor TPedidoDao.Create;
begin
  FConexao := TSistemaControl.GetInstance().Conexao;
end;

function TPedidoDao.Incluir(APedidoModel: TPedidoModel): Boolean;
var
  vlQuery: TFDQuery;
begin
  vlQuery := FConexao.CriarQuery();
  try
    FConexao.GetConn.TxOptions.AutoCommit:=False;
    FConexao.GetConn.StartTransaction;
    try
      vlQuery.ExecSQL('insert into pedidos (id_pedido , data_emissao, id_cliente , valor_total) values (:id_pedido , :data_emissao, :id_cliente, :valor_total)', [APedidoModel.Codigo , FormatDateTime('YYYY-MM-DD', APedidoModel.DataEmissao), APedidoModel.CodigoCliente, fuCommaToPoint(FloatToStr(APedidoModel.ValorTotal))]);
      DMPedVendas.salvarPedidoItens;
      FConexao.GetConn.Commit;
      except
        on E: Exception do
        begin
          FConexao.GetConn.Rollback;
          raise Exception.Create('Erro ao salvar o Pedido: ' + E.Message);
        end;
      end;
    Result := True;
  finally
    vlQuery.Free;
  end;
end;

function TPedidoDao.Alterar(APedidoModel: TPedidoModel): Boolean;
var
  vlQuery: TFDQuery;
begin
  vlQuery := FConexao.CriarQuery();
  try
    FConexao.GetConn.TxOptions.AutoCommit:=False;
    FConexao.GetConn.StartTransaction;
    try
      vlQuery.ExecSQL('update pedido set data_emissao = :data_emissao, valor_total = :valor_total where id_pedido  = :id_pedido )', [FormatDateTime('YYYY-MM-DD', APedidoModel.DataEmissao), fuCommaToPoint(FloatToStr(APedidoModel.ValorTotal)), APedidoModel.Codigo]);
      FConexao.GetConn.Commit;
      except
        on E: Exception do
        begin
          FConexao.GetConn.Rollback;
          raise Exception.Create('Erro ao alterar o Pedido: ' + E.Message);
        end;
      end;
    Result := True;
  finally
    vlQuery.Free;
  end;
end;

function TPedidoDao.Excluir(APedidoModel: TPedidoModel): Boolean;
var
  vlQuery: TFDQuery;
begin
  vlQuery := FConexao.CriarQuery();
  try
    FConexao.GetConn.TxOptions.AutoCommit:=False;
    FConexao.GetConn.StartTransaction;
    try
      vlQuery.ExecSQL('delete from pedidos where id_pedido = :id_pedido ', [APedidoModel.Codigo]);
      FConexao.GetConn.Commit;
      except
        on E: Exception do
        begin
          FConexao.GetConn.Rollback;
          raise Exception.Create('Erro ao excluir o Pedido: ' + E.Message);
        end;
      end;
    Result := (vlQuery.RowsAffected > 0);              
  finally
    vlQuery.Free;
  end;
end;

function TPedidoDao.GetIdPedido: Integer;
var
  vlQuery: TFDQuery;
begin
  vlQuery := FConexao.CriarQuery();
  try
    vlQuery.Open('select IFNULL(max(id_pedido),0)+1 from pedidos');
    try
      Result := vlQuery.Fields[0].AsInteger;
    finally
      vlQuery.Close;
    end;
  finally
    vlQuery.Free;
  end;
end;

function TPedidoDao.GetPedidoCodigo(APedidoModel: TPedidoModel): TFDQuery;
var
  vlQuery: TFDQuery;
begin
  vlQuery := FConexao.CriarQuery();
  vlQuery.Open('select * from pedidos where id_pedido =:id_pedido order by id_pedido', [APedidoModel.Codigo]);
  Result := vlQuery;
end;

end.
