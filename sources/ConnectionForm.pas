unit ConnectionForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  dxSkinsCore, dxSkinBlack,
  dxSkinOffice2007Black, dxSkinsDefaultPainters,
  cxLookAndFeels, cxPropertiesStore,
  dxSkinsForm, cxLookAndFeelPainters, cxTextEdit, cxLabel, cxControls,
  cxContainer, cxEdit, cxGroupBox, Menus, StdCtrls, cxButtons, Registry,
  cxGraphics, cxMaskEdit, cxDropDownEdit, dxRibbonForm, DataModule, MainForm;

type
  TFormConnection = class(TdxRibbonForm)
    cxLabelODBCDataSource: TcxLabel;
    cxLabelDBUser: TcxLabel;
    cxLabelDBPassword: TcxLabel;
    cxTextEditDBPassword: TcxTextEdit;
    cxTextEditDBUser: TcxTextEdit;
    cxButtonConnect: TcxButton;
    cxLabelFormTitle: TcxLabel;
    cxComboBoxDSSelect: TcxComboBox;
    dxSkinController1: TdxSkinController;
    procedure GetDataSourceNames();
    procedure FormShow(Sender: TObject);
    procedure cxButtonConnectClick(Sender: TObject);
    procedure Connect();
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private

  public
    { Public declarations }
  end;

var
  FormConnection: TFormConnection;

implementation

{$R *.dfm}

procedure TFormConnection.cxButtonConnectClick(Sender: TObject);
begin
    Connect;
end;

procedure TFormConnection.Connect();
begin
    if cxComboBoxDSSelect.SelectedItem >=0  then
    begin
      try
        if NOT DMMain.ADOConnectionMain.Connected then
        begin
                dmMain.ADOConnectionMain.ConnectionString := 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=' + cxComboBoxDSSelect.Properties.Items[cxComboBoxDSSelect.SelectedItem];
                dmMain.ADOConnectionMain.Open(cxTextEditDBUser.Text, cxTextEditDBPassword.Text);
        end;
        FormConnection.Visible := False;
        FormMain.ShowModal;
      except
        on E: Exception do
          MessageDlg('Ошибка соединения с сервером базы данных: ' + #10 + #10 + E.message, mtError, [mbOK], 0);
      end
    end
    else
      MessageDlg('Выберите источник данных', mtWarning, [mbOK], 0);
end;

procedure TFormConnection.FormKeyPress(Sender: TObject; var Key: Char);
begin
    case Key of
        #13: Connect;
        #27: Close;
    end;
end;

procedure TFormConnection.FormShow(Sender: TObject);
begin
  GetDataSourceNames();
end;

procedure TFormConnection.GetDataSourceNames();
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\ODBC\ODBC.INI\ODBC Data Sources', False) then
    begin
      reg.GetValueNames(cxComboBoxDSSelect.Properties.Items);
    end;
  finally
    reg.CloseKey;
    FreeAndNil(reg);
  end;
end;

end.
