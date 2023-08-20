unit roomform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  ExtCtrls, puppetmasterlib;

type

  { TfrmRoom }

  TfrmRoom = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    txtClass: TComboBox;
    txtCondition: TComboBox;
    txtTitle: TEdit;
    procedure txtClassEnter(Sender: TObject);
    procedure txtClassKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure txtClassSelect(Sender: TObject);
    procedure txtConditionExit(Sender: TObject);
    procedure txtConditionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtConditionSelect(Sender: TObject);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FRoom: TPMLeaf;
    procedure SetRoom(AValue: TPMLeaf);

  public
    property Room: TPMLeaf read FRoom write SetRoom;
  end;

var
  frmRoom: TfrmRoom;

implementation

{$R *.lfm}

{ TfrmRoom }

procedure TfrmRoom.txtTitleExit(Sender: TObject);
begin
  FRoom.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmRoom.txtClassEnter(Sender: TObject);
begin
  FRoom.SetTrait('Class', txtClass.Text);
end;

procedure TfrmRoom.txtClassKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FRoom.SetTrait('Class', txtClass.Text);
end;

procedure TfrmRoom.txtClassSelect(Sender: TObject);
begin
  FRoom.SetTrait('Class', txtClass.Text);
end;

procedure TfrmRoom.txtConditionExit(Sender: TObject);
begin
  FRoom.SetTrait('Condition', txtCondition.Text);
end;

procedure TfrmRoom.txtConditionKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FRoom.SetTrait('Condition', txtCondition.Text);
end;

procedure TfrmRoom.txtConditionSelect(Sender: TObject);
begin
  FRoom.SetTrait('Condition', txtCondition.Text);
end;

procedure TfrmRoom.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FRoom.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmRoom.SetRoom(AValue: TPMLeaf);
begin
  if FRoom = AValue then Exit;
  FRoom := AValue;
  txtTitle.Text := FRoom.GetTrait('Title');
  txtClass.Text := FRoom.GetTrait('Class');
  txtCondition.Text := FRoom.GetTrait('Condition');
end;

end.

