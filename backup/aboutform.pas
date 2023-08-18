unit aboutform;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmAbout }

  TfrmAbout = class(TForm)
    btnClose: TButton;
    Label1: TLabel;
    Label2: TLabel;
  private

  public

  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.lfm}

end.

