unit campaignsform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, csvdocument,
  FileUtil, puppetmasterlib;

type

  { TfrmCampaigns }

  TfrmCampaigns = class(TForm)
    btnCancel: TButton;
    btnNew: TButton;
    btnOpen: TButton;
    btnDelete: TButton;
    Label2: TLabel;
    lstCampaigns: TListBox;
    txtNew: TEdit;
    Label1: TLabel;
    procedure btnDeleteClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lstCampaignsClick(Sender: TObject);
    procedure txtNewChange(Sender: TObject);
  private
    FCampaign: TPMCampaign;
  public
    property Campaign: TPMCampaign read FCampaign;
  end;

var
  frmCampaigns: TfrmCampaigns;

implementation

{$R *.lfm}

{ TfrmCampaigns }

procedure TfrmCampaigns.FormCreate(Sender: TObject);
var
  i : integer;
  csv: TCSVDocument;
  cpn: TPMCampaign;
  path: string;
  files: TStringList;
begin
  FCampaign := TPMCampaign.Create;
  path := ConcatPaths([GetUserDir, 'Documents', 'Puppetmaster Campaigns']);
  if not DirectoryExists(path) then
    ForceDirectories(path);

  files := FindAllFiles(path, '*.*', false);
  for i := 0 to files.Count - 1 do
  begin
    cpn := TPMCampaign.Create;
    cpn.LoadFromFile(files[i]);
    lstCampaigns.Items.AddObject(cpn.Name, cpn);
  end;
end;

procedure TfrmCampaigns.lstCampaignsClick(Sender: TObject);
begin
  btnOpen.Enabled := (lstCampaigns.Count > 0) and (lstCampaigns.ItemIndex > -1);
  btnDelete.Enabled := (lstCampaigns.Count > 0) and (lstCampaigns.ItemIndex > -1);
end;

procedure TfrmCampaigns.btnNewClick(Sender: TObject);
begin
  FCampaign.Name := txtNew.Text;
  FCampaign.SaveToFile;
  Self.ModalResult := mrOk;
end;

procedure TfrmCampaigns.btnDeleteClick(Sender: TObject);
var
  camp: TPMCampaign;
  path: string;
begin
  camp := TPMCampaign(lstCampaigns.Items.Objects[lstCampaigns.ItemIndex]);
  path := ConcatPaths([GetUserDir, 'Documents', 'Puppetmaster Campaigns', camp.ID]);
  DeleteFile(path);
  lstCampaigns.DeleteSelected;
  btnOpen.Enabled := (lstCampaigns.Count > 0) and (lstCampaigns.ItemIndex > -1);
  btnDelete.Enabled := (lstCampaigns.Count > 0) and (lstCampaigns.ItemIndex > -1);
end;

procedure TfrmCampaigns.btnOpenClick(Sender: TObject);
begin
  FCampaign := TPMCampaign(lstCampaigns.Items.Objects[lstCampaigns.ItemIndex]);
  Self.ModalResult := mrOk;
end;

procedure TfrmCampaigns.txtNewChange(Sender: TObject);
begin
  btnNew.Enabled := (Length(txtNew.Text) > 0);
end;

end.

