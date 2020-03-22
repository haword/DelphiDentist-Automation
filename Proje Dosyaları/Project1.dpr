program Project1;

uses
  Vcl.Forms,
  giris in 'giris.pas' {Form1},
  anasayfa in 'anasayfa.pas' {Form2},
  Vcl.Themes,
  Vcl.Styles,
  tedavi in 'tedavi.pas' {Form4},
  randevu in 'randevu.pas' {Form5},
  kisibil in 'kisibil.pas' {Form6},
  kisiduz in 'kisiduz.pas' {Form8},
  xzy_siniryapan_form in 'xzy_siniryapan_form.pas' {Form7},
  eklekisi in 'eklekisi.pas' {Form3},
  randevuay in 'randevuay.pas' {Form9},
  hesap in 'hesap.pas' {Form10},
  hesapode in 'hesapode.pas' {Form11},
  kualanici_ad_sif in 'kualanici_ad_sif.pas' {Form12},
  supad_des in 'supad_des.pas' {Form13},
  sifre in 'sifre.pas' {Form14};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := true;
  TStyleManager.TrySetStyle('Windows10 SlateGray');

  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.Run;
end.
