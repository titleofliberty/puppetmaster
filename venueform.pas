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
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlHeader: TPanel;
    txtClass: TComboBox;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollClassClick(Sender: TObject);
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FVenue: TPMLeaf;
    procedure SetVenue(AValue: TPMLeaf);
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
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  FVenue.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
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
end;

end.

