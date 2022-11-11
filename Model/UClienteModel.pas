unit UClienteModel;

interface

uses
  FireDAC.Comp.Client;

type
  TClienteModel = class
  private
    FCodigo: Integer;
    FNome: string;

    procedure SetCodigo(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    function getAllClientes: TFDQuery;

    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
  end;

implementation

uses uClienteDao;

function TClienteModel.getAllClientes: TFDQuery;
var
  vlClienteDao: TClienteDao;
begin
  vlClienteDao := TClienteDao.Create;
  Result := vlClienteDao.getAllClientes;
end;

procedure TClienteModel.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TClienteModel.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
