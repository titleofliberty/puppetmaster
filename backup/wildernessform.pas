unit wildernessform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, puppetmasterlib;

type

  { TfrmWilderness }

  TfrmWilderness = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    txtClass: TComboBox;
    txtTitle: TEdit;
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
  if AValue.Category <> 'Wilderness' then Exit;
  if FWilderness = AValue then Exit;
  FWilderness := AValue;
  txtTitle.Text := FWilderness.GetTrait('Title');
  txtClass.Text := FWilderness.GetTrait('Class');
end;

end.

