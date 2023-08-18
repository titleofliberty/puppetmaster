unit wildernessform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  puppetmasterlib;

type

  { TfrmWilderness }

  TfrmWilderness = class(TForm)
    btnRollAll: TButton;
    txtClass: TComboBox;
    Label3: TLabel;
    txtTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure btnRollAllClick(Sender: TObject);
  private
    FWilderness: TPMLeaf;
    procedure SetWilderness(AValue: TPMLeaf);

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

procedure TfrmWilderness.SetWilderness(AValue: TPMLeaf);
begin
  if FWilderness = AValue then Exit;
  FWilderness := AValue;
  txtTitle.Text := FWilderness.GetTrait('Title');
  txtClass.Text := FWilderness.GetTrait('Class');
end;

end.

