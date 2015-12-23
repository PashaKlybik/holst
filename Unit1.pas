unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, StdCtrls, Math, Vcl.Grids;

type
  TFormOutput = class(TForm)
    Output: TStringGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOutput: TFormOutput;

implementation
    uses Umain;
{$R *.dfm}

end.
