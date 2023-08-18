program puppetmaster;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, mainform, puppetmasterlib, settlementform, venueform,
  puppetform, diceform, playerform, roomform, aboutform, dungeonform, 
wildernessform, tractform, chamberform;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Puppetmaster';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDungeon, frmDungeon);
  Application.CreateForm(TfrmWilderness, frmWilderness);
  Application.CreateForm(TfrmTract, frmTract);
  Application.CreateForm(TfrmChamber, frmChamber);
  Application.Run;
end.

