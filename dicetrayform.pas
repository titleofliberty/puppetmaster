unit dicetrayform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TfrmDiceTray }

  TfrmDiceTray = class(TForm)
    imgPic: TImage;
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  frmDiceTray: TfrmDiceTray;

implementation

{$R *.lfm}

{ TfrmDiceTray }

procedure TfrmDiceTray.FormResize(Sender: TObject);
begin
  imgPic.Top := (Self.Height - imgPic.Height) div 2;
  imgPic.Left:= (Self.Width - imgPic.Width) div 2;
end;

end.

