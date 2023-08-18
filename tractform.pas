unit tractform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, LCLType,
  puppetmasterlib;

type

  { TfrmTract }

  TfrmTract = class(TForm)
    btnRollAll: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    txtFauna: TComboBox;
    txtFlora: TComboBox;
    txtManufactured: TComboBox;
    txtNatural: TComboBox;
    txtTitle: TEdit;
    procedure btnRollAllClick(Sender: TObject);
    procedure txtNaturalExit(Sender: TObject);
    procedure txtNaturalKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure txtNaturalSelect(Sender: TObject);
    procedure txtTitleExit(Sender: TObject);
    procedure txtTitleKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FTract: TPMLeaf;
    procedure SetTract(AValue: TPMLeaf);
  public
    property Tract: TPMLeaf read FTract write SetTract;
  end;

var
  frmTract: TfrmTract;

implementation

{$R *.lfm}

{ TfrmTract }

procedure TfrmTract.btnRollAllClick(Sender: TObject);
begin
  txtNatural.ItemIndex := Random(txtNatural.Items.Count);
  txtManufactured.ItemIndex := Random(txtManufactured.Items.Count);
  txtFlora.ItemIndex := Random(txtFlora.Items.Count);
  txtFauna.ItemIndex := Random(txtFauna.Items.Count);

  FTract.SetTrait('Natural', txtNatural.Text);
  FTract.SetTrait('Manufactured', txtManufactured.Text);
  FTract.SetTrait('Flora', txtFlora.Text);
  FTract.SetTrait('Fauna', txtFauna.Text);
end;

procedure TfrmTract.txtNaturalExit(Sender: TObject);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  FTract.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmTract.txtNaturalKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  if Key = VK_RETURN then
    FTract.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmTract.txtNaturalSelect(Sender: TObject);
var
  cbo : TComboBox;
begin
  cbo := TComboBox(Sender);
  FTract.SetTrait(cbo.Name.Replace('txt', ''), cbo.Text);
end;

procedure TfrmTract.txtTitleExit(Sender: TObject);
begin
  FTract.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmTract.txtTitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    FTract.SetTrait('Title', txtTitle.Text);
end;

procedure TfrmTract.SetTract(AValue: TPMLeaf);
begin
  if AValue.Category <> 'Tract' then exit;
  if FTract = AValue then Exit;
  FTract := AValue;
  txtTitle.Text := FTract.GetTrait('Title');
  txtNatural.Text := FTract.GetTrait('Natural');
  txtManufactured.Text := FTract.GetTrait('Manufactured');
  txtFlora.Text := FTract.GetTrait('Flora');
  txtFauna.Text := FTract.GetTrait('Fauna');
end;

end.

