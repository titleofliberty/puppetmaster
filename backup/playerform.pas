unit playerform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, puppetmasterlib;

type

  { TfrmPlayer }

  TfrmPlayer = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    txtCharacter: TEdit;
    txtClass: TEdit;
    txtPlayer: TEdit;
    txtRace: TEdit;
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
var
  txt: TEdit;
begin
  txt := TEdit(Sender);
  FPlayer.SetTrait(txt.Name.Replace('txt', ''), txt.Text);
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

end;


end.

