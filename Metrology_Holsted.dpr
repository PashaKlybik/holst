program Metrology_Holsted;

uses
  Forms,
  Umain in 'Umain.pas' {Metrika},
  Unit1 in 'Unit1.pas' {FormOutput};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMetrika, Metrika);
  Application.CreateForm(TFormOutput, FormOutput);
  Application.Run;
end.
