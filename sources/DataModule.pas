unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, ADOInt, StrUtils, Messages, Windows;

type
  TDataModuleMain = class(TDataModule)
    ADOConnectionMain: TADOConnection;
    AQUserLogin: TADOQuery;
    AQGetPersonsByMovieId: TADOQuery;
    AQGetPersonsBySeriesId: TADOQuery;
    AQSelectMoviePersons: TADOQuery;
    AQSelectChannels: TADOQuery;
    AQSelectTypes: TADOQuery;
    AQSelectUsersByVisible: TADOQuery;
    AQGetUserByName: TADOQuery;
    AQMainSchedule: TADOQuery;
    DSMainSchedule: TDataSource;
    AQSelectTables: TADOQuery;
    DSSelectTables: TDataSource;
    DSSelectChannels: TDataSource;
    AQUpdateChannel: TADOQuery;
    AQDeleteChannel: TADOQuery;
    AQInsertChannel: TADOQuery;
    DSSelectGenres: TDataSource;
    AQSelectGenres: TADOQuery;
    DSSelectTypes: TDataSource;
    DSSelectPersons: TDataSource;
    AQSelectPersons: TADOQuery;
    AQInsertPerson: TADOQuery;
    AQUpdatePerson: TADOQuery;
    AQSelectSchedule: TADOQuery;
    DSSelectSchedule: TDataSource;
    DSSelectObjects: TDataSource;
    AQSelectBroadcasts: TADOQuery;
    AQSelectMovies: TADOQuery;
    AQSelectUsers: TADOQuery;
    DSSelectUsers: TDataSource;
    DSSelectGroups: TDataSource;
    AQSelectGroups: TADOQuery;
    AQUpdateUser: TADOQuery;
    AQDeleteUser: TADOQuery;
    AQInsertUser: TADOQuery;
    AQUpdateUserPassword: TADOQuery;
    DSSelectAcl: TDataSource;
    AQSelectAcl: TADOQuery;
    DSSelectMovies: TDataSource;
    DSSelectBroadcasts: TDataSource;
    DSSelectSeries: TDataSource;
    AQSelectSeries: TADOQuery;
    DSSelectMovieGenres: TDataSource;
    AQSelectMovieGenres: TADOQuery;
    DSSelectSeriesGenres: TDataSource;
    AQSelectSeriesGenres: TADOQuery;
    DSSelectSeriesEpisodes: TDataSource;
    AQSelectSeriesEpisodes: TADOQuery;
    AQEmptyQuery: TADOQuery;
    AQUpdateSchedule: TADOQuery;
    AQDeleteSchedule: TADOQuery;
    AQInsertSchedule: TADOQuery;
    AQSelectUserTables: TADOQuery;
    AQSelectUserRightsForTable: TADOQuery;
    AQIDDQD: TADOQuery;
    AQOptimize: TADOQuery;
    AQUpdateMovie: TADOQuery;
    AQDeleteMovie: TADOQuery;
    AQInsertMovie: TADOQuery;
    AQUpdateSeries: TADOQuery;
    AQDeleteSeries: TADOQuery;
    AQInsertSeries: TADOQuery;
    AQDeletePerson: TADOQuery;
    AQGetMovieById: TADOQuery;
    AQGetGenresByMovieId: TADOQuery;
    AQGetEpisodeById: TADOQuery;
    AQGetGenresBySeriesId: TADOQuery;
    AQGetBroadcastById: TADOQuery;
    AQSelectSeriesWithEpisodes: TADOQuery;
    DSSelectSeriesPersons: TDataSource;
    AQSelectSeriesPersons: TADOQuery;
    DSSelectRoles: TDataSource;
    AQSelectRoles: TADOQuery;
    DSSelectCountries: TDataSource;
    AQSelectCountries: TADOQuery;
    AQReportMoviePersons: TADOQuery;
    AQReportSeriesPersons: TADOQuery;
    DSSelectBroadcastPersons: TDataSource;
    AQSelectBroadcastPersons: TADOQuery;
    AQUpdateBroadcast: TADOQuery;
    AQDeleteBroadcast: TADOQuery;
    AQInsertBroadcast: TADOQuery;
    AQReportSeries: TADOQuery;
    AQReportMovies: TADOQuery;
    AQReportBroadcast: TADOQuery;
    AQReportBroadcastPersons: TADOQuery;
    AQReportMovieGenres: TADOQuery;
    AQReportSeriesGenres: TADOQuery;

    ////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    procedure CloseOpenQuery(Query: TADOquery);
    procedure RefreshQuery(Query: TADOquery);
    procedure RefreshScheduleQuery();
    procedure RefreshMainScheduleQuery();

    function PostGeneric(Query: TADOQuery; State: String): integer;
    procedure CancelGeneric(Query: TADOQuery);
    function DeleteGeneric(Query: TADOQuery): integer;

    function InsertSchedule() : integer;
    function UpdateSchedule() : integer;
    function DeleteSchedule() : integer;
    procedure FillScheduleValues(Query: TADOQuery);

    function InsertChannel() : integer;
    function UpdateChannel() : integer;
    function DeleteChannel() : integer;
    procedure FillChannelValues(Query: TADOQuery);

    function InsertMovie() : integer;
    function UpdateMovie() : integer;
    function DeleteMovie() : integer;
    procedure FillMovieValues(Query: TADOQuery);

    function InsertSeries() : integer;
    function UpdateSeries() : integer;
    function DeleteSeries() : integer;
    procedure FillSeriesValues(Query: TADOQuery);

    function InsertPerson() : integer;
    function UpdatePerson() : integer;
    function DeletePerson() : integer;
    procedure FillPersonValues(Query: TADOQuery);

    function InsertBroadcast() : integer;
    function UpdateBroadcast(): integer;
    function DeleteBroadcast(): integer;
    procedure FillBroadcastValues(Query: TADOQuery);

    function InsertUser() : integer;
    function UpdateUser() : integer;
    function DeleteUser(): integer;
    function UpdateUserPassword() : integer;
    procedure FillUserValues(Query: TADOQuery);

    procedure OptimizeTable(Table: string);
    procedure RepairTable(Table: string);
    procedure UpdateMainSchedule();
    procedure CloseMainSchedule();

    function CanUserControlTable(Table: string; User: WideString) : boolean;

    procedure DataModuleCreate(Sender: TObject);

    procedure AQSelectMoviePersonsBeforePost(DataSet: TDataSet);
    procedure AQSelectMovieGenresBeforePost(DataSet: TDataSet);
    procedure AQSelectSeriesGenresBeforePost(DataSet: TDataSet);
    procedure AQSelectSeriesPersonBeforePost(DataSet: TDataSet);
    procedure AQSelectSeriesEpisodesBeforePost(DataSet: TDataSet);
    procedure AQSelectSeriesPersonsBeforePost(DataSet: TDataSet);
    procedure AQSelectBroadcastPersonsBeforePost(DataSet: TDataSet);
    ////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMain: TDataModuleMain;
  DateFormat: TFormatSettings;
  ScheduleWhereChannelClause, ScheduleWhereTypeClause, ScheduleWhereTimeClause, ScheduleWhereDateClause: WideString;
  Null: Variant;

implementation

uses MainForm, Utils;

procedure TDataModuleMain.CloseOpenQuery(Query: TADOQuery);
begin
    Query.Close;
    Query.Open;
end;

procedure TDataModuleMain.RefreshQuery(Query: TAdoQuery);
begin
    if Query.Active then
        Query.Refresh
    else
        Query.Open;
end;

procedure TDataModuleMain.RefreshMainScheduleQuery();
begin
    //ADOQueryMainSchedule.Parameters.ParamByName('dateFrom').Value := DateToStr(GetMonday, DateFormat);
    //ADOQueryMainSchedule.Parameters.ParamByName('dateTo').Value := DateToStr(GetSunday, DateFormat);
    UpdateMainSchedule;
end;

procedure TDataModuleMain.RefreshScheduleQuery();
var
    currentIndex : integer;
    haveToSeek : boolean;
begin
    currentIndex := 0;
    haveToSeek := False;
    if AQSelectSchedule.Active then
    begin
        currentIndex := AQSelectSchedule.FieldByName('scheduleId').AsInteger;
        haveToSeek := True;
    end;
    CloseOpenQuery(AQSelectSchedule);

    if haveToSeek then
    begin
        while not AQSelectSchedule.Eof do
        begin
            if AQSelectSchedule.FieldByName('scheduleId').AsInteger <> currentIndex then
                AQSelectSchedule.Next
            else
                break;
        end;
    end;
end;

function TDataModuleMain.CanUserControlTable(Table: string; User: WideString): boolean;
begin
    Result := false;

    AQSelectUserRightsForTable.Close;
    AQSelectUserRightsForTable.Parameters.ParamByName('tableName').Value := Table;
    AQSelectUserRightsForTable.Parameters.ParamByName('userName').Value := User;
    AQSelectUserRightsForTable.Open;
    if AQSelectUserRightsForTable.RecordCount > 0 then
    begin
        AQSelectUserRightsForTable.First;
        if AQSelectUserRightsForTable.FieldByName('aclAccess').Value = 'полный доступ' then
            Result := true;
    end;
end;

procedure TDataModuleMain.OptimizeTable(Table: string);
begin
    AQEmptyQuery.Close;
    AQEmptyQuery.SQL.Clear;
    AQEmptyQuery.SQL.Text := 'OPTIMIZE TABLE `' + Table + '`';
    AQEmptyQuery.ExecSQL;
end;
procedure TDataModuleMain.RepairTable(Table: string);
begin
    AQEmptyQuery.Close;
    AQEmptyQuery.SQL.Clear;
    AQEmptyQuery.SQL.Text := 'REPAIR TABLE `' + Table + '`';
    AQEmptyQuery.ExecSQL;
end;

function TDataModuleMain.DeleteGeneric(Query: TADOQuery) : integer;
begin
    Query.Delete;
    Query.Refresh;
    Result := 1;
end;

procedure TDataModuleMain.CancelGeneric(Query: TADOQuery);
begin
    Query.Cancel;
end;

function TDataModuleMain.PostGeneric(Query: TADOQuery; State: string): integer;
begin
    Result := 0;
    if Query.State in [dsInsert, dsEdit] then
    begin
        Query.Post;
        if Query.State = dsInsert then
        begin
            Query.Close;
            Query.Open;
        end
        else
            Query.Refresh;
        Result := 1;
    end
    else if State = 'insert' then
        Query.Insert
    else if State = 'edit' then
        Query.Edit;        
end;

procedure TDataModuleMain.AQSelectMoviePersonsBeforePost(DataSet: TDataSet);
begin
    if (AQSelectMovies.Active) AND (AQSelectMovies.FieldByName('movieId').AsInteger > 0) then
        DataSet.FieldByName('movieId').Value := AQSelectMovies.FieldByName('movieId').Value;
end;

procedure TDataModuleMain.AQSelectBroadcastPersonsBeforePost(DataSet: TDataSet);
begin
    if (AQSelectBroadcasts.Active) AND (AQSelectBroadcasts.FieldByName('broadcastId').AsInteger > 0) then
        DataSet.FieldByName('broadcastId').Value := AQSelectBroadcasts.FieldByName('broadcastId').Value;
end;

procedure TDataModuleMain.AQSelectMovieGenresBeforePost(DataSet: TDataSet);
begin
    if (AQSelectMovies.Active) AND (AQSelectMovies.FieldByName('movieId').AsInteger > 0) then
        DataSet.FieldByName('movieId').Value := AQSelectMovies.FieldByName('movieId').Value;
end;

procedure TDataModuleMain.AQSelectSeriesPersonBeforePost(DataSet: TDataSet);
begin
    if (AQSelectSeries.Active) AND (AQSelectSeries.FieldByName('seriesId').AsInteger > 0) then
        DataSet.FieldByName('seriesId').Value := AQSelectSeries.FieldByName('seriesId').Value;
end;

procedure TDataModuleMain.AQSelectSeriesPersonsBeforePost(DataSet: TDataSet);
begin
    if (AQSelectSeries.Active) AND (AQSelectSeries.FieldByName('seriesId').AsInteger > 0) then
        DataSet.FieldByName('seriesId').Value := AQSelectSeries.FieldByName('seriesId').Value;
end;

procedure TDataModuleMain.AQSelectSeriesEpisodesBeforePost(DataSet: TDataSet);
begin
    if (AQSelectSeries.Active) AND (AQSelectSeries.FieldByName('seriesId').AsInteger > 0) then
        DataSet.FieldByName('seriesId').Value := AQSelectSeries.FieldByName('seriesId').Value;
end;

procedure TDataModuleMain.AQSelectSeriesGenresBeforePost(DataSet: TDataSet);
begin
    if (AQSelectSeries.Active) AND (AQSelectSeries.FieldByName('seriesId').AsInteger > 0) then
        DataSet.FieldByName('seriesId').Value := AQSelectSeries.FieldByName('seriesId').Value;
end;

procedure TDataModuleMain.DataModuleCreate(Sender: TObject);
begin
    DateFormat.ShortDateFormat := 'yyyy-MM-dd';
end;

function TDataModuleMain.InsertSchedule() : integer;
begin
    with AQInsertSchedule do
    begin
        FillScheduleValues(AQInsertSchedule);

        if FormMain.cxComboBoxObjectCategory.EditingValue = 'передача' then
        begin
            Parameters.ParamByName('broadcastId').Value := FormMain.cxLookupComboBoxObjectId.EditingValue;
            Parameters.ParamByName('episodeId').Value := Null;
            Parameters.ParamByName('movieId').Value := Null;
        end
        else if FormMain.cxComboBoxObjectCategory.EditingValue = 'сериал' then
        begin
            Parameters.ParamByName('episodeId').Value := FormMain.cxLookupComboBoxObjectId.EditingValue;
            Parameters.ParamByName('broadcastId').Value := Null;
            Parameters.ParamByName('movieId').Value := Null;
        end
        else if FormMain.cxComboBoxObjectCategory.EditingValue = 'фильм' then
        begin
            Parameters.ParamByName('movieId').Value := FormMain.cxLookupComboBoxObjectId.EditingValue;
            Parameters.ParamByName('broadcastId').Value := Null;
            Parameters.ParamByName('episodeId').Value := Null;
        end;

        ExecSQL;
    end;
    Result := 1;
end;

function TDataModuleMain.UpdateSchedule() : integer;
var
    Null : Variant;
begin
    with AQUpdateSchedule do
    begin
        FillScheduleValues(AQUpdateSchedule);

        if FormMain.cxComboBoxObjectCategory.EditingValue = 'передача' then
        begin
            Parameters.ParamByName('broadcastId').Value := FormMain.cxLookupComboBoxObjectId.EditingValue;
            Parameters.ParamByName('episodeId').Value := Null;
            Parameters.ParamByName('movieId').Value := Null;
        end
        else if FormMain.cxComboBoxObjectCategory.EditingValue = 'сериал' then
        begin
            Parameters.ParamByName('episodeId').Value := FormMain.cxLookupComboBoxObjectId.EditingValue;
            Parameters.ParamByName('broadcastId').Value := Null;
            Parameters.ParamByName('movieId').Value := Null;
        end
        else if FormMain.cxComboBoxObjectCategory.EditingValue = 'фильм' then
        begin
            Parameters.ParamByName('movieId').Value := FormMain.cxLookupComboBoxObjectId.EditingValue;
            Parameters.ParamByName('broadcastId').Value := Null;
            Parameters.ParamByName('episodeId').Value := Null;
        end;

        //Parameters.ParamByName('scheduleId').Value := AQSelectSchedule.FieldByName('scheduleId').Value;
        
        ExecSQL;
    end;

    RefreshScheduleQuery();

    Result := 1;
end;

function TDataModuleMain.DeleteSchedule() : integer;
begin
    AQDeleteSchedule.Parameters.ParamByName('scheduleId').Value := AQSelectSchedule.FieldByName('scheduleId').Value;
    AQDeleteSchedule.ExecSQL;
    CloseOpenQuery(AQSelectSchedule);
    
    Result := 1;
end;

procedure TDataModuleMain.FillScheduleValues(Query: TADOQuery);
begin
    With Query do
    begin
        Parameters.ParamByName('channelId').Value := FormMain.cxLookupComboBoxChannelId.EditingValue;
        Parameters.ParamByName('typeId').Value := FormMain.cxLookupComboBoxTypeId.EditingValue;
        Parameters.ParamByName('scheduleDate').Value := DateToStr(FormMain.cxDateEditScheduleDate.EditingValue, DateFormat);
        Parameters.ParamByName('scheduleStart').Value := TimeToStr(FormMain.cxTimeEditScheduleStart.EditingValue);
        Parameters.ParamByName('scheduleEnd').Value := TimeToStr(FormMain.cxTimeEditScheduleEnd.EditingValue);
        Parameters.ParamByName('scheduleIsNextDay').Value := FormMain.cxComboBoxScheduleIsNextDay.EditingValue;
        if Parameters.FindParam('scheduleId') <> nil then
            Parameters.FindParam('scheduleId').Value := AQSelectSchedule.FieldByName('scheduleId').Value;
    end;
end;

function TDataModuleMain.InsertChannel() : integer;
begin
    FillChannelValues(AQInsertChannel);
    AQInsertChannel.ExecSQL;
    CloseOpenQuery(AQSelectChannels);

    Result := 1;
end;

function TDataModuleMain.UpdateChannel() : integer;
begin
    FillChannelValues(AQUpdateChannel);
    AQUpdateChannel.ExecSQL;
    RefreshQuery(AQSelectChannels);

    Result := 1;
end;

function TDataModuleMain.DeleteChannel() : integer;
begin
    AQDeleteChannel.Parameters.ParamByName('channelId').Value := AQSelectChannels.FieldByName('channelId').Value;
    AQDeleteChannel.ExecSQL;
    CloseOpenQuery(AQSelectChannels);

    Result := 1;
end;

procedure TDataModuleMain.FillChannelValues(Query: TADOQuery);
begin
    With Query do
    begin
        Parameters.ParamByName('channelName').Value := FormMain.cxTextEditChannelName.EditingValue;
        Parameters.ParamByName('channelDescription').Value := FormMain.cxMemoChannelDescription.EditingValue;
        Parameters.ParamByName('channelImage').Assign(FormMain.cxImageChannelImage.Picture);
        Parameters.ParamByName('channelOrder').Value := FormMain.cxSpinEditChannelOrder.EditingValue;
        Parameters.ParamByName('channelBroadcastStart').Value := DateToStr(FormMain.cxDateEditBroadcastStart.EditingValue, DateFormat);
        Parameters.ParamByName('channelUrl').Value := FormMain.cxHyperLinkEditChannelUrl.EditingValue;
        if Parameters.FindParam('channelId') <> nil then
            Parameters.FindParam('channelId').Value := AQSelectChannels.FieldByName('channelId').Value;
    end;
end;

function TDataModuleMain.InsertMovie() : integer;
begin
    FillMovieValues(AQInsertMovie);
    AQInsertMovie.ExecSQL;
    CloseOpenQuery(AQSelectMovies);

    Result := 1;
end;

function TDataModuleMain.UpdateMovie() : integer;
begin
    FillMovieValues(AQUpdateMovie);
    AQUpdateMovie.ExecSQL;
    RefreshQuery(AQSelectMovies);

    Result := 1;
end;

function TDataModuleMain.DeleteMovie() : integer;
begin
    AQDeleteMovie.Parameters.ParamByName('movieId').Value := AQSelectMovies.FieldByName('movieId').Value;
    AQDeleteMovie.ExecSQL;
    CloseOpenQuery(AQSelectMovies);

    Result := 1;
end;

procedure TDataModuleMain.FillMovieValues(Query : TADOQuery);
begin
    With Query do
    begin
        Parameters.ParamByName('movieName').Value := FormMain.cxTextEditMovieName.EditingValue;
        Parameters.ParamByName('movieDate').Value := DateToStr(FormMain.cxDateEditMovieDate.EditingValue, DateFormat);
        Parameters.ParamByName('movieDescription').Value := FormMain.cxMemoMovieDescription.EditingValue;
        Parameters.ParamByName('movieLength').Value := FormMain.cxSpinEditMovieLength.EditingValue;
        Parameters.ParamByName('movieBudget').Value := FormMain.cxCurrencyEditMovieBudget.EditingValue;
        Parameters.ParamByName('movieReturns').Value := FormMain.cxCurrencyEditMovieReturns.EditingValue;
        Parameters.ParamByName('countryId').Value := FormMain.cxLookupComboBoxMovieCountryId.EditingValue;
        if Parameters.FindParam('movieId') <> nil then        
            Parameters.FindParam('movieId').Value := AQSelectMovies.FieldByName('movieId').Value;
    end;
end;

function TDataModuleMain.InsertSeries() : integer;
begin
    FillSeriesValues(AQInsertSeries);
    AQInsertSeries.ExecSQL;
    CloseOpenQuery(AQSelectSeries);

    Result := 1;
end;

function TDataModuleMain.UpdateSeries() : integer;
begin
    FillSeriesValues(AQUpdateSeries);
    AQUpdateSeries.ExecSQL;
    RefreshQuery(AQSelectSeries);

    Result := 1;
end;

function TDataModuleMain.DeleteSeries() : integer;
begin
    AQDeleteSeries.Parameters.ParamByName('seriesId').Value := AQSelectSeries.FieldByName('seriesId').Value;
    AQDeleteSeries.ExecSQL;
    CloseOpenQuery(AQSelectSeries);

    Result := 1;
end;

procedure TDataModuleMain.FillSeriesValues(Query : TADOQuery);
begin
    With Query do
    begin
        Parameters.ParamByName('seriesName').Value := FormMain.cxTextEditSeriesName.EditingValue;
        Parameters.ParamByName('seriesDescription').Value := FormMain.cxMemoSeriesDescription.EditingValue;
        Parameters.ParamByName('seriesStatus').Value := FormMain.cxComboBoxSeriesStatus.EditingValue;
        Parameters.ParamByName('countryId').Value := FormMain.cxLookupComboBoxSeriesCountryId.EditingValue;
        Parameters.ParamByName('seriesLength').Value := FormMain.cxSpinEditSeriesLength.EditingValue;
        if Parameters.FindParam('seriesId') <> nil then
            Parameters.FindParam('seriesId').Value := AQSelectSeries.FieldByName('seriesId').Value;
    end;
end;

function TDataModuleMain.InsertPerson() : integer;
begin
    FillPersonValues(AQInsertPerson);
    AQInsertPerson.ExecSQL;
    CloseOpenQuery(AQSelectPersons);

    Result := 1;
end;

function TDataModuleMain.UpdatePerson() : integer;
begin
    FillPersonValues(AQUpdatePerson);
    AQUpdatePerson.ExecSQL;
    RefreshQuery(AQSelectPersons);

    Result := 1;
end;

function TDataModuleMain.DeletePerson() : integer;
begin
    AQDeletePerson.Parameters.ParamByName('personId').Value := AQSelectPersons.FieldByName('personId').Value;
    AQDeletePerson.ExecSQL;
    CloseOpenQuery(AQSelectPersons);

    Result := 1;
end;

procedure TDataModuleMain.FillPersonValues(Query: TADOQuery);
begin
    With Query do
    begin
        Query.Parameters.ParamByName('personName').Value := FormMain.cxTextEditPersonName.EditingValue;
        Query.Parameters.ParamByName('personSex').Value := FormMain.cxComboBoxPersonSex.EditingValue;
        Query.Parameters.ParamByName('personHeight').Value := FormMain.cxSpinEditPersonHeight.EditingValue;
        Query.Parameters.ParamByName('personBio').Value := FormMain.cxMemoPersonBio.EditingValue;
        Query.Parameters.ParamByName('personPhoto').Assign(FormMain.cxImagePersonPhoto.Picture);

        Query.Parameters.ParamByName('personBirthdate').Value := DateToStr(FormMain.cxDateEditPersonBirthdate.EditingValue, DateFormat);
        try
            DateToStr(FormMain.cxDateEditPersonDeathdate.EditingValue, DateFormat);
            Query.Parameters.ParamByName('personDeathdate').Value := DateToStr(FormMain.cxDateEditPersonDeathdate.EditingValue, DateFormat);
        except

        end;
        if Query.Parameters.FindParam('personId') <> nil then
            Query.Parameters.ParamByName('personId').Value := AQSelectPersons.FieldByName('personId').Value;
    end;
end;

function TDataModuleMain.InsertBroadcast : integer;
begin
    FillBroadcastValues(AQInsertBroadcast);
    AQInsertBroadcast.ExecSQL;
    CloseOpenQuery(AQSelectBroadcasts);

    Result := 1;
end;

function TDataModuleMain.UpdateBroadcast : integer;
begin
    FillBroadcastValues(AQUpdateBroadcast);
    AQUpdateBroadcast.ExecSQL;
    RefreshQuery(AQSelectBroadcasts);

    Result := 1;
end;

function TDataModuleMain.DeleteBroadcast : integer;
begin
    AQDeleteBroadcast.Parameters.ParamByName('broadcastId').Value := AQSelectBroadcasts.FieldByName('broadcastId').Value;
    AQDeleteBroadcast.ExecSQL;
    CloseOpenQuery(AQSelectBroadcasts);

    Result := 1;
end;

procedure TDataModuleMain.FillBroadcastValues(Query: TADOQuery);
begin
    With QUery do
    begin
        Query.Parameters.ParamByName('broadcastName').Value := FormMain.cxTextEditBroadcastName.EditingValue;
        Query.Parameters.ParamByName('broadcastLength').Value := FormMain.cxSpinEditBroadcastLength.EditingValue;
        Query.Parameters.ParamByName('broadcastDescription').Value := FormMain.cxMemoBroadcastDescription.EditingValue;

        if Query.Parameters.FindParam('broadcastId') <> nil then
            Query.Parameters.ParamByName('broadcastId').Value := AQSelectBroadcasts.FieldByName('broadcastId').Value;
    end;
end;

function TDataModuleMain.InsertUser : integer;
begin
    FillUserValues(AQInsertUser);
    AQInsertUser.ExecSQL;
    CloseOpenQuery(AQSelectUsers);

    Result := 1;
end;

function TDataModuleMain.UpdateUser : integer;
begin
    FillUserValues(AQUpdateUser);
    AQUpdateUser.ExecSQL;
    RefreshQuery(AQSelectUsers);

    Result := 1;
end;

function TDataModuleMain.UpdateUserPassword : integer;
begin
    AQUpdateUserPassword.Parameters.ParamByName('userPassword').Value := FormMain.cxTextEditUserPassword.EditingValue;
    AQUpdateUserPassword.Parameters.ParamByName('userId').Value := AQSelectUsers.FieldByName('userId').Value;
    AQUpdateUserPassword.ExecSQL;
    RefreshQuery(AQSelectUsers);

    Result := 1;
end;

function TDataModuleMain.DeleteUser() : integer;
begin
    AQDeleteUser.Parameters.ParamByName('userId').Value := AQSelectUsers.FieldByName('userId').AsInteger;
    AQDeleteUser.ExecSQL;
    CloseOpenQuery(AQSelectUsers);

    Result := 1;
end;

procedure TDataModuleMain.FillUserValues(Query: TADOQuery);
begin
    With Query do
    begin
        Parameters.ParamByName('userName').Value := FormMain.cxTextEditUserName.EditingValue;
        Parameters.ParamByName('userEmail').Value := FormMain.cxMaskEditUserEmail.EditingValue;
        Parameters.ParamByName('userImage').Assign(FormMain.cxImageUserImage.Picture);
        Parameters.ParamByName('groupId').Value := FormMain.cxLookupComboBoxGroupId.EditingValue;
        Parameters.ParamByName('userAbout').Value := FormMain.cxMemoUserAbout.EditingValue;
        Parameters.ParamByName('userShowInList').Value := FormMain.cxComboBoxUserShowInList.EditingValue;
        if Parameters.FindParam('userPassword') <> nil then
            Parameters.ParamByName('userPassword').Value := FormMain.cxTextEditUserPassword.EditingValue;
        if Parameters.FindParam('userId') <> nil then
            Parameters.ParamByName('userId').Value := AQSelectUsers.FieldByName('userId').Value;
    end;
end;

procedure TDataModuleMain.CloseMainSchedule();
begin
    AQMainSchedule.Close;
end;

procedure TDataModuleMain.UpdateMainSchedule();
var
    WhereClause : TStringList;
    Where : string;
begin
    WhereClause := TStringList.Create;

    AQMainSchedule.Close;

    if ScheduleWhereChannelClause <> '' then
        WhereClause.Add(ScheduleWhereChannelClause);
    if ScheduleWhereTypeClause <> '' then
         WhereClause.Add(ScheduleWhereTypeClause);
    if ScheduleWhereTimeClause <> '' then
         WhereClause.Add(ScheduleWhereTimeClause);
    if ScheduleWhereDateClause <> '' then
        WhereClause.Add(ScheduleWhereDateClause);

    if (WhereClause.Count > 0)then
    begin
        WhereClause.LineBreak := ' AND ';
        Where := LeftStr(WhereClause.Text, Length(WhereClause.Text) - 5);
        AQMainSchedule.SQL.Text := 'SELECT * FROM scheduleHuman WHERE ' + Where + ' ORDER BY channelOrder ASC, channelName ASC, scheduleDate ASC, scheduleIsNextDay Desc, scheduleStart ASC, scheduleTitle ASC';
        AQMainSchedule.Open;
    end
    else
    begin
        AQMainSchedule.SQL.Text := 'SELECT * FROM scheduleHuman WHERE scheduleDate >= '''+DateToStr(GetMonday, DateFormat)+''' AND scheduleDate <= '''+DateToStr(GetSunday, DateFormat)+''' ORDER BY channelOrder ASC, channelName ASC, scheduleDate ASC, scheduleIsNextDay Desc, scheduleStart ASC, scheduleTitle ASC';
        //AQMainSchedule.Parameters.ParamByName('dateFrom').Value := DateToStr(GetMonday, DateFormat);
        //AQMainSchedule.Parameters.ParamByName('dateTo').Value := DateToStr(GetSunday, DateFormat);
        //AQMainSchedule.Open;
    end;
end;

{$R *.dfm}

end.
