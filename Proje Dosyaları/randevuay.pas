unit randevuay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.WinXCalendars, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.ComCtrls,
  Vcl.TabNotBk, Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, Vcl.WinXPanels, Vcl.Menus;

type
  TForm9 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    CalendarView1: TCalendarView;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ComboBox1: TComboBox;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    aramaQuery: TADOQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    StaticText1: TStaticText;
    ADOQuery3: TADOQuery;
    Panel2: TPanel;
    Button2: TButton;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CalendarView1Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure kitle;
    procedure acil;
    procedure tikolayi(Sender: TObject);


  end;

var
  Form9: TForm9;
  doctor_idd:integer;
  olusturan,olusturan_idd,hasta_idd,tarih,saat,ayi,guni:string;
  guntarih:TDateTime;
  yil,ay,gun:word;
implementation

{$R *.dfm}
procedure TForm9.kitle;
var
i:integer;
begin
   ADOQuery1.Close;
   CalendarView1.Enabled:=False;
   panel1.Visible:=false;
   Panel1.Enabled:=false;
   panel2.Visible:=false;
   Panel2.Enabled:=false;
   for i := 0 to 16 do
   begin
     TBitBtn(Components[i]).Enabled:=false;
   end;
end;



procedure TForm9.acil;
var
i:integer;
begin

   CalendarView1.Enabled:=true;
for i := 0 to 16 do
   begin
     TBitBtn(Components[i]).Enabled:=true;
   end;
end;

procedure TForm9.tikolayi(Sender: TObject);
begin
  saat:=TBitBtn(sender as TBitBtn).Caption;
  Tarih:=yil.ToString+'-'+ayi+'-'+guni+' '+saat;
  if (sender as TBitBtn).Font.Color=clRed then //update olay�
  begin
    panel1.Visible:=false;
    Panel1.Enabled:=false;
    panel2.Visible:=true;
    Panel2.Enabled:=true;
    ADOQuery3.SQL.Clear;
    ADOQuery3.SQL.Add('select  h.adi, h.soyadi, h.kimlik_no,h.id from randevu r join hasta_bilgileri h on r.hasta_id=h.id');
    ADOQuery3.SQL.Add('where r.iptal_edildi=''false'' and r.doctor_id='+doctor_idd.ToString+' and');
    ADOQuery3.SQL.Add('(CONVERT(VARCHAR(16),'+#39+tarih+#39+', 20)=CONVERT(VARCHAR(16),r.baslangic_zamani, 20) or CONVERT(VARCHAR(16),'+#39+'0'+tarih+#39+', 20)=CONVERT(VARCHAR(16),r.baslangic_zamani, 20))');
    ADOQuery3.open;
    StaticText5.Caption:=ADOQuery3.FieldByName('adi').AsString;
    StaticText6.Caption:=ADOQuery3.FieldByName('soyadi').AsString;
    StaticText7.Caption:=ADOQuery3.FieldByName('kimlik_no').AsString;

  end
  else  //inset olay�
  begin
    panel1.Visible:=true;
    Panel1.Enabled:=true;
    panel2.Visible:=false;
    Panel2.Enabled:=false;

  end;

end;

procedure TForm9.BitBtn1Click(Sender: TObject);
begin
   tikolayi(Sender)
end;

procedure TForm9.Button1Click(Sender: TObject);
var
i,x:integer;
begin
    for i := 0 to 16 do
   begin
     TBitBtn(Components[i]).Font.Color:=clLime;
   end;
    ADOQuery3.SQL.Clear;
    ADOQuery3.SQL.Add('insert into randevu(olusturan_kisi_bilgi_id,hasta_id,doctor_id,baslangic_zamani,iptal_edildi) values (:ves1, :ves2, :ves3, :ves4, :ves5)');
    ADOQuery3.Parameters.ParamByName('ves1').Value:=olusturan_idd;
    ADOQuery3.Parameters.ParamByName('ves2').Value:=hasta_idd;
    ADOQuery3.Parameters.ParamByName('ves3').Value:=doctor_idd.ToString;
    ADOQuery3.Parameters.ParamByName('ves4').Value:=tarih;
    ADOQuery3.Parameters.ParamByName('ves5').Value:='0';
    ADOQuery3.ExecSQL;
    Panel1.Visible:=false;
    Panel1.Enabled:=false;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select CONVERT(VARCHAR(5),r.baslangic_zamani, 108)as''saati'',hs.adi,hs.soyadi,hs.kimlik_no,k.kullanici_adi,kul.kullanici_adi ');
    ADOQuery1.SQL.Add('from randevu r join hasta_bilgileri hs on hs.id=r.hasta_id join kullanici_hesabi k on k.id=r.doctor_id join kullanici_hesabi kul on kul.kisi_bilgi_id=r.doctor_id ');
    ADOQuery1.SQL.Add('where  r.iptal_edildi=''False'' and (CONVERT(VARCHAR(10),'+#39+DateToStr(CalendarView1.Date)+' 00:00:00'+#39+', 104)=CONVERT(VARCHAR(10),r.baslangic_zamani, 104) ');
    ADOQuery1.SQL.Add('or CONVERT(VARCHAR(10),'+#39+'0'+DateToStr(CalendarView1.Date)+' 00:00:00'+#39+', 104)=CONVERT(VARCHAR(10),r.baslangic_zamani, 104))');
    ADOQuery1.SQL.Add('and k.kullanici_adi='+#39+ComboBox1.Items[ComboBox1.ItemIndex]+#39+'order by saati asc');
    ADOQuery1.Open;
  x:=0;
  while not ADOQuery1.Eof do
    begin
      for i:=x to 16 do
        begin
         if (TBitBtn(Components[i]).Caption=ADOQuery1['saati']) then
          begin
              TBitBtn(Components[i]).Font.Color:=clRed;
          end;
      end;
      ADOQuery1.Next;
      inc(x);
    end;
end;
procedure TForm9.Button2Click(Sender: TObject);
begin
panel1.Enabled:=false;
 panel1.Visible:=false;
end;
procedure TForm9.Button3Click(Sender: TObject);
var
i,x:integer;
begin
    for i := 0 to 16 do
   begin
     TBitBtn(Components[i]).Font.Color:=clLime;
   end;
    ADOQuery3.SQL.Clear;
    ADOQuery3.SQL.Add('select  h.id,h.adi, h.soyadi, h.kimlik_no,h.id from randevu r join hasta_bilgileri h on r.hasta_id=h.id');
    ADOQuery3.SQL.Add('where r.iptal_edildi=''false'' and r.doctor_id='+doctor_idd.ToString+' and');
    ADOQuery3.SQL.Add('(CONVERT(VARCHAR(16),'+#39+tarih+#39+', 20)=CONVERT(VARCHAR(16),r.baslangic_zamani, 20) or CONVERT(VARCHAR(16),'+#39+'0'+tarih+#39+', 20)=CONVERT(VARCHAR(16),r.baslangic_zamani, 20))');
    ADOQuery3.open;
    hasta_idd:=ADOQuery3.FieldByName('id').AsString;
    ADOQuery3.SQL.Clear;
    ADOQuery3.SQL.Add('update randevu set iptal_edildi=''True'' where');
    ADOQuery3.SQL.Add('hasta_id='+#39+hasta_idd+#39+' and doctor_id='+#39+doctor_idd.ToString+#39+' and iptal_edildi=''false'' and');
    ADOQuery3.SQL.Add('(CONVERT(VARCHAR(16),'+#39+tarih+#39+', 20)=CONVERT(VARCHAR(16),baslangic_zamani, 20) or CONVERT(VARCHAR(16),'+#39+'0'+tarih+#39+', 20)=CONVERT(VARCHAR(16),baslangic_zamani, 20))');
    ADOQuery3.ExecSQL;
    panel2.Enabled:=false;
    panel2.Visible:=false;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select CONVERT(VARCHAR(5),r.baslangic_zamani, 108)as''saati'',hs.adi,hs.soyadi,hs.kimlik_no,k.kullanici_adi,kul.kullanici_adi ');
    ADOQuery1.SQL.Add('from randevu r join hasta_bilgileri hs on hs.id=r.hasta_id join kullanici_hesabi k on k.id=r.doctor_id join kullanici_hesabi kul on kul.kisi_bilgi_id=r.doctor_id ');
    ADOQuery1.SQL.Add('where  r.iptal_edildi=''False'' and (CONVERT(VARCHAR(10),'+#39+DateToStr(CalendarView1.Date)+' 00:00:00'+#39+', 104)=CONVERT(VARCHAR(10),r.baslangic_zamani, 104) ');
    ADOQuery1.SQL.Add('or CONVERT(VARCHAR(10),'+#39+'0'+DateToStr(CalendarView1.Date)+' 00:00:00'+#39+', 104)=CONVERT(VARCHAR(10),r.baslangic_zamani, 104))');
    ADOQuery1.SQL.Add('and k.kullanici_adi='+#39+ComboBox1.Items[ComboBox1.ItemIndex]+#39+'order by saati asc');
    ADOQuery1.Open;
    x:=0;
  while not ADOQuery1.Eof do
    begin
      for i:=x to 16 do
        begin
         if (TBitBtn(Components[i]).Caption=ADOQuery1['saati']) then
          begin
              TBitBtn(Components[i]).Font.Color:=clRed;
          end;
      end;
      ADOQuery1.Next;
      inc(x);
    end;

end;

procedure TForm9.Button5Click(Sender: TObject);
begin
panel2.Enabled:=false;
 panel2.Visible:=false;
end;

procedure TForm9.CalendarView1Change(Sender: TObject);
var
i,x:integer;
begin

    DecodeDate(CalendarView1.Date,yil,ay,gun);
    ayi:=ay.ToString;
    guni:=gun.ToString;
    if(ay<=9) then
    begin
       ayi:='0'+ay.ToString;
    end;
    if gun<=9 then
    begin
      guni:='0'+gun.ToString;
    end;
   tarih:=yil.ToString+'-'+ayi+'-'+guni+' '+saat;
    for i := 0 to 16 do
   begin
     TBitBtn(Components[i]).Font.Color:=clLime;
   end;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select CONVERT(VARCHAR(5),r.baslangic_zamani, 108)as''saati'',hs.adi,hs.soyadi,hs.kimlik_no,k.kullanici_adi,kul.kullanici_adi ');
    ADOQuery1.SQL.Add('from randevu r join hasta_bilgileri hs on hs.id=r.hasta_id join kullanici_hesabi k on k.id=r.doctor_id join kullanici_hesabi kul on kul.kisi_bilgi_id=r.doctor_id ');
    ADOQuery1.SQL.Add('where  r.iptal_edildi=''False'' and (CONVERT(VARCHAR(10),'+#39+DateToStr(CalendarView1.Date)+' 00:00:00'+#39+', 104)=CONVERT(VARCHAR(10),r.baslangic_zamani, 104) ');
    ADOQuery1.SQL.Add('or CONVERT(VARCHAR(10),'+#39+'0'+DateToStr(CalendarView1.Date)+' 00:00:00'+#39+', 104)=CONVERT(VARCHAR(10),r.baslangic_zamani, 104))');
    ADOQuery1.SQL.Add('and k.kullanici_adi='+#39+ComboBox1.Items[ComboBox1.ItemIndex]+#39+'order by saati asc');
    ADOQuery1.Open;
    x:=0;
  while not ADOQuery1.Eof do
    begin
      for i:=x to 16 do
        begin
         if (TBitBtn(Components[i]).Caption=ADOQuery1['saati']) then
          begin
              TBitBtn(Components[i]).Font.Color:=clRed;
          end;
      end;
      ADOQuery1.Next;
      inc(x);
    end;
     tarih:=DateToStr(CalendarView1.Date);
end;

procedure TForm9.ComboBox1Change(Sender: TObject);
var
  i,x:integer;
begin
  panel1.Visible:=false;
  Panel1.Enabled:=false;
  if (ComboBox1.ItemIndex>=0) then
  begin
     acil;
     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.Add('select CONVERT(VARCHAR(5),r.baslangic_zamani, 108)as''saati'',hs.adi,hs.soyadi,hs.kimlik_no,k.kullanici_adi,kul.kullanici_adi ');
     ADOQuery1.SQL.Add('from randevu r join hasta_bilgileri hs on hs.id=r.hasta_id join kullanici_hesabi k on k.id=r.doctor_id join kullanici_hesabi kul on kul.kisi_bilgi_id=r.doctor_id ');
     ADOQuery1.SQL.Add('where CONVERT(VARCHAR(10), GETDATE(), 104)=CONVERT(VARCHAR(10),r.baslangic_zamani, 104) ');
     ADOQuery1.SQL.Add('and r.iptal_edildi=''false'' and k.kullanici_adi='+#39+ComboBox1.Items[ComboBox1.ItemIndex]+#39+' order by saati asc');
     ADOQuery1.Open;
  x:=0;
  for i := 0 to 16 do
   begin
     TBitBtn(Components[i]).Font.Color:=clLime;
   end;
  while not ADOQuery1.Eof do
    begin
      for i:=x to 16 do
        begin
         if (TBitBtn(Components[i]).Caption=ADOQuery1['saati']) then
          begin
              TBitBtn(Components[i]).Font.Color:=clRed;
          end;
      end;
      ADOQuery1.Next;
      inc(x);
    end;
     ADOQuery1.SQL.Clear;
     ADOQuery1.SQL.Add('select id from kullanici_hesabi where kullanici_adi='+#39+ComboBox1.Items[ComboBox1.ItemIndex]+#39+'');
     ADOQuery1.Open;
     doctor_idd:=strtoint(ADOQuery1.FieldByName('id').AsString);
  end;

end;
procedure TForm9.DBGrid1CellClick(Column: TColumn);
var
sec:string;
begin
    sec:=DBGrid1.Fields[DBGrid1.SelectedIndex].AsString;
    ADOQuery3.SQL.Clear;
    ADOQuery3.SQL.Add('select id from hasta_bilgileri where adi='+#39+sec+#39+'');
    ADOQuery3.Open;
    hasta_idd:=ADOQuery3.FieldByName('id').AsString;
end;
 procedure TForm9.FormShow(Sender: TObject);
var
x,i:integer;
begin
    ComboBox1.Items.Clear;
    kitle;
    ADOQuery2.First;
    while not ADOQuery2.Eof do
    begin
      ComboBox1.Items.Add(ADOQuery2['kullanici_adi']);
      ADOQuery2.Next;
    end;
    ADOQuery3.SQL.Clear;
    ADOQuery3.SQL.Add('select id from kullanici_hesabi where kullanici_adi='+#39+olusturan+#39+'');
    ADOQuery3.Open;
    olusturan_idd:=ADOQuery3.FieldByName('id').AsString;

end;
end.
