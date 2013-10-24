unit Report;

//жуткий копипаст inside

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   cxControls, cxContainer, cxEdit, 
  ExtCtrls, ComObj, ExcelXP, StrUtils, ProgressBarForm, DataModule, MainForm, cxGroupBox, cxCheckGroup, cxLookAndFeelPainters, ADODb, utils, ReportSeriesForm, ShellAPI;

type
    TReport  = class
        public
            class procedure GenerateScheduleReport;
            class procedure GenerateSeriesReport;
            class procedure GenerateMoviesReport;
            class procedure GenerateBroadcastReport;
            class function GetHtmlHeader(Title: String) : TStringList;
            class function GetHtmlFooter : TStringList;
    end;

implementation

class function TReport.GetHtmlHeader(Title: String) : TStringList;
var
    header: TStringList;
begin
    header := TStringList.Create;
    header.Add('<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
    header.Add('<html>');
    header.Add('<head>');
    header.Add('<title>Отчет "'+title+'"</title>');
    header.Add('<meta http-equiv="content-type" content="text/html" charset="windows-1251">');
    header.Add('<link rel="stylesheet" href="../templates/default.css" type="text/css">');
    header.Add('</head>');
    header.Add('<body>');
    header.Add('<div id="header">');
    header.Add('<h1>TVDatabase</h1>');
    header.Add('</div>');
    header.Add('<div id="container">');
    header.Add('<div id="gridheader">');
    header.Add('<h2>'+title+'</h2>');
    header.Add('</div>');

    Result := header;
end;

class function TReport.GetHtmlFooter : TStringList;
var
    footer: TStringList;
begin
    footer := TStringList.Create;
    footer.add('</div><div id="footer">TVDatabase, версия 2.0.1 &#169; 2009 <a href="mailto:sbmaxx@gmail.com">Роман Рождественский</a></div></body>');
    footer.add('</html>');

    Result := footer;
end;

class procedure TReport.GenerateBroadcastReport;
var
  i : integer;
  html, para : TStringList;
  onePercent : double;
  Query : TADOQuery;
begin
    try
        try
            html := TStringList.Create;
            html.AddStrings(GetHtmlHeader('Передачи'));

            para := TStringList.Create;
            Query := DMMain.AQReportBroadcast;
            DMMain.CloseOpenQuery(Query);

            onePercent := Query.RecordCount / 100;

            i := 0;
            Query.First;
            while not Query.eof do
            begin
                html.add('<h1>' + Query.FieldByName('broadcastName').AsWideString + '</h1>');
                html.add('<div class="textDescription">');
                para.Text := Query.FieldByName('broadcastDescription').AsWideString;
                para.LineBreak := '</p><p>';
                html.add('<p>' + LeftStr(para.Text, Length(para.Text) - 3));
                html.add('</div>');
                html.add('<div class="extra">');
                para.Text := Query.FieldByName('personName').AsWideString;
                html.add('<p><strong>Персоны</strong>:<br />' + LeftStr(para.Text, Length(para.Text) - 3));
                html.add(
                '<p><strong>Дополнительно</strong>:'+
                '<br/>Продолжительность: ' + Query.FieldByName('broadcastLength').AsString + ' минут' +
                '</p>');

                html.add('</div>');
                i := i + 1;
                FormProgressBar.cxProgressBarReport.EditValue := i / onePercent;
                FormProgressBar.Update;

                Query.Next;
            end;

            FormProgressBar.cxProgressBarReport.EditValue := 100;

            html.AddStrings(GetHtmlFooter);

            html.SaveToFile('export\ReportBroadcast.html');

            FormProgressBar.TimerProgressBar.Enabled := true;

            ShellExecute(0,'open',pChar('export\ReportBroadcast.html'),NIL,NIL,SW_SHOWNORMAL);
        except
            on E: Exception do
            begin
              MessageDlg('Не удается сформировать отчет: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
            end;
        end;
    finally
        FormProgressBar.cxProgressBarReport.EditValue := 0;
    end;
end;

class procedure TReport.GenerateMoviesReport;
var
  i : integer;
  html, para : TStringList;
  onePercent : double;
  Query : TADOQuery;
begin
    try
        try
            html := TStringList.Create;
            html.AddStrings(GetHtmlHeader('Фильмы'));

            para := TStringList.Create;
            Query := DMMain.AQReportMovies;
            DMMain.CloseOpenQuery(Query);

            onePercent := Query.RecordCount / 100;

            i := 0;
            Query.First;
            while not Query.eof do
            begin
                html.add('<h1>' + Query.FieldByName('movieName').AsWideString + '</h1>');
                html.add('<div class="textDescription">');
                para.Text := Query.FieldByName('movieDescription').AsWideString;
                para.LineBreak := '</p><p>';
                html.add('<p>' + LeftStr(para.Text, Length(para.Text) - 3));
                html.add('</div>');
                html.add('<div class="extra">');
                para.Text := Query.FieldByName('personName').AsWideString;
                html.add('<p><strong>Персоны</strong>:<br />' + LeftStr(para.Text, Length(para.Text) - 3));
                html.add(
                '<p><strong>Дополнительно</strong>:<br />Премьера: '+ HumanDate(Query.FieldByName('movieDate').AsString, True) +
                '<br />Страна: '+Query.FieldByName('countryName').AsWideString +
                '<br /> Жанры: '+Query.FieldByName('genreName').AsWideString +
                '<br /> Продолжительность: ' + Query.FieldByName('movieLength').AsString + ' минут' +
                '<br /> Бюджет: $' +Query.FieldByName('movieBudget').AsString +
                '<br /> Сборы: $' +Query.FieldByName('movieReturns').AsString +
                '<br /> Прибыль: $'+Query.FieldByName('movieProfit').AsString +
                '</p>');

                html.add('</div>');
                i := i + 1;
                FormProgressBar.cxProgressBarReport.EditValue := i / onePercent;
                FormProgressBar.Update;

                Query.Next;
            end;

            FormProgressBar.cxProgressBarReport.EditValue := 100;

            html.AddStrings(GetHtmlFooter);

            html.SaveToFile('export\ReportMovies.html');

            FormProgressBar.TimerProgressBar.Enabled := true;

            ShellExecute(0,'open',pChar('export\ReportMovies.html'),NIL,NIL,SW_SHOWNORMAL);
        except
            on E: Exception do
            begin
              MessageDlg('Не удается сформировать отчет: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
            end;
        end;
    finally
        FormProgressBar.cxProgressBarReport.EditValue := 0;
    end;
end;

class procedure TReport.GenerateSeriesReport;
var
  i : integer;
  html, para : TStringList;
  currentSeries, currentSeason : string;
  onePercent : double;
  Query : TADOQuery;
begin
    try
        try
            html := TStringList.Create;
            html.AddStrings(GetHtmlHeader('Сериалы'));

            para := TStringList.Create;
            Query := DMMain.AQReportSeries;
            DMMain.CloseOpenQuery(Query);

            onePercent := Query.RecordCount / 100;

            i := 0;
            Query.First;
            while not Query.eof do
            begin
                if currentSeries <> Query.FieldByName('seriesName').Value then
                begin
                    currentSeason := '';
                    currentSeries := Query.FieldByName('seriesName').Value;
                    
                    html.add('<h1>' + currentSeries + '</h1>');
                    html.add('<div class="textDescription">');
                    para.Text := Query.FieldByName('seriesDescription').AsWideString;
                    para.LineBreak := '</p><p>';
                    html.add('<p>' + LeftStr(para.Text, Length(para.Text) - 3));
                    html.add('</div>');
                    html.add('<div class="extra">');
                    para.Text := Query.FieldByName('personName').AsWideString;
                    html.add('<p><strong>Персоны</strong>:<br />' + LeftStr(para.Text, Length(para.Text) - 3));
                    html.add(
                    '<p><strong>Дополнительно</strong>:<br />Страна: '+Query.FieldByName('countryName').AsWideString +
                    '<br /> Жанры: '+Query.FieldByName('genreName').AsWideString +
                    '<br /> Количество серий: ' + Query.FieldByName('seriesEpisodeCount').AsString+
                    '<br /> Продолжительность серии: ' + Query.FieldByName('seriesLength').AsString + ' минут' +
                    '<br /> Всего занято эфирного времени: ' + Query.FieldByName('seriesInScheduleLength').AsString + ' минут' +
                    '</p>');

                    html.add('</div>');

                    if Query.FieldByName('episodeName').Value <> '' then
                    begin
                        while (currentSeries = Query.FieldByName('seriesName').AsWideString) AND (NOT Query.Eof) do
                        begin
                            if currentSeason <> Query.FieldByName('episodeSeason').AsString then
                            begin
                                if currentSeason <> '' then
                                begin
                                    html.add('</dl>');
                                    html.Add('</div>');
                                end;

                                currentSeason := Query.FieldByName('episodeSeason').AsString;
                                html.add('<h2>Сезон №'+currentSeason+'</h2>');
                                html.add('<p>Занято эфирного времени: '+Query.FieldByName('seriesSeasonInScheduleLength').AsString+'</p>');
                                html.add('<div class="seriesList">');
                                html.add('<dl>');
                            end;


                            html.add('<dt>'+Query.FieldByName('episodeName').AsWideString+'</dt>');
                            html.add('<dd>'+Query.FieldByName('episodeDescription').AsWideString+'+');

                            if Query.FieldByName('maxCount').AsString <> '' then
                            begin
                                if Query.FieldByName('maxCount').AsString <> Query.FieldByName('minCount').AsString then
                                    html.add('<p><strong>Статистика</strong>: '+Query.FieldByName('maxCount').AsString+' раз(а) показали по '+Query.FieldByName('maxChannelName').asString + ', и всего '+Query.FieldByName('minCount').AsString+' раз(а) -- по '+Query.FieldByName('minChannelName').asString+'</p>')
                                else
                                    html.add('<p><strong>Статистика</strong>: '+Query.FieldByName('maxCount').AsString+' раз(а) показали по '+Query.FieldByName('maxChannelName').asString + '</p>');
                            end;

                            html.add('</dd>');
                            i := i + 1;
                            FormProgressBar.cxProgressBarReport.EditValue := i / onePercent;
                            FormProgressBar.Update;

                            Query.Next;
                        end;
                        html.add('</dl>');
                        html.add('</div>');
                    end
                    else
                    begin
                        i := i + 1;
                        FormProgressBar.cxProgressBarReport.EditValue := i / onePercent;
                        FormProgressBar.Update;

                        Query.Next;
                    end;
                end
                else
                    Query.Next;
            end;

            FormProgressBar.cxProgressBarReport.EditValue := 100;

            html.AddStrings(GetHtmlFooter);

            html.SaveToFile('export\ReportSeries.html');

            FormProgressBar.TimerProgressBar.Enabled := true;

            ShellExecute(0,'open',pChar('export\ReportSeries.html'),NIL,NIL,SW_SHOWNORMAL);
        except
            on E: Exception do
            begin
              MessageDlg('Не удается сформировать отчет: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
            end;
        end;
    finally
        FormProgressBar.cxProgressBarReport.EditValue := 0;
    end;
end;

class procedure TReport.GenerateScheduleReport;
var
  row, i : integer;
  para : TStringList;
  Excel : OleVariant;
  List, Cols, Rows : Variant;
  currentChannel, currentDate : string;
  onepercent : double;
  Query : TADOQuery;
begin
    try
        try
            Query := DMMain.AQMainSchedule;
            para := TStringList.Create;
            Excel := CreateOleObject('Excel.Application');

            Excel.Workbooks.Open(FileName := ExtractFilePath(Application.ExeName) + 'templates/template-schedule.xlt', UpdateLinks := false, ReadOnly := true);
            List := Excel.workbooks[1].worksheets[1];
            Cols := List.columns;
            Rows := List.rows;

            //row, col
            List.Cells[3, 2] := 'С: ' + DateToStr(FormMain.cxDateEditDateFrom.Date) + ' по ' + DateToStr(FormMain.cxDateEditDateTo.Date);

            for i := 0 to FormMain.cxCheckGroupChannels.Properties.Items.Count - 1 do
            begin
                if (FormMain.cxCheckGroupChannels.States[i] = cbsChecked) AND (FormMain.cxCheckGroupChannels.Properties.Items.Items[i].Caption <> 'Все') then
                    para.Add(FormMain.cxCheckGroupChannels.Properties.Items.Items[i].Caption);
            end;
            para.LineBreak := ', ';
            List.Cells[4, 2] := LeftStr(para.Text, Length(para.Text) -2);

            para.Clear;
            for i := 0 to FormMain.cxCheckGroupTypes.Properties.Items.Count - 1 do
            begin
                if (FormMain.cxCheckGroupTypes.States[i] = cbsChecked) AND (FormMain.cxCheckGroupTypes.Properties.Items.Items[i].Caption <> 'Все') then
                    para.Add(FormMain.cxCheckGroupTypes.Properties.Items.Items[i].Caption);
            end;
            para.LineBreak := ', ';
            List.Cells[5, 2] := LeftStr(para.Text, Length(para.Text) - 2);

            para.Clear;
            for i := 0 to FormMain.cxCheckGroupTimes.Properties.Items.Count - 1 do
            begin
                if (FormMain.cxCheckGroupTimes.States[i] = cbsChecked) AND (FormMain.cxCheckGroupTimes.Properties.Items.Items[i].Caption <> 'Все') then
                    para.Add(FormMain.cxCheckGroupTimes.Properties.Items.Items[i].Caption);
            end;
            para.LineBreak := ', ';
            List.Cells[6, 2] := LeftStr(para.Text, Length(para.Text) - 2);

            row := 8;
            i := 0;

            onepercent := Query.RecordCount / 100;

            Query.First;
            
            while not Query.eof do
            begin
                FormProgressBar.cxProgressBarReport.EditValue := i / onepercent;
                FormProgressBar.Update;

                if currentChannel <> Query.FieldByName('channelOrderName').AsString then
                begin
                    currentChannel := Query.FieldByName('channelOrderName').AsString;
                    currentDate := '';
                    List.Cells[row, 1] := Query.FieldByName('channelOrderName').Value;
                    List.Cells[row, 1].Font.Size := 16;
                    List.Cells[row, 1].Font.Name := 'Georgia';
                    List.Range['A' + IntToStr(row) + ':E' + IntToStr(row)].Interior.Color := RGB(235, 235, 235);
                    row := row + 1;
                end;

                if currentDate <> Query.FieldByName('scheduleDate').AsString then
                begin
                    if currentDate <> '' then
                    begin
                        List.Range['A' + IntToStr(row) + ':E' + IntToStr(row)].Interior.Color := RGB(255, 255, 255);
                        row := row + 1;
                    end;
                    
                    currentDate := Query.FieldByName('scheduleDate').AsString;
                    List.Cells[row, 3] := HumanDate(Query.FieldByName('scheduleDate').Value, false);
                    List.Cells[row, 3].Font.Size := 12;
                    List.Cells[row, 3].HorizontalAlignment := -4131;
                    List.Cells[row, 3].Font.Name := 'Verdana';
                    List.Cells[row, 3].Font.Color := -11711155;
                    List.Range['A' + IntToStr(row) + ':E' + IntToStr(row)].Interior.Color := RGB(255, 255, 255);
                    row := row + 1;
                end;


                List.Cells[row, 3] := FormatDateTime('hh:nn', Query.FieldByName('scheduleStart').AsDateTime) +' - '+ FormatDateTime('hh:nn', Query.FieldByName('scheduleEnd').AsDateTime);
                List.Cells[row, 4] := Query.FieldByName('scheduleTitle').Value;
                List.Cells[row, 5] := Query.FieldByName('scheduleType').Value;
                List.Range['A' + IntToStr(row) + ':E' + IntToStr(row)].Interior.Color := RGB(255, 255, 255);
                List.Range['A' + IntToStr(row) + ':E' + IntToStr(row)].Font.Size := 10;
                    List.Range['A' + IntToStr(row) + ':E' + IntToStr(row)].Font.Name := 'Verdana';

                if i mod 2 = 0 then
                begin
                    List.Range['C' + IntToStr(row) + ':E' + IntToStr(row)].Interior.Color := RGB(245, 245, 245);
                end;

                Query.Next;
                row := row + 1;
                i := i + 1;
                Sleep(100);
            end;

            FormProgressBar.cxProgressBarReport.EditValue := 100;

            FormProgressBar.TimerProgressBar.Enabled := true;

            Excel.ActiveWorkbook.SaveAs(ExtractFilePath(ParamStr(0))+'export\schedule_'+DateToStr(FormMain.cxDateEditDateFrom.Date)+'-'+DateToStr(FormMain.cxDateEditDateTo.Date)+'.xls', 56);
            Excel.Workbooks.Open(FileName := ExtractFilePath(Application.ExeName) + 'export\schedule_'+DateToStr(FormMain.cxDateEditDateFrom.Date)+'-'+DateToStr(FormMain.cxDateEditDateTo.Date)+'.xls');
            Excel.Visible := true;
        except
            on E: Exception do
            begin
              MessageDlg('Не удается сформировать отчет: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
              Excel.Quit;
            end;
        end;
    finally
        Excel := Unassigned;
        FormProgressBar.cxProgressBarReport.EditValue := 0;
    end;
end;


end.
