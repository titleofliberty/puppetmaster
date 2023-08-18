unit dicetrayform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids,
  LCLType, ExtCtrls, Buttons, BCButton, BGRAResizeSpeedButton, BCSVGButton;

type

  { TfrmDiceTray }

  TfrmDiceTray = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txtTitle: TEdit;
    Label1: TLabel;
    procedure btnApplyClick(Sender: TObject);
    procedure grdDiceTrayKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FDiceTray: TPanel;
  public
    property DiceTrayPanel: TPanel read FDiceTray write FDiceTray;
  end;

var
  frmDiceTray: TfrmDiceTray;

implementation

{$R *.lfm}

{ TfrmDiceTray }

procedure TfrmDiceTray.btnApplyClick(Sender: TObject);
var
  r : integer;
  btn : TButton;
begin
  while FDiceTray.ControlCount > 0 do
    FDiceTray.Controls[0].Free;

  for r := grdDiceTray.RowCount - 1 downto 1 do
  begin
    btn := TButton.Create(FDiceTray);
    btn.Parent := FDiceTray;
    btn.Align := alLeft;
    btn.AutoSize := true;
    btn.Hint := grdDiceTray.Cells[1, r] + grdDiceTray.Cells[2, r] + grdDiceTray.Cells[3, r];
    btn.Caption:= grdDiceTray.Cells[1, r];
  end;
end;

procedure TfrmDiceTray.grdDiceTrayKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_INSERT) then
    grdDiceTray.InsertColRow(false, grdDiceTray.RowCount)
  else if (Key = VK_DELETE) then
    if grdDiceTray.RowCount > 1 then
      grdDiceTray.DeleteColRow(false, grdDiceTray.Row);

end;

end.

