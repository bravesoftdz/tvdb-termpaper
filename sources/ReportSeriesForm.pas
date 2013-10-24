unit ReportSeriesForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinOffice2007Black,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxMemo,
  cxLabel, cxCustomPivotGrid, cxDBPivotGrid;

type
  TFormReportSeries = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1seriesName: TcxGridDBColumn;
    cxGrid1DBTableView1seriesDescription: TcxGridDBColumn;
    cxGrid1DBTableView1episodeName: TcxGridDBColumn;
    cxGrid1DBTableView1episodeDescription: TcxGridDBColumn;
    cxGrid1DBTableView1seriesLength: TcxGridDBColumn;
    cxGrid1DBTableView1countryName: TcxGridDBColumn;
    cxGrid1DBTableView1episodeSeason: TcxGridDBColumn;
    cxGrid1DBTableView1episodeNumber: TcxGridDBColumn;
    cxGrid1DBTableView1genreName: TcxGridDBColumn;
    cxGrid1DBTableView1personName: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReportSeries: TFormReportSeries;

implementation

uses DataModule;

{$R *.dfm}

end.
