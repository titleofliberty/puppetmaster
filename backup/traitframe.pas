unit traitframe;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, StdCtrls, ExtCtrls;

type

  { TfraTrait }

  TfraTrait = class(TFrame)
    cboValues: TComboBox;
    imgDelete: TImage;
    lblCaption: TLabel;
    pnlBottom: TPanel;
  private

  public

  end;

implementation

{$R *.lfm}

end.

