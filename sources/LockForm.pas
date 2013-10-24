unit LockForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Black, dxSkinsDefaultPainters,
  Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel;

type
  TFormLock = class(TForm)
    cxLabelUser: TcxLabel;
    cxLabelPassword: TcxLabel;
    cxTextEditPassword: TcxTextEdit;
    cxButtonUnlock: TcxButton;
    cxLabelFormTitle: TcxLabel;
    cxTextEditUser: TcxTextEdit;
    function Unlock(userName: WideString; userPassword: WideString): integer;
    procedure cxButtonUnlockClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TryUnlock();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLock: TFormLock;
  SuccessUnlock: Boolean;
implementation

uses DataModule, MainForm;
{$R *.dfm}

procedure TFormLock.cxButtonUnlockClick(Sender: TObject);
begin
    TryUnlock;
end;

procedure TFormLock.TryUnlock;
var
    result: integer;
begin
    try
        result := Unlock(cxTextEditUser.Text, cxTextEditPassword.Text);
        if result = 1 then
        begin
            SuccessUnlock := true;
            Close;
        end
        else
        begin
            MessageDlg('Введен неверный пароль', mtWarning, [mbOK], 0);
        end;
    except
        on E: Exception do
          MessageDlg('Ошибка запроса к базе данных: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
    end;
end;

procedure TFormLock.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    if SuccessUnlock then
    begin
        MainForm.FormMain.Show;
        CanClose := true;
    end
    else
    begin
        if MessageDlg('Результат разблокировки отрицательный. Закрыть приложение?', mtConfirmation, [mbOk, mbCancel], 0) = mrCancel then
        begin
            CanClose := False;
        end
        else
            CanClose := True;
            MainForm.FormMain.Close;
    end;
end;

procedure TFormLock.FormKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #13: TryUnlock;
        #27: CloseModal;
    end;
end;

function TFormLock.Unlock(userName: WideString; userPassword: WideString): integer;
begin
    DMMain.AQUserLogin.Close;
    DMMain.AQUserLogin.Parameters.ParamByName('userName').Value := userName;
    DMMain.AQUserLogin.Parameters.ParamByName('userPassword').Value := userPassword;
    DMMain.AQUserLogin.Open;

    if DMMain.AQUserLogin.RecordCount > 0 then
        Result := 1
    else
        Result := -1;
end;

end.
