unit simpleform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, puppetmasterlib, LCLType;

type

  { TfrmSimple }

  TfrmSimple = class(TForm)
    btnLocked: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    pnlHeader: TPanel;
    txtNotes: TMemo;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
    procedure txtNotesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FLeaf: TLeaf;
    procedure SetLeaf(AValue: TLeaf);
    procedure LockForm;
  public
    property Leaf: TLeaf read FLeaf write SetLeaf;
  end;

var
  frmSimple: TfrmSimple;

implementation

{$R *.lfm}

{ TfrmSimple }

procedure TfrmSimple.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmSimple.txtNotesExit(Sender: TObject);
begin
  FLeaf.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmSimple.txtNotesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLeaf.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmSimple.txtTitleExit(Sender: TObject);
begin
  FLeaf.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmSimple.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FLeaf.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmSimple.SetLeaf(AValue: TLeaf);
begin
  if FLeaf = AValue then Exit;
  FLeaf := AValue;

  pnlHeader.Caption := FLeaf.Category;
  txtTitle.Text := FLeaf.Title;
  txtNotes.Text := FLeaf.Notes;

end;

procedure TfrmSimple.LockForm;
begin
  txtTitle.Enabled  := not btnLocked.Down;
  txtNotes.ReadOnly := btnLocked.Down;
  FLeaf.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

