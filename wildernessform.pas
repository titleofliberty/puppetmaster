unit wildernessform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, Buttons, puppetmasterlib;

type

  { TfrmWilderness }

  TfrmWilderness = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlHeader: TPanel;
    btnLocked: TSpeedButton;
    txtClass: TComboBox;
    txtTitle: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollAllClick(Sender: TObject);
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

