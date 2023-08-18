unit venueform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  puppetmasterlib;

type

  { TfrmVenue }

  TfrmVenue = class(TForm)
    btnRollName: TButton;
    btnRollClass: TButton;
    Label3: TLabel;
    txtClass: TComboBox;
    Label2: TLabel;
    txtName: TEdit;
    Label1: TLabel;
    procedure btnRollClassClick(Sender: TObject);
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtNameExit(Sender: TObject);
    procedure txtNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TfrmVenue.txtNameExit(Sender: TObject);
begin
  FVenue.SetTrait('Title', txtName.Text);
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

procedure TfrmVenue.txtNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FVenue.SetTrait('Title', txtName.Text);
end;

procedure TfrmVenue.SetVenue(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Venue' then Exit;
  if FVenue = AValue then Exit;
  FVenue := AValue;
  txtName.Text := FVenue.GetTrait('Title');
  txtClass.Text := FVenue.GetTrait('Class');
end;

end.
