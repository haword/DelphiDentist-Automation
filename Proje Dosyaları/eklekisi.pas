unit eklekisi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Mask;

type
  TForm3 = class(TForm)
    GridPanel1: TGridPanel;
    StaticText1: TStaticText;
    MaskEdit1: TMaskEdit;
    StaticText2: TStaticText;
    MaskEdit2: TMaskEdit;
    StaticText3: TStaticText;
    MaskEdit3: TMaskEdit;
    StaticText4: TStaticText;
    Memo1: TMemo;
    StaticText5: TStaticText;
    MaskEdit4: TMaskEdit;
    StaticText6: TStaticText;
    MaskEdit5: TMaskEdit;
    StaticText7: TStaticText;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    StaticText9: TStaticText;
    GridPanel2: TGridPanel;
    StaticText12: TStaticText;
    MaskEdit11: TMaskEdit;
    StaticText13: TStaticText;
    MaskEdit12: TMaskEdit;
    StaticText14: TStaticText;
    MaskEdit13: TMaskEdit;
    StaticText16: TStaticText;
    MaskEdit14: TMaskEdit;
    StaticText17: TStaticText;
    MaskEdit15: TMaskEdit;
    StaticText8: TStaticText;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
ak_iid,cinss:string;
begin
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('insert into akraba (adi,soyadi,yak�nl�k,gsm,mail) values(:ves1, :ves2, :ves3, :ves4, :ves5)');
ADOQuery1.Parameters.ParamByName('ves1').Value:=MaskEdit11.Text;
ADOQuery1.Parameters.ParamByName('ves2').Value:=MaskEdit12.Text;
ADOQuery1.Parameters.ParamByName('ves3').Value:=MaskEdit13.Text;
ADOQuery1.Parameters.ParamByName('ves4').Value:=MaskEdit14.Text;
ADOQuery1.Parameters.ParamByName('ves5').Value:=MaskEdit15.Text;
ADOQuery1.ExecSQL;

ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('select top 1 id from akraba order by id desc');
ADOQuery1.Open;
ak_iid:=ADOQuery1.FieldByName('id').AsString;
if RadioButton1.Checked=true then
    begin
      cinss:='1';
    end
    else
    begin
      cinss:='0';
    end;
ADOQuery1.SQL.Clear;
ADOQuery1.SQL.Add('insert into hasta_bilgileri(adi,soyadi,kimlik_no,adres,gsm,mail,akraba_id,cinsiyet) values (:ves1, :ves2, :ves3, :ves4, :ves5, :ves6, :ves7, :ves8)');
ADOQuery1.Parameters.ParamByName('ves1').Value:=MaskEdit1.Text;
ADOQuery1.Parameters.ParamByName('ves2').Value:=MaskEdit2.Text;
ADOQuery1.Parameters.ParamByName('ves3').Value:=MaskEdit3.Text;
ADOQuery1.Parameters.ParamByName('ves4').Value:=Memo1.Lines.CommaText;
ADOQuery1.Parameters.ParamByName('ves5').Value:=MaskEdit4.Text;
ADOQuery1.Parameters.ParamByName('ves6').Value:=MaskEdit5.Text;
ADOQuery1.Parameters.ParamByName('ves7').Value:=ak_iid;
ADOQuery1.Parameters.ParamByName('ves8').Value:=cinss;
ADOQuery1.ExecSQL;
end;

end.
