object Form10: TForm10
  Left = 0
  Top = 0
  Caption = 'Hesap '#214'deme Ekran'#305
  ClientHeight = 408
  ClientWidth = 388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
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
    OnClick = GridPanel1Click
    object DBGrid1: TDBGrid
      Left = 3
      Top = 66
      Width = 376
      Height = 333
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      PopupMenu = odemeyap
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGrid1CellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'kimlik_no'
          Title.Alignment = taCenter
          Title.Caption = 'Kimlik Numaras'#305
          Width = 139
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'adi'
          Title.Alignment = taCenter
          Title.Caption = 'Ad'#305
          Width = 124
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'soyadi'
          Title.Alignment = taCenter
          Title.Caption = 'Soyad'#305
          Width = 81
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
      ExplicitHeight = 27
    end
    object BitBtn1: TBitBtn
      Left = 268
      Top = 22
      Width = 96
      Height = 22
      Align = alClient
      Caption = #214'deme Yap'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 3
      Top = 44
      Width = 15
      Height = 22
      Align = alClient
      Caption = 'Y'
      TabOrder = 3
    end
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select  h.kimlik_no,h.adi,h.soyadi from hasta_bilgileri h join z' +
        'iyaretci zi on zi.hasta_id=h.id join sorun_tespiti so on so.ziya' +
        'retci_id=zi.id join tedavi te on te.id=so.secilmis_tedavi_id gro' +
        'up by h.kimlik_no,h.adi,h.soyadi')
    Top = 96
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=disci;Data Source=DESKTOP-PKHVEEA\SQLEX' +
      'PRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Top = 248
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Top = 144
  end
  object odemeyap: TPopupMenu
    Top = 200
    object Dzenle1: TMenuItem
      Caption = #214'deme Yap'
      OnClick = Dzenle1Click
    end
  end
end
