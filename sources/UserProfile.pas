unit UserProfile;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Black, dxSkinsDefaultPainters,
  cxControls, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxMemo, cxImage, cxDBEdit, cxDBLabel;

type
  TFormUserProfile = class(TForm)
    cxLabelFormTitle: TcxLabel;
    cxLabelUserNameLabel: TcxLabel;
    cxLabelUserGroupLabel: TcxLabel;
    cxLabelContactLabel: TcxLabel;
    cxLabelUserAboutLabel: TcxLabel;
    cxImageUserImage: TcxImage;
    cxLabelDataUserName: TcxLabel;
    cxLabelDataUserGroup: TcxLabel;
    cxLabelDataUserEmail: TcxLabel;
    cxMemoDataUserAbout: TcxMemo;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUserProfile: TFormUserProfile;

implementation

uses DataModule, MainForm;
{$R *.dfm}

procedure TFormUserProfile.FormKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #27: Close;
    end;
end;

procedure TFormUserProfile.FormShow(Sender: TObject);
begin
    try
        DMMain.AQGetUserByName.Close;
        DMMain.AQGetUserByName.Parameters.ParamByName('userName').Value := MainForm.User;
        DMMain.AQGetUserByName.Open;

        if DMMain.AQGetUserByName.RecordCount > 0 then
        begin
            DMMain.AQGetUserByName.First;

            cxLabelDataUserName.Caption := DMMain.AQGetUserByName.FIeldByName('userName').Value;
            cxLabelDataUserEmail.Caption:= DMMain.AQGetUserByName.FieldByName('userEmail').Value;
            cxMemoDataUserAbout.Text := DMMain.AQGetUserByName.FieldByName('userAbout').Value;

            if DMMain.AQGetUserByName.FieldByName('userImage').AsString = '' then
            begin
                
            end
            else
                cxImageUserImage.Picture.Assign(DMMain.AQGetUserByName.FieldByName('userImage'));
        end
        else
        begin
            MessageDlg('Невозможно получить информацию о пользователе!', mtError, [mbOK], 0);
            Close;
        end;
    except
        on E: Exception do
          MessageDlg('Ошибка запроса к базе данных: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
    end;

end;

end.
