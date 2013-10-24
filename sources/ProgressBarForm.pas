unit ProgressBarForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Black, dxSkinsDefaultPainters,
  cxLabel, cxControls, cxContainer, cxEdit,
  cxProgressBar, ExtCtrls, StrUtils, cxLookAndFeelPainters;

type
  TFormProgressBar = class(TForm)
    cxProgressBarReport: TcxProgressBar;
    cxLabel1: TcxLabel;
    TimerProgressBar: TTimer;
    TimerStartGenerate: TTimer;
    procedure TimerProgressBarTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerStartGenerateTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProgressBar: TFormProgressBar;

implementation

uses DataModule, MainForm, Utils, Report;
{$R *.dfm}

procedure TFormProgressBar.FormShow(Sender: TObject);
begin
    TimerStartGenerate.Enabled := true;
end;

procedure TFormProgressBar.TimerProgressBarTimer(Sender: TObject);
begin
    TimerProgressBar.Enabled := false;
end;

procedure TFormProgressBar.TimerStartGenerateTimer(Sender: TObject);
begin
    TimerStartGenerate.Enabled := false;
    try
        if CurrentReport = 'ScheduleExcel' then
            TReport.GenerateScheduleReport
        else if CurrentReport = 'Movies' then
            TReport.GenerateMoviesReport
        else if CurrentReport = 'Series' then
            TReport.GenerateSeriesReport
        else if CurrentReport = 'Broadcast' then
            TReport.GenerateBroadcastReport
        else if CurrentReport = 'Channels' then
    finally
        Close;
    end;
end;

end.
