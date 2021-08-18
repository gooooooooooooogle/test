unit u_Reg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles;

type
  TF_Reg = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  F_Reg: TF_Reg;

implementation
  uses
     u_RegInfo, u_HardWare;
{$R *.dfm}


procedure TF_Reg.Button2Click(Sender: TObject);
begin
    if( Trim(edit1.Text) = '') then
    begin
        showmessage('请先获取机器码');
        Exit;
    end;
    if (edit2.Text <> CheckRegInfo(edit1.Text)) then
    begin
        MessageBox(0, '注册信息不正确', '提示', MB_OK);
    end
    else
    begin
        SetLocalReg(Edit2.Text);
        ModalResult := mrOk;
        Close;
    end;
end;         

procedure TF_Reg.FormShow(Sender: TObject);
begin
   Edit1.Text := HardWareInfo;
   Edit2.Text := GetLocalReg;
end;

end.
