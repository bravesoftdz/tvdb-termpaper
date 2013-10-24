unit Utils;

interface
uses Types, ActiveX, OleCtrls, SHDocVw, SysUtils, Variants, Classes, Forms, Graphics, Controls, StdCtrls, Windows;

function ShowHtml(mWebBrowser: TWebBrowser; mStrings: TStrings): Boolean;
function ColorToHTML(const Color: TColor): string;
function ToString(Value: Variant): String;
function HumanDate(S: string; IncludeYear: Boolean): string;
function GetMonday() : TDate;
function GetSunday() : TDate;
function MakeDirectory(Dir : string) : boolean;

implementation

function MakeDirectory(Dir : string) : boolean;
begin
    Result := true;
    if Not DirectoryExists(dir) then
        Result := CreateDir(Dir);
end;

function GetMonday() : TDate;
var
    Today : TDate;
    DateOfWeek, DateOffset: Integer;
begin
    Today := Now;
    DateOfWeek := DayOfWeek(Today);

    if DateOfWeek = 1 then
        DateOffset := 6
    else
        DateOffset := DateOfWeek - 2;

    Result := Today - DateOffset;
end;

function GetSunday() : Tdate;
var
    Today : TDate;
    DateOfWeek, DateOffset: Integer;
begin
    Today := Now;
    DateOfWeek := DayOfWeek(Today);

    if DateOfWeek = 1 then
        DateOffset := 0
    else
        DateOffset := DateOfWeek - 8;

    Result := Today - DateOffset;
end;

function ToString(Value: Variant): String;
begin
case TVarData(Value).VType of
   varSmallInt,
   varInteger   : Result := IntToStr(Value);
   varSingle,
   varDouble,
   varCurrency  : Result := FloatToStr(Value);
   varDate      : Result := FormatDateTime('yyyy-mm-dd hh:nn:ss', Value);
   varBoolean   : if Value then Result := 'True' else Result := 'False';
   varString    : Result := Value;
   else            Result := '';
end;
end;


function ShowHtml(mWebBrowser: TWebBrowser; mStrings: TStrings): Boolean;
var
  vMemoryStream: TMemoryStream;
begin
  Result := False;
  if not (Assigned(mStrings) and Assigned(mWebBrowser)) then
    Exit;
  mWebBrowser.Navigate('about:blank');
  //mWebBrowser.Navigate(ExtractFilePath(ParamStr(0)) + 'data/blank.html');
  if not Assigned(mWebBrowser.Document) then
    Exit;
  vMemoryStream := TMemoryStream.Create;
  try
    mStrings.SaveToStream(vMemoryStream);
    try
      vMemoryStream.Position := 0;
      Application.ProcessMessages; // :)
      (mWebBrowser.Document as IPersistStreamInit).Load(
        TStreamAdapter.Create(vMemoryStream));
    except
      Exit;
    end;
  finally
    vMemoryStream.Free;
  end;
  Result := True;
end;


function ColorToHTML(const Color: TColor): string;
var
  ColorRGB: Integer;
begin
  ColorRGB := ColorToRGB(Color);
  Result := Format(
    '#%0.2X%0.2X%0.2X',
    [GetRValue(ColorRGB), GetGValue(ColorRGB), GetBValue(ColorRGB)]
  );
end;

function HumanDate(S: string; IncludeYear : boolean): string;
const
    Months: array[1..12] of string = ('€нвар€', 'феврал€', 'марта', 'апрел€',
            'ма€', 'июн€', 'июл€', 'августа', 'сент€бр€', 'окт€бр€', 'но€бр€',
            'декабр€');
var
    Year, Month, Day: Word;
begin
try
    StrToDate(S);
    DecodeDate(StrToDate(S), Year, Month, Day);
    Result := IntToStr(day);
    Result := Result + ' ' + Months[Month];
    if IncludeYear then
        Result := Result + ' ' + IntToStr(Year) + ' года';
except
end;
end;


end.
