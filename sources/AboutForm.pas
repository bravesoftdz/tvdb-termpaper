unit AboutForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Black, dxSkinsDefaultPainters,
  dxSkinsdxLCPainter, dxLayoutControl,
  cxControls, dxGDIPlusClasses, cxContainer, cxEdit, cxImage, cxLabel;

type
  TFormAbout = class(TForm)
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    cxImage1: TcxImage;
    dxLayoutControl1Item1: TdxLayoutItem;
    cxLabel1: TcxLabel;
    dxLayoutControl1Item2: TdxLayoutItem;
    cxLabel2: TcxLabel;
    dxLayoutControl1Item3: TdxLayoutItem;
    procedure dxLayoutControl1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.dxLayoutControl1KeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #27: Close;
    end;
end;

procedure TFormAbout.FormKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #27: Close;
    end;
end;

end.
