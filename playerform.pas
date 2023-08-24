unit playerform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, Buttons, puppetmasterlib;

type

  { TfrmPlayer }

  TfrmPlayer = class(TForm)
    btnLocked: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    pnlHeader: TPanel;
    txtCharacter: TEdit;
    txtClass: TEdit;
    txtPlayer: TEdit;
    txtRace: TEdit;
    procedure btnLockedClick(Sender: TObject);
    procedure txtPlayerExit(Sender: TObject);
    procedure txtPlayerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
  private
    FPlayer: TPMLeaf;
    procedure SetPlayer(AValue: TPMLeaf);
    procedure LockForm;
  public
    property Player: TPMLeaf read FPlayer write SetPlayer;
  end;

var
  frmPlayer: TfrmPlayer;

implementation

{$R *.lfm}

{ TfrmPlayer }

procedure TfrmPlayer.txtPlayerExit(Sender: TObject);
var
  txt: TEdit;
begin
  txt := TEdit(Sender);
  FPlayer.SetTrait(txt.Name.Replace('txt', ''), txt.Text);
end;

procedure TfrmPlayer.btnLockedClick(Sender: TObject);
begin
  LockForm;
end;

procedure TfrmPlayer.txtPlayerKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  txt: TEdit;
begin
  txt := TEdit(Sender);
  if Key = VK_RETURN then
    FPlayer.SetTrait(txt.Name.Replace('txt', ''), txt.Text);
end;

procedure TfrmPlayer.SetPlayer(AValue: TPMLeaf);
begin
  if FPlayer = AValue then exit;
  FPlayer := AValue;
  txtPlayer.Text := FPlayer.GetTrait('Player');
  txtCharacter.Text := FPlayer.GetTrait('Character');
  txtRace.Text := FPlayer.GetTrait('Race');
  txtClass.Text := FPlayer.GetTrait('Class');
  btnLocked.Down := FPlayer.GetTrait('Locked') = 'True';
  LockForm;
end;

procedure TfrmPlayer.LockForm;
begin
  txtPlayer.Enabled := not btnLocked.Down;
  txtCharacter.Enabled := not btnLocked.Down;
  txtRace.Enabled := not btnLocked.Down;
  txtClass.Enabled := not btnLocked.Down;
  FPlayer.SetTrait('Locked', BoolToStr(btnLocked.Down, 'True', 'False'));
end;


end.

