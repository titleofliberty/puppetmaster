unit tagsframe;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ExtCtrls, StdCtrls, LCLType, StrUtils;

type

  { TfraTags }

  TfraTags = class(TFrame)
    btnClear: TButton;
    cboTags: TComboBox;
    pnlTags: TFlowPanel;
    Panel1: TPanel;
    procedure TagDelete(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure cboTagsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FTags: TStringList;
    procedure SetTags(AValue: TStringList);
    procedure PopulateTags;
  public
    property Tags: TStringList read FTags write SetTags;
  end;

implementation

{$R *.lfm}

{ TfraTags }

procedure TfraTags.TagDelete(Sender: TObject);
begin
  TComponent(Sender).Free;
  PopulateTags;
end;

procedure TfraTags.btnClearClick(Sender: TObject);
begin
  FTags.Clear;
  PopulateTags;
end;

procedure TfraTags.cboTagsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
  sa : TStringArray;
begin
  if FTags = nil then
  begin
    FTags := TStringList.Create;
    FTags.Sorted := true;
    FTags.Duplicates := dupIgnore;
  end;

  if Key = VK_RETURN then
  begin
    sa := SplitString(cboTags.Text, ',;');
    for i := 0 to High(sa) do
    begin
      FTags.Add(sa[i].Trim);
    end;
    PopulateTags;
  end;
end;

procedure TfraTags.SetTags(AValue: TStringList);
begin
  if FTags = AValue then Exit;
  FTags := AValue;
  PopulateTags;
end;

procedure TfraTags.PopulateTags;
var
  i: integer;
  btn: TButton;
begin
  while pnlTags.ComponentCount > 0 do
  begin
    btn := TButton(pnlTags.Components[0]);
    btn.Free;
  end;

  for i := 0 to FTags.Count - 1 do
  begin
    btn := TButton.Create(pnlTags);
    btn.Parent := pnlTags;
    btn.Caption := FTags[i];
    btn.AutoSize := true;
    btn.OnClick := @TagDelete;
  end;
end;


end.

