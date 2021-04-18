program Primeiro;

uses
  Vcl.Forms,
  NavigatorInsersao in 'Exercícios\1 - Primeiro\NavigatorInsersao.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
