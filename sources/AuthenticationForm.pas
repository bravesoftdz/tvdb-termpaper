unit AuthenticationForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,   dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Black, dxSkinsDefaultPainters,
  Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel, cxGraphics,
  cxMaskEdit, cxDropDownEdit, cxGroupBox, ADOdb;

type
  TFormAuthentication = class(TForm)
    cxLabelFormTitle: TcxLabel;
    cxLabelUser: TcxLabel;
    cxTextEditPassword: TcxTextEdit;
    cxLabelPassword: TcxLabel;
    cxButtonLogin: TcxButton;
    cxComboBoxUserSelect: TcxComboBox;
    procedure GetUsers;
    procedure cxButtonLoginClick(Sender: TObject);
    function Login(userName: WideString; userPassword: WideString): integer;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TryLogin();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    FormAuthentication: TFormAuthentication;
    IsInitializated: Boolean;

implementation

uses DataModule, MainForm;
    
{$R *.dfm}

procedure TFormAuthentication.cxButtonLoginClick(Sender: TObject);
begin
    //
    TryLogin;
end;

procedure TFormAuthentication.TryLogin;
var
    result: integer;
begin
    try
        result := Login(cxComboBoxUserSelect.Text, cxTextEditPassword.Text);
        if result = 1 then
        begin
            MainForm.FormMain.SuccessLogin(cxComboBoxUserSelect.Text);
            Close;
        end
        else
        begin
            MessageDlg('Указанная комбинация имени пользователя и пароля не существует', mtWarning, [mbOK], 0);
        end;
    except
        on E: Exception do
          MessageDlg('Ошибка запроса к базе данных: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
    end;
end;

procedure TFormAuthentication.FormKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #13: TryLogin;
        #27: Close;
    end;

   end;

procedure TFormAuthentication.FormShow(Sender: TObject);
begin
    if NOT IsInitializated then
    begin
        GetUsers;
        IsInitializated := True;
    end;
end;

procedure TFormAuthentication.GetUsers;
begin
    With DMMain.AQSelectUsersByVisible do
    begin
        Close;
        Parameters.ParamByName('userShowInList').Value := 'да';
        Open;

        First;
        while not Eof do
        begin
            cxComboBoxUserSelect.Properties.Items.Add(FieldByName('userName').AsWideString);
            Next;
        end;
    end;
end;

function TFormAuthentication.Login(userName: WideString; userPassword: WideString): integer;
begin
    With DMMain.AQUserLogin do
    begin
        Close;
        Parameters.ParamByName('userName').Value := userName;
        Parameters.ParamByName('userPassword').Value := userPassword;
        Open;

        if RecordCount > 0 then
            Result := 1
        else
            Result := -1;
    end;
end;

end.
