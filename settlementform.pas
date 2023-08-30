unit settlementform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLType, Buttons, puppetmasterlib;

type

  { TfrmSettlement }

  TfrmSettlement = class(TForm)
    btnLocked: TSpeedButton;
    btnRollAll: TButton;
    btnRollName: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlHeader: TPanel;
    txtNotes: TMemo;
    txtTitle: TEdit;
    txtClass: TComboBox;
    procedure btnLockedClick(Sender: TObject);
    procedure btnRollNameClick(Sender: TObject);
    procedure btnRollAllClick(Sender: TObject);
    procedure txtNotesExit(Sender: TObject);
    procedure txtNotesKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtWallsExit(Sender: TObject);
    procedure txtWallsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtWallsSelect(Sender: TObject);
  private
    FSettlement: TPMLeaf;
    procedure SetSettlement(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Settlement: TPMLeaf read FSettlement write SetSettlement;
  end;

var
  frmSettlement: TfrmSettlement;

implementation

{$R *.lfm}

{ TfrmSettlement }

procedure TfrmSettlement.btnRollNameClick(Sender: TObject);
begin
  FSettlement.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmSettlement.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmSettlement.btnRollAllClick(Sender: TObject);
var
  i : integer;
begin

end;

procedure TfrmSettlement.txtNotesExit(Sender: TObject);
begin
  FSettlement.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmSettlement.txtNotesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FSettlement.SetTrait('Notes', txtNotes.Text);
end;

procedure TfrmSettlement.txtTitleExit(Sender: TObject);
begin
  FSettlement.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmSettlement.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FSettlement.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmSettlement.txtWallsExit(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FSettlement.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmSettlement.txtWallsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FSettlement.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmSettlement.txtWallsSelect(Sender: TObject);
var
  cbo: TComboBox;
begin
  cbo := TComboBox(Sender);
  FSettlement.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmSettlement.SetSettlement(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Settlement' then Exit;
  if FSettlement = AValue then Exit;
  FSettlement := AValue;

  txtTitle.Text := FSettlement.GetTrait('Title');
  btnLocked.Down := FSettlement.GetTrait('Locked') = 'True';
  LockForm;
end;

procedure TfrmSettlement.LockForm;
begin
  txtTitle.Enabled := not btnLocked.Down;
  btnRollName.Enabled := not btnLocked.Down;
  btnRollAll.Enabled := not btnLocked.Down;
  txtNotes.ReadOnly := btnLocked.Down;
  FSettlement.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;

end.

