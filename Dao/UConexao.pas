unit UConexao;

interface

uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQLDef,
  FireDAC.Phys.FB, System.SysUtils, FireDAC.DApt, FireDAC.VCLUI.Wait, Vcl.Forms, Vcl.Dialogs;

type
  TConexao = class
  private
    FConn: TFDConnection;
    FDatabase : String;
    FUserName : String;
    FPassword : String;
    procedure setConexao;
  public
    constructor Create;
    destructor Destroy; override;

    function GetConn: TFDConnection;
    function CriarQuery: TFDQuery;
  end;

implementation

uses UfuncsUtils;

procedure TConexao.setConexao;
begin
  try
    LeArquivoINI(FDatabase, FUserName, FPassword);
    FConn.Params.DriverID := 'MySQL';
    FConn.Params.Database := FDatabase;
    FConn.Params.UserName := FUserName;
    FConn.Params.Password := FPassword;
    FConn.LoginPrompt     := False;
    FConn.Connected       := True;
    FConn.Connected       := False;
  except on E: Exception do
  begin
    MessageDlg('Erro ao conectar no banco de dados, verifique os parâmetros no arquivo PEDIDOS.ini.'+ e.Message, mtError, [mbOK], 0);
    Application.Terminate;
  end;
  end;

end;

constructor TConexao.Create;
begin
  FConn := TFDConnection.Create(nil);

  Self.setConexao();
end;

function TConexao.CriarQuery: TFDQuery;
var
  vlQuery: TFDQuery;
begin
  vlQuery := TFDQuery.Create(nil);
  vlQuery.Connection := FConn;

  Result := vlQuery;
end;

destructor TConexao.Destroy;
begin
  FConn.Free;
  inherited;
end;

function TConexao.GetConn: TFDConnection;
begin
  Result := FConn;
end;

end.
