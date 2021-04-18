unit CadastroAlunoComboBoxCurso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, UComboBoxTeste;

type
  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    EditDIngresso: TEdit;
    EditTurno: TEdit;
    EditPeriodo: TEdit;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EditDNascimento: TEdit;
    EditID: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditNome: TEdit;
    DataSource2: TDataSource;
    FDQueryListagem: TFDQuery;
    FDConnection1: TFDConnection;
    FDQueryComando: TFDQuery;
    Label6: TLabel;
    FDQueryCursos: TFDQuery;
    ComboBoxCurso: TComboBoxTeste;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure EditPeriodoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  var
    sId_Aluno: string;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
  FDQueryListagem.Close;

  FDQueryComando.SQL.clear;
  FDQueryComando.SQL.Add('SELECT * FROM ALUNO');
  FDQueryComando.Open();

  with FDQueryComando.SQL do
  begin
    Add('INSERT INTO Aluno');
    Add('(');
    Add('ID_ALUNO,');
    Add('NOME,');
    Add('ID_CURSO,');
    Add('TURNO,');
    Add('PERÍODO,');
    Add('DATANASCIMENTO,');
    Add('DATAINGRESSOFACULDADE');
    Add(')');
    Add('VALUES');
    Add('(');
    Add('' + EditID.Text + ',');
    Add('''' + EditNome.Text + ''',');
    if (ComboBoxCurso.ItemIndex = 0) then
    begin
      Add(' null ,');
    end
    else
    begin
      Add('''' + ComboBoxCurso.getKey + ''',');
    end;
    Add('''' + EditTurno.Text + ''',');
    if (EditPeriodo.Text = '') then
    begin
      Add(' null ,');
    end
    else
    begin
      Add('' + EditPeriodo.Text + ',');
    end;
    Add('''' + EditDNascimento.Text + ''',');
    if (EditDIngresso.Text <> '') then
    begin
      Add('''' + EditDIngresso.Text + '''');
    end
    else
    begin
      Add('null ');
    end;
    Add(')');
  end;
  FDQueryComando.ExecSQL;
  FDQueryComando.Close;
  FDQueryListagem.Close;
  FDQueryListagem.Open;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  FDQueryListagem.Close;
  with FDQueryListagem.SQL do
  begin
    Add('SELECT');
    Add('ALUNO.ID_Aluno,');
    Add('ALUNO.NOME,');
    Add('ALUNO.DataNascimento,');
    Add('ALUNO.DataIngressoFaculdade,');
    Add('ALUNO.Período, ALUNO.Turno,');
    Add('Cursos.Curso, Cursos.ID_Curso');
    Add('FROM');
    Add('ALUNO Left JOIN Cursos');
    Add('on ALUNO.ID_Curso = Cursos.ID_Curso');
  end;
  FDQueryListagem.Open;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  sId_Aluno := FDQueryListagem.FieldByName('ID_Aluno').AsString;

  with FDQueryComando.SQL do
  begin
    clear;
    Add('DELETE FROM ALUNO');
    Add('WHERE ID_Aluno = ' + sId_Aluno);
  end;

  FDQueryComando.ExecSQL;
  FDQueryComando.Close;
  FDQueryListagem.Close;
  FDQueryListagem.Open;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  sId_Aluno := FDQueryListagem.FieldByName('ID_Aluno').AsString;

  with FDQueryComando.SQL do
  begin
    clear;
    Add('UPDATE Aluno');
    Add('SET');
    Add('ID_ALUNO = ' + EditID.Text + ',');
    Add('NOME = ''' + EditNome.Text + ''',');
    if (ComboBoxCurso.ItemIndex = 0) then
    begin
      Add('ID_CURSO = null ,');
    end
    else
    begin
      Add('ID_CURSO = ''' + ComboBoxCurso.getKey + ''',');
    end;
    Add('TURNO = ''' + EditTurno.Text + ''',');
    if (EditPeriodo.Text = '') then
    begin
      Add('PERÍODO = null ,');
    end
    else
    begin
      Add('PERÍODO = ' + EditPeriodo.Text + ',');
    end;
    if (EditDIngresso.Text <> '') then
    begin
      Add('DATAINGRESSOFACULDADE = ''' + EditDIngresso.Text + ''',');
    end
    else
    begin
      Add('DATAINGRESSOFACULDADE = null ,');
    end;
    Add('DATANASCIMENTO = ''' + EditDNascimento.Text + '''');
    Add('WHERE ID_Aluno = ' + sId_Aluno);
  end;
  FDQueryComando.ExecSQL;
  FDQueryComando.Close;
  FDQueryListagem.Close;
  FDQueryListagem.Open;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  EditID.clear;
  EditNome.clear;
  EditTurno.clear;
  EditDIngresso.clear;
  EditDNascimento.clear;
  ComboBoxCurso.clear;
  EditPeriodo.clear;
end;

procedure TForm3.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  EditID.Text := FDQueryListagem.FieldByName('ID_Aluno').AsString;
  EditNome.Text := FDQueryListagem.FieldByName('NOME').AsString;
  EditTurno.Text := FDQueryListagem.FieldByName('TURNO').AsString;
  EditDIngresso.Text := FDQueryListagem.FieldByName
    ('DATAINGRESSOFACULDADE').AsString;
  EditDNascimento.Text := FDQueryListagem.FieldByName('DATANASCIMENTO')
    .AsString;
  ComboBoxCurso.Text := FDQueryListagem.FieldByName('ID_CURSO').AsString;
  EditPeriodo.Text := FDQueryListagem.FieldByName('PERÍODO').AsString;
end;

procedure TForm3.EditPeriodoKeyPress(Sender: TObject; var Key: Char);
begin
  If not(Key in ['0' .. '9', #08]) then
  begin
    Key := #0;
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  FDQueryCursos.Open('Select * from cursos');
  ComboBoxCurso.Items.Add('Sem Curso');
  ComboBoxCurso.ItemsKey.Add('');
  while not(FDQueryCursos.Eof) do
  begin
    ComboBoxCurso.Items.Add(FDQueryCursos.FieldByName('CURSO').AsString);
    ComboBoxCurso.ItemsKey.Add(FDQueryCursos.FieldByName('id_CURSO').AsString);
    FDQueryCursos.Next;
  end;
  ComboBoxCurso.ItemIndex := 0;
end;

end.
