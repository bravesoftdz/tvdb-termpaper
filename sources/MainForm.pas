unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  dxSkinsCore, dxSkinBlack, dxSkinOffice2007Black, dxSkinsDefaultPainters,
  dxSkinsdxBarPainter, dxBar,
  cxLookAndFeels, dxSkinsForm, dxRibbonForm, dxSkinsdxRibbonPainter, cxClasses,
  dxRibbon, cxControls, cxStyles, dxSkinscxPCPainter, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ImgList, dxBarExtItems, cxCheckBox, cxBarEditItem, dxStatusBar,
  dxRibbonStatusBar, Menus, dxSkinsdxNavBar2Painter, dxNavBarCollns,
  dxNavBarBase, dxNavBar, ExtCtrls, dxsbar, dxDockPanel, dxDockControl,
  cxLookAndFeelPainters, cxContainer, cxGroupBox, cxCheckGroup, cxDBCheckGroup,
  ComCtrls, cxListView, cxSplitter, cxImage, cxDBEdit, cxTextEdit, cxLabel,
  StdCtrls, cxRadioGroup, cxButtons, dxBarExtDBItems, cxLocalization, cxPC,
  cxMemo, dxRibbonGallery, cxMaskEdit, cxDropDownEdit, cxBlobEdit, cxButtonEdit,
  ExtDlgs, cxCalendar, cxTimeEdit, cxCalc, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSpinEdit, ADODB, ADOInt, Buttons, StrUtils, OleCtrls,
  SHDocVw, ActiveX, Utils, ExcelXp, ComObj, cxHyperLinkEdit, cxCurrencyEdit, cxExport, cxGridExportLink,
  cxImageComboBox, cxHeader, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd,
  dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSCore, dxPScxCommon, dxPScxGrid6Lnk;

type
  TFormMain = class(TdxRibbonForm)
  //TFormMain = class(TForm)
    dxRibbonStatusBarMain: TdxRibbonStatusBar;
    dxRibbonMainTabMain: TdxRibbonTab;
    dxRibbonMain: TdxRibbon;
    dxRibbonMainTabAdministratrion: TdxRibbonTab;
    cxImageListLarge: TcxImageList;
    cxImageListSmall: TcxImageList;
    dxBarManagerMain: TdxBarManager;
    dxBarManagerMainBarAuthentication: TdxBar;
    dxBarManagerMainBarHelp: TdxBar;
    dxBarManagerMainBarApplication: TdxBar;
    dxBarManagerMainBarQuickAccess: TdxBar;
    dxBarLargeButtonShutdown: TdxBarLargeButton;
    dxBarLargeButtonHelp: TdxBarLargeButton;
    dxBarLargeButtonAbout: TdxBarLargeButton;
    dxBarLargeButtonDonations: TdxBarLargeButton;
    dxBarLargeButtonThanks: TdxBarLargeButton;
    dxBarLargeButtonLogin: TdxBarLargeButton;
    dxBarLargeButtonProfile: TdxBarLargeButton;
    dxBarLargeButtonChangeUser: TdxBarLargeButton;
    dxBarLargeButtonLogout: TdxBarLargeButton;
    dxBarLargeButtonLock: TdxBarLargeButton;
    cxLocalizerRussian: TcxLocalizer;
    cxPageControlMain: TcxPageControl;
    cxTabSheetMain: TcxTabSheet;
    PanelMainRight: TPanel;
    cxGridSchedule: TcxGrid;
    cxGridScheduleDBTableView1: TcxGridDBTableView;
    cxGridScheduleLevel1: TcxGridLevel;
    cxTabSheetAdministration: TcxTabSheet;
    cxPageControlAdministration: TcxPageControl;
    cxTabSheetAChannel: TcxTabSheet;
    cxTabSheetAType: TcxTabSheet;
    cxTabSheetAMovie: TcxTabSheet;
    cxTabSheetASeries: TcxTabSheet;
    cxTabSheetAGenre: TcxTabSheet;
    cxTabSheetAPerson: TcxTabSheet;
    cxTabSheetASchedule: TcxTabSheet;
    cxTabSheetAUser: TcxTabSheet;
    cxTabSheetAGroup: TcxTabSheet;
    cxTabSheetATable: TcxTabSheet;
    cxTabSheetAAcl: TcxTabSheet;
    cxPageControlAChannelPage: TcxPageControl;
    cxTabSheetAChannelGridView: TcxTabSheet;
    cxTabSheetAChannelEditView: TcxTabSheet;
    cxGridAChannelsGridDBTableViewChannelsList: TcxGridDBTableView;
    cxGridAChannelsGridLevelChannelsList: TcxGridLevel;
    cxGridAChannelsGrid: TcxGrid;
    dxBarManagerMainBarData: TdxBar;
    dxBarLargeButtonInsert: TdxBarLargeButton;
    dxBarLargeButtonDelete: TdxBarLargeButton;
    dxBarLargeButtonUpdate: TdxBarLargeButton;
    dxBarLargeButtonDBServer: TdxBarLargeButton;
    dxBarLargeButtonServer: TdxBarLargeButton;
    cxGridAChannelsGridDBTableViewChannelsListchannelName: TcxGridDBColumn;
    cxGridAChannelsGridDBTableViewChannelsListchannelDescription: TcxGridDBColumn;
    cxGridAChannelsGridDBTableViewChannelsListchannelImage: TcxGridDBColumn;
    cxButtonEditChannelImageBrowse: TcxButtonEdit;
    cxLabelChannelName: TcxLabel;
    cxLabelChannelDescrption: TcxLabel;
    cxLabelChannelImage: TcxLabel;
    cxLabelChannelOrder: TcxLabel;
    TimerHideMessage: TTimer;
    OpenPictureDialogBmp: TOpenPictureDialog;
    cxGridAGenresGridDBTableView1: TcxGridDBTableView;
    cxGridAGenresGridLevel1: TcxGridLevel;
    cxGridAGenresGrid: TcxGrid;
    cxGridAGenresGridDBTableView1genreName: TcxGridDBColumn;
    cxGridATypesGridDBTableView1: TcxGridDBTableView;
    cxGridATypesGridLevel1: TcxGridLevel;
    cxGridATypesGrid: TcxGrid;
    cxGridATypesGridDBTableView1typeName: TcxGridDBColumn;
    cxGridATablesGridDBTableView1: TcxGridDBTableView;
    cxGridATablesGridLevel1: TcxGridLevel;
    cxGridATablesGrid: TcxGrid;
    cxGridATablesGridDBTableView1tableName: TcxGridDBColumn;
    cxGridATablesGridDBTableView1tableComment: TcxGridDBColumn;
    dxBarLargeButtonOptimize: TdxBarLargeButton;
    dxBarLargeButtonRepair: TdxBarLargeButton;
    cxPageControlAPersonPage: TcxPageControl;
    cxTabSheetAPersonGridView: TcxTabSheet;
    cxTabSheetAPersonEditView: TcxTabSheet;
    cxGridAPersonGridDBTableView1: TcxGridDBTableView;
    cxGridAPersonGridLevel1: TcxGridLevel;
    cxGridAPersonGrid: TcxGrid;
    cxLabelPersonName: TcxLabel;
    cxLabelPersonSex: TcxLabel;
    cxButtonEditPersonPhotoBrowser: TcxButtonEdit;
    cxLabelPersonPhoto: TcxLabel;
    cxLabelPersonBio: TcxLabel;
    cxTabSheetAProgram: TcxTabSheet;
    cxPageControlASchedulePage: TcxPageControl;
    cxTabSheetAScheduleGridView: TcxTabSheet;
    cxGridAScheduleGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxTabSheetAScheduleEditView: TcxTabSheet;
    cxLabelObjectId: TcxLabel;
    cxComboBoxObjectCategory: TcxComboBox;
    cxLabelObjectCategory: TcxLabel;
    cxLabelChannelId: TcxLabel;
    cxLabelScheduleDate: TcxLabel;
    cxGroupBoxScheduleTime: TcxGroupBox;
    cxLabelScheduleStart: TcxLabel;
    cxLabelScheduleEnd: TcxLabel;
    cxLabelScheduleIsNextDay: TcxLabel;
    cxLabel1: TcxLabel;
    cxPageControlAUserPage: TcxPageControl;
    cxTabSheetAUserGridView: TcxTabSheet;
    cxTabSheetAUserEditView: TcxTabSheet;
    cxGridAUsersGridDBTableView1: TcxGridDBTableView;
    cxGridAUsersGridLevel1: TcxGridLevel;
    cxGridAUsersGrid: TcxGrid;
    cxGridAUsersGridDBTableView1userName: TcxGridDBColumn;
    cxGridAUsersGridDBTableView1userShowInList: TcxGridDBColumn;
    cxGridAUsersGridDBTableView1userContact: TcxGridDBColumn;
    cxGridAUsersGridDBTableView1userImage: TcxGridDBColumn;
    cxGridAUsersGridDBTableView1groupName: TcxGridDBColumn;
    cxLabeluserName: TcxLabel;
    cxLabelGroupId: TcxLabel;
    cxLabelUserContact: TcxLabel;
    cxLabelUserImage: TcxLabel;
    cxLabelUserAbout: TcxLabel;
    dxBarManagerMainBarTable: TdxBar;
    cxButtonEditUserImageBrowser: TcxButtonEdit;
    cxGroupBoxPassword: TcxGroupBox;
    cxTextEditUserPassword: TcxTextEdit;
    cxLabelUserPasswordConfirmation: TcxLabel;
    cxTextEditUserPasswordConfirmation: TcxTextEdit;
    cxLabelUserPassword: TcxLabel;
    cxLabelUserShowInList: TcxLabel;
    cxGridAGroupsGridDBTableView1: TcxGridDBTableView;
    cxGridAGroupsGridLevel1: TcxGridLevel;
    cxGridAGroupsGrid: TcxGrid;
    cxGridDBTableView1scheduleTitle: TcxGridDBColumn;
    cxGridDBTableView1scheduleType: TcxGridDBColumn;
    cxGridDBTableView1channelName: TcxGridDBColumn;
    cxGridDBTableView1scheduleDate: TcxGridDBColumn;
    cxGridDBTableView1scheduleStart: TcxGridDBColumn;
    cxGridDBTableView1scheduleEnd: TcxGridDBColumn;
    cxGridDBTableView1scheduleIsNextDay: TcxGridDBColumn;
    cxGridAAclGridDBTableView1: TcxGridDBTableView;
    cxGridAAclGridLevel1: TcxGridLevel;
    cxGridAAclGrid: TcxGrid;
    cxGridAAclGridDBTableView1groupId: TcxGridDBColumn;
    cxGridAAclGridDBTableView1tableId: TcxGridDBColumn;
    cxGridAAclGridDBTableView1aclAccess: TcxGridDBColumn;
    cxPageControlAMoviePage: TcxPageControl;
    cxTabSheetAMovieGridView: TcxTabSheet;
    cxTabSheetAMovieEditView: TcxTabSheet;
    cxGridAMoviesGridDBTableView1: TcxGridDBTableView;
    cxGridAMoviesGridLevel1: TcxGridLevel;
    cxGridAMoviesGrid: TcxGrid;
    cxGridAMoviesGridDBTableView1movieName: TcxGridDBColumn;
    cxGridAMoviesGridDBTableView1movieDescription: TcxGridDBColumn;
    cxLabelMovieName: TcxLabel;
    cxLabelMovieDescription: TcxLabel;
    cxPageControlASeriesPage: TcxPageControl;
    cxTabSheetASeriesGridView: TcxTabSheet;
    cxTabSheetASeriesEditView: TcxTabSheet;
    cxGridASeriesGridDBTableView1: TcxGridDBTableView;
    cxGridASeriesGridLevel1: TcxGridLevel;
    cxGridASeriesGrid: TcxGrid;
    cxGridASeriesGridDBTableView1seriesName: TcxGridDBColumn;
    cxGridASeriesGridDBTableView1seriesDescription: TcxGridDBColumn;
    cxGridASeriesGridDBTableView1seriesStatus: TcxGridDBColumn;
    cxLabelSeriesName: TcxLabel;
    cxLabelMovieDate: TcxLabel;
    cxGridAMoviesGridDBTableView1movieDate: TcxGridDBColumn;
    cxGridAGroupsGridDBTableView1groupName: TcxGridDBColumn;
    cxPageControlASeriesEditViewPage: TcxPageControl;
    cxTabSheetASeriesEditViewGenres: TcxTabSheet;
    cxGridSeriesGenres: TcxGrid;
    cxGridSeriesGenresDBTableView1: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxStyleRepositoryMain: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    dxBarLargeButtonCopy: TdxBarLargeButton;
    cxLabelTypeIdLabel: TcxLabel;
    cxLookupComboBoxObjectId: TcxLookupComboBox;
    cxGridScheduleDBTableView1scheduletitle: TcxGridDBColumn;
    cxGridScheduleDBTableView1scheduledate: TcxGridDBColumn;
    cxGridScheduleDBTableView1scheduleType: TcxGridDBColumn;
    cxLookupComboBoxChannelId: TcxLookupComboBox;
    cxLookupComboBoxTypeId: TcxLookupComboBox;
    cxDateEditScheduleDate: TcxDateEdit;
    cxTimeEditScheduleStart: TcxTimeEdit;
    cxTimeEditScheduleEnd: TcxTimeEdit;
    cxTextEditChannelName: TcxTextEdit;
    cxSpinEditChannelOrder: TcxSpinEdit;
    cxMemoChannelDescription: TcxMemo;
    cxImageChannelImage: TcxImage;
    cxTextEditMovieName: TcxTextEdit;
    cxDateEditMovieDate: TcxDateEdit;
    cxMemoMovieDescription: TcxMemo;
    cxTextEditSeriesName: TcxTextEdit;
    cxMemoSeriesDescription: TcxMemo;
    cxTextEditPersonName: TcxTextEdit;
    cxComboBoxPersonSex: TcxComboBox;
    cxImagePersonPhoto: TcxImage;
    cxMemoPersonBio: TcxMemo;
    cxTextEditUserName: TcxTextEdit;
    cxLookupComboBoxGroupId: TcxLookupComboBox;
    cxComboBoxUserShowInList: TcxComboBox;
    cxImageUserImage: TcxImage;
    cxMemoUserAbout: TcxMemo;
    cxComboBoxScheduleIsNextDay: TcxComboBox;
    cxButtonUserChangePassword: TcxButton;
    dxBarCombo1: TdxBarCombo;
    CustomdxBarCombo1: TCustomdxBarCombo;
    dxBarLargeButton1: TdxBarLargeButton;
    cxComboBoxSeriesStatus: TcxComboBox;
    cxLabelSeriesStatus: TcxLabel;
    dxBarSubItemReports: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    dxBarLargeButtonExport: TdxBarLargeButton;
    cxGroupBoxPersonDate: TcxGroupBox;
    cxDateEditPersonBirthdate: TcxDateEdit;
    cxDateEditPersonDeathdate: TcxDateEdit;
    cxLabelPersonBirthdate: TcxLabel;
    cxLabelPersonDeathdate: TcxLabel;
    cxLabelPersonHeight: TcxLabel;
    cxSpinEditPersonHeight: TcxSpinEdit;
    cxGridSeriesPersons: TcxGrid;
    cxGridSeriesPersonsDBTableView1: TcxGridDBTableView;
    cxGridLevel6: TcxGridLevel;
    cxTabSheetARole: TcxTabSheet;
    cxTabSheetACountry: TcxTabSheet;
    cxGridARoleGridDBTableView1: TcxGridDBTableView;
    cxGridARoleGridLevel1: TcxGridLevel;
    cxGridARoleGrid: TcxGrid;
    cxGridARoleGridDBTableView1roleName: TcxGridDBColumn;
    cxGridACountryGridDBTableView1: TcxGridDBTableView;
    cxGridACountryGridLevel1: TcxGridLevel;
    cxGridACountryGrid: TcxGrid;
    cxGridACountryGridDBTableView1countryName: TcxGridDBColumn;
    cxGridACountryGridDBTableView1countryCode: TcxGridDBColumn;
    cxMaskEditUserEmail: TcxMaskEdit;
    cxGridAChannelsGridDBTableViewChannelsListchannelBroadcastStart: TcxGridDBColumn;
    cxGridAChannelsGridDBTableViewChannelsListchannelUrl: TcxGridDBColumn;
    cxLabelChannelBroadcastStart: TcxLabel;
    cxLabelChannelUrl: TcxLabel;
    cxDateEditBroadcastStart: TcxDateEdit;
    cxLabelMovieBudget: TcxLabel;
    cxLabelMovieReturns: TcxLabel;
    cxCurrencyEditMovieBudget: TcxCurrencyEdit;
    cxCurrencyEditMovieReturns: TcxCurrencyEdit;
    cxHyperLinkEditChannelUrl: TcxHyperLinkEdit;
    cxPageControlAMovieEditView: TcxPageControl;
    cxTabSheetAMoviePersonsGrid: TcxTabSheet;
    cxTabSheetAMovieGenresGrid: TcxTabSheet;
    cxGridMovieGenres: TcxGrid;
    cxGridMovieGenresDBTableView1: TcxGridDBTableView;
    cxGridMovieGenresDBTableView1genreId: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxTabSheetASeriesEditViewEpisodes: TcxTabSheet;
    cxGridSeriesEpisodes: TcxGrid;
    cxGridSeriesEpisodesDBTableView1: TcxGridDBTableView;
    cxGridSeriesEpisodesDBTableView1episodeSeason: TcxGridDBColumn;
    cxGridSeriesEpisodesDBTableView1episodeNumber: TcxGridDBColumn;
    cxGridSeriesEpisodesDBTableView1episodeName: TcxGridDBColumn;
    cxGridSeriesEpisodesDBTableView1episodeDescription: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxLabelSeriesDescription: TcxLabel;
    cxLabelSeriesLength: TcxLabel;
    cxSpinEditSeriesLength: TcxSpinEdit;
    cxLabelSeriesCountryId: TcxLabel;
    cxLookupComboBoxSeriesCountryId: TcxLookupComboBox;
    cxLabelMovieCountryId: TcxLabel;
    cxLookupComboBoxMovieCountryId: TcxLookupComboBox;
    cxLabelMovieLength: TcxLabel;
    cxSpinEditMovieLength: TcxSpinEdit;
    cxGridAPersonGridDBTableView1personName: TcxGridDBColumn;
    cxGridAPersonGridDBTableView1personBio: TcxGridDBColumn;
    cxGridAPersonGridDBTableView1personPhoto: TcxGridDBColumn;
    cxGridAPersonGridDBTableView1personBirthdate: TcxGridDBColumn;
    cxGridAPersonGridDBTableView1personDeathdate: TcxGridDBColumn;
    cxGridAPersonGridDBTableView1personSex: TcxGridDBColumn;
    cxGridAPersonGridDBTableView1personHeight: TcxGridDBColumn;
    cxGridAMoviesGridDBTableView1countryId: TcxGridDBColumn;
    cxGridAMoviesGridDBTableView1movieLength: TcxGridDBColumn;
    cxGridAMoviesGridDBTableView1movieBudget: TcxGridDBColumn;
    cxGridAMoviesGridDBTableView1movieReturns: TcxGridDBColumn;
    cxGridASeriesGridDBTableView1countryId: TcxGridDBColumn;
    cxGridASeriesGridDBTableView1seriesLength: TcxGridDBColumn;
    cxGridSeriesPersonsDBTableView1personId: TcxGridDBColumn;
    cxGridSeriesPersonsDBTableView1roleId: TcxGridDBColumn;
    cxGridSeriesGenresDBTableView1genreId: TcxGridDBColumn;
    cxGridMoviePersons: TcxGrid;
    cxGridMoviePersonsDBTableView1: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    cxGridMoviePersonsDBTableView1personId: TcxGridDBColumn;
    cxGridMoviePersonsDBTableView1roleId: TcxGridDBColumn;
    cxPageControlAProgramPage: TcxPageControl;
    cxTabSheetAProgramGridView: TcxTabSheet;
    cxTabSheetAProgramEditView: TcxTabSheet;
    cxGridABroadcastsGrid: TcxGrid;
    cxGridABroadcastsGridDBTableView1: TcxGridDBTableView;
    cxGridABroadcastsGridDBTableView1broadcastName: TcxGridDBColumn;
    cxGridABroadcastsGridDBTableView1broadcastDescription: TcxGridDBColumn;
    cxGridABroadcastsGridDBTableView1broadcastLength: TcxGridDBColumn;
    cxGridABroadcastsGridLevel1: TcxGridLevel;
    cxLabelBroadcastName: TcxLabel;
    cxTextEditBroadcastName: TcxTextEdit;
    cxLabelBroadcastDescription: TcxLabel;
    cxMemoBroadcastDescription: TcxMemo;
    cxLabelBroadcastLength: TcxLabel;
    cxSpinEditBroadcastLength: TcxSpinEdit;
    cxGridBroadcastPersons: TcxGrid;
    cxGridBroadcastPersonsDBTableView1: TcxGridDBTableView;
    cxGridLevel7: TcxGridLevel;
    cxLabelBroadcastPersons: TcxLabel;
    cxGridBroadcastPersonsDBTableView1personId: TcxGridDBColumn;
    cxGridBroadcastPersonsDBTableView1roleId: TcxGridDBColumn;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarManagerMainBarReports: TdxBar;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButtonAExport: TdxBarLargeButton;
    dxBarManagerMainBar1: TdxBar;
    dxBarLargeButtonAExportXLS: TdxBarLargeButton;
    dxBarLargeButtonAExportXML: TdxBarLargeButton;
    dxBarLargeButtonAExportHTML: TdxBarLargeButton;
    dxBarLargeButtonAExportTXT: TdxBarLargeButton;
    cxGridScheduleDBTableView1Column1: TcxGridDBColumn;
    cxHeaderScheduleHeader: TcxHeader;
    PanelMainLeft: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    cxGroupBoxDatePeriod: TcxGroupBox;
    cxLabelDateFrom: TcxLabel;
    cxLabelDateTo: TcxLabel;
    cxDateEditDateFrom: TcxDateEdit;
    cxDateEditDateTo: TcxDateEdit;
    cxCheckGroupTimes: TcxCheckGroup;
    cxCheckGroupChannels: TcxCheckGroup;
    cxCheckGroupTypes: TcxCheckGroup;
    cxSplitter1: TcxSplitter;
    cxGridScheduleDBTableView1Column2: TcxGridDBColumn;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    cxBarEditItem1: TcxBarEditItem;
    cxBarEditItem2: TcxBarEditItem;
    cxBarEditItem3: TcxBarEditItem;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    cxGridARoleGridDBTableView1Column1: TcxGridDBColumn;
    cxImageListChannels: TcxImageList;

    ////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////
    ///
    ///
    procedure ResetAdministrationTab();
    procedure ResetChannelEditView();
    procedure ResetMovieEditView();
    procedure ResetScheduleEditView();
    procedure ResetSeriesEditView();
    procedure ResetPersonEditView();
    procedure ResetUserEditView();
    procedure ResetBroadcastEditView();

    procedure FillDate();
    procedure FillChannels();
    procedure FillTypes();
    procedure FillTimes();

    procedure SuccessLogin(name: WideString);
    procedure Logout();

    procedure FillAChannelGrid();
    procedure FillAGenreGrid();
    procedure FillATableGrid();
    procedure FillATypeGrid();
    procedure FillAPersonGrid();
    procedure FillAAclGrid();
    procedure FillAGroupGrid();
    procedure FilLAMovieGrid();
    procedure FillABroadcastGrid();
    procedure FillAScheduleGrid();
    procedure FillAUserGrid();
    procedure FillASeriesGrid();

    procedure FillAChannelEditView();
    procedure FillAScheduleEditView();
    procedure FillAMovieEditView();
    procedure FillASeriesEditView();
    procedure FillAPersonEditView();
    procedure FillAUserEditView();
    procedure FillABroadcastEditView();

    function ShowAdministrationPageTab(TableName: string; UserRight: string): string;
    procedure OpenTabSheetsByTag(tags: TStringList);

    procedure DisableEnableDataControl(tag: integer);
    procedure DisableGrid(grid: TcxGridDBTableView);
    procedure EnableGrid(grid: TcxGridDBTableView);
    procedure DisableButtons();
    procedure EnableButtons();

    procedure GenerateWhereChannelClause();
    procedure GenerateWhereTypeClause();
    procedure GenerateWhereTimeClause();
    procedure GenerateWhereDateClause();

    function CheckEditValues(FormName : string) : boolean;
    procedure CheckScheduleForm(Errors : TStringList);
    procedure CheckChannelForm(Errors : TStringList);
    procedure CheckMovieForm(Errors : TStringList);
    procedure CheckSeriesForm(Errors : TStringList);
    procedure CheckPersonForm(Errors : TStringList);
    procedure CheckBroadcastForm(Errors: TStringList);
    procedure CheckUserForm(Errors : TStringList; Command : String);

    procedure SetAllCheckboxState(CheckGroup: TcxCheckGroup; Status: Boolean);

    function ProcessCheckGroup(CheckGroup: TcxCheckGroup; CheckStates: TcxCheckStates) : boolean;
    procedure SetCheckGroupState(CheckGroup: TcxCheckGroup;  Checked: Boolean);
    procedure SetCheckStatesState(CheckStates: TcxCheckStates; Checked: Boolean; Size: Integer);
    function NotFirstCheckboxChanged(CheckGroup: TcxCheckGroup; CheckStates: TcxCheckStates) : boolean;
    ////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////


    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxCheckGroupChannelsPropertiesChange(Sender: TObject);
    procedure cxCheckGroupTypesPropertiesChange(Sender: TObject);
    procedure cxCheckGroupTimesPropertiesChange(Sender: TObject);
    procedure dxBarLargeButtonLoginClick(Sender: TObject);
    procedure dxBarLargeButtonChangeUserClick(Sender: TObject);
    procedure dxBarLargeButtonLockClick(Sender: TObject);
    procedure dxBarLargeButtonShutdownClick(Sender: TObject);
    procedure dxBarLargeButtonProfileClick(Sender: TObject);
    procedure dxBarLargeButtonThanksClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxRibbonMainTabChanged(Sender: TdxCustomRibbon);
    procedure UpdateStatusBar(Panel: integer; Text: WideString);
    procedure dxBarLargeButtonAboutClick(Sender: TObject);
    procedure cxTabSheetAChannelGridViewShow(Sender: TObject);
    procedure cxGridAChannelsGridDBTableViewChannelsListDblClick(Sender: TObject);
    procedure dxBarLargeButtonUpdateClick(Sender: TObject);
    procedure cxPageControlAdministrationPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure cxTabSheetAChannelShow(Sender: TObject);
    procedure dxBarLargeButtonInsertClick(Sender: TObject);
    procedure dxBarLargeButtonDeleteClick(Sender: TObject);
    procedure TimerHideMessageTimer(Sender: TObject);
    procedure cxTabSheetAGenreShow(Sender: TObject);
    procedure cxTabSheetATypeShow(Sender: TObject);
    procedure cxTabSheetATableShow(Sender: TObject);
    procedure cxTabSheetAPersonShow(Sender: TObject);
    procedure cxTabSheetAPersonGridViewShow(Sender: TObject);
    procedure cxGridAPersonGridDBTableView1DblClick(Sender: TObject);
    procedure cxButtonEditChannelImageBrowseClick(Sender: TObject);
    procedure cxButtonEditPersonPhotoBrowserClick(Sender: TObject);
    procedure cxTabSheetAScheduleEditViewShow(Sender: TObject);
    procedure cxComboBoxTypeIdPropertiesChange(Sender: TObject);
    procedure cxGridAUsersGridDBTableView1DblClick(Sender: TObject);
    procedure cxButtonEditUserImageBrowserClick(Sender: TObject);
    procedure cxTabSheetAUserShow(Sender: TObject);
    procedure cxTabSheetAUserGridViewShow(Sender: TObject);
    procedure cxTabSheetAGroupShow(Sender: TObject);
    procedure cxTabSheetAAclShow(Sender: TObject);
    procedure cxGridAMoviesGridDBTableView1DblClick(Sender: TObject);
    procedure cxTabSheetAMovieEditViewShow(Sender: TObject);
    procedure cxTabSheetAMovieShow(Sender: TObject);
    procedure cxTabSheetAMovieGridViewShow(Sender: TObject);
    procedure cxTabSheetAProgramShow(Sender: TObject);
    procedure cxTabSheetAScheduleShow(Sender: TObject);
    procedure cxTabSheetAScheduleGridViewShow(Sender: TObject);
    procedure cxTabSheetASeriesShow(Sender: TObject);
    procedure cxTabSheetASeriesEditViewShow(Sender: TObject);
    procedure cxGridDBTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridASeriesGridDBTableView1DblClick(Sender: TObject);
    procedure cxPageControlAChannelPagePageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure dxBarLargeButtonOptimizeClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxTabSheetAdministrationShow(Sender: TObject);
    procedure dxBarLargeButtonRepairClick(Sender: TObject);
    procedure dxBarLargeButtonLogoutClick(Sender: TObject);
    procedure cxTabSheetMainShow(Sender: TObject);
    procedure dxBarLargeButtonDonationsClick(Sender: TObject);
    procedure cxTabSheetAChannelEditViewShow(Sender: TObject);
    procedure cxTabSheetAPersonEditViewShow(Sender: TObject);
    procedure cxTabSheetAUserEditViewShow(Sender: TObject);
    procedure cxButtonUserChangePasswordClick(Sender: TObject);
    procedure cxGridScheduleDBTableView1DblClick(Sender: TObject);
    procedure cxDateEditDateFromPropertiesChange(Sender: TObject);
    procedure cxDateEditDateToPropertiesChange(Sender: TObject);
    procedure dxBarLargeButtonExportClick(Sender: TObject);
    procedure dxBarLargeButtonHelpClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cxTabSheetACountryShow(Sender: TObject);
    procedure cxTabSheetARoleShow(Sender: TObject);
    procedure cxTabSheetAProgramEditViewShow(Sender: TObject);
    procedure cxGridABroadcastsGridDBTableView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxBarLargeButtonAExportXLSClick(Sender: TObject);
    procedure dxBarLargeButtonAExportXMLClick(Sender: TObject);
    procedure dxBarLargeButtonAExportHTMLClick(Sender: TObject);
    procedure dxBarLargeButtonAExportTXTClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarSubItem2Click(Sender: TObject);
    procedure dxBarButton14Click(Sender: TObject);
    procedure dxBarButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    
  end;

var
  FormMain: TFormMain;

  CheckStatesChannels: TcxCheckStates;
  CheckStatesTypes: TcxCheckStates;
  CheckStatesTimes: TcxCheckStates;

  ChannelsIsChecked, TypesIsChecked, TimesIsChecked: Boolean;

  User: WideString;


  IsInsertState: Boolean;
  IsLoggedIn: Boolean;
  IsInitializated: Boolean;

  IsChannelAllCheckBoxClicked : boolean;
  IsTypesAllCheckBoxClicked : boolean;
  IsTimesAllCheckBoxClicked: boolean;

  IsChannelChanged, IsTypeChanged: boolean;

  CurrentReport: WideString; 
implementation

uses ConnectionForm, DataModule, AuthenticationForm, LockForm, UserProfile, ThanksForm, AboutForm, DonationForm, ScheduleDetailExtremeForm, ProgressBarForm;

{$R *.dfm}

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FormConnection.Close;
  FormProgressBar.Close;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
    try
    cxLocalizerRussian.LoadFromFile(ExtractFilePath(ParamStr(0))+'russian.ini');
    cxLocalizerRussian.Active := true;
    cxLocalizerRussian.Locale := 1049;
    cxLocalizerRussian.Translate;
    except
        MessageDlg('Не удалось загрузить файл локализации (russian.ini). Используем английский язык.', mtInformation, [mbOK], 0);
    end;
end;

procedure TFormMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_F1 then
        dxBarLargeButtonHelpClick(Self);
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
    if NOT IsInitializated then
    begin
        cxPageControlMain.ActivePage := cxTabSheetMain;
        UpdateStatusBar(1, cxPageControlMain.ActivePage.Caption);

        FillChannels;
        FillTypes;
        FillTimes;
        FillDate;

        Logout;

        IsTypesAllCheckBoxClicked := false;
        IsChannelAllCheckBoxClicked := false;
        IsTimesAllCheckBoxClicked := false;

        IsInsertState := false;

        IsChannelChanged := false;
        IsTypeChanged := false;

        ResetAdministrationTab;

        IsInitializated := True;
    end;
end;

procedure TFormMain.SetAllCheckboxState(CheckGroup: TcxCheckGroup; Status: boolean);
begin
    if AnsiPos('Channel', CheckGroup.Name) <> 0 then
        IsChannelAllCheckBoxClicked := Status
    else if AnsiPos('Types', CheckGroup.Name) <> 0 then
        IsTypesAllCheckBoxClicked := Status
    else if AnsiPos('Times', CheckGroup.Name) <> 0 then
        IsTimesAllCheckBoxClicked := Status;   
end;

//главная функция обработки клика на чекгруппе
function TFormMain.ProcessCheckGroup(CheckGroup: TcxCheckGroup; CheckStates: TcxCheckStates) : boolean;
var
    i: integer;
    AllChecked: Boolean;
begin
    Result := false;
    AllChecked := true;

    with CheckGroup do
        for i := 0 to Properties.Items.Count - 1 do
        begin
            //начиная со второго (пропускаем "все") элемента смотрим их состояние
            if i <> 0 then
            begin
                if States[i] = cbsUnchecked then
                    AllChecked := false; //хотя бы один не отмечен
            end;

            //сверяем состояние с предыдущим
            if States[i] <> CheckStates[i] then
            begin
                //если изменилось значение первого ("все") элемента, то ставим
                //значения для всех элементов в группе
                if i = 0 then
                begin
                    Result := true;
                    //сначало меняем их "прошлое состояние"
                    SetAllCheckboxState(CheckGroup, True);
                    SetCheckStatesState(CheckStates, (States[i] = cbsChecked), Properties.Items.Count);
                    SetCheckGroupState(CheckGroup, (States[i] = cbsChecked));
                    SetAllCheckboxState(CheckGroup, False);
                end;
                CheckStates[i] := States[i];
            end;
        end;

    //Если все отмечены, то надо поставить первому элементу галочку
    if AllChecked then
    begin
        CheckStates[0] := cbsChecked;
        CheckGroup.States[0] := cbsChecked
    end
    //аналогично снять
    else
    begin
        CheckStates[0] := cbsUnchecked;
        CheckGroup.States[0] := cbsUnchecked;
    end;
end;

function TFormMain.NotFirstCheckboxChanged(CheckGroup: TcxCheckGroup; CheckStates: TcxCheckStates) : boolean;
var
    i: integer;
begin
    Result := false;
    with CheckGroup do
        for i := 1 to Properties.Items.Count - 1 do
        begin
            if States[i] <> CheckStates[i] then
            begin
                Result := true;
            end;
        end;
end;

procedure TFormMain.SetCheckStatesState(CheckStates: TcxCheckStates; Checked: Boolean; Size: integer);
var
    i: integer;
begin
    for i := 0 to Size - 1 do
        if Checked then
            CheckStates[i] := cbsChecked
        else
            CheckStates[i] := cbsUnchecked;
end;

procedure TFormMain.SetCheckGroupState(CheckGroup: TcxCheckGroup; Checked: Boolean);
var
    i: integer;
begin
    with CheckGroup do
      for i := 0 to Properties.Items.Count - 1 do
        if Checked then
            States[i] := cbsChecked
        else
            States[i] := cbsUnchecked;
end;


procedure TFormMain.cxButtonEditPersonPhotoBrowserClick(Sender: TObject);
begin
    if OpenPictureDialogBmp.Execute then
    begin
        cxButtonEditPersonPhotoBrowser.Text := OpenPictureDialogBmp.FileName;
        try
        cxImagePersonPhoto.Picture.LoadFromFile(OpenPictureDialogBmp.FileName);
        except
            on E: Exception do
              MessageDlg('Не удается загрузить изображение: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
        end;
    end;
end;

procedure TFormMain.cxButtonEditChannelImageBrowseClick(Sender: TObject);
begin
    if OpenPictureDialogBmp.Execute then
    begin
        cxButtonEditChannelImageBrowse.Text := OpenPictureDialogBmp.FileName;
        try
        cxImageChannelImage.Picture.LoadFromFile(OpenPictureDialogBmp.FileName);
        except
            on E: Exception do
              MessageDlg('Не удается загрузить изображение: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
        end;
    end;
end;

procedure TFormMain.cxButtonEditUserImageBrowserClick(Sender: TObject);
begin
    if OpenPictureDialogBmp.Execute then
    begin
        cxButtonEditUserImageBrowser.Text := OpenPictureDialogBmp.FileName;
        try
        cxImageUserImage.Picture.LoadFromFile(OpenPictureDialogBmp.FileName);
        except
            on E: Exception do
              MessageDlg('Не удается загрузить изображение: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
        end;
    end;
end;

procedure TFormMain.cxButtonUserChangePasswordClick(Sender: TObject);
var
    Result : Integer;
begin
    Result := 0;
    if (DMMain.AQSelectUsers.Active) AND (DMMain.AQSelectUsers.FieldByName('userId').Value > 0) then
    begin
        if CheckEditValues('userchangepassword') then
        begin
            Result := DMMain.UpdateUserPassword;
            if Result = 1 then
                begin
                    UpdateStatusBar(3, 'Пароль успешно обновлен');
                    TimerHideMessage.Enabled := true;
                end;
        end;
    end;
    if Result > 100 then ; // magic    
end;

procedure TFormMain.cxCheckGroupChannelsPropertiesChange(Sender: TObject);
var
    clickedNotFirstCheckbox, clickedFirstCheckbox : boolean;
begin
    clickedNotFirstCheckbox := NotFirstCheckboxChanged(cxCheckGroupChannels, CheckStatesChannels);
    clickedFirstCheckbox := ProcessCheckGroup(cxCheckGroupChannels, CheckStatesChannels);

    if clickedFirstCheckbox  then
    begin
        if cxCheckGroupChannels.States[0] = cbsChecked then
            ScheduleWhereChannelClause := ''
        else
            ScheduleWhereChannelClause := ' (1 > 2) ';
        DMMain.UpdateMainSchedule
    end
    else if (NOT IsChannelAllCheckBoxClicked) AND (clickedNotFirstCheckbox) then
        GenerateWhereChannelClause;
end;

procedure TFormMain.cxCheckGroupTypesPropertiesChange(Sender: TObject);
var
    clickedNotFirstCheckbox, clickedFirstCheckbox : boolean;
begin
    clickedNotFirstCheckbox := NotFirstCheckboxChanged(cxCheckGroupTypes, CheckStatesTypes);
    clickedFirstCheckbox := ProcessCheckGroup(cxCheckGroupTypes, CheckStatesTypes);

    if clickedFirstCheckbox  then
    begin
        if cxCheckGroupTypes.States[0] = cbsChecked then
            ScheduleWhereTypeClause := ''
        else
            ScheduleWhereTypeClause := ' (1 > 2) '; //особая уличная магия
        DMMain.UpdateMainSchedule
    end
    else if (NOT IsTypesAllCheckBoxClicked) AND (clickedNotFirstCheckbox) then
        GenerateWhereTypeClause;
end;

procedure TFormMain.cxCheckGroupTimesPropertiesChange(Sender: TObject);
var
    clickedNotFirstCheckbox, clickedFirstCheckbox : boolean;
begin
    clickedNotFirstCheckbox := NotFirstCheckboxChanged(cxCheckGroupTimes, CheckStatesTimes);
    clickedFirstCheckbox := ProcessCheckGroup(cxCheckGroupTimes, CheckStatesTimes);

    if clickedFirstCheckbox  then
    begin
        if cxCheckGroupTimes.States[0] = cbsChecked then
            ScheduleWhereTimeClause := ''
        else
            ScheduleWhereTimeClause := ' (1 > 2) '; //особая уличная магия
        DMMain.UpdateMainSchedule
    end
    else if (NOT IsTimesAllCheckBoxClicked) AND (clickedNotFirstCheckbox) then
        GenerateWhereTimeClause;
end;

procedure TFormMain.GenerateWhereChannelClause();
var
    WhereClause : TStringList;
    i: integer;
begin
    if IsInitializated then
    begin
        WhereClause := TStringList.Create;
        for i := 1 to cxCheckGroupChannels.Properties.Items.Count - 1 do
        begin
            if cxCheckGroupChannels.States[i] = cbsChecked then
                WhereClause.Add(IntToStr(cxCheckGroupChannels.Properties.Items[i].Tag));
        end;
        WhereClause.LineBreak := ',';
        ScheduleWhereChannelClause := ' channelId IN (' + LeftStr(WhereClause.Text, Length(WhereClause.Text) - 1) +') ';

        if WhereClause.Count + 1 = cxCheckGroupChannels.Properties.Items.Count then
            ScheduleWhereChannelClause := ''
        else if WhereClause.Count = 0 then
            ScheduleWhereChannelClause := ' (1 > 2) ';
        DMMain.UpdateMainSchedule;
    end;
end;

procedure TFormMain.GenerateWhereTypeClause();
var
    WhereClause : TStringList;
    i: integer;
begin
    if IsInitializated then
    begin
        WhereClause := TStringList.Create;
        for i := 1 to cxCheckGroupTypes.Properties.Items.Count - 1 do
        begin
            if cxCheckGroupTypes.States[i] = cbsChecked then
                WhereClause.Add(IntToStr(cxCheckGroupTypes.Properties.Items[i].Tag));
        end;
        WhereClause.LineBreak := ',';
        ScheduleWhereTypeClause := ' typeId IN (' + LeftStr(WhereClause.Text, Length(WhereClause.Text) - 1) +') ';

        if WhereClause.Count + 1 = cxCheckGroupTypes.Properties.Items.Count then
            ScheduleWhereTypeClause := ''
        else if WhereClause.Count = 0 then
            ScheduleWhereTypeClause := ' (1 > 2) '; //особая уличная магия     

        DMMain.UpdateMainSchedule;
    end;
end;

procedure TFormMain.GenerateWhereDateClause();
begin
    ScheduleWhereDateClause := ' scheduleDate >=  ''' + DateToStr(cxDateEditDateFrom.Date, DateFormat) + ''' AND scheduleDate <= ''' + DateToStr(cxDateEditDateTo.Date, DateFormat) + ''' ';
    DMMain.UpdateMainSchedule;
end;

procedure TFormMain.GenerateWhereTimeClause();
var
    WhereClause : TStringList;
    i: integer;
begin
    if IsInitializated then
    begin
        WhereClause := TStringList.Create;
        for i := 1 to cxCheckGroupTimes.Properties.Items.Count - 1 do
        begin
            if cxCheckGroupTimes.States[i] = cbsChecked then
                case i of
                    1: WhereClause.Add('scheduleStart >= ''06:00:00'' AND scheduleStart < ''12:00:00''');
                    2: WhereClause.Add('scheduleStart >= ''12:00:00'' AND scheduleStart < ''18:00:00''');
                    3: WhereClause.Add('scheduleStart >= ''18:00:00'' AND scheduleStart < ''24:00:00''');
                    4: WhereClause.Add('scheduleStart >= ''00:00:00'' AND scheduleStart < ''06:00:00''');
                end;

        end;
        WhereClause.LineBreak := ' OR ';
        ScheduleWhereTimeClause := ' (' + LeftStr(WhereClause.Text, Length(WhereClause.Text) - 4) +') ';

        if WhereClause.Count + 1 = cxCheckGroupTimes.Properties.Items.Count then
            ScheduleWhereTimeClause := ''
        else if WhereClause.Count = 0 then
            ScheduleWhereTimeClause := ' (1 > 2) '; //особая уличная магия     

        DMMain.UpdateMainSchedule;
    end;
end;

procedure TFormMain.DisableGrid(grid: TcxGridDBTableView);
begin
    with grid do
    begin
        OptionsData.Editing := false;
        OptionsData.Inserting := false;
        OptionsData.Deleting := false;
    end;
end;

procedure TFormMain.EnableGrid(grid: TcxGridDBTableView);
begin
    with grid do
    begin
        OptionsData.Editing := true;
        OptionsData.Inserting := true;
        OptionsData.Deleting := true;
    end;
end;

procedure TFormMain.EnableButtons;
begin
    dxBarLargeButtonInsert.Enabled := true;
    dxBarLargeButtonUpdate.Enabled := true;
    dxBarLargeButtonDelete.Enabled := true;

    dxBarLargeButtonOptimize.Enabled := true;
    dxBarLargeButtonRepair.Enabled := true;
end;

procedure TFormMain.DisableButtons;
begin
    dxBarLargeButtonInsert.Enabled := false;
    dxBarLargeButtonUpdate.Enabled := false;
    dxBarLargeButtonDelete.Enabled := false;

    dxBarLargeButtonOptimize.Enabled := false;
    dxBarLargeButtonRepair.Enabled := false;
end;

procedure TFormMain.DisableEnableDataControl(tag: integer);
var
    CanControl : boolean;
begin
    CanControl := false;
    case Tag of
            //acl
            0:
            begin
                CanControl := DMMain.CanUserControlTable('acl', User);
                if not CanControl then
                begin
                    DisableGrid(cxGridAAclGridDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    EnableGrid(cxGridAAclGridDBTableView1);
                    EnableButtons;
                end;
            end;

            //person
            1:
            begin
                CanControl := DMMain.CanUserControlTable('person', User);
                if not CanControl then
                begin
                    DisableGrid(cxGridAPersonGridDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    EnableGrid(cxGridAPersonGridDBTableView1);
                    EnableButtons;
                end;
            end;

            //channel
            2:
            begin
                CanControl := DMMain.CanUserControlTable('channel', User);
                if not CanControl then
                begin
                    //DisableGrid(cxGridAChannelsGridDBTableViewChannelsList);
                    DisableButtons;
                end
                else
                begin
                    EnableGrid(cxGridAChannelsGridDBTableViewChannelsList);
                    //EnableButtons;
                end;
            end;

            //genre
            3:
            begin
                CanControl := DMMain.CanUserControlTable('genre', User);
                if not CanControl then
                begin
                    DisableGrid(cxGridAGenresGridDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    EnableGrid(cxGridAGenresGridDBTableView1);
                    EnableButtons;
                end;
            end;

            //group
            4:
            begin
                CanControl := DMMain.CanUserControlTable('group', User);
                if not CanControl then
                begin
                    DisableGrid(cxGridAGroupsGridDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    EnableGrid(cxGridAGroupsGridDBTableView1);
                    EnableButtons;
                end;
            end;

            //movie
            5:
            begin
                CanControl := DMMain.CanUserControlTable('movie', User);
                if not CanControl then
                begin
                    //DisableGrid(cxGridAMoviesGridDBTableView1);
                    DisableGrid(cxGridMoviePersonsDBTableView1);
                    DisableGrid(cxGridMovieGenresDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    //EnableGrid(cxGridAMoviesGridDBTableView1);
                    EnableGrid(cxGridMoviePersonsDBTableView1);
                    EnableGrid(cxGridMovieGenresDBTableView1);
                    EnableButtons;
                end;
            end;

            //object
            6:
            begin
                CanControl := DMMain.CanUserControlTable('broadcast', User);
                if not CanControl then
                begin
                    DisableGrid(cxGridABroadcastsGridDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    EnableGrid(cxGridABroadcastsGridDBTableView1);
                    EnableButtons;
                end;
            end;

            //schedule
            7:
            begin
                CanControl := DMMain.CanUserControlTable('schedule', User);
                if not CanControl then
                begin
                    //DisableGrid(cxGridScheduleDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    //EnableGrid(cxGridScheduleDBTableView1);
                    EnableButtons;
                end;
            end;

            //series
            8:
            begin
                CanControl := DMMain.CanUserControlTable('series', User);
                if not CanControl then
                begin
                    //DisableGrid(cxGridASeriesGridDBTableView1);
                    DisableGrid(cxGridSeriesPersonsDBTableView1);
                    DisableGrid(cxGridSeriesEpisodesDBTableView1);
                    DisableGrid(cxGridSeriesGenresDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    //EnableGrid(cxGridASeriesGridDBTableView1);
                    EnableGrid(cxGridSeriesPersonsDBTableView1);
                    EnableGrid(cxGridSeriesEpisodesDBTableView1);
                    EnableGrid(cxGridSeriesGenresDBTableView1);
                    EnableButtons;
                end;
            end;

            //table
            9:
            begin
                CanControl := DMMain.CanUserControlTable('table', User);
                if not CanControl then
                begin
                    DisableGrid(cxGridATablesGridDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    EnableGrid(cxGridATablesGridDBTableView1);
                    EnableButtons;
                end;
            end;

            //type
            10:
            begin
                CanControl := DMMain.CanUserControlTable('type', User);
                if not CanControl then
                begin
                    DisableGrid(cxGridATypesGridDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    EnableGrid(cxGridATypesGridDBTableView1);
                    EnableButtons;
                end;
            end;

            //user
            11:
            begin
                CanControl := DMMain.CanUserControlTable('user', User);
                if not CanControl then
                begin
                    //DisableGrid(cxGridAUsersGridDBTableView1);
                    DisableButtons;
                end
                else
                begin
                    //EnableGrid(cxGridAUsersGridDBTableView1);
                    EnableButtons;
                end;
            end;

            //role
            12:
            begin
                CanControl := DMMain.CanUserControlTable('role', User);
                if not CanControl then
                    DisableButtons
                else
                    EnableButtons;
            end;

            //country
            13:
            begin
                CanControl := DMMain.CanUserControlTable('country', User);
                if not CanControl then
                    DisableButtons
                else
                    EnableButtons;
            end;
    end;

    if CanControl then ;//magic
end;

procedure TFormMain.cxComboBoxTypeIdPropertiesChange(Sender: TObject);
var
    category: WideString;
begin
    category := (Sender as TcxComboBox).Text;
    if category = 'передача' then DMMain.DSSelectObjects.DataSet := DMMain.AQSelectBroadcasts
    else if category = 'фильм' then DMMain.DSSelectObjects.DataSet := DMMain.AQSelectMovies
    else if category = 'сериал' then DMMain.DSSelectObjects.DataSet := DMMain.AQSelectSeriesWithEpisodes;

    DMMain.DSSelectObjects.DataSet.Close;
    DMMain.DSSelectObjects.DataSet.Open;

    cxLookupComboBoxObjectId.ItemIndex := -1;
end;

procedure TFormMain.cxDateEditDateFromPropertiesChange(Sender: TObject);
begin
    if Length(Trim(ToString(cxDateEditDateFrom.EditingValue))) = 0 then
        cxDateEditDateFrom.Date := GetMonday;

    GenerateWhereDateClause;
end;

procedure TFormMain.cxDateEditDateToPropertiesChange(Sender: TObject);
begin
    if Length(Trim(ToString(cxDateEditDateTo.EditingValue))) = 0 then
        cxDateEditDateTo.Date := GetSunday;
    GenerateWhereDateClause;
end;

procedure TFormMain.cxGridABroadcastsGridDBTableView1DblClick(Sender: TObject);
begin
    cxPageControlAProgramPage.ActivePage := cxTabSheetAProgramEditView;
end;

procedure TFormMain.cxGridAChannelsGridDBTableViewChannelsListDblClick(Sender: TObject);
begin
    cxPageControlAChannelPage.ActivePage := cxTabSheetAChannelEditView;
end;

procedure TFormMain.cxGridAPersonGridDBTableView1DblClick(Sender: TObject);
begin
    cxPageControlAPersonPage.ActivePage := cxTabSheetAPersonEditView;
end;

procedure TFormMain.cxGridAMoviesGridDBTableView1DblClick(Sender: TObject);
begin
    cxPageControlAMoviePage.ActivePage := cxTabSheetAMovieEditView;
end;

procedure TFormMain.cxGridASeriesGridDBTableView1DblClick(Sender: TObject);
begin
    cxPageControlASeriesPage.ActivePage := cxTabSheetASeriesEditView;
end;

procedure TFormMain.cxGridAUsersGridDBTableView1DblClick(Sender: TObject);
begin
    cxPageControlAUserPage.ActivePage := cxTabSheetAUserEditView;
end;

procedure TFormMain.cxGridDBTableView1DblClick(Sender: TObject);
begin
    cxPageControlASchedulePage.ActivePage := cxTabSheetAScheduleEditView;
end;

procedure TFormMain.cxGridDBTableView2CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
    if (DMMain.AQSelectMovies.Active) AND (DMMain.AQSelectMovies.FieldByName('movieId').AsInteger > 0) then
    begin
        DMMain.AQSelectMovieGenres.Edit;
    end;
end;

procedure TFormMain.cxGridScheduleDBTableView1DblClick(Sender: TObject);
begin
    FormScheduleDetailExtreme.ShowModal;
end;

procedure TFormMain.cxPageControlAChannelPagePageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
//    if MessageDlg('Сохранить изменения?', mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
//        DMMain.UpdateChannel
end;

procedure TFormMain.cxPageControlAdministrationPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
    UpdateStatusBar(2, NewPage.Caption);
    DisableEnableDataControl(NewPage.Tag);
end;

procedure TFormMain.cxTabSheetAAclShow(Sender: TObject);
begin
    DMMain.CloseOpenQuery(DMMain.AQSelectGroups);
    DMMain.CloseOpenQuery(DMMain.AQSelectTables);
    FillAAclGrid;
end;

procedure TFormMain.cxTabSheetAPersonEditViewShow(Sender: TObject);
begin
    FillAPersonEditView;
end;

procedure TFormMain.cxTabSheetAPersonGridViewShow(Sender: TObject);
begin
    FillAPersonGrid;
end;

procedure TFormMain.cxTabSheetAPersonShow(Sender: TObject);
begin
    FillAPersonGrid;
end;

procedure TFormMain.cxTabSheetAChannelEditViewShow(Sender: TObject);
begin
    FillAChannelEditView;
end;

procedure TFormMain.cxTabSheetAChannelGridViewShow(Sender: TObject);
begin
    FillAChannelGrid;
end;

procedure TFormMain.cxTabSheetAChannelShow(Sender: TObject);
begin
    FillAChannelGrid;
end;

procedure TFormMain.cxTabSheetACountryShow(Sender: TObject);
begin
    DMMain.RefreshQuery(DMMain.AQSelectCountries);
end;

procedure TFormMain.cxTabSheetAdministrationShow(Sender: TObject);
var
    i: integer;
    tags : TStringList;
begin
    tags := TStringList.Create;

    for i := 0 to cxPageControlAdministration.PageCount - 1 do
    begin
        cxPageControlAdministration.Pages[i].Enabled := false;
    end;

    DMMain.AQSelectUserTables.Close;
    DMMain.AQSelectUserTables.Parameters.ParamByName('userName').Value := User;
    DMMain.AQSelectUserTables.Open;

    DMMain.AQSelectUserTables.First;
    while not DMMain.AQSelectUserTables.Eof do
    begin
        tags.Add(ShowAdministrationPageTab(DMMain.AQSelectUserTables.FieldByName('tableName').Value, DMMain.AQSelectUserTables.FieldByName('aclAccess').Value));
        DMMain.AQSelectUserTables.Next;
    end;

    OpenTabSheetsByTag(tags);
end;

procedure TFormMain.OpenTabSheetsByTag(tags: TStringList);
var
    i: integer;
begin
    for i := 0 to cxPageControlAdministration.PageCount - 1 do
    begin
        if tags.IndexOf(IntToStr(cxPageControlAdministration.Pages[i].Tag)) <> -1 then
            cxPageControlAdministration.Pages[i].Enabled := True;
    end;
end;

function TFormMain.ShowAdministrationPageTab(TableName: string; UserRight: string): string;
begin
    if (TableName = 'acl') AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('0');
    end
    else if (TableName = 'person') AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('1');
    end
    else if (TableName = 'channel' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('2');
    end
    else if (TableName = 'genre' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('3');
    end
    else if (TableName = 'group' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('4');
    end
    else if (TableName = 'movie' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('5');
    end
    else if (TableName = 'broadcast' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('6');
    end
    else if (TableName = 'schedule' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('7');
    end
    else if (TableName = 'series' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('8');
    end
    else if (TableName = 'table' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('9');
    end
    else if (TableName = 'type' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('10');
    end
    else if (TableName = 'user' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('11');
    end
    else if (TableName = 'role' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('12');
    end
    else if (TableName = 'country' ) AND ((UserRight = 'полный доступ') OR (UserRight = 'только чтение')) then
    begin
        Result := ('13');
    end;
end;

procedure TFormMain.cxTabSheetAGenreShow(Sender: TObject);
begin
    FillAGenreGrid;
end;

procedure TFormMain.cxTabSheetAGroupShow(Sender: TObject);
begin
    FillAGroupGrid;
end;

procedure TFormMain.cxTabSheetAMovieEditViewShow(Sender: TObject);
begin
    if (DMMain.AQSelectMovies.Active) AND (DMMain.AQSelectMovies.FieldByName('movieId').AsInteger > 0) then
    begin
        FillAMovieEditView;
        
        DMMain.AQSelectMoviePersons.Parameters.ParamByName('movieId').value := DMMain.AQSelectMovies.FieldByName('movieId').AsInteger;
        DMMain.AQSelectMovieGenres.Parameters.ParamByName('movieId').value := DMMain.AQSelectMovies.FieldByName('movieId').AsInteger;
        DMMain.CloseOpenQuery(DMMain.AQSelectPersons);
        DMMain.CloseOpenQuery(DMMain.AQSelectGenres);
        DMMain.CloseOpenQuery(DMMain.AQSelectRoles);
        DMMain.CloseOpenQuery(DMMain.AQSelectMoviePersons);
        DMMain.CloseOpenQuery(DMMain.AQSelectMovieGenres);
    end
    else
    begin
        DMMain.AQSelectMoviePersons.Close;
        DMMain.AQSelectMovieGenres.Close;
    end;
end;

procedure TFormMain.cxTabSheetAMovieGridViewShow(Sender: TObject);
begin
    FillAMovieGrid;
end;

procedure TFormMain.cxTabSheetAMovieShow(Sender: TObject);
begin
    DMMain.RefreshQuery(DMMain.AQSelectCountries);

    FillAMovieGrid;
end;

procedure TFormMain.cxTabSheetAProgramEditViewShow(Sender: TObject);
begin
    if (DMMain.AQSelectBroadcasts.Active) AND (DMMain.AQSelectBroadcasts.FieldByName('broadcastId').AsInteger > 0) then
    begin
        FillABroadcastEditView;

        DMMain.AQSelectBroadcastPersons.Parameters.ParamByName('broadcastId').value := DMMain.AQSelectBroadcasts.FieldByName('broadcastId').AsInteger;
        DMMain.CloseOpenQuery(DMMain.AQSelectPersons);
        DMMain.CloseOpenQuery(DMMain.AQSelectRoles);
        DMMain.CloseOpenQuery(DMMain.AQSelectBroadcastPersons);
    end
    else
    begin
        DMMain.AQSelectBroadcastPersons.Close;
    end;
end;

procedure TFormMain.cxTabSheetAProgramShow(Sender: TObject);
begin
    FillABroadcastGrid;
end;

procedure TFormMain.cxTabSheetARoleShow(Sender: TObject);
begin
    DMMain.RefreshQuery(DMMain.AQSelectRoles);
end;

procedure TFormMain.cxTabSheetAScheduleEditViewShow(Sender: TObject);
begin
    DMMain.RefreshQuery(DMMain.AQSelectChannels);
    DMMain.RefreshQuery(DMMain.AQSelectTypes);

    FillAScheduleEditView;
end;

procedure TFormMain.cxTabSheetAScheduleGridViewShow(Sender: TObject);
begin
    FillAScheduleGrid;
    //DMMain.AQSelectSchedule.Properties['Unique Table'].Value := 'schedule';
    //DMMain.AQSelectSchedule.Properties['Resync Command'].Value := '';
    //RefreshQuery(DMMain.AQSelectSchedule );
end;

procedure TFormMain.cxTabSheetAScheduleShow(Sender: TObject);
begin
    FillAScheduleGrid;
end;

procedure TFormMain.cxTabSheetASeriesEditViewShow(Sender: TObject);
begin
    if (DMMain.AQSelectSeries.Active) AND (DMMain.AQSelectSeries.FieldByName('seriesId').AsInteger > 0) then
    begin
        FillASeriesEditView;

        DMMain.AQSelectSeriesPersons.Parameters.ParamByName('seriesId').value := DMMain.AQSelectSeries.FieldByName('seriesId').AsInteger;
        DMMain.AQSelectSeriesGenres.Parameters.ParamByName('seriesId').value := DMMain.AQSelectSeries.FieldByName('seriesId').AsInteger;
        DMMain.AQSelectSeriesEpisodes.Parameters.ParamByName('seriesId').value := DMMain.AQSelectSeries.FieldByName('seriesId').AsInteger;
        DMMain.CloseOpenQuery(DMMain.AQSelectPersons);
        DMMain.CloseOpenQuery(DMMain.AQSelectGenres);
        DMMain.CloseOpenQuery(DMMain.AQSelectCountries);
        DMMain.CloseOpenQuery(DMMain.AQSelectRoles);
        DMMain.CloseOpenQuery(DMMain.AQSelectSeriesGenres);
        DMMain.CloseOpenQuery(DMMain.AQSelectSeriesEpisodes);
        DMMain.CloseOpenQuery(DMMain.AQSelectSeriesPersons);
    end
    else
    begin
        DMMain.AQSelectSeriesGenres.Close;
        DMMain.AQSelectSeriesEpisodes.Close;
        DMMain.AQSelectSeriesPersons.Close;
    end;
end;

procedure TFormMain.cxTabSheetASeriesShow(Sender: TObject);
begin
    DMMain.RefreshQuery(DMMain.AQSelectCountries);

    FillASeriesGrid;
end;

procedure TFormMain.cxTabSheetATableShow(Sender: TObject);
begin
    FillATableGrid;
end;

procedure TFormMain.cxTabSheetATypeShow(Sender: TObject);
begin
    FillATypeGrid;
end;

procedure TFormMain.cxTabSheetAUserEditViewShow(Sender: TObject);
begin
    FillAUserEditView;

    DMMain.RefreshQuery(DMMain.AQSelectGroups);
end;

procedure TFormMain.cxTabSheetAUserGridViewShow(Sender: TObject);
begin
    DMMain.CloseOpenQuery(DMMain.AQSelectGroups);
    FillAUserGrid;
end;

procedure TFormMain.cxTabSheetAUserShow(Sender: TObject);
begin
    DMMain.CloseOpenQuery(DMMain.AQSelectGroups);
    FillAUserGrid;
end;

procedure TFormMain.cxTabSheetMainShow(Sender: TObject);
begin
    DMMain.RefreshMainScheduleQuery;
end;

procedure TFormMain.FillAPersonEditView();
var
    Query : TADOQuery;
begin
    Query := DMMain.AQSelectPersons;
    if (Query.Active) AND (Query.FieldByName('personId').AsInteger > 0) then
    begin
        cxTextEditPersonName.EditValue := Query.FieldByName('personName').Value;
        cxComboBoxPersonSex.EditValue := Query.FieldByName('personSex').Value;
        cxSpinEditPersonHeight.EditValue := Query.FieldByName('personHeight').Value;
        cxDateEditPersonBirthdate.EditValue := Query.FieldByName('personBirthdate').Value;
        cxDateEditPersonDeathdate.EditValue := Query.FieldByName('personDeathdate').Value;
        cxImagePersonPhoto.Picture.Assign(Query.FieldByName('personPhoto'));
        cxMemoPersonBio.EditValue := Query.FieldByName('personBio').Value;
    end;
end;

procedure TFormMain.FillAUserEditView();
var
    Query : TADOQuery;
begin
    Query := DMMain.AQSelectUsers;
    if (Query.Active) AND (Query.FieldByName('userId').AsInteger > 0) then
    begin
        cxTextEditUserName.EditValue := Query.FieldByName('userName').Value;
        cxMaskEditUserEmail.EditValue := Query.FieldByName('userEmail').Value;
        cxComboBoxUserShowInList.EditValue := Query.FieldByName('userShowInList').Value;
        cxLookupComboBoxGroupId.EditValue := Query.FieldByName('groupId').Value;
        cxMemoUserAbout.EditValue := Query.FieldByName('userAbout').Value;
        cxImageUserImage.Picture.Assign(Query.FieldByName('userImage'));
    end;
end;

procedure TFormMain.FillABroadcastEditView();
var
    Query: TADOQuery;
begin
    Query := DMMain.AQSelectBroadcasts;
    if (Query.Active) AND (Query.FieldByName('broadcastId').AsInteger > 0) then
    begin
        cxTextEditBroadcastName.EditValue := Query.FieldByName('broadcastName').Value;
        cxSpinEditBroadcastLength.EditValue := Query.FieldByName('broadcastLength').Value;
        cxMemoBroadcastDescription.EditValue := Query.FieldByName('broadcastDescription').Value;
    end;
end;

procedure TFormMain.FillASeriesEditView();
var
    Query : TADOQuery;
begin
    Query := DMMain.AQSelectSeries;
    if (Query.Active) AND (Query.FieldByName('seriesId').AsInteger > 0) then
    begin
        cxTextEditSeriesName.EditValue := Query.FieldByName('seriesName').Value;
        cxMemoSeriesDescription.EditValue := Query.FieldByName('seriesDescription').Value;
        cxComboBoxSeriesStatus.EditValue := Query.FieldByName('seriesStatus').Value;
        cxSpinEditSeriesLength.EditValue := Query.FieldByName('seriesLength').Value;
        cxLookupComboBoxSeriesCountryId.EditValue := Query.FieldByName('countryId').Value;
    end;
end;

procedure TFormMain.FillAMovieEditView();
var
    Query : TADOQuery;
begin
    Query := DMMain.AQSelectMovies;
    if (Query.Active) AND (Query.FieldByName('movieId').AsInteger > 0) then
    begin
        cxTextEditMovieName.EditValue := Query.FieldByName('movieName').Value;
        cxDateEditMovieDate.EditValue := Query.FieldByName('movieDate').Value;
        cxCurrencyEditMovieBudget.EditValue := Query.FieldByName('movieBudget').Value;
        cxCurrencyEditMovieReturns.EditValue := Query.FieldByName('movieReturns').Value;
        cxMemoMovieDescription.EditValue := Query.FieldByName('movieDescription').Value;
        cxLookupComboBoxMovieCountryId.EditValue := Query.FieldByName('countryId').Value;
        cxSpinEditMovieLength.EditValue := Query.FieldByName('movieLength').Value;
    end;
end;

procedure TFormMain.FillAChannelEditView();
var
    Query : TADOQuery;
begin
    Query := DMMain.AQSelectChannels;
    if (Query.Active) AND (Query.FieldByName('channelId').AsInteger > 0) then
    begin
        cxTextEditChannelName.EditValue := Query.FieldByName('channelName').Value;
        cxDateEditBroadcastStart.EditValue := Query.FieldByName('channelBroadcastStart').Value;
        cxHyperLinkEditChannelUrl.EditValue := Query.FieldByName('channelUrl').Value;
        cxImageChannelImage.Picture.Assign(Query.FieldByName('channelImage'));
        cxSpinEditChannelOrder.EditValue := Query.FieldByName('channelOrder').Value;
        cxMemoChannelDescription.EditValue := Query.FieldByName('channelDescription').Value;
    end;
end;

procedure TFormMain.FillAScheduleEditView();
var
    category: WideString;
    Query : TADOQuery;
begin
    Query := DMMain.AQSelectSchedule;
    if (Query.Active) AND (Query.FieldByName('scheduleId').AsInteger > 0) then
    begin
        cxLookupComboBoxChannelId.EditValue := Query.FieldByName('channelId').Value;
        cxComboBoxObjectCategory.Text := Query.FieldByName('scheduleType').Value;
        cxLookupComboBoxTypeId.EditValue := Query.FieldByName('typeId').Value;
        cxDateEditScheduleDate.EditValue := Query.FieldByName('scheduleDate').Value;
        cxTimeEditScheduleStart.EditValue := Query.FieldByName('scheduleStart').Value;
        cxTimeEditScheduleEnd.EditValue := Query.FieldByName('scheduleEnd').Value;
        cxComboBoxScheduleIsNextDay.EditValue := Query.FieldByName('scheduleIsNextDay').Value;

        category := cxComboBoxObjectCategory.Text;
        if category = 'передача' then DMMain.DSSelectObjects.DataSet := DMMain.AQSelectBroadcasts
        else if category = 'фильм' then DMMain.DSSelectObjects.DataSet := DMMain.AQSelectMovies
        else if category = 'сериал' then DMMain.DSSelectObjects.DataSet := DMMain.AQSelectSeriesWithEpisodes;

        DMMain.DSSelectObjects.DataSet.Close;
        DMMain.DSSelectObjects.DataSet.Open;

        cxLookupComboBoxObjectId.EditValue := Query.FieldByName('objectId').AsInteger;
    end;
end;

procedure TFormMain.FillAChannelGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectChannels);
end;

procedure TFormMain.FillAGenreGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectGenres);
end;

procedure TFormMain.FillATypeGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectTypes);
end;

procedure TFormMain.FillATableGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectTables);
end;

procedure TFormMain.FillAPersonGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectPersons);
end;

procedure TFormMain.FillAAclGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectAcl);
end;

procedure TFormMain.FillAGroupGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectGroups);
end;

procedure TFormMain.FillAMovieGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectMovies);
end;

procedure TFormMain.FillABroadcastGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectBroadcasts);
end;

procedure TFormMain.FillAScheduleGrid();
begin
    DMMain.RefreshScheduleQuery();
end;

procedure TFormMain.FillAUserGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectUsers);
end;

procedure TFormMain.FillASeriesGrid();
begin
    DMMain.RefreshQuery(DMMain.AQSelectSeries);
end;

procedure TFormMain.dxBarButton14Click(Sender: TObject);
begin
    dxComponentPrinter1Link1.OptionsSelection.ProcessSelection := false;
    dxComponentPrinter1Link1.OptionsSelection.ProcessExactSelection := false;
    dxComponentPrinter1.Print(true, nil, nil);
end;

procedure TFormMain.dxBarButton15Click(Sender: TObject);
begin
    dxComponentPrinter1Link1.OptionsSelection.ProcessSelection := true;
    dxComponentPrinter1Link1.OptionsSelection.ProcessExactSelection := true;
    dxComponentPrinter1.Print(true, nil, nil);
end;

procedure TFormMain.dxBarButton2Click(Sender: TObject);
begin
    CurrentReport := 'Channels';
end;

procedure TFormMain.dxBarButton3Click(Sender: TObject);
begin
    CurrentReport := 'Broadcast';
    FormProgressBar.ShowModal;
end;

procedure TFormMain.dxBarButton4Click(Sender: TObject);
begin
    CurrentReport := 'Series';
    FormProgressBar.ShowModal;
end;

procedure TFormMain.dxBarButton5Click(Sender: TObject);
begin
    CurrentReport := 'Movies';
    FormProgressBar.ShowModal;
end;

procedure TFormMain.dxBarLargeButtonAboutClick(Sender: TObject);
begin
    FormAbout.ShowModal;
end;

procedure TFormMain.dxBarLargeButtonAExportHTMLClick(Sender: TObject);
begin
    try
        MakeDirectory('export');
        case cxPageControlAdministration.ActivePage.Tag of
            //acl
            0: ExportGridToHtml('export/acl', cxGridAAclGrid, true, true);
            //person
            1: ExportGridToHtml('export/actor', cxGridAPersonGrid, true, true);
            //channel
            2: ExportGridToHtml('export/channel', cxGridAChannelsGrid, true, true);
            //genre
            3: ExportGridToHtml('export/genre', cxGridAGenresGrid, true, true);
            //group
            4: ExportGridToHtml('export/group', cxGridAGroupsGrid, true, true);
            //movie
            5: ExportGridToHtml('export/movie', cxGridAMoviesGrid, true, true);
            //object
            6: ExportGridToHtml('export/broadcast', cxGridABroadcastsGrid, true, true);
            //schedule
            7: ExportGridToHtml('export/schedule', cxGridAScheduleGrid, true, true);
            //series
            8: ExportGridToHtml('export/series', cxGridASeriesGrid, true, true);
            //table
            9: ExportGridToHtml('export/table', cxGridATablesGrid, true, true);
            //type
            10: ExportGridToHtml('export/type', cxGridATypesGrid, true, true);
            //user
            11: ExportGridToHtml('export/user', cxGridAUsersGrid, true, true);
            //role
            12: ExportGridToHtml('export/role', cxGridARoleGrid, true, true);
            //country
            13: ExportGridToHtml('export/country', cxGridACountryGrid, true, true);
        end;
    except

    end;
end;

procedure TFormMain.dxBarLargeButtonAExportTXTClick(Sender: TObject);
begin
    try
        MakeDirectory('export');
        case cxPageControlAdministration.ActivePage.Tag of
            //acl
            0: ExportGridToText('export/acl', cxGridAAclGrid, true, true);
            //person
            1: ExportGridToText('export/actor', cxGridAPersonGrid, true, true);
            //channel
            2: ExportGridToText('export/channel', cxGridAChannelsGrid, true, true);
            //genre
            3: ExportGridToText('export/genre', cxGridAGenresGrid, true, true);
            //group
            4: ExportGridToText('export/group', cxGridAGroupsGrid, true, true);
            //movie
            5: ExportGridToText('export/movie', cxGridAMoviesGrid, true, true);
            //object
            6: ExportGridToText('export/broadcast', cxGridABroadcastsGrid, true, true);
            //schedule
            7: ExportGridToText('export/schedule', cxGridAScheduleGrid, true, true);
            //series
            8: ExportGridToText('export/series', cxGridASeriesGrid, true, true);
            //table
            9: ExportGridToText('export/table', cxGridATablesGrid, true, true);
            //type
            10: ExportGridToText('export/type', cxGridATypesGrid, true, true);
            //user
            11: ExportGridToText('export/user', cxGridAUsersGrid, true, true);
            //role
            12: ExportGridToText('export/role', cxGridARoleGrid, true, true);
            //country
            13: ExportGridToText('export/country', cxGridACountryGrid, true, true);
        end;
    except

    end;
end;

procedure TFormMain.dxBarLargeButtonAExportXLSClick(Sender: TObject);
begin
    try
        MakeDirectory('export');
        case cxPageControlAdministration.ActivePage.Tag of
            //acl
            0: ExportGridToExcel('export/acl', cxGridAAclGrid, true, true);
            //person
            1: ExportGridToExcel('export/actor', cxGridAPersonGrid, true, true);
            //channel
            2: ExportGridToExcel('export/channel', cxGridAChannelsGrid, true, true);
            //genre
            3: ExportGridToExcel('export/genre', cxGridAGenresGrid, true, true);
            //group
            4: ExportGridToExcel('export/group', cxGridAGroupsGrid, true, true);
            //movie
            5: ExportGridToExcel('export/movie', cxGridAMoviesGrid, true, true);
            //object
            6: ExportGridToExcel('export/broadcast', cxGridABroadcastsGrid, true, true);
            //schedule
            7: ExportGridToExcel('export/schedule', cxGridAScheduleGrid, true, true);
            //series
            8: ExportGridToExcel('export/series', cxGridASeriesGrid, true, true);
            //table
            9: ExportGridToExcel('export/table', cxGridATablesGrid, true, true);
            //type
            10: ExportGridToExcel('export/type', cxGridATypesGrid, true, true);
            //user
            11: ExportGridToExcel('export/user', cxGridAUsersGrid, true, true);
            //role
            12: ExportGridToExcel('export/role', cxGridARoleGrid, true, true);
            //country
            13: ExportGridToExcel('export/country', cxGridACountryGrid, true, true);
        end;
    except

    end;
end;

procedure TFormMain.dxBarLargeButtonAExportXMLClick(Sender: TObject);
begin
    try
        MakeDirectory('export');
        case cxPageControlAdministration.ActivePage.Tag of
            //acl
            0: ExportGridToXml('export/acl', cxGridAAclGrid, true, true);
            //person
            1: ExportGridToXml('export/actor', cxGridAPersonGrid, true, true);
            //channel
            2: ExportGridToXml('export/channel', cxGridAChannelsGrid, true, true);
            //genre
            3: ExportGridToXml('export/genre', cxGridAGenresGrid, true, true);
            //group
            4: ExportGridToXml('export/group', cxGridAGroupsGrid, true, true);
            //movie
            5: ExportGridToXml('export/movie', cxGridAMoviesGrid, true, true);
            //object
            6: ExportGridToXml('export/broadcast', cxGridABroadcastsGrid, true, true);
            //schedule
            7: ExportGridToXml('export/schedule', cxGridAScheduleGrid, true, true);
            //series
            8: ExportGridToXml('export/series', cxGridASeriesGrid, true, true);
            //table
            9: ExportGridToXml('export/table', cxGridATablesGrid, true, true);
            //type
            10: ExportGridToXml('export/type', cxGridATypesGrid, true, true);
            //user
            11: ExportGridToXml('export/user', cxGridAUsersGrid, true, true);
            //role
            12: ExportGridToXml('export/role', cxGridARoleGrid, true, true);
            //country
            13: ExportGridToXml('export/country', cxGridACountryGrid, true, true);
        end;
    except

    end;
end;

procedure TFormMain.dxBarLargeButtonChangeUserClick(Sender: TObject);
begin
    FormAuthentication.ShowModal;
end;

procedure TFormMain.dxBarLargeButtonDeleteClick(Sender: TObject);
var
    Result: integer;
begin
    Result := 0;

    if MessageDlg('Удалить запись?', mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
    begin
    try
        case cxPageControlAdministration.ActivePage.Tag of
            //acl
            0: if DMMain.AQSelectAcl.FieldByName('aclId').AsInteger > 0 then
                Result := DMMain.DeleteGeneric(DMMain.AQSelectAcl);

            //person
            1:
            begin
                if DMMain.AQSelectPersons.FieldByName('personId').AsInteger > 0 then
                begin
                    Result := DMMain.DeletePerson;

                    if cxPageControlAPersonPage.ActivePage <> cxTabSheetAPersonGridView then
                        cxPageControlAPersonPage.ActivePage := cxTabSheetAPersonGridView;
                end;
            end;

            //channel
            2:
            begin
                if DMMain.AQSelectChannels.FieldByName('channelId').AsInteger > 0 then
                begin
                    Result := DMMain.DeleteChannel;
                    IsChannelChanged := true;

                    if cxPageControlAChannelPage.ActivePage <> cxTabSheetAChannelGridView then
                        cxPageControlAChannelPage.ActivePage := cxTabSheetAChannelGridView;
                end;
            end;

            //genre
            3: if DMMain.AQSelectGenres.FieldByName('genreId').AsInteger > 0 then
                    Result := DMMain.DeleteGeneric(DMMain.AQSelectGenres);

            //group
            4: if DMMain.AQSelectGroups.FieldByName('groupId').AsInteger > 0 then
                    Result := DMMain.DeleteGeneric(DMMain.AQSelectGroups);

            //movie
            5:
            begin
                if DMMain.AQSelectMovies.FieldByName('movieId').AsInteger > 0 then
                begin
                    Result := DMMain.DeleteGeneric(DMMain.AQSelectMovies);

                    if cxPageControlAMoviePage.ActivePage <> cxTabSheetAMovieGridView then
                        cxPageControlAMoviePage.ActivePage := cxTabSheetAMovieGridView;
                end;
            end;

            //broadcast
            6:
            begin
                if DMMain.AQSelectBroadcasts.FieldByName('broadcastId').AsInteger > 0 then
                begin
                    Result := DMMain.DeleteBroadcast;

                    if cxPageControlAProgramPage.ActivePage <> cxTabSheetAProgramGridView then
                        cxPageControlAProgramPage.ActivePage := cxTabSheetAProgramGridView;
                end;
            end;
            //schedule
            7:
            begin
                if DMMain.AQSelectSchedule.FieldByName('scheduleId').AsInteger > 0 then
                begin
                    Result := DMMain.DeleteSchedule;

                    if cxPageControlASchedulePage.ActivePage <> cxTabSheetAScheduleGridView then
                        cxPageControlASchedulePage.ActivePage := cxTabSheetAScheduleGridView;
                end;
            end;

            //series
            8:
            begin
                if DMMain.AQSelectSeries.FieldByName('seriesId').AsInteger > 0 then
                begin
                    Result := DMMain.DeleteSeries;

                    if cxPageControlASeriesPage.ActivePage <> cxTabSheetASeriesGridView then
                        cxPageControlASeriesPage.ActivePage := cxTabSheetASeriesGridView;
                end;
            end;

            //table
            9:
            if DMMain.AQSelectTables.FieldByName('tableId').AsInteger > 0 then
            begin
                DMMain.DeleteGeneric(DMMain.AQSelectTables);
            end;

            //type
            10:
            begin
                if DMMain.AQSelectTypes.FieldByName('typeId').AsInteger > 0 then
                begin
                    Result := DMMain.DeleteGeneric(DMMain.AQSelectTypes);
                    IsTypeChanged := true;
                end;
            end;

            //user
            11:
                if DMMain.AQSelectUsers.FieldByName('userId').AsInteger > 0 then
                begin
                    if DMMain.AQSelectUsers.FieldByName('userName').AsString = User then
                        MessageDlg('Нельзя удалить самого себя', mtWarning, [mbOK], 0)
                    else
                    begin
                        Result := DMMain.DeleteUser;
                        if cxPageControlAUserPage.ActivePage <> cxTabSheetAUserGridView then
                            cxPageControlAUserPage.ActivePage := cxTabSheetAUserGridView;
                    end;
                end;

            //role
            12:
            begin
                if DMMain.AQSelectRoles.FieldByName('roleId').AsInteger > 0 then
                    DMMain.DeleteGeneric(DMMain.AQSelectRoles);
            end;

            //country
            13:
            begin
                if DMMain.AQSelectCountries.FieldByName('countryId').AsInteger > 0 then
                    DMMain.DeleteGeneric(DMMain.AQSelectCountries);
            end;
        end;
        if Result = 1 then
        begin
            UpdateStatusBar(3, 'Объект успешно удален');
            TimerHideMessage.Enabled := true;
        end;
    except
        on E: Exception do
        MessageDlg('Ошибка запроса к базе данных: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
    end;
    end;
end;

procedure TFormMain.dxBarLargeButtonDonationsClick(Sender: TObject);
begin
    FormDonation.ShowModal;
end;

procedure TFormMain.dxBarLargeButtonExportClick(Sender: TObject);
begin
    CurrentReport := 'ScheduleExcel';
    FormProgressBar.ShowModal;
end;

procedure TFormMain.dxBarLargeButtonHelpClick(Sender: TObject);
begin
    WinExec('hh.exe Help.chm', SW_SHOWNORMAL);
end;

procedure TFormMain.dxBarLargeButtonInsertClick(Sender: TObject);
var
    Result: integer;
begin
    Result := 0;
    try
        case cxPageControlAdministration.ActivePage.Tag of
            //acl
            0: Result := DMMain.PostGeneric(DMMain.AQSelectAcl, 'insert');

            //person
            1:
            begin
                if cxPageControlAPersonPage.ActivePage <> cxTabSheetAPersonEditView then
                begin
                    cxPageControlAPersonPage.ActivePage := cxTabSheetAPersonEditView;
                    ResetPersonEditView;
                    IsInsertState := true;
                end
                else
                begin
                    if CheckEditValues('person') then
                    begin
                        Result := DMMain.InsertPerson;
                        IsInsertState := false;
                        if Result = 1 then
                            cxPageControlAPersonPage.ActivePage := cxTabSheetAPersonGridView;
                    end;
                end;
            end;

            //channel
            2:
            begin
                if cxPageControlAChannelPage.ActivePage <> cxTabSheetAChannelEditView then
                begin
                    cxPageControlAChannelPage.ActivePage := cxTabSheetAChannelEditView;
                    ResetChannelEditView;
                    IsInsertState := true;
                end
                else
                begin
                    if CheckEditValues('channel') then
                    begin
                        Result := DMMain.InsertChannel;
                        IsInsertState := false;
                        if Result = 1 then
                        begin
                            IsChannelChanged := true;
                            cxPageControlAChannelPage.ActivePage := cxTabSheetAChannelGridView;
                        end;
                    end;
                end;
            end;

            //genre
            3: Result := DMMain.PostGeneric(DMMain.AQSelectGenres, 'insert');

            //group
            4: Result := DMMain.PostGeneric(DMMain.AQSelectGroups, 'insert');

            //movie
            5:
            begin
                if cxPageControlAMoviePage.ActivePage <> cxTabSheetAMovieEditView then
                begin
                    cxPageControlAMoviePage.ActivePage := cxTabSheetAMovieEditView;
                    ResetMovieEditView;
                    IsInsertState := true;
                end
                else
                    if CheckEditValues('movie') then
                    begin
                        Result := DMMain.InsertMovie;
                        IsInsertState := false;
                        if Result = 1 then
                            cxPageControlAMoviePage.ActivePage := cxTabSheetAMovieGridView;
                    end;
            end;

            //broadcast
            6:
            begin
                if cxPageControlAProgramPage.ActivePage <> cxTabSheetAProgramEditView then
                begin
                    cxPageControlAProgramPage.ActivePage := cxTabSheetAProgramEditView;
                    ResetBroadcastEditView;
                    IsInsertState := true;
                end
                else
                    if CheckEditValues('broadcast') then
                    begin
                        Result := DMMain.InsertBroadcast;
                        IsInsertState := false;
                        if Result = 1 then
                            cxPageControlAProgramPage.ActivePage := cxTabSheetAProgramGridView;
                    end;
            end;

            //schedule
            7:
            begin
                if cxPageControlASchedulePage.ActivePage <> cxTabSheetAScheduleEditView then
                begin
                    cxPageControlASchedulePage.ActivePage := cxTabSheetAScheduleEditView;
                    ResetScheduleEditView;
                    IsInsertState := true;
                end
                else
                begin
                    if CheckEditValues('schedule') then
                    begin
                        Result := DMMain.InsertSchedule;
                        IsInsertState := false;
                        if Result = 1 then
                            cxPageControlASchedulePage.ActivePage := cxTabSheetAScheduleGridView;
                    end;
                end;
            end;

            //series
            8:
                if cxPageControlASeriesPage.ActivePage <> cxTabSheetASeriesEditView then
                begin
                    cxPageControlASeriesPage.ActivePage := cxTabSheetASeriesEditView;
                    ResetSeriesEditView;
                    IsInsertState := true;
                end
                else
                begin
                    if CheckEditValues('series') then
                    begin
                        Result := DMMain.InsertSeries;
                        IsInsertState := false;
                        if Result = 1 then
                            cxPageControlASeriesPage.ActivePage := cxTabSheetASeriesGridView;
                    end;
                end;

            //table
            9: Result := DMMain.PostGeneric(DMMain.AQSelectTables, 'insert');

            //type
            10:
            begin
                Result := DMMain.PostGeneric(DMMain.AQSelectTypes, 'insert');
                if Result = 1 then
                    IsTypeChanged := true;
            end;

            //user
            11:
            begin
                if cxPageControlAUserPage.ActivePage <> cxTabSheetAUserEditView then
                begin
                    cxPageControlAUserPage.ActivePage := cxTabSheetAUserEditView;
                    ResetUserEditView;
                    IsInsertState := true;
                end
                else
                    if CheckEditValues('userinsert') then
                    begin
                        Result := DMMain.InsertUser;
                        IsInsertState := false;
                        if Result = 1 then
                            cxPageControlAUserPage.ActivePage := cxTabSheetAUserGridView;
                    end;
            end;

            //role
            12:
            begin

            end;

            //country
            13:
            begin

            end;

        end;
        if Result = 1 then
        begin
            UpdateStatusBar(3, 'Объект успешно добавлен');
            TimerHideMessage.Enabled := true;
        end;
    except
        on E: Exception do
        begin
            if AnsiPos('entry', E.Message) > 0 then
            MessageDlg('Похожий объект уже содержится в базе данных.' + #10 + #10, mtInformation, [mbOK], 0)
            else MessageDlg('Ошибка запроса к базе данных: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
        end;
    end;
end;

procedure TFormMain.dxBarLargeButtonLockClick(Sender: TObject);
begin
    Hide;
    FormLock.cxTextEditUser.Text := User;
    FormLock.ShowModal;
end;

procedure TFormMain.dxBarLargeButtonLoginClick(Sender: TObject);
begin
    Logout;
    FormAuthentication.Show;
end;

procedure TFormMain.dxBarLargeButtonLogoutClick(Sender: TObject);
begin
    Logout;
end;

procedure TFormMain.dxBarLargeButtonOptimizeClick(Sender: TObject);
begin
    try
        case cxPageControlAdministration.ActivePage.Tag of
            //acl
            0: DMMain.OptimizeTable('acl') ;
            //actor
            1: DMMain.OptimizeTable('actor');
            //channel
            2: DMMain.OptimizeTable('channel');
            //genre
            3: DMMain.OptimizeTable('genre');
            //group
            4: DMMain.OptimizeTable('group');
            //movie
            5: DMMain.OptimizeTable('movie');
            //object
            6: DMMain.OptimizeTable('broadcast');
            //schedule
            7: DMMain.OptimizeTable('schedule');
            //series
            8: DMMain.OptimizeTable('series');
            //table
            9: DMMain.OptimizeTable('table');
            //type
            10: DMMain.OptimizeTable('type');
            //user
            11: DMMain.OptimizeTable('user');
            //role
            12: DMMain.OptimizeTable('role');
            //country
            13: DMMain.OptimizeTable('country');
        end;
        UpdateStatusBar(3, 'Таблица успешно оптимизирована');
        TimerHideMessage.Enabled := true;
    except
        on E: Exception do
        begin
            MessageDlg('Ошибка запроса к базе данных: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
        end;
    end;
end;

procedure TFormMain.dxBarLargeButtonProfileClick(Sender: TObject);
begin
    FormUserProfile.ShowModal;
end;

procedure TFormMain.dxBarLargeButtonRepairClick(Sender: TObject);
begin
    try
        case cxPageControlAdministration.ActivePage.Tag of
            //acl
            0: DMMain.RepairTable('acl') ;
            //actor
            1: DMMain.RepairTable('actor');
            //channel
            2: DMMain.RepairTable('channel');
            //genre
            3: DMMain.RepairTable('genre');
            //group
            4: DMMain.RepairTable('group');
            //movie
            5: DMMain.RepairTable('movie');
            //object
            6: DMMain.RepairTable('broadcast');
            //schedule
            7: DMMain.RepairTable('schedule');
            //series
            8: DMMain.RepairTable('series');
            //table
            9: DMMain.RepairTable('table');
            //type
            10: DMMain.RepairTable('type');
            //user
            11: DMMain.RepairTable('user');
            //role
            12: DMMain.RepairTable('role');
            //country
            13: DMMain.RepairTable('country');
        end;
        UpdateStatusBar(3, 'Таблица успешно починена');
        TimerHideMessage.Enabled := true;
    except
        on E: Exception do
        begin
            MessageDlg('Ошибка запроса к базе данных: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
        end;
    end;
end;

procedure TFormMain.dxBarLargeButtonShutdownClick(Sender: TObject);
begin
    Close;
end;

procedure TFormMain.dxBarLargeButtonThanksClick(Sender: TObject);
begin
    FormThanks.ShowModal;
end;

procedure TFormMain.dxBarLargeButtonUpdateClick(Sender: TObject);
var
    Result : Integer;
begin
    Result := 0;
    try
        case cxPageControlAdministration.ActivePage.Tag of
            //acl
            0: Result := DMMain.PostGeneric(DMMain.AQSelectAcl, 'edit');

            //person
            1:
            begin
                if cxPageControlAPersonPage.ActivePage <> cxTabSheetAPersonEditView then
                    cxPageControlAPersonPage.ActivePage := cxTabSheetAPersonEditView
                else
                begin
                    if IsInsertState then
                    begin
                        cxPageControlAPersonPage.ActivePage := cxTabSheetAPersonGridView;
                        IsInsertState := false;
                    end
                    else
                        if CheckEditValues('person') then
                            Result := DMMain.UpdatePerson;
                end;
            end;

            //channel
            2:
            begin
                if cxPageControlAChannelPage.ActivePage <> cxTabSheetAChannelEditView then
                    cxPageControlAChannelPage.ActivePage := cxTabSheetAChannelEditView
                else
                begin
                    if IsInsertState then
                    begin
                        cxPageControlAChannelPage.ActivePage := cxTabSheetAChannelGridView;
                        IsInsertState := false;
                    end
                    else
                        if CheckEditValues('channel') then
                        begin
                            Result := DMMain.UpdateChannel;
                            if Result = 1 then
                                IsChannelChanged := true;
                        end;
                end;
            end;

            //genre
            3: Result := DMMain.PostGeneric(DMMain.AQSelectGenres, 'edit');

            //group
            4: Result := DMMain.PostGeneric(DMMain.AQSelectGroups, 'edit');

            //movie
            5:
            begin
                if cxPageControlAMoviePage.ActivePage <> cxTabSheetAMovieEditView then
                    cxPageControlAMoviePage.ActivePage := cxTabSheetAMovieEditView
                else
                    if CheckEditValues('movie') then
                        Result := DMMain.UpdateMovie;
            end;

            //object
            6:
            begin
                if cxPageControlAProgramPage.ActivePage <> cxTabSheetAProgramEditView then
                    cxPageControlAProgramPage.ActivePage := cxTabSheetAProgramEditView
                else
                    if CheckEditValues('broadcast') then
                        Result := DMMain.UpdateBroadcast;
            end;

            //schedule
            7:
            begin
                if cxPageControlASchedulePage.ActivePage <> cxTabSheetAScheduleEditView then
                    cxPageControlASchedulePage.ActivePage := cxTabSheetAScheduleEditView
                else
                    if IsInsertState then
                    begin
                        cxPageControlASchedulePage.ActivePage := cxTabSheetAScheduleGridView;
                        IsInsertState := false;
                    end
                    else
                        if CheckEditValues('schedule') then
                            Result := DMMain.UpdateSchedule;
            end;

            //series
            8:
            begin
                if cxPageControlASeriesPage.ActivePage <> cxTabSheetASeriesEditView then
                    cxPageControlASeriesPage.ActivePage := cxTabSheetASeriesEditView
                else
                    if CheckEditValues('series') then
                        Result := DMMain.UpdateSeries;
            end;

            //table
            9: Result := DMMain.PostGeneric(DMMain.AQSelectTables, 'edit');

            //type
            10:
            begin
                Result := DMMain.PostGeneric(DMMain.AQSelectTypes, 'edit');
                if Result = 1 then
                    IsTypeChanged := true;
            end;

            //user
            11:
            begin
                if cxPageControlAUserPage.ActivePage <> cxTabSheetAUserEditView then
                    cxPageControlAUserPage.ActivePage := cxTabSheetAUserEditView
                else
                    if IsInsertState then
                    begin
                        cxPageControlAUserPage.ActivePage := cxTabSheetAUserGridView;
                        IsInsertState := false;
                    end
                    else
                        if CheckEditValues('userupdate') then
                            Result := DMMain.UpdateUser;
            end;

            //role
            12:
            begin

            end;

            //country
            13:
            begin

            end;
        end;
        if Result = 1 then
        begin
            UpdateStatusBar(3, 'Объект успешно обновлен');
            TimerHideMessage.Enabled := true;
        end;
    except
        on E: Exception do
        begin
            if AnsiPos('entry', E.Message) > 0 then
            MessageDlg('Похожий объект уже содержится в базе данных.' + #10 + #10, mtInformation, [mbOK], 0)
            else MessageDlg('Ошибка запроса к базе данных: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
        end;
    end;
end;

procedure TFormMain.dxBarSubItem2Click(Sender: TObject);
begin
    dxComponentPrinter1Link1.OptionsSelection.ProcessSelection := false;
    dxComponentPrinter1Link1.OptionsSelection.ProcessExactSelection := false;
    dxComponentPrinter1.Print(True,nil,nil);
end;

procedure TFormMain.dxRibbonMainTabChanged(Sender: TdxCustomRibbon);
begin
    if IsInitializated then
    begin
        if Sender.ActiveTab.Tag = 666 then
        begin
            cxPageControlMain.ActivePage := cxTabSheetAdministration;
            DisableEnableDataControl(7); //magic
        end
        else
        begin
            cxPageControlMain.ActivePage := cxTabSheetMain;
            UpdateStatusBar(2, '');

            if IsChannelChanged then
            begin
                FillChannels;
                IsChannelChanged := false;
            end;

            if IsTypeChanged then
            begin
                FillTypes;
                IsTypeChanged := false;
            end;
            
        end;
        UpdateStatusBar(1, cxPageControlMain.ActivePage.Caption);
    end;
end;

procedure TFormMain.ResetAdministrationTab;
begin
    cxPageControlAdministration.ActivePage := cxTabSheetASchedule;
    
    cxPageControlAChannelPage.ActivePage := cxTabSheetAChannelGridView;
    cxPageControlAPersonPage.ActivePage := cxTabSheetAPersonGridView;
    cxPageControlASchedulePage.ActivePage := cxTabSheetAScheduleGridView;
    cxPageControlAUserPage.ActivePage := cxTabSheetAUserGridView;
    cxPageControlAMoviePage.ActivePage := cxTabSheetAMovieGridView;
    cxPageControlASeriesPage.ActivePage := cxTabSheetASeriesGridView;
    cxPageControlAProgramPage.ActivePage := cxTabSheetAProgramGridView;
end;

procedure TFormMain.ResetChannelEditView;
begin
    cxTextEditChannelName.Clear;
    cxImageChannelImage.Clear;
    cxSpinEditChannelOrder.Clear;
    cxMemoChannelDescription.Clear;
    cxDateEditBroadcastStart.Clear;
    cxHyperLinkEditChannelUrl.Clear;
end;

procedure TFormMain.ResetMovieEditView;
begin
    cxTextEditMovieName.Clear;
    cxMemoMovieDescription.Clear;
    cxDateEditMovieDate.Clear;
    cxSpinEditMovieLength.Clear;
    cxLookupComboBoxMovieCountryId.Clear;
    cxCurrencyEditMovieBudget.Clear;
    cxCurrencyEditMovieReturns.Clear;

    DMMain.AQSelectMoviePersons.Close;
    DMMain.AQSelectMovieGenres.Close;
end;

procedure TFormMain.ResetSeriesEditView;
begin
    cxTextEditSeriesName.Clear;
    cxMemoSeriesDescription.Clear;
    cxComboBoxSeriesStatus.Clear;
    cxSpinEditSeriesLength.Clear;
    cxLookupComboBoxSeriesCountryId.Clear;

    DMMain.AQSelectSeriesGenres.Close;
    DMMain.AQSelectSeriesEpisodes.Close;
    DMMain.AQSelectSeriesPersons.Close;
end;

procedure TFormMain.ResetPersonEditView;
begin
    cxTextEditPersonName.Clear;
    cxComboBoxPersonSex.Clear;
    cxSpinEditPersonHeight.Clear;
    cxDateEditPersonBirthdate.Clear;
    cxDateEditPersonDeathdate.Clear;
    cxMemoPersonBio.Clear;
    cxImagePersonPhoto.Clear;
end;

procedure TFormMain.ResetBroadcastEditView;
begin
    cxTextEditBroadcastName.Clear;
    cxSpinEditBroadcastLength.Clear;
    cxMemoBroadcastDescription.Clear
end;

procedure TFormMain.ResetUserEditView;
begin
    cxTextEditUserName.Clear;
    cxMaskEditUserEmail.Clear;
    cxTextEditUserPassword.Clear;
    cxTextEditUserPasswordConfirmation.Clear;
    cxComboBoxUserShowInList.Clear;
    cxMemoUserAbout.Clear;
    cxImageUserImage.Clear;
end;

procedure TFormMain.ResetScheduleEditView;
begin
    cxDateEditScheduleDate.Clear;
    cxTimeEditScheduleStart.Clear;
    cxTimeEditScheduleEnd.Clear;
    cxLookupComboBoxObjectId.Clear;
    cxLookupComboBoxChannelId.Clear;
    cxLookupComboBoxTypeId.Clear;
    cxComboBoxObjectCategory.Clear;
    cxComboBoxScheduleIsNextDay.Clear;
end;

procedure TFormMain.FillDate();
begin
    cxDateEditDateFrom.Date := GetMonday;
    cxDateEditDateTo.Date := GetSunday;
(*
       1: 'Воскресенье';
       2: 'Понедельник';
       3: 'Вторник';
       4: 'Среда';
       5: 'Четверг';
       6: 'Пятница';
       7: 'Суббота';

*)
end;

procedure TFormMain.FillChannels();
var
    item: TcxCheckGroupItem;
begin
    cxCheckGroupChannels.Properties.Items.Clear;
    item := TcxCheckGroupItem.Create(cxCheckGroupChannels.Properties.Items);
    item.Tag := 0;
    item.Caption := 'Все';

    DMMain.CloseOpenQuery(DMMain.AQSelectChannels);

    DMMain.AQSelectChannels.First;
    while not DMMain.AQSelectChannels.Eof do
    begin
        item := TcxCheckGroupItem.Create(cxCheckGroupChannels.Properties.Items);
        item.Tag := DMMain.AQSelectChannels.FieldByName('channelId').AsInteger;
        item.Caption := DMMain.AQSelectChannels.FieldByName('channelName').AsWideString;

        DMMain.AQSelectChannels.Next;
    end;

    //задаем длину массивов равной количеству чекбоксов
    SetLength(CheckStatesChannels, cxCheckGroupChannels.Properties.Items.Count);
    //устанавливаем информацию о состояних всех чекбосков в Checked, чтобы не возникало
    //event'a о смене состояния в следующей строке
    SetCheckStatesState(CheckStatesChannels, True, cxCheckGroupChannels.Properties.Items.Count);
    //устанавливаем состояние всех чекбоксов в Checked, чтобы не возникало
    SetCheckGroupState(cxCheckGroupChannels, True);
end;

procedure TFormMain.FillTypes();
var item: TcxCheckGroupItem;
begin
    cxCheckGroupTypes.Properties.Items.Clear;
    item := TcxCheckGroupItem.Create(cxCheckGroupTypes.Properties.Items);
    item.Tag := 0;
    item.Caption := 'Все';

    DMMain.CloseOpenQuery(DMMain.AQSelectTypes);

    DMMain.AQSelectTypes.First;
    while not DMMain.AQSelectTypes.Eof do
    begin
        item := TcxCheckGroupItem.Create(cxCheckGroupTypes.Properties.Items);
        item.Tag := DMMain.AQSelectTypes.FieldByName('typeId').AsInteger;
        item.Caption := DMMain.AQSelectTypes.FieldByName('typeName').AsWideString;

        DMMain.AQSelectTypes.Next;
    end;

    SetLength(CheckStatesTypes,cxCheckGroupTypes.Properties.Items.Count);
    SetCheckStatesState(CheckStatesTypes, True, cxCheckGroupTypes.Properties.Items.Count);
    SetCheckGroupState(cxCheckGroupTypes, True);
end;

procedure TFormMain.FillTimes();
begin
    SetLength(CheckStatesTimes,cxCheckGroupTimes.Properties.Items.Count);
    SetCheckStatesState(CheckStatesTimes, True, cxCheckGroupTimes.Properties.Items.Count);
    SetCheckGroupState(cxCheckGroupTimes, True);
end;


procedure TFormMain.SuccessLogin(name: WideString);
begin
    IsLoggedIn := true;
    User := name;
    UpdateStatusBar(0, User);
    MessageDlg('Вы успешно авторизовались в системе', mtConfirmation, [mbOK], 0);

    dxBarLargeButtonProfile.Enabled := true;
    dxBarLargeButtonChangeUser.Enabled := true;
    dxBarLargeButtonLogout.Enabled := true;
    dxBarLargeButtonLogin.Enabled := false;
    dxBarLargeButtonLock.Enabled := true;
    dxRibbonMainTabAdministratrion.Visible := true;
end;

procedure TFormMain.TimerHideMessageTimer(Sender: TObject);
begin
    UpdateStatusBar(3, '');
    TimerHideMessage.Enabled := false;
end;

procedure TFormMain.Logout();
begin
    IsLoggedIn := false;
    UpdateStatusBar(0, 'Гость');

    dxBarLargeButtonProfile.Enabled := false;
    dxBarLargeButtonChangeUser.Enabled := false;
    dxBarLargeButtonLogout.Enabled := false;
    dxBarLargeButtonLogin.Enabled := true;
    dxBarLargeButtonLock.Enabled := false;
    dxRibbonMainTabAdministratrion.Visible := false;
end;

procedure TFormMain.UpdateStatusBar(Panel: Integer; Text: WideString);
begin
    dxRibbonStatusBarMain.Panels[Panel].Text := Text;
end;

function TFormMain.CheckEditValues(FormName : string) : boolean;
var
    Errors : TStringList;
begin
    Errors := TStringList.Create;

    if FormName = 'schedule' then
        CheckScheduleForm(Errors);

    if FormName = 'channel' then
    begin
        CheckChannelForm(Errors);
    end;

    if FormName = 'broadcast' then
    begin
        CheckBroadcastForm(Errors);
    end;

    if FormName = 'movie' then
    begin
        CheckMovieForm(Errors);
    end;

    if FormName = 'series' then
    begin
        CheckSeriesForm(Errors);
    end;

    if FormName = 'person' then
    begin
        CheckPersonForm(Errors);
    end;

    if FormName = 'userinsert' then
    begin
        CheckUserForm(Errors, 'insert');
    end;

    if FormName = 'userupdate' then
    begin
        CheckUserForm(Errors, 'update');    end;

    if FormName = 'userchangepassword' then
    begin
        CheckUserForm(Errors, 'changepassword');    end;

    if Errors.Count = 0 then
        Result := True
    else
    begin
        Errors.LineBreak := #10;
        MessageDlg('При заполнении формы возникли ошибки:' + #10 + #10 + Errors.Text, mtInformation, [mbOK], 0);
        Result := False;
    end;
end;

procedure TFormMain.CheckScheduleForm(Errors : TStringList);
begin
    if Length(Trim(ToString(cxLookupComboBoxChannelId.EditingValue))) = 0 then
        Errors.Add('- поле "Канал" не может быть пустым;');

    if Length(Trim(ToString(cxComboBoxObjectCategory.EditingValue))) = 0 then
        Errors.Add('- поле "Категория объектов" не может быть пустым;');

    if Length(Trim(ToString(cxLookupComboBoxObjectId.EditingValue))) = 0 then
        Errors.Add('- поле "Объект" не может быть пустым;');

    if Length(Trim(ToString(cxLookupComboBoxTypeId.EditingValue))) = 0 then
        Errors.Add('- поле "Тип" не может быть пустым;');

    if Length(Trim(ToString(cxDateEditScheduleDate.EditingValue))) = 0 then
        Errors.Add('- поле "Дата" не может быть пустым;');

    if Length(Trim(ToString(cxTimeEditScheduleStart.EditingValue))) = 0 then
        Errors.Add('- поле "Начало" не может быть пустым;');

    if Length(Trim(ToString(cxTimeEditScheduleEnd.EditingValue))) = 0 then
        Errors.Add('- поле "Конец" не может быть пустым;');

    if ToString(cxTimeEditScheduleStart.EditingValue) = ToString(cxTimeEditScheduleEnd.EditingValue) then
        Errors.Add('- время начала и конца не может совпадать;');

    //if Length(Trim(ToString(cxComboBoxScheduleIsNextDay.EditingValue))) = 0 then
    //    Errors.Add('- поле "Следующий день" не может быть пустым;' + ToString(cxComboBoxScheduleIsNextDay.EditingValue));
end;

procedure TFormMain.CheckChannelForm(Errors : TStringList);
begin
    if Length(Trim(ToString(cxTextEditChannelName.EditingText))) = 0 then
        Errors.Add('- поле "Название" не может быть пустым;');

    if Length(Trim(ToString(cxDateEditBroadcastStart.EditingValue))) = 0 then
        Errors.Add('- поле "Начало вещания" не может быть пустым;');

    if Length(Trim(ToString(cxHyperLinkEditChannelUrl.EditingText))) = 0 then
        Errors.Add('- поле "Сайт" не может быть пустым;');

    if Length(Trim(ToString(cxSpinEditChannelOrder.EditingText))) = 0 then
        Errors.Add('- поле "Порядок" не может быть пустым;');
end;

procedure TFormMain.CheckMovieForm(Errors : TStringList);
begin
    if Length(Trim(ToString(cxTextEditMovieName.EditingText))) = 0 then
        Errors.Add('- поле "Название" не может быть пустым;');

    if Length(Trim(ToString(cxDateEditMovieDate.EditingValue))) = 0 then
        Errors.Add('- поле "Дата выпуска" не может быть пустым;');

    if Length(Trim(ToString(cxLookupComboBoxMovieCountryId.EditingValue))) = 0 then
        Errors.Add('- поле "Страна" не может быть пустым;');

    if Length(Trim(ToString(cxCurrencyEditMovieBudget.EditingValue))) = 0 then
        Errors.Add('- поле "Бюджет" не может быть пустым;');
end;

procedure TFormMain.CheckSeriesForm(Errors : TStringList);
begin
    if Length(Trim(ToString(cxTextEditSeriesName.EditingText))) = 0 then
        Errors.Add('- поле "Название" не может быть пустым;');

    if Length(Trim(ToString(cxComboBoxSeriesStatus.EditingText))) = 0 then
        Errors.Add('- поле "Статус" не может быть пустым;');

    if Length(Trim(ToString(cxLookupComboBoxSeriesCountryId.EditingText))) = 0 then
        Errors.Add('- поле "Страна" не может быть пустым;');

    if Length(Trim(ToString(cxSpinEditSeriesLength.EditingText))) = 0 then
        Errors.Add('- поле "Длительность" не может быть пустым;');
end;

procedure TFormMain.CheckPersonForm(Errors : TStringList);
begin
    if Length(Trim(ToString(cxTextEditPersonName.EditingText))) = 0 then
        Errors.Add('- поле "Фамилия Имя Отчество" не может быть пустым;');

    if Length(Trim(ToString(cxDateEditPersonBirthdate.EditingValue))) = 0 then
        Errors.Add('- поле "Дата рождения" не может быть пустым;');

    if Length(Trim(ToString(cxComboBoxPersonSex.EditText))) = 0 then
        Errors.Add('- поле "Пол" не может быть пустым;');
end;

procedure TFormMain.CheckBroadcastForm(Errors: TStringList);
begin
    if Length(Trim(ToString(cxTextEditBroadcastName.EditingText))) = 0 then
        Errors.Add('- поле "Название" не может быть пустым;');
end;

procedure TFormMain.CheckUserForm(Errors : TStringList; Command : String);
begin
    if (Command = 'insert') OR (Command = 'update') then
    begin
        if Length(Trim(ToString(cxTextEditUserName.EditingText))) = 0 then
            Errors.Add('- поле "Имя пользователя" не может быть пустым;');

        if Length(Trim(ToString(cxLookupComboBoxGroupId.EditingValue))) = 0 then
            Errors.Add('- поле "Группа" не может быть пустым;');
    end;

    if (Command = 'insert') OR (Command = 'changepassword') then
    begin
        if Length(Trim(ToString(cxTextEditUserPassword.EditingValue))) = 0 then
            Errors.Add('- поле "Пароль" не может быть пустым;');

        if Length(Trim(ToString(cxTextEditUserPassword.EditingValue))) = 0 then
            Errors.Add('- поле "Подтверждение" не может быть пустым;');

        if ToString(cxTextEditUserPassword.EditingValue) <> ToString(cxTextEditUserPasswordConfirmation.EditingValue) then
            Errors.Add('- поля "Пароль" и "Подтверждение пароля" должны совпадать');
    end;
end;

end.


