object Form5: TForm5
  Left = 439
  Top = 247
  Caption = 'Randevu Defteri'
  ClientHeight = 408
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 388
    Height = 408
    Align = alClient
    BevelOuter = bvNone
    ColumnCollection = <
      item
        Value = 1.000000000000000000
      end
      item
        Value = 4.000000000000000000
      end
      item
        Value = 5.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 20.000000000000000000
      end
      item
        Value = 5.000000000000000000
      end
      item
        Value = 4.000000000000000000
      end
      item
        Value = 1.000000000000000000
      end>
    ControlCollection = <
      item
        Column = 1
        ColumnSpan = 8
        Control = DBGrid1
        Row = 4
        RowSpan = 5
      end
      item
        Column = 1
        ColumnSpan = 3
        Control = SearchBox1
        Row = 1
      end
      item
        Column = 6
        ColumnSpan = 2
        Control = BitBtn1
        Row = 2
      end
      item
        Column = 1
        Control = BitBtn2
        Row = 3
      end>
    RowCollection = <
      item
        Value = 1.111111111111111000
      end
      item
        Value = 4.444444444444445000
      end
      item
        Value = 5.555555555555555000
      end
      item
        Value = 5.555555555555555000
      end
      item
        Value = 22.222222222222220000
      end
      item
        Value = 22.222222222222220000
      end
      item
        Value = 27.777777777777780000
      end
      item
        Value = 5.555555555555555000
      end
      item
        Value = 4.444444444444445000
      end
      item
        Value = 1.111111111111111000
      end>
    TabOrder = 0
    ExplicitWidth = 493
    ExplicitHeight = 523
    object DBGrid1: TDBGrid
      Left = 3
      Top = 66
      Width = 376
      Height = 333
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'saati'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'adi'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'soyadi'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kimlik_no'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'kullanici_adi'
          Width = 97
          Visible = True
        end>
    end
    object SearchBox1: TSearchBox
      Left = 3
      Top = 4
      Width = 111
      Height = 18
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = SearchBox1Change
      ExplicitLeft = 23
      ExplicitTop = 5
      ExplicitWidth = 122
      ExplicitHeight = 27
    end
    object BitBtn1: TBitBtn
      Left = 268
      Top = 22
      Width = 96
      Height = 22
      Align = alClient
      Caption = 'Randevu Ekle/Sil'
      TabOrder = 2
      OnClick = BitBtn1Click
      ExplicitLeft = 341
      ExplicitTop = 28
      ExplicitWidth = 98
      ExplicitHeight = 29
    end
    object BitBtn2: TBitBtn
      Left = 3
      Top = 44
      Width = 15
      Height = 22
      Align = alClient
      Caption = 'Y'
      TabOrder = 3
      OnClick = BitBtn2Click
      ExplicitTop = 38
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=disci;Data Source=DESKTOP-PKHVEEA\SQLEX' +
      'PRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 8
    Top = 200
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select CONVERT(VARCHAR(5),r.baslangic_zamani, 108)as'#39'saati'#39',hs.a' +
        'di,hs.soyadi,hs.kimlik_no,k.kullanici_adi  from randevu r join h' +
        'asta_bilgileri hs on hs.id=r.hasta_id join kullanici_hesabi k on' +
        ' k.id=r.doctor_id where r.iptal_edildi='#39'False'#39' and CONVERT(VARCH' +
        'AR(11), GETDATE(), 106)=CONVERT(VARCHAR(11),r.baslangic_zamani, ' +
        '106) order by saati asc')
    Left = 8
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 8
    Top = 312
  end
end
