unit ScheduleDetailExtremeForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw, DB, StrUtils, AppEvnts, ActiveX,
  UContainer, Utils, MSHTML, Htmlview, dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Black, cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls,
  StdCtrls, cxTextEdit, ADODb;

type
  TFormScheduleDetailExtreme = class(TForm)
    WebBrowserScheduleExtreme: TWebBrowser;
    cxTextEditInvisibleMagic: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ApplicationEventsExtremeMessage(var Msg: tagMSG;  var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
  private
    fWBContainer: TWBContainer;
  public
    { Public declarations }
  end;

var
  FormScheduleDetailExtreme: TFormScheduleDetailExtreme;
  HtmlHeader, HtmlBody, HtmlFooter : TSTringList;
  ObjectId : Integer;
  ScheduleType : String;

threadvar
  FOleInPlaceActiveObject: IOleInPlaceActiveObject;  

implementation

uses
    MainForm, DataModule;

{$R *.dfm}

function GetObjectId() : Integer;
begin
    ObjectId := DMMain.AQMainSchedule.FieldByName('objectId').Value;
    Result := ObjectId;
end;

function GetScheduleTitle() : string;
begin
    Result := DMMain.AQMainSchedule.FieldByName('scheduleTitle').Value;
end;

function GetChannelName() : string;
begin
    Result := DMMain.AQMainSchedule.FieldByName('channelName').Value;
end;

function GetScheduleType() : string;
begin
    Result := DMMain.AQMainSchedule.FieldByName('scheduleType').Value;
end;

function GetScheduleDate() : string;
begin
    Result := DMMain.AQMainSchedule.FieldByName('scheduleDate').AsString;
end;

function GetScheduleTimeStart() : TDateTime;
begin
    Result := DMMain.AQMainSchedule.FieldByName('scheduleStart').Value;
end;

function GetScheduleTimeEnd() : TDateTime;
begin
    Result := DMMain.AQMainSchedule.FieldByName('scheduleEnd').Value;
end;

procedure FillMovieInfo();
var
    Para : TStringList;
    Query : TADOQuery;
begin
    Para := TStringList.Create;
    Query := DMMain.AQGetMovieById;

    Query.Close;
    Query.Parameters.ParamByName('movieId').Value := ObjectId;
    Query.Open;
    Query.First;

    Para.Text := Query.FieldByName('movieDescription').AsWideString;
    Para.LineBreak := '</p><p>';

    HtmlBody.Add('<p>' + LeftStr(Para.Text, Length(Para.Text) - 3));

    DMMain.AQReportMovieGenres.Close;
    DMMain.AQReportMovieGenres.Parameters.ParamByName('movieId').Value := ObjectId;
    DMMain.AQReportMovieGenres.Open;

    DMMain.AQReportMoviePersons.Close;
    DMMain.AQReportMoviePersons.Parameters.ParamByName('movieId').Value := ObjectId;
    DMMain.AQReportMoviePersons.Open;

    HtmlBody.Add('<div class="extra">');
    Para.Text := DMMain.AQReportMoviePersons.FieldByName('roleName').AsWideString;
    HtmlBody.add('<p><strong>Персоны</strong>:<br />' + LeftStr(para.Text, Length(para.Text) - 3));
    HtmlBody.add(
                '<p><strong>Дополнительно</strong>:<br />Премьера: '+ HumanDate(Query.FieldByName('movieDate').AsString, True) +
                '<br />Страна: '+Query.FieldByName('countryName').AsWideString +
                '<br /> Жанр: '+DMMain.AQReportMovieGenres.FieldByName('genreName').AsWideString +
                '<br /> Продолжительность: ' + Query.FieldByName('movieLength').AsString + ' минут' +
                '<br /> Бюджет: $' +Query.FieldByName('movieBudget').AsString +
                '<br /> Сборы: $' +Query.FieldByName('movieReturns').AsString + 
                '</p>');
    HtmlBody.Add('</div>');

    Para.free;
end;

procedure FillSeriesInfo();
var
    Para : TStringList;
    Query: TADOQuery;
begin
    Para := TStringList.Create;
    Query := DMMain.AQGetEpisodeById;

    Query.Close;
    Query.Parameters.ParamByName('episodeId').Value := ObjectId;
    Query.Open;
    Query.First;

    Para.Text := Query.FieldByName('episodeDescription').AsWideString;
    Para.LineBreak := '</p><p>';

    HtmlBody.Add('<p>' + LeftStr(Para.Text, Length(Para.Text) - 3));

    Para.Text := Query.FieldByName('seriesDescription').AsWideString;

    HtmlBody.Add('<p><a href="javascript:toggle(''seriesinfo'')" class="js">Информация о сериале</a></p>');
    HtmlBody.Add('<div class="extra" id="seriesinfo" style="display: none;">');
    HtmlBody.Add('<p><strong>Описание сериала</strong>:</p>');
    HtmlBody.Add('<p>' + LeftStr(Para.Text, Length(Para.Text) - 3) +'</p>');

    DMMain.AQReportSeriesGenres.Close;
    DMMain.AQReportSeriesGenres.Parameters.ParamByName('seriesId').Value := Query.FieldByName('seriesId').AsInteger;;
    DMMain.AQReportSeriesGenres.Open;

    DMMain.AQReportSeriesPersons.Close;
    DMMain.AQReportSeriesPersons.Parameters.ParamByName('seriesId').Value := Query.FieldByName('seriesId').AsInteger;;
    DMMain.AQReportSeriesPersons.Open;


    Para.Text := DMMain.AQReportSeriesPersons.FieldByName('roleName').AsWideString;
    HtmlBody.add('<p><strong>Персоны</strong>:<br />' + LeftStr(para.Text, Length(para.Text) - 3));
    HtmlBody.add(
                '<p><strong>Дополнительно</strong>: '+
                '<br />Страна: '+Query.FieldByName('countryName').AsWideString +
                '<br /> Жанр: '+DMMain.AQReportSeriesGenres.FieldByName('genreName').AsWideString +
                '<br /> Продолжительность: ' + Query.FieldByName('seriesLength').AsString + ' минут' +
                '</p>');

    HtmlBody.Add('</div>');

    Para.free;
end;

procedure FillBroadcastInfo();
var
    Para : TStringList;
    Query: TADOQuery;
begin
    Para := TStringList.Create;
    Query:= DMMain.AQGetBroadcastById;

    Query.Close;
    Query.Parameters.ParamByName('broadcastId').Value := ObjectId;
    Query.Open;
    Query.First;

    Para.Text := Query.FieldByName('broadcastDescription').AsWideString;
    Para.LineBreak := '</p><p>';

    HtmlBody.Add('<p>' + LeftStr(Para.Text, Length(Para.Text) - 3));

    DMMain.AQReportBroadcastPersons.Close;
    DMMain.AQReportBroadcastPersons.Parameters.ParamByName('broadcastId').Value := Query.FieldByName('broadcastId').AsInteger;;
    DMMain.AQReportBroadcastPersons.Open;


    Para.Text := DMMain.AQReportBroadcastPersons.FieldByName('roleName').AsWideString;

    HtmlBody.Add('<div class="extra">');
    HtmlBody.Add('<p><strong>Персоны</strong>:<br />' + LeftStr(para.Text, Length(para.Text) - 3));
    HtmlBody.Add('<p><strong>Дополнительно</strong>:'+
    '<br />Продолжительность: ' + Query.FieldByName('broadcastLength').AsString+ ' минут</p>');
    HtmlBody.Add('</div>');

    Para.free;
end;

procedure FillTemplate();
begin
    HtmlHeader := TStringList.Create;
    HtmlBody := TStringList.Create;
    HtmlFooter := TStringList.Create;

    HtmlHeader.Add('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">');
    HtmlHeader.Add('<html>');
    HtmlHeader.Add('<head>');
    HtmlHeader.Add('<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">');
    HtmlHeader.Add('<title>TVDatabase</title>');
    HtmlHeader.Add('<script type="text/javascript">');
    HtmlHeader.Add('<!--');
    HtmlHeader.Add('function keyPressHandler()');
    HtmlHeader.Add('{');
    HtmlHeader.Add('');
    HtmlHeader.Add('}');

    HtmlHeader.Add('function toggle(obj) { var el = document.getElementById(obj);');
    HtmlHeader.Add('el.style.display = (el.style.display != "none" ? "none" : "" ); }');
    HtmlHeader.Add('-->');
    HtmlHeader.Add('</script>');
    HtmlHeader.Add('<style type="text/css">');

    HtmlHeader.Add('html,body { background: #fff; font-family: Tahoma, Arial, Helvetica, sans-serif; color: #222;}');
    HtmlHeader.Add('body { margin: 30px;}');
    HtmlHeader.Add('h1, h2 { font-weight: normal; font-family: Arial; }');
    HtmlHeader.Add('p {font-size: 12px;}');
    HtmlHeader.Add('a { color: #0066cc; }');
    HtmlHeader.Add('.quiet { color: #666; }');
    HtmlHeader.Add('#date {border-bottom: 1px solid silver; margin-bottom: 5px;padding-bottom: 5px;font-size: smaller;}');
    HtmlHeader.Add('#print {margin-top: 10px; border-top: 1px solid silver; font-size: smaller; text-align: right;padding-top: 5px;}');
    HtmlHeader.Add('#copyright {margin-top: 5px; font-size: 10px; text-align: right; padding-top: 5px;}');
    HtmlHeader.Add('.js {  border-bottom: 1px dashed;    text-decoration: none;}');
    HtmlHeader.Add('.extra p {margin: 0; padding: 0; color: #666}');
    HtmlHeader.Add('.extra {padding-left: 15px; border-left: 10px solid silver;}');
    HtmlHeader.Add('#seriesExtra {margin-top: 5px;}');

    HtmlHeader.Add('</style>');
    HtmlHeader.Add('</head>');
    HtmlHeader.Add('<body onkeypress="keyPressHandler()">');

    HtmlFooter.Add('<div id="print"><a href="javascript:window.print();" class="js">Распечатать</a></div>');
    HtmlFooter.Add('<div id="copyright">&copy; 2009 Роман <span class="quiet">sbmaxx</span> Рождественский</div>');
    HtmlFooter.Add('</body>');
    HtmlFooter.Add('</html>');
end;

procedure TFormScheduleDetailExtreme.FormActivate(Sender: TObject);
begin
    cxTextEditInvisibleMagic.SetFocus;
end;

procedure TFormScheduleDetailExtreme.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_ESCAPE then
        Close;
end;

procedure TFormScheduleDetailExtreme.FormShow(Sender: TObject);
begin
    fWBContainer := TWBContainer.Create(WebBrowserScheduleExtreme);
    fWBContainer.UseCustomCtxMenu := True;
    fWBContainer.Show3DBorder := False;
    fWBContainer.ShowScrollBars := True;
    fWBContainer.AllowTextSelection := True;

    FillTemplate;

    GetObjectId;

    HtmlBody.AddStrings(HtmlHeader);

    HtmlBody.Add('<div id="header">');
    HtmlBody.Add('</div>');
    HtmlBody.Add('<h1>'+GetScheduleTitle+'</h1>');
    HtmlBody.Add('<div id="date" class="quite">'+ GetChannelName + ', ' + HumanDate(GetScheduleDate, False)+', '+ FormatDateTime('hh:nn', GetScheduleTimeStart)+'&nbsp;&mdash; '+FormatDateTime('hh:nn', GetScheduleTimeEnd)+'</div>');
    HtmlBody.Add('<div id="info">');

    ScheduleType := GetScheduleType();

    if ScheduleType = 'фильм' then
        FillMovieInfo()
    else if ScheduleType = 'сериал' then
        FillSeriesInfo()
    else if ScheduleType = 'передача' then
        FillBroadcastInfo();

    HtmlBody.Add('</div>');
    
    HtmlBody.AddStrings(HtmlFooter);


    //fWBContainer.HostedBrowser.Navigate(ExtractFilePath(ParamStr(0)) + 'data/test.html');
    ShowHtml(fWBContainer.HostedBrowser, HtmlBody);

   //repeat
   //  Application.ProcessMessages;
   //until WebBrowserMain.ReadyState >= READYSTATE_COMPLETE;
   //if WebBrowserScheduleExtreme.Document <> nil then (WebbrowserScheduleExtreme.Document as IHTMLDocument2).ParentWindow.Focus;
end;

procedure TFormScheduleDetailExtreme.ApplicationEventsExtremeMessage(var Msg: tagMSG;  var Handled: Boolean);
var
  iOIPAO: IOleInPlaceActiveObject;
  Dispatch: IDispatch;
begin
    ShowMessage('here');
  if not Assigned(WebBrowserScheduleExtreme) then begin
    Handled:= False;
    Exit;
  end;
  Handled:= IsDialogMessage(WebBrowserScheduleExtreme.Handle, Msg) = True;
  if (Handled) {and (not WebBrowser.Busy)} then begin
    //{and (not WebBrowser.Busy)} - если "разкомментировать", то код будет
    //                              работать только после полной загрузки
    //                              страницы
    if not Assigned(FOleInPlaceActiveObject) then begin
      Dispatch := WebBrowserScheduleExtreme.Application;
      if Assigned(Dispatch) then begin
        Dispatch.QueryInterface(IOleInPlaceActiveObject, iOIPAO);
        if Assigned(iOIPAO) then FOleInPlaceActiveObject:= iOIPAO;
      end;
    end;
    if Assigned(FOleInPlaceActiveObject) then
      if Msg.wParam = VK_RETURN then
        FOleInPlaceActiveObject.TranslateAccelerator(Msg);
  end;
end;
initialization
 OleInitialize(nil);
finalization
 OleUninitialize;
 FOleInPlaceActiveObject:= nil;

end.
