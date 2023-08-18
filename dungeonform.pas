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

procedure TfrmDungeon.txtClassExit(Sender: TObject);
begin
  FDungeon.SetTrait(txtClass.Name.Replace('txt', ''), txtClass.Text);
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

procedure TfrmDungeon.SetDungeon(AValue: TPMLeaf);
begin
  if FDungeon = AValue then Exit;
  FDungeon := AValue;
  txtTitle.Text  := FDungeon.Title;
  txtClass.Text  := FDungeon.GetTrait('Class');
end;

end.

