unit campaignform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  puppetmasterlib;

type

  { TfrmCampaign }

  TfrmCampaign = class(TForm)
    txtName: TEdit;
    Label1: TLabel;
    procedure txtNameExit(Sender: TObject);
    procedure txtNameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FCampaign: TPMCampaign;
    procedure SetCampaign(AValue: TPMCampaign);

  public
    property Campaign: TPMCampaign read FCampaign write SetCampaign;
  end;

var
  frmCampaign: TfrmCampaign;

implementation

{$R *.lfm}

{ TfrmCampaign }

procedure TfrmCampaign.txtNameExit(Sender: TObject);
begin
  FCampaign.Name := txtName.Text;
end;

procedure TfrmCampaign.txtNameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  FCampaign.Name := txtName.Text;
end;

procedure TfrmCampaign.SetCampaign(AValue: TPMCampaign);
begin
  if FCampaign = AValue then Exit;
  FCampaign := AValue;
  txtName.Text := FCampaign.Name;
end;

end.

