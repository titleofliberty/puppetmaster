unit dungeonform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, Buttons, puppetmasterlib;

type

  { TfrmDungeon }

  TfrmDungeon = class(TForm)
    btnLocked: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtNotes: TMemo;
    Panel1: TPanel;
    pnlClient: TPanel;
    pnlHeader: TPanel;
    txtClass: TComboBox;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
  private
    FDungeon: TPMLeaf;
    procedure SetDungeon(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Dungeon: TPMLeaf read FDungeon write SetDungeon;
  end;

var
  frmDungeon: TfrmDungeon;

implementation

{$R *.lfm}

{ TfrmDungeon }

procedure TfrmDungeon.txtClassExit(Sender: TObject);
begin
  FDungeon.SetTrait(txtClass.Name.Replace('txt', ''), txtClass.Text);
end;

procedure TfrmDungeon.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmDungeon.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FDungeon.SetTrait(txtClass.Name.Replace('txt', ''), txtClass.Text);
end;

procedure TfrmDungeon.txtClassSelect(Sender: TObject);
begin
  FDungeon.SetTrait(txtClass.Name.Replace('txt', ''), txtClass.Text);
end;

procedure TfrmDungeon.txtNotesExit(Sender: TObject);
begin
  FDungeon.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmDungeon.SetDungeon(AValue: TPMLeaf);
begin
  if FDungeon = AValue then Exit;
  FDungeon := AValue;
  txtTitle.Text := FDungeon.Title;
  txtClass.Text := FDungeon.GetTrait('Class');
  txtNotes.Text := FDungeon.GetTrait('Notes');
  btnLocked.Down:= FDungeon.GetTrait('Locked') = 'True';
  LockForm;
end;

procedure TfrmDungeon.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  txtNotes.ReadOnly := btnLocked.Down;
  FDungeon.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

