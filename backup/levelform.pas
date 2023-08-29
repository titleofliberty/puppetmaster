unit levelform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, puppetmasterlib, LCLType;

type

  { TfrmLevel }

  TfrmLevel = class(TForm)
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
    procedure btnLockedClick(Sender: TObject);
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FLevel: TPMLeaf;
    procedure SetLevel(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Level : TPMLeaf read FLevel write SetLevel;
  end;

var
  frmLevel: TfrmLevel;

implementation

{$R *.lfm}

{ TfrmLevel }

procedure TfrmLevel.txtTitleExit(Sender: TObject);
begin
  FLevel.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmLevel.txtClassExit(Sender: TObject);
begin
  FLevel.SetTrait('Class', txtClass.Text);
end;

procedure TfrmLevel.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmLevel.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLevel.SetTrait('Class', txtClass.Text);
end;

procedure TfrmLevel.txtClassSelect(Sender: TObject);
begin
  FLevel.SetTrait('Class', txtClass.Text);
end;

procedure TfrmLevel.txtNotesExit(Sender: TObject);
begin
  FLevel.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmLevel.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLevel.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmLevel.SetLevel(AValue: TPMLeaf);
begin
  if FLevel = AValue then Exit;
  FLevel := AValue;
  txtTitle.Text := FLevel.GetTrait('Title');
  txtClass.Text := FLevel.GetTrait('Class');
  txtNotes.Text := FLevel.GetTrait('Notes');
end;

procedure TfrmLevel.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtNotes.ReadOnly := btnLocked.Down;
  FLevel.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

