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
  puppetform, diceform, playerform, aboutform, dungeonform, 
wildernessform, 
chambertractroomform, htmlcolors, levelform, routeform, 
floorform;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Puppetmaster';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLevel, frmLevel);
  Application.CreateForm(TfrmRoute, frmRoute);
  Application.CreateForm(TfrmFloor, frmFloor);
  Application.Run;
end.

