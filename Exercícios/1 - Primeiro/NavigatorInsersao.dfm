object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 232
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBNavigator1: TDBNavigator
    Left = 8
    Top = 175
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 2
    Width = 681
    Height = 167
    DataSource = DataSource1
    TabOrder = 1
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
        FieldName = 'Nome'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Curso'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Turno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Per'#237'odo'
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
        Visible = True
      end>
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=Level5'
      'User_Name=sa'
      'Password=admserver01'
      'Server=localhost'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 728
    Top = 8
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM ALUNO')
    Left = 728
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 728
    Top = 120
  end
end
