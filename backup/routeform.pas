unit routeform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, LCLType, puppetmasterlib;

type

  { TfrmRoute }

  TfrmRoute = class(TForm)
    btnLocked: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    pnlClient: TPanel;
    pnlHeader: TPanel;
    txtClass: TComboBox;
    txtNotes: TMemo;
    txtTitle: TEdit;
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
    procedure txtNotesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FRoute: TPMLeaf;
    procedure SetRoute(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Route: TPMLeaf read FRoute write SetRoute;
  end;

var
  frmRoute: TfrmRoute;

implementation

{$R *.lfm}

{ TfrmRoute }

procedure TfrmRoute.txtTitleExit(Sender: TObject);
begin
  FRoute.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmRoute.txtClassExit(Sender: TObject);
begin
  FRoute.SetTrait('Class', txtClass.Text);
end;

procedure TfrmRoute.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FRoute.SetTrait('Class', txtClass.Text);
end;

procedure TfrmRoute.txtClassSelect(Sender: TObject);
begin
  FRoute.SetTrait('Class', txtClass.Text);
end;

procedure TfrmRoute.txtNotesExit(Sender: TObject);
begin
  FRoute.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmRoute.txtNotesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FRoute.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmRoute.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FRoute.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmRoute.SetRoute(AValue: TPMLeaf);
begin
  if FRoute = AValue then Exit;
  FRoute := AValue;
  txtTitle.Text := FRoute.GetTrait('Title');
  txtClass.Text := FRoute.GetTrait('Class');
  txtNotes.Text := FRoute.GetTrait('Notes');
end;

procedure TfrmRoute.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtNotes.ReadOnly := btnLocked.Down;
  FRoute.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

