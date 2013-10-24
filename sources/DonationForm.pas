unit DonationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls,   dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Black, dxSkinsDefaultPainters,
  dxSkinsdxLCPainter, dxGDIPlusClasses, cxImage, dxLayoutControl, cxContainer,
  cxEdit, cxLabel, cxControls;

type
  TFormDonation = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxLabel1: TcxLabel;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxImage1: TcxImage;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxLabel2: TcxLabel;
    dxLayoutControl1Item3: TdxLayoutItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
  public
    { Public declarations }
  end;

var
  FormDonation: TFormDonation;

implementation


{$R *.dfm}

procedure TFormDonation.FormKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #27: Close;
    end;
end;

end.
