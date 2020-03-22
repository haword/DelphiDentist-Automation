unit tedavi;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXPanels,
  Vcl.WinXPickers, Vcl.WinXCalendars, Vcl.WinXCtrls, Vcl.StdCtrls, Vcl.CheckLst,
  Xml.xmldom, Xml.XMLIntf, IPPeerClient, IPPeerServer, Vcl.Touch.Keyboard,
  System.Tether.Manager, Vcl.Samples.Gauges, Vcl.ColorGrd, Vcl.Samples.Spin,
  Vcl.Grids, Vcl.Samples.Calendar, IdDNSResolver, IdUDPBase, IdUDPClient,
  IdEchoUDP, IdTelnet, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdCmdTCPClient, IdIRC, Web.HTTPApp, Web.DBWeb, Xml.XMLDoc,
  Data.Cloud.CloudAPI, Data.Cloud.AzureAPI, Vcl.ComCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage, VCLTee.TeeFilters, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompExtCtrls, Vcl.AppEvnts, Vcl.TabNotBk,
  Data.DB, Data.Win.ADODB, Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls, Vcl.DBCGrids;
type
  TForm4 = class(TForm)
    TabbedNotebook1: TTabbedNotebook;
    GridPanel1: TGridPanel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    GridPanel2: TGridPanel;
    GridPanel3: TGridPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    CategoryPanel1: TCategoryPanel;
    CategoryPanel2: TCategoryPanel;
    CategoryPanel3: TCategoryPanel;
    SearchBox1: TSearchBox;
    GridPanel4: TGridPanel;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    CategoryPanel4: TCategoryPanel;
    CategoryPanel6: TCategoryPanel;
    GridPanel5: TGridPanel;
    DBGrid1: TDBGrid;
    islemquery: TADOQuery;
    islemsource: TDataSource;
    GridPanel6: TGridPanel;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    tedaviquery: TADOQuery;
    tedaviSource: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    teshisSource: TDataSource;
    teshisQuery: TADOQuery;
    cerahiQuery: TADOQuery;
    cerahiSource: TDataSource;
    DBGrid4: TDBGrid;
    SearchBox2: TSearchBox;
    SearchBox3: TSearchBox;
    SearchBox4: TSearchBox;
    kisiaramaQuery: TADOQuery;
    StaticText16: TStaticText;
    StaticText26: TStaticText;
    verigirisQuery: TADOQuery;
    x1Query3: TADOQuery;
    Panel1: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure SearchBox1KeyPress(Sender: TObject; var Key: Char);
    procedure SearchBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure CategoryPanel6Click(Sender: TObject);
    procedure SearchBox2Change(Sender: TObject);
    procedure SearchBox3Change(Sender: TObject);
    procedure SearchBox4Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid3CellClick(Column: TColumn);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure DBGrid4CellClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure cagri();
    procedure cagrienter();
    procedure buttag(Sender: TObject);
    procedure buttag2(Sender: TObject);
    procedure kitleme();
    procedure acma();
    procedure ziyaretciekle(hasta_idd:integer);
    procedure sifirla();
    procedure virigirisi_kaydet();
    procedure fiyatbi();
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  doc,ziyaretcid,hastalik_idd,s_tedavi_idd,adim_idd,hasta_idd:integer;
  ziyaretcidd,sorunidd,disim:string;
implementation

{$R *.dfm}

procedure TForm4.SearchBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then  begin
    cagrienter;
  end;
end;

procedure TForm4.sifirla;
begin
    disim:='';
    doc:=0;
    hastalik_idd:=0;
    s_tedavi_idd:=0;
    adim_idd:=0;
    hasta_idd:=0;
    ziyaretcidd:='';
    sorunidd:='';
    StaticText25.Caption:='------';
    StaticText24.Caption:='------';
    StaticText23.Caption:='------';
    StaticText22.Caption:='------';
    StaticText26.Caption:='------';
    StaticText8.Caption:='------';
    StaticText10.Caption:='------';
    StaticText12.Caption:='------';
    StaticText14.Caption:='------';
    Memo1.Lines.CommaText:='';
end;

procedure TForm4.fiyatbi;
var
od,ok:string;
begin
  x1Query3.SQL.Clear;
  x1Query3.SQL.Add('select sum(te.fiyat) as ''fiy''  from hasta_bilgileri h join ziyaretci zi on zi.hasta_id=h.id ');
  x1Query3.SQL.Add('join sorun_tespiti so on so.ziyaretci_id=zi.id join tedavi te on te.id=so.secilmis_tedavi_id');
  x1Query3.SQL.Add(' where h.kimlik_no='+#39+SearchBox1.Text+#39+' group by h.kimlik_no');
  x1Query3.Open;
  od:=x1Query3.FieldByName('fiy').AsString;
  x1Query3.SQL.Clear;
  x1Query3.SQL.Add('select sum(o.�deme_miktari) as ''fiy'' from hasta_bilgileri h');
  x1Query3.SQL.Add('join odeme o on o.hasta_id=h.id where h.kimlik_no='+#39+SearchBox1.Text+#39+' group by h.kimlik_no');
  x1Query3.Open;
  ok:=x1Query3.FieldByName('fiy').AsString;
  StaticText2.Caption:=(strtoint(od)-strtoint(ok)).ToString;
end;

procedure TForm4.virigirisi_kaydet;
begin
  verigirisQuery.SQL.Clear; //hasta id i�in tarama yap�l�yor
  verigirisQuery.SQL.Add('select top 1 id as ''hasta_id'' from ziyaretci where hasta_id='+hasta_idd.ToString+' and dentist_id='+doc.ToString+' order by id desc');
  verigirisQuery.Active:=true;
  ziyaretcidd:=verigirisQuery.FieldByName('hasta_id').AsString;
  verigirisQuery.SQL.Clear; // sorun tespit verileri giriliyor
  verigirisQuery.SQL.Add('insert into sorun_tespiti (dis_id,hastalik_katalog_id,ziyaretci_id,secilmis_tedavi_id) values (:ve1, :ve2, :ve3, :ve4)');
  verigirisQuery.Parameters.ParamByName('ve1').Value:=disim;
  verigirisQuery.Parameters.ParamByName('ve2').Value:=hastalik_idd;
  verigirisQuery.Parameters.ParamByName('ve3').Value:=ziyaretcidd;
  verigirisQuery.Parameters.ParamByName('ve4').Value:=s_tedavi_idd;
  verigirisQuery.ExecSQL;


  verigirisQuery.SQL.Clear; // sorun id aran�yor
  verigirisQuery.SQL.Add('select top 1 st.id as ''sor_id'' from ziyaretci zi join sorun_tespiti st on st.ziyaretci_id=zi.id  where hasta_id='+hasta_idd.ToString+' and dentist_id='+doc.ToString+' order by st.id desc');
  verigirisQuery.Active:=true;
  sorunidd:=verigirisQuery.FieldByName('sor_id').AsString;


  verigirisQuery.SQL.Clear;  //ziyaret_id tablosuna veri giriliyor
  verigirisQuery.SQL.Add('insert into ziyaret_id (ziyaretci_id, tedavi_adimlari_id, sorun_tespit_id, notlar) values (:ve1,:ve2,:ve3,:ve4)');
  verigirisQuery.Parameters.ParamByName('ve1').Value:=ziyaretcidd;
  verigirisQuery.Parameters.ParamByName('ve2').Value:=adim_idd;
  verigirisQuery.Parameters.ParamByName('ve3').Value:=sorunidd;
  verigirisQuery.Parameters.ParamByName('ve4').Value:=Memo1.Lines.CommaText;
  verigirisQuery.ExecSQL;


  islemquery.SQL.Clear;
  islemquery.SQL.Add('select CONVERT(VARCHAR(11), ziy.ziyaret_tarihi, 106)as''Ziyaret Tarihi'',');
  islemquery.SQL.Add('CONVERT(VARCHAR(11), ziy.ziyaret_tarihi, 106)as''Ziyaret Biti�i'',');
  islemquery.SQL.Add('CONVERT(VARCHAR(5),ziy.ziyaret_tarihi, 108)as''Ziyaret Saati'',yet.yetki+'' ''+kul.kullanici_adi as ''Doktor'',');
  islemquery.SQL.Add('d.dis,hkt.hastalik_adi,ted.tedavi_adi,adbi.yapilan_islem,zid.notlar,ted.fiyat as''�cret'' from hasta_bilgileri hst');
  islemquery.SQL.Add('join ziyaretci ziy on hst.id=ziy.hasta_id join ziyaret_id zid on zid.ziyaretci_id=ziy.id');
  islemquery.SQL.Add('join sorun_tespiti soru on soru.id=zid.sorun_tespit_id join tedavi ted on ted.id=soru.secilmis_tedavi_id');
  islemquery.SQL.Add('join kullanici_hesabi kul on kul.id=ziy.dentist_id join yetkilik yet on yet.id=kul.yetki_id join dis d on d.id=soru.dis_id');
  islemquery.SQL.Add('join hastalik_katalogu hkt on hkt.id=soru.hastalik_katalog_id');
  islemquery.SQL.Add('join adim_bilgi adbi on adbi.id=zid.tedavi_adimlari_id');
  islemquery.SQL.Add('where hst.kimlik_no='''+SearchBox1.Text+''' ');
  islemquery.Active:=true;
  fiyatbi;


end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
virigirisi_kaydet;
end;

procedure TForm4.BitBtn3Click(Sender: TObject);
begin
StaticText22.Caption:=DBGrid3.Fields[DBGrid2.SelectedIndex].AsString;
end;

procedure TForm4.buttag(Sender: TObject);   //tag denemesi 1 kullan�lm�yor -
begin
TBitBtn(sender).Caption:='you pressed button ' + IntToStr((Sender as TBitBtn).Tag);
end;

procedure TForm4.kitleme();
begin
  CategoryPanel6.Collapsed:=true;
  CategoryPanel4.Collapsed:=true;
  CategoryPanel3.Collapsed:=true;
  CategoryPanel3.Enabled:=false;
  CategoryPanel4.Enabled:=false;
  CategoryPanel6.Enabled:=false;
  BitBtn1.Enabled:=false;
  BitBtn2.Enabled:=false;
end;
procedure TForm4.acma();
begin

  CategoryPanel3.Collapsed:=false;
  CategoryPanel4.Collapsed:=false;
  CategoryPanel6.Collapsed:=false;
  CategoryPanel3.Enabled:=true;
  CategoryPanel4.Enabled:=true;
  CategoryPanel6.Enabled:=true;
end;

procedure TForm4.ziyaretciekle(hasta_idd:integer);
begin

   verigirisQuery.SQL.Clear;
   verigirisQuery.SQL.Add('insert into ziyaretci (ziyaret_tarihi,hasta_id,dentist_id) values (:ve1,:ve2,:ve3)');
   verigirisQuery.Parameters.ParamByName('ve1').Value:=DateToStr(date)+' '+timeToStr(time);
   verigirisQuery.Parameters.ParamByName('ve2').Value:=hasta_idd;
   verigirisQuery.Parameters.ParamByName('ve3').Value:=doc;
   verigirisQuery.ExecSQL;

end;

procedure TForm4.buttag2(Sender: TObject);   //tag denemesi 2 di� bilgilerini aktar�cak  kullan�l�yor +
begin
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select dis from dis where id='+inttostr((Sender as TImage).Tag)+'');
        ADOQuery1.Open;
        if not ADOQuery1.Eof then
        begin
          ADOQuery2.SQL.Clear;
          ADOQuery2.SQL.Add('select hkt.hastalik_adi,t.tedavi_adi from hasta_bilgileri hs');
          ADOQuery2.SQL.Add('join ziyaretci zi on hs.id=zi.hasta_id join sorun_tespiti soru on zi.id=soru.ziyaretci_id');
          ADOQuery2.SQL.Add('join dis d on d.id = soru.dis_id join hastalik_katalogu hkt on hkt.id=soru.hastalik_katalog_id');
          ADOQuery2.SQL.Add('join tedavi t on t.id=soru.secilmis_tedavi_id where hs.kimlik_no='''+SearchBox1.Text+''' and d.id='+inttostr((Sender as TImage).Tag)+'');
          ADOQuery2.Active:=true;
          ADOQuery2.Open;
          disim:=inttostr((sender as TImage).Tag);
          StaticText25.Caption:=ADOQuery1.FieldByName('dis').AsString;

          ADOQuery1.Open;
            if not kisiaramaQuery.Eof then
              begin
                acma;
              end;

        end;
end;


procedure TForm4.cagri();//aramam fonksiyonumuz +
begin

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select hs.adi, hs.soyadi, hs.kimlik_no, ak.adi as ''ak_adi'',ak.soyadi as ''ak_sayadi'',ak.yak�nl�k from hasta_bilgileri hs join akraba ak on hs.akraba_id=ak.id where hs.kimlik_no='''+SearchBox1.Text+'''');
        ADOQuery1.Open;
        ADOQuery2.SQL.Clear;
        if not ADOQuery1.Eof then
        begin
          StaticText8.Caption:=ADOQuery1.FieldByName('adi').AsString;
          StaticText10.Caption:=ADOQuery1.FieldByName('soyadi').AsString;
          StaticText12.Caption:=ADOQuery1.FieldByName('kimlik_no').AsString;
          ADOQuery1.Open;
        end
        else
        begin
          StaticText8.Caption:= '' ;
          StaticText10.Caption:= '' ;
          StaticText12.Caption:= '' ;
          kitleme;
        end;

end;

procedure TForm4.cagrienter();//aramam fonksiyonumuz +
begin

        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Add('select hs.id as ''hasta_id'', hs.adi, hs.soyadi, hs.kimlik_no, ak.adi as ''ak_adi'',ak.soyadi as ''ak_sayadi'',ak.yak�nl�k from hasta_bilgileri hs join akraba ak on hs.akraba_id=ak.id where hs.kimlik_no='''+SearchBox1.Text+'''');
        ADOQuery1.Open;
        ADOQuery2.SQL.Clear;
        if not ADOQuery1.Eof then
        begin
          ziyaretciekle(strtoint(ADOQuery1.FieldByName('hasta_id').AsString));
          hasta_idd:=strtoint(ADOQuery1.FieldByName('hasta_id').AsString);

          kisiaramaQuery.SQL.Clear;
          kisiaramaQuery.SQL.Add('select top 1 hasta_id , CONVERT(VARCHAR(11), zi.ziyaret_tarihi, 106) AS [DD MON YYYY], kul.kullanici_adi from hasta_bilgileri hs join ziyaretci zi on hs.id=zi.hasta_id ');
          kisiaramaQuery.SQL.Add('join kullanici_hesabi kul on zi.dentist_id=kul.id join akraba ak on hs.akraba_id=ak.id where hs.kimlik_no='''+SearchBox1.Text+'''order by zi.id desc');
          kisiaramaQuery.Open;
          ADOQuery2.SQL.Clear;
          if not kisiaramaQuery.Eof then
          begin
            StaticText15.Caption:=kisiaramaQuery.FieldByName('kullanici_adi').AsString;
            StaticText14.Caption:=kisiaramaQuery.FieldByName('DD MON YYYY').AsString;
            BitBtn1.Enabled:=true;
            BitBtn2.Enabled:=true;
            CategoryPanel2.Collapsed:=false;
            kisiaramaQuery.Open;
            islemquery.SQL.Clear;
            islemquery.SQL.Add('select CONVERT(VARCHAR(11), ziy.ziyaret_tarihi, 106)as''Ziyaret Tarihi'',');
            islemquery.SQL.Add('CONVERT(VARCHAR(11), ziy.ziyaret_tarihi, 106)as''Ziyaret Biti�i'',');
            islemquery.SQL.Add('CONVERT(VARCHAR(5),ziy.ziyaret_tarihi, 108)as''Ziyaret Saati'',yet.yetki+'' ''+kul.kullanici_adi as ''Doktor'',');
            islemquery.SQL.Add('d.dis,hkt.hastalik_adi,ted.tedavi_adi,adbi.yapilan_islem,zid.notlar,ted.fiyat as''�cret'' from hasta_bilgileri hst');
            islemquery.SQL.Add('join ziyaretci ziy on hst.id=ziy.hasta_id join ziyaret_id zid on zid.ziyaretci_id=ziy.id');
            islemquery.SQL.Add('join sorun_tespiti soru on soru.id=zid.sorun_tespit_id join tedavi ted on ted.id=soru.secilmis_tedavi_id');
            islemquery.SQL.Add('join kullanici_hesabi kul on kul.id=ziy.dentist_id join yetkilik yet on yet.id=kul.yetki_id join dis d on d.id=soru.dis_id');
            islemquery.SQL.Add('join hastalik_katalogu hkt on hkt.id=soru.hastalik_katalog_id');
            islemquery.SQL.Add('join adim_bilgi adbi on adbi.id=zid.tedavi_adimlari_id');
            islemquery.SQL.Add('where hst.kimlik_no='''+SearchBox1.Text+''' ');
            islemquery.Active:=true;
            islemquery.Open;
            fiyatbi;

          end
          else
          begin
          islemquery.SQL.Clear;
          CategoryPanel2.Collapsed:=true;
          StaticText15.Caption:= '' ;
          StaticText14.Caption:= '' ;
          end;

        end;






end;

procedure TForm4.FormCreate(Sender: TObject);
begin
CategoryPanel2.Collapsed:=true;
kitleme;


end;

procedure TForm4.Image1Click(Sender: TObject);
begin
buttag2(sender);

end;

procedure TForm4.Image2Click(Sender: TObject);
begin
buttag2(sender);
end;

procedure TForm4.SearchBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  cagri;
end;

procedure TForm4.SearchBox2Change(Sender: TObject);
begin
  if SearchBox2.Text<>'' then
   Begin
    teshisQuery.Filter:='hastalik_adi LIKE '+QuotedStr(#37+SearchBox2.Text+#37)+'';
    // 'hastalik_adi LIKE %'+ QuotedStr('SearchBox2.Text')+'%';
    teshisQuery.Filtered:=true;
   End
  else
   begin
    teshisQuery.Filtered:=false;
   end;
end;

procedure TForm4.SearchBox3Change(Sender: TObject);
begin
  if SearchBox3.Text<>'' then
   Begin
    tedaviquery.Filter:='tedavi_adi LIKE '+QuotedStr(#37+SearchBox3.Text+#37)+'';
    // 'hastalik_adi LIKE %'+ QuotedStr('SearchBox2.Text')+'%';
    tedaviquery.Filtered:=true;
   End
  else
   begin
    tedaviquery.Filtered:=false;
   end;
end;

procedure TForm4.SearchBox4Change(Sender: TObject);
begin
  if SearchBox4.Text<>'' then
   Begin
    cerahiQuery.Filter:='yapilan_islem LIKE '+QuotedStr(#37+SearchBox4.Text+#37)+'';
    // 'hastalik_adi LIKE %'+ QuotedStr('SearchBox2.Text')+'%';
    cerahiQuery.Filtered:=true;
   End
  else
   begin
    cerahiQuery.Filtered:=false;
   end;
end;

procedure TForm4.CategoryPanel6Click(Sender: TObject);
begin

CategoryPanel6.Collapsed:=true;
  //for i := 1 to 4 do
 // begin
   //    (TBitBtn as i).
  //end;


end;


procedure TForm4.DBGrid3CellClick(Column: TColumn); //te�his
begin
  StaticText24.Caption:=DBGrid3.Fields[DBGrid3.SelectedIndex].AsString;
  hastalik_idd:=strtoint(teshisQuery.FieldByName('id').AsString);
end;

procedure TForm4.DBGrid2CellClick(Column: TColumn);  //tedavi
begin
  StaticText23.Caption:=DBGrid2.Fields[DBGrid2.SelectedIndex].AsString;
  s_tedavi_idd:=strtoint(tedaviquery.FieldByName('id').AsString);

end;

procedure TForm4.DBGrid4CellClick(Column: TColumn); //ad�mlar
begin
  StaticText22.Caption:=DBGrid4.Fields[DBGrid4.SelectedIndex].AsString;
  adim_idd:=strtoint(cerahiQuery.FieldByName('id').AsString);
end;

end.
