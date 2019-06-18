unit UnSalerRight;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  AdvGlowButton, Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel, Data.DB, Datasnap.DBClient,
  Data.Win.ADODB, MemTableDataEh, DataDriverEh, MemTableEh;

type
  TFrmSalerRight = class(TForm)
    RzPanel1: TRzPanel;
    lbl: TLabel;
    Edt_User: TEdit;
    Label1: TLabel;
    Edt_Password: TEdit;
    btnLogin: TAdvGlowButton;
    RzPanel2: TRzPanel;
    btn: TAdvGlowButton;
    dso: TDataSource;
    Adt: TADODataSet;
    mte: TMemTableEh;
    dsd: TDataSetDriverEh;
    GRD: TDBGridEh;
    procedure btnLoginClick(Sender: TObject);
    procedure AdtNewRecord(DataSet: TDataSet);
    procedure btnClick(Sender: TObject);
  private
    { Private declarations }
  public
    TypeName:string;
  end;

var
  FrmSalerRight: TFrmSalerRight;

implementation
   uses UnData;
{$R *.dfm}

procedure TFrmSalerRight.AdtNewRecord(DataSet: TDataSet);
begin
    Adt.FieldByName('TypeName').AsString:=TypeName;
end;

procedure TFrmSalerRight.btnClick(Sender: TObject);
var
  Str:string;
begin
    mte.filter:='IsSelect=1';
    mte.filtered:=true;

   if mte.recordcount=0 then
    begin
     ShowMessage('ѡ�����Ŀ����Ϊ0,������ѡ����Ŀ');
     exit;
    end;
    mte.first;
    while not mte.Eof  do
    begin
      if Str='' then  Str:=TRIM(mte.FieldByName('name').AsString)
      else
         str:=str+'|'+TRIM(mte.FieldByName('name').AsString);
      mte.Next;
    end;
    dm_DaTa.Proc_WriteIni('��������',TypeName,str);
end;

procedure TFrmSalerRight.btnLoginClick(Sender: TObject);
begin
    if  (Edt_User.Text='SYSTEM') and  (Edt_Password.Text='MANAGER') then
    begin
        btnLogin.Caption:='ע��';
        GRD.ReadOnly:=False;
        btn.Enabled:=True;

    end
    else
      ShowMessage('�û��������������');
end;

end.
