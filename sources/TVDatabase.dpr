program TVDatabase;

uses
  Forms,
  ConnectionForm in 'ConnectionForm.pas' {FormConnection},
  DataModule in 'DataModule.pas' {DataModuleMain: TDataModule},
  MainForm in 'MainForm.pas' {FormMain},
  AuthenticationForm in 'AuthenticationForm.pas' {FormAuthentication},
  LockForm in 'LockForm.pas' {FormLock},
  UserProfile in 'UserProfile.pas' {FormUserProfile},
  ThanksForm in 'ThanksForm.pas' {FormThanks},
  AboutForm in 'AboutForm.pas' {FormAbout},
  Utils in 'Utils.pas',
  UContainer in 'UContainer.pas',
  IntfDocHostUIHandler in 'IntfDocHostUIHandler.pas',
  UNulContainer in 'UNulContainer.pas',
  DonationForm in 'DonationForm.pas' {FormDonation},
  ScheduleDetailExtremeForm in 'ScheduleDetailExtremeForm.pas' {FormScheduleDetailExtreme},
  ProgressBarForm in 'ProgressBarForm.pas' {FormProgressBar},
  Report in 'Report.pas',
  ReportSeriesForm in 'ReportSeriesForm.pas' {FormReportSeries};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.Title := 'TVDatabase';
  Application.CreateForm(TFormConnection, FormConnection);
  Application.CreateForm(TDataModuleMain, DMMain);
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAuthentication, FormAuthentication);
  Application.CreateForm(TFormLock, FormLock);
  Application.CreateForm(TFormUserProfile, FormUserProfile);
  Application.CreateForm(TFormThanks, FormThanks);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.CreateForm(TFormDonation, FormDonation);
  Application.CreateForm(TFormScheduleDetailExtreme, FormScheduleDetailExtreme);
  Application.CreateForm(TFormProgressBar, FormProgressBar);
  Application.CreateForm(TFormReportSeries, FormReportSeries);
  Application.Run;
end.
