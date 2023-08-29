unit wildernessform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, Buttons, puppetmasterlib;

type

  { TfrmWilderness }

  TfrmWilderness = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlHeader: TPanel;
    btnLocked: TSpeedButton;
    txtClass: TComboBox;
    txtNotes: TMemo;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollAllClick(Sender: TObject);
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
    procedure txtNotesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FWilderness: TPMLeaf;
    procedure SetWilderness(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Wilderness: TPMLeaf read FWilderness write SetWilderness;
  end;

var
  frmWilderness: TfrmWilderness;

implementation

{$R *.lfm}

{ TfrmWilderness }

procedure TfrmWilderness.btnRollAllClick(Sender: TObject);
begin
  txtClass.ItemIndex := Random(txtClass.Items.Count);
end;

procedure TfrmWilderness.txtClassExit(Sender: TObject);
begin
  FWilderness.SetTrait('Class', txtClass.Text);
end;

procedure TfrmWilderness.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FWilderness.SetTrait('Class', txtClass.Text);
end;

procedure TfrmWilderness.txtClassSelect(Sender: TObject);
begin
  FWilderness.SetTrait('Class', txtClass.Text);
end;

procedure TfrmWilderness.txtNotesExit(Sender: TObject);
begin
  FWilderness.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmWilderness.txtNotesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FWilderness.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmWilderness.txtTitleExit(Sender: TObject);
begin
  FWilderness.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmWilderness.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FWilderness.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmWilderness.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmWilderness.SetWilderness(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Wilderness' then Exit;
  if FWilderness = AValue then Exit;
  FWilderness := AValue;
  txtTitle.Text := FWilderness.GetTrait('Title');
  txtClass.Text := FWilderness.GetTrait('Class');
  btnLocked.Down := FWilderness.GetTrait('Locked') = 'True';
  LockForm;
end;

procedure TfrmWilderness.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  FWilderness.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

