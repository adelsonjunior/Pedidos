unit uClienteControl;

interface

uses
  uClienteModel, System.SysUtils, FireDAC.Comp.Client;

type
  TClienteControl = class
  private
    FClienteModel: TClienteModel;

  public
    constructor Create;
    destructor Destroy; override;

    function getAllClientes: TFDQuery;
    property ClienteModel: TClienteModel read FClienteModel write FClienteModel;
  end;

implementation

{ TClienteControl }

constructor TClienteControl.Create;
begin
  FClienteModel := TClienteModel.Create;
end;

destructor TClienteControl.Destroy;
begin
  FClienteModel.Free;

  inherited;
end;

function TClienteControl.getAllClientes: TFDQuery;
begin
  Result := FClienteModel.getAllClientes;
end;

end.
