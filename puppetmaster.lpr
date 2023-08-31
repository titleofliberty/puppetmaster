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
  Forms, lazcontrols, mainform, puppetmasterlib,
  puppetform, diceform, playerform, aboutform, 
chambertractroomform, htmlcolors, 
titleclassnotesform, beastmonsterform, simpleform;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Puppetmaster';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.

