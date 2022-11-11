unit UProdutoControl;

interface

uses
  UProdutoModel, System.SysUtils, FireDAC.Comp.Client;

type
  TProdutoControl = class
  private
    FProdutoModel: TProdutoModel;
  public
    constructor Create;
    destructor Destroy; override;

    function getAllProdutos: TFDQuery;
    property ProdutoModel: TProdutoModel read FProdutoModel write FProdutoModel;
  end;

implementation

constructor TProdutoControl.Create;
begin
  FProdutoModel := TProdutoModel.Create;
end;

destructor TProdutoControl.Destroy;
begin
  FProdutoModel.Free;
  inherited;
end;

function TProdutoControl.getAllProdutos: TFDQuery;
begin
  Result := FProdutoModel.getAllProdutos;
end;

end.
