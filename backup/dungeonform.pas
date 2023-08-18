unit dungeonform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  puppetmasterlib;

type

  { TfrmDungeon }

  TfrmDungeon = class(TForm)
    txtClass: TComboBox;
    Label3: TLabel;
    txtTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnRollAllClick(Sender: TObject);
    procedure txtClassExit(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
  private
    FDungeon: TPMLeaf;
    procedure SetDungeon(AValue: TPMLeaf);

  public
    property Dungeon: TPMLeaf read FDungeon write SetDungeon;
  end;

var
  frmDungeon: TfrmDungeon;

implementation

{$R *.lfm}

{ TfrmDungeon }

procedure TfrmDungeon.btnRollAllClick(Sender: TObject);
begin
  txtClass.ItemIndex := Random(txtClass.Items.Count);
  txtWalls.ItemIndex := Random(txtWalls.Items.Count);
  txtFloors.ItemIndex := Random(txtFloors.Items.Count);
end;

procedure TfrmDungeon.txtClassExit(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FDungeon.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmDungeon.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  if Key = VK_RETURN then
    FDungeon.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmDungeon.txtClassSelect(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FDungeon.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmDungeon.SetDungeon(AValue: TPMLeaf);
begin
  if FDungeon = AValue then Exit;
  FDungeon := AValue;
  txtTitle.Text  := FDungeon.Title;
  txtClass.Text  := FDungeon.GetTrait('Class');
  txtWalls.Text  := FDungeon.GetTrait('Walls');
  txtFloors.Text := FDungeon.GetTrait('Floors');
end;

end.

