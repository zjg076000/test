unit UnOrderRight;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  AdvGlowButton, Vcl.StdCtrls, Vcl.ExtCtrls, RzPanel, Data.DB, Datasnap.DBClient,
  Data.Win.ADODB, MemTableDataEh, DataDriverEh, MemTableEh, AdvSmoothLabel;

type
  TFrmOrderRight = class(TForm)
    RzPanel2: TRzPanel;
    btn: TAdvGlowButton;
    dso: TDataSource;
    Adt: TADODataSet;
    mte: TMemTableEh;
    dsd: TDataSetDriverEh;
    RzPanel1: TRzPanel;
    GRD: TDBGridEh;
    advsmthlbl1: TAdvSmoothLabel;
    chk_select: TCheckBox;
    procedure btnLoginClick(Sender: TObject);
    procedure AdtNewRecord(DataSet: TDataSet);
    procedure btnClick(Sender: TObject);
    procedure chk_selectClick(Sender: TObject);
  private
    { Private declarations }
  public
    TypeName:string;
  end;

var
  FrmOrderRight: TFrmOrderRight;

implementation
   uses UnData;
{$R *.dfm}

procedure TFrmOrderRight.AdtNewRecord(DataSet: TDataSet);
begin
    Adt.FieldByName('TypeName').AsString:=TypeName;
end;

procedure TFrmOrderRight.btnClick(Sender: TObject);
var
  Str:string;
begin
    mte.filter:='IsSelect=1';
    mte.filtered:=true;
    TypeName:=mte.FieldByName('TypeName').AsString;
   if mte.recordcount=0 then
    begin
     ShowMessage('ѡ�����Ŀ����Ϊ0,������ѡ����Ŀ');
     exit;
    end;
    mte.first;
    var  i:Integer;
    for I := 1 to mte.RecordCount do

    begin
      if Str='' then  Str:=TRIM(mte.FieldByName('name').AsString)
      else
         str:=str+'|'+TRIM(mte.FieldByName('name').AsString);
      if i<mte.RecordCount then

      mte.Next;
    end;
    dm_DaTa.Proc_WriteIni('��������',TypeName,str);
end;

procedure TFrmOrderRight.btnLoginClick(Sender: TObject);
begin
  {  if  (Edt_User.Text='SYSTEM') and  (Edt_Password.Text='MANAGER') then
    begin
        btnLogin.Caption:='ע��';
        GRD.ReadOnly:=False;
        btn.Enabled:=True;

    end
    else
      ShowMessage('�û��������������');       }
end;

procedure TFrmOrderRight.chk_selectClick(Sender: TObject);
begin
      dm_DaTa.MemDataIsSelect(chk_select,mte);
end;

end.
