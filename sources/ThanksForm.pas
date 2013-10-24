unit ThanksForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Black, dxSkinsDefaultPainters,
  dxSkinsdxLCPainter, dxGDIPlusClasses,
  dxLayoutControl, jpeg, cxContainer, cxEdit, cxImage, cxControls;

type
  TFormThanks = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxImageFalcon: TcxImage;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxImageDevEx: TcxImage;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxImageKeyboard: TcxImage;
    dxLayoutControl1Item3: TdxLayoutItem;
    cxImageMonitor: TcxImage;
    dxLayoutControl1Item4: TdxLayoutItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormThanks: TFormThanks;

implementation

{$R *.dfm}

procedure TFormThanks.FormKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #27: Close;
    end;
end;

end.
