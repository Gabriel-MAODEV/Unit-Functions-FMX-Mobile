program Sample;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit12 in 'Unit12.pas' {Form12},
  uFunc_FMX_Mobile in 'Units\uFunc_FMX_Mobile.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm12, Form12);
  Application.Run;
end.
