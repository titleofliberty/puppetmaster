unit floorform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  LCLType, Buttons, puppetmasterlib;

type

  { TfrmFloor }

  TfrmFloor = class(TForm)
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
    FFloor: TPMLeaf;
    procedure SetFloor(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Floor: TPMLeaf read FFloor write SetFloor;
  end;

var
  frmFloor: TfrmFloor;

implementation

{$R *.lfm}

{ TfrmFloor }

procedure TfrmFloor.txtTitleExit(Sender: TObject);
begin
  FFloor.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmFloor.txtClassExit(Sender: TObject);
begin
  FFloor.SetTrait('Class', txtClass.Text);
end;

procedure TfrmFloor.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FFloor.SetTrait('Class', txtClass.Text);
end;

procedure TfrmFloor.txtClassSelect(Sender: TObject);
begin
  FFloor.SetTrait('Class', txtClass.Text);
end;

procedure TfrmFloor.txtNotesExit(Sender: TObject);
begin
  FFloor.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmFloor.txtNotesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FFloor.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmFloor.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FFloor.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmFloor.SetFloor(AValue: TPMLeaf);
begin
  if FFloor = AValue then Exit;
  FFloor := AValue;
  txtTitle.Text := FFloor.GetTrait('Title');
  txtClass.Text := FFloor.GetTrait('Class');
  txtNotes.Text := FFloor.GetTrait('Notes');
end;

procedure TfrmFloor.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtNotes.ReadOnly := btnLocked.Down;
  FFloor.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

