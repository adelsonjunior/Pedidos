program PrPedVendas;

uses
  Vcl.Forms,
  UPedVendas in 'UPedVendas.pas' {FrmPedVendas},
  UDMPedVendas in 'Modulo de Dados\UDMPedVendas.pas' {DMPedVendas: TDataModule},
  uClienteDao in 'Dao\uClienteDao.pas',
  uConexao in 'Dao\uConexao.pas',
  UProdutoDao in 'Dao\UProdutoDao.pas',
  UClienteModel in 'Model\UClienteModel.pas',
  UProdutoModel in 'Model\UProdutoModel.pas',
  uClienteControl in 'Controlle\uClienteControl.pas',
  uSistemaControl in 'Controlle\uSistemaControl.pas',
  UProdutoControl in 'Controlle\UProdutoControl.pas',
  UFrmConsultaProdutos in 'View\UFrmConsultaProdutos.pas' {FrmConsultaProdutos},
  UFrmConsultaClientes in 'View\UFrmConsultaClientes.pas' {FrmConsultaClientes},
  UFuncsUtils in 'Utils\UFuncsUtils.pas',
  UPedidoModel in 'Model\UPedidoModel.pas',
  UPedidoDao in 'Dao\UPedidoDao.pas',
  UPedidoControl in 'Controlle\UPedidoControl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMPedVendas, DMPedVendas);
  Application.CreateForm(TFrmPedVendas, FrmPedVendas);
  Application.Run;
end.
