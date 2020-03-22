unit hesapode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.Win.ADODB;

type
  TForm11 = class(TForm)
    DBGrid1: TDBGrid;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
   kimlik_no,id,od,ok:string;
implementation

{$R *.dfm}

procedure TForm11.BitBtn1Click(Sender: TObject);
begin
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('insert into odeme(�deme_miktari,hasta_id) values(:ves1,:ves2)');
  ADOQuery1.Parameters.ParamByName('ves1').Value:=LabeledEdit1.Text;
  ADOQuery1.Parameters.ParamByName('ves2').Value:=id;
  ADOQuery1.ExecSQL;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select sum(te.fiyat) as ''fiy''  from hasta_bilgileri h join ziyaretci zi on zi.hasta_id=h.id ');
  ADOQuery1.SQL.Add('join sorun_tespiti so on so.ziyaretci_id=zi.id join tedavi te on te.id=so.secilmis_tedavi_id');
  ADOQuery1.SQL.Add(' where h.kimlik_no='+#39+kimlik_no+#39+' group by h.kimlik_no');
  ADOQuery1.Open;
  od:=ADOQuery1.FieldByName('fiy').AsString;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select sum(o.�deme_miktari) as ''fiy'' from hasta_bilgileri h');
  ADOQuery1.SQL.Add('join odeme o on o.hasta_id=h.id where h.kimlik_no='+#39+kimlik_no+#39+' group by h.kimlik_no');
  ADOQuery1.Open;
  ok:=ADOQuery1.FieldByName('fiy').AsString;
  StaticText5.Caption:=(strtoint(od)-strtoint(ok)).ToString;
  LabeledEdit1.Text:='';
end;

procedure TForm11.FormShow(Sender: TObject);
begin
 StaticText6.Caption:=kimlik_no;
 ADOQuery1.SQL.Clear;
 ADOQuery1.SQL.Add('select id,adi,soyadi,kimlik_no from hasta_bilgileri where kimlik_no='+#39+kimlik_no+#39+'');
 ADOQuery1.Open;
 StaticText8.Caption:=ADOQuery1.FieldByName('adi').AsString;
 id:=ADOQuery1.FieldByName('id').AsString;
 StaticText7.Caption:=ADOQuery1.FieldByName('soyadi').AsString;
 ADOQuery1.SQL.Clear;
 ADOQuery1.SQL.Add('select (select sum(te.fiyat)  from hasta_bilgileri h join ziyaretci zi on zi.hasta_id=h.id ');
 ADOQuery1.SQL.Add('join sorun_tespiti so on so.ziyaretci_id=zi.id join tedavi te on te.id=so.secilmis_tedavi_id ');
 ADOQuery1.SQL.Add('where h.kimlik_no='+#39+kimlik_no+#39+' group by h.kimlik_no)-(select (sum(o.�deme_miktari))+0 from hasta_bilgileri h ');
 ADOQuery1.SQL.Add('join odeme o on o.hasta_id=h.id where h.kimlik_no='+#39+kimlik_no+#39+' group by h.kimlik_no ) as ''fiy''');
 ADOQuery1.Open;

   StaticText5.Caption:=ADOQuery1.FieldByName('fiy').AsString;

  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Add('select d.dis,hkt.hastalik_adi,ted.tedavi_adi,adbi.yapilan_islem,ted.fiyat as''�cret'' from hasta_bilgileri hst');
  ADOQuery2.SQL.Add('join ziyaretci ziy on hst.id=ziy.hasta_id join ziyaret_id zid on zid.ziyaretci_id=ziy.id');
  ADOQuery2.SQL.Add('join sorun_tespiti soru on soru.id=zid.sorun_tespit_id join tedavi ted on ted.id=soru.secilmis_tedavi_id');
  ADOQuery2.SQL.Add('join kullanici_hesabi kul on kul.id=ziy.dentist_id join yetkilik yet on yet.id=kul.yetki_id join dis d on d.id=soru.dis_id');
  ADOQuery2.SQL.Add('join hastalik_katalogu hkt on hkt.id=soru.hastalik_katalog_id');
  ADOQuery2.SQL.Add('join adim_bilgi adbi on adbi.id=zid.tedavi_adimlari_id');
  ADOQuery2.SQL.Add('where hst.kimlik_no='+#39+kimlik_no+#39+'');
  ADOQuery2.Active:=true;
  DataSource1.DataSet:=ADOQuery2;
end;

end.
