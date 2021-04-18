unit WithCadastroListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    FDQueryComando: TFDQuery;
    DBGrid1: TDBGrid;
    Button1: TButton;
    EditID: TEdit;
    EditNome: TEdit;
    EditTurno: TEdit;
    EditDIngresso: TEdit;
    EditDNascimento: TEdit;
    EditCurso: TEdit;
    EditPeriodo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button2: TButton;
    FDQueryListagem: TFDQuery;
    DataSource2: TDataSource;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure EditPeriodoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  var
    sId_Aluno: string;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

//INSERIR
procedure TForm2.Button1Click(Sender: TObject);
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
    Add('CURSO,');
    Add('TURNO,');
    Add('PERÍODO,');
    Add('DATANASCIMENTO,');
    Add('DATAINGRESSOFACULDADE');
    Add(')');
    Add('VALUES');
    Add('(');
    Add('' + EditID.Text + ',');
    Add('''' + EditNome.Text + ''',');
    Add('''' + EditCurso.Text + ''',');
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

procedure TForm2.Button2Click(Sender: TObject);
begin
  FDQueryListagem.Close;
  FDQueryListagem.SQL.Add('SELECT * FROM ALUNO');
  FDQueryListagem.Open;
end;

//DELETAR
procedure TForm2.Button3Click(Sender: TObject);
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

//ALTERAR
procedure TForm2.Button4Click(Sender: TObject);
begin
  sId_Aluno := FDQueryListagem.FieldByName('ID_Aluno').AsString;

  with FDQueryComando.SQL do
  begin
    clear;
    Add('UPDATE Aluno');
    Add('SET');
    Add('ID_ALUNO = ' + EditID.Text + ',');
    Add('NOME = ''' + EditNome.Text + ''',');
    Add('CURSO = ''' + EditCurso.Text + ''',');
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

//LIMPAR
procedure TForm2.Button5Click(Sender: TObject);
begin
  EditID.clear;
  EditNome.clear;
  EditTurno.clear;
  EditDIngresso.clear;
  EditDNascimento.clear;
  EditCurso.clear;
  EditPeriodo.clear;
end;

//ALIMENTAR EDIT
procedure TForm2.DataSource2DataChange(Sender: TObject; Field: TField);
begin
  EditID.Text := FDQueryListagem.FieldByName('ID_Aluno').AsString;
  EditNome.Text := FDQueryListagem.FieldByName('NOME').AsString;
  EditTurno.Text := FDQueryListagem.FieldByName('TURNO').AsString;
  EditDIngresso.Text := FDQueryListagem.FieldByName
    ('DATAINGRESSOFACULDADE').AsString;
  EditDNascimento.Text := FDQueryListagem.FieldByName('DATANASCIMENTO')
    .AsString;
  EditCurso.Text := FDQueryListagem.FieldByName('CURSO').AsString;
  EditPeriodo.Text := FDQueryListagem.FieldByName('PERÍODO').AsString;
end;

procedure TForm2.EditPeriodoKeyPress(Sender: TObject; var Key: Char);

begin
  If not(Key in ['0' .. '9', #08]) then
    Key := #0;
end;

end.
