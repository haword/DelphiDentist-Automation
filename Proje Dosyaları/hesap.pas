unit hesap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Menus, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm10 = class(TForm)
    GridPanel1: TGridPanel;
    DBGrid1: TDBGrid;
    SearchBox1: TSearchBox;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    odemeyap: TPopupMenu;
    Dzenle1: TMenuItem;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure Dzenle1Click(Sender: TObject);
    procedure SearchBox1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure GridPanel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation
  uses hesapode;
{$R *.dfm}

procedure TForm10.BitBtn1Click(Sender: TObject);
begin
hesapode.kimlik_no:=DBGrid1.Fields[DBGrid1.SelectedIndex].AsString;
hesapode.Form11.ShowModal;
end;

procedure TForm10.DBGrid1CellClick(Column: TColumn);
begin
BitBtn1.Enabled:=True;
end;

procedure TForm10.Dzenle1Click(Sender: TObject);
begin
hesapode.kimlik_no:=DBGrid1.Fields[DBGrid1.SelectedIndex].AsString;
hesapode.Form11.ShowModal;
end;

procedure TForm10.GridPanel1Click(Sender: TObject);
begin
BitBtn1.Enabled:=False;
end;

procedure TForm10.SearchBox1Change(Sender: TObject);
begin
if SearchBox1.Text<>'' then
   Begin
    ADOQuery1.Filter:='adi LIKE '+QuotedStr(#37+SearchBox1.Text+#37)+' or soyadi LIKE '+QuotedStr(#37+SearchBox1.Text+#37)+' or kimlik_no LIKE '+QuotedStr(#37+SearchBox1.Text+#37)+'';
    ADOQuery1.Filtered:=true;
   End
  else
   begin
    ADOQuery1.Filtered:=false;
   end;
end;

end.
