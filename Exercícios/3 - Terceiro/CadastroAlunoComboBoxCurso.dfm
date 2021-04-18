object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 498
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label7: TLabel
    Left = 165
    Top = 141
    Width = 83
    Height = 13
    Caption = 'Data de Ingresso'
  end
  object Label3: TLabel
    Left = 8
    Top = 95
    Width = 28
    Height = 13
    Caption = 'Curso'
  end
  object Label4: TLabel
    Left = 8
    Top = 141
    Width = 28
    Height = 13
    Caption = 'Turno'
  end
  object Label5: TLabel
    Left = 170
    Top = 95
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Label1: TLabel
    Left = 8
    Top = 6
    Width = 11
    Height = 13
    Caption = 'ID'
  end
  object Label2: TLabel
    Left = 56
    Top = 6
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label6: TLabel
    Left = 8
    Top = 49
    Width = 96
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object Button1: TButton
    Left = 8
    Top = 187
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 89
    Top = 187
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 170
    Top = 187
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 251
    Top = 187
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 332
    Top = 187
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 4
    OnClick = Button5Click
  end
  object EditDIngresso: TEdit
    Left = 165
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 5
    TextHint = '01/02/2018'
  end
  object EditTurno: TEdit
    Left = 8
    Top = 160
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object EditPeriodo: TEdit
    Left = 165
    Top = 114
    Width = 121
    Height = 21
    TabOrder = 7
    OnKeyPress = EditPeriodoKeyPress
  end
  object EditDNascimento: TEdit
    Left = 8
    Top = 68
    Width = 153
    Height = 21
    TabOrder = 8
    TextHint = '01/01/2000'
  end
  object EditID: TEdit
    Left = 8
    Top = 22
    Width = 33
    Height = 21
    TabOrder = 9
  end
  object EditNome: TEdit
    Left = 56
    Top = 21
    Width = 105
    Height = 21
    TabOrder = 10
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 218
    Width = 646
    Height = 272
    DataSource = DataSource2
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_Aluno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataNascimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DataIngressoFaculdade'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Per'#237'odo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Curso'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_Curso'
        Width = 50
        Visible = True
      end>
  end
  object DataSource2: TDataSource
    DataSet = FDQueryListagem
    OnDataChange = DataSource2DataChange
    Left = 602
    Top = 128
  end
  object FDQueryListagem: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '')
    Left = 602
    Top = 72
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Level5_2'
      'User_Name=sa'
      'Password=admserver01'
      'Server=localhost'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 602
    Top = 8
  end
  object FDQueryComando: TFDQuery
    Connection = FDConnection1
    Left = 520
    Top = 8
  end
  object FDQueryCursos: TFDQuery
    Connection = FDConnection1
    Left = 448
    Top = 8
  end
end
