program Segundo;

uses
  Vcl.Forms,
  WithCadastroListagem in 'Exerc�cios\2 - Segundo\WithCadastroListagem.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
