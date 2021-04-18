program Terceiro;

uses
  Vcl.Forms,
  CadastroAlunoComboBoxCurso in 'Exercícios\3 - Terceiro\CadastroAlunoComboBoxCurso.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
