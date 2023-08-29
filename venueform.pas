unit venueform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, Buttons, puppetmasterlib;

type

  { TfrmVenue }

  TfrmVenue = class(TForm)
    btnLocked: TSpeedButton;
    btnRollClass: TButton;
    btnRollName: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlHeader: TPanel;
    txtClass: TComboBox;
    txtNotes: TMemo;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollClassClick(Sender: TObject);
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
    procedure txtNotesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FVenue: TPMLeaf;
    procedure SetVenue(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Venue: TPMLeaf read FVenue write SetVenue;
  end;

var
  frmVenue: TfrmVenue;

implementation

{$R *.lfm}

{ TfrmVenue }

procedure TfrmVenue.txtTitleExit(Sender: TObject);
begin
  FVenue.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmVenue.txtClassExit(Sender: TObject);
begin
  FVenue.SetTrait('Class', txtClass.Text);
end;

procedure TfrmVenue.btnRollClassClick(Sender: TObject);
begin
  txtClass.ItemIndex := Random(txtClass.Items.Count);
  FVenue.SetTrait('Class', txtClass.Text);
end;

procedure TfrmVenue.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmVenue.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FVenue.SetTrait('Class', txtClass.Text);
end;

procedure TfrmVenue.txtClassSelect(Sender: TObject);
begin
  FVenue.SetTrait('Class', txtClass.Text);
end;

procedure TfrmVenue.txtNotesExit(Sender: TObject);
begin
  FVenue.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmVenue.txtNotesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FVenue.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmVenue.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FVenue.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmVenue.SetVenue(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Venue' then Exit;
  if FVenue = AValue then Exit;
  FVenue := AValue;
  txtTitle.Text := FVenue.GetTrait('Title');
  txtClass.Text := FVenue.GetTrait('Class');
  btnLocked.Down := FVenue.GetTrait('Locked') = 'True';
  LockForm;
end;

procedure TfrmVenue.LockForm;
begin
  txtTitle.Enabled  := not btnLocked.Down;
  txtClass.Enabled  := not btnLocked.Down;
  txtNotes.ReadOnly := btnLocked.Down;
  FVenue.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

