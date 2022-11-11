unit UFuncsUtils;

interface

uses
  SysUtils, Classes, DB, IniFiles, Vcl.Dialogs;

type
  TStatus = (tIncluir, tAlterar, tExcluir, tPesquisando);
  function fuCommaToPoint(StrToChange: string): string;
  function fuPointToComma(StrToChange: string): string;
  procedure EnabledDataset(ADataSet: TDataSet; ABookMark: TBookmark);
  procedure DisabledDataset(ADataSet: TDataSet; var ABookMark: TBookmark);
  procedure LeArquivoINI(var ADatabase, AUserName, APassword : String);

implementation
{$R-}

function fuCommaToPoint(StrToChange: string): string;
var
  nCount: Integer;
begin
  for nCount := 1 to Length(StrToChange) do
  begin
    if (StrToChange[nCount] = '.') then
      StrToChange[nCount] := ','
    else if (StrToChange[nCount] = ',') then
      StrToChange[nCount] := '.'
  end;
  Result := StrToChange;
end;

function fuPointToComma(StrToChange: string): string;
var
  nCount: Integer;
begin
  for nCount := 1 to Length(StrToChange) do
  begin
    if (StrToChange[nCount] = '.') then
      StrToChange[nCount] := ',';
  end;
  Result := StrToChange;
end;

procedure EnabledDataset(ADataSet: TDataSet; ABookMark: TBookmark);
begin
  if Assigned(ABookMark) and
     (ADataSet.BookmarkValid(ABookMark)) then
     begin
       ADataSet.GotoBookmark(ABookMark);
       ADataSet.FreeBookmark(ABookMark);
     end;

  while ADataSet.ControlsDisabled do
  begin
    ADataSet.EnableControls;
  end;
end;

procedure DisabledDataset(ADataSet: TDataSet; var ABookMark: TBookmark);
begin
  ABookMark := ADataSet.GetBookmark;
  if not ADataSet.ControlsDisabled then
  begin
    ADataSet.DisableControls;
  end;
end;

procedure LeArquivoINI(var ADatabase, AUserName, APassword : String);
var CaminhoNomeArq : String;
    ArqIni: TIniFile;
begin
  Try
    CaminhoNomeArq := ExtractFilePath(ParamStr(0)) + 'PEDIDOS.INI';

    if FileExists(CaminhoNomeArq) then
    begin
      ArqIni := TIniFile.Create(CaminhoNomeArq);
      try
        ADatabase := ArqIni.ReadString('BD', 'DATABASE','vendas');
        AUserName := ArqIni.ReadString('BD', 'USERNAME', 'root');
        APassword := ArqIni.ReadString('BD', 'PASSWORD', 'teste');
      finally
        ArqIni.Free;
      end;
    end
    else
    begin
      ArqIni := TIniFile.Create(CaminhoNomeArq);
      try
        ArqIni.WriteString('BD', 'DATABASE', 'vendas');
        ArqIni.WriteString('BD', 'USERNAME', 'root');
        ArqIni.WriteString('BD', 'PASSWORD', 'teste');
        ADatabase := ArqIni.ReadString('BD', 'DATABASE','vendas');
        AUserName := ArqIni.ReadString('BD', 'USERNAME', 'root');
        APassword := ArqIni.ReadString('BD', 'PASSWORD', 'teste');
      finally
        ArqIni.Free;
      end;
    end;
  Except
    on E: Exception do begin
      MessageDlg('Não foi possível ler o arquivo de parâmetros:' +#13+ CaminhoNomeArq + ' ' +#13+ E.Message, mtWarning, [mbOk], 0);
    end;
  end;
end;

end.
