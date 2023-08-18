unit playerform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  puppetmasterlib;

type

  { TfrmPlayer }

  TfrmPlayer = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtRace: TEdit;
    txtPlayer: TEdit;
    Label1: TLabel;
    txtCharacter: TEdit;
    txtClass: TEdit;
    procedure txtCharacterExit(Sender: TObject);
    procedure txtCharacterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtPlayerExit(Sender: TObject);
    procedure txtPlayerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
  private
    FPlayer: TPMLeaf;
    procedure SetPlayer(AValue: TPMLeaf);
  public
    property Player: TPMLeaf read FPlayer write SetPlayer;
  end;

var
  frmPlayer: TfrmPlayer;

implementation

{$R *.lfm}

{ TfrmPlayer }

procedure TfrmPlayer.txtPlayerExit(Sender: TObject);
begin
  FPlayer.SetTrait('Player', txtPlayer.Text);
end;

procedure TfrmPlayer.txtPlayerKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FPlayer.SetTrait('Player', txtPlayer.Text);
end;

procedure TfrmPlayer.txtCharacterExit(Sender: TObject);
begin
  FPlayer.SetTrait('Character', txtCharacter.Text);
end;

procedure TfrmPlayer.txtCharacterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FPlayer.SetTrait('Character', txtCharacter.Text);
end;

procedure TfrmPlayer.SetPlayer(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Player' then Exit;
  if FPlayer = AValue then Exit;
  FPlayer := AValue;
  txtPlayer.Text := FPlayer.GetTrait('Player');
  txtCharacter.Text := FPlayer.GetTrait('Character');
end;

end.

