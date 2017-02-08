program CalcTime;

uses
  Forms,
  CalcWR in 'CalcWR.pas' {fCalcWR},
  Sets in 'Sets.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfCalcWR, fCalcWR);
  Application.Run;
end.
