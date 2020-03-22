unit giris;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXCalendars, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.WinXPickers, Data.DB, Data.Win.ADODB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    kullaniciadi: TLabeledEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    �ifre: TLabeledEdit;
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure �ifreKeyPress(Sender: TObject; var Key: Char);
    procedure kullaniciadiKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses anasayfa,randevuay,tedavi,sifre;


procedure TForm1.Button1Click(Sender: TObject);
begin

  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('select * from kullanici_hesabi where kullanici_adi='''+kullaniciadi.Text+''' and sifre='''+�ifre.Text+'''');
  ADOQuery1.Open;

if not ADOQuery1.Eof then
begin


  AlphaBlend:=true;
  AlphaBlendValue:=0;
  tedavi.doc:= strtoint(ADOQuery1.FieldByName('id').AsString);
  tedavi.Form4.StaticText26.Caption:=ADOQuery1.FieldByName('kullanici_adi').AsString;
  anasayfa.kullanici_id:=ADOQuery1.FieldByName('kullanici_adi').AsString;
  randevuay.olusturan:=ADOQuery1.FieldByName('kullanici_adi').AsString;
  sifre.Form14.Close;
  anasayfa.Form2.ShowModal;




end
else
begin
  ShowMessage('kullan�c� ad� veya �ifre yanl��');

end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
sifre.Form14.show;
end;

procedure TForm1.kullaniciadiKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then  begin
    Button1.Click;
  end;
end;

procedure TForm1.�ifreKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then  begin
    Button1.Click;
  end;
end;

end.
