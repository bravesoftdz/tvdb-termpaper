unit ScheduleReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  Menus, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls,
  cxButtons, cxGroupBox, cxControls, cxContainer, cxEdit, cxCheckGroup;

type
  TFormScheduleReport = class(TForm)
    cxCheckGroupChannels: TcxCheckGroup;
    cxCheckGroupTypes: TcxCheckGroup;
    cxCheckGroupTimes: TcxCheckGroup;
    cxGroupBoxDaperiod: TcxGroupBox;
    cxButtonMakeReport: TcxButton;
    cxDateEditFrom: TcxDateEdit;
    cxDateEditTo: TcxDateEdit;
    cxLabelDateFrom: TcxLabel;
    cxLabelDateTo: TcxLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormScheduleReport: TFormScheduleReport;

implementation

uses DataModule, MainForm;
{$R *.dfm}

procedure TFormScheduleReport.FormKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #27 : Close;    
    end;
end;

procedure TFormScheduleReport.FormShow(Sender: TObject);
begin
    ;
end;

end.
