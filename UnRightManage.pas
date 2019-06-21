unit UnRightManage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Unbase_pnl, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, dxGDIPlusClasses,
  Vcl.StdCtrls, MemTableDataEh, Data.DB, Data.Win.ADODB, DataDriverEh,
  MemTableEh, AdvGlowButton, AdvSmoothLabel, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList;

type
  TfrmRightManager = class(Tfrmbase_pnl)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    Label1: TLabel;
    Image1: TImage;
    RzPanel5: TRzPanel;
    RzPanel6: TRzPanel;
    RzPanel7: TRzPanel;
    RzPanel9: TRzPanel;
    RzPanel10: TRzPanel;
    lbl_01: TLabel;
    Image4: TImage;
    DBGridEh2: TDBGridEh;
    RzPanel15: TRzPanel;
    Label6: TLabel;
    Image6: TImage;
    btnDeleteUser: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    RzPanel16: TRzPanel;
    RzPanel18: TRzPanel;
    RzPanel17: TRzPanel;
    btn_DeleteRoleUser: TAdvGlowButton;
    btnRoleUser: TAdvGlowButton;
    DBGridEh5: TDBGridEh;
    rzpnl1: TRzPanel;
    btn1: TAdvGlowButton;
    btn2: TAdvGlowButton;
    DBGridEh4: TDBGridEh;
    advsmthlbl1: TAdvSmoothLabel;
    AdtFunction: TADODataSet;
    dsdFunction: TDataSetDriverEh;
    dsoFunction: TDataSource;
    AdtFunctionmkname: TStringField;
    AdtFunctionflname: TWideStringField;
    AdtFunctionIsSelect: TBooleanField;
    mteFunction: TMemTableEh;
    dsd_UserRight: TDataSetDriverEh;
    dso_UserRight: TDataSource;
    adtFormFunction: TADODataSet;
    Qry: TADOQuery;
    adtRoleUser: TADODataSet;
    dsdRoleUser: TDataSetDriverEh;
    dsoRoleUser: TDataSource;
    adtRoleUserId: TIntegerField;
    adtRoleUserUserId: TIntegerField;
    adtRoleUserRoleId: TIntegerField;
    mteRoleUser: TMemTableEh;
    mteRoleUserId: TIntegerField;
    mteRoleUserUserId: TIntegerField;
    mteRoleUserRoleId: TIntegerField;
    dsdRoleRight: TDataSetDriverEh;
    mte_RoleRight: TMemTableEh;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    BooleanField1: TBooleanField;
    dso_RoleRight: TDataSource;
    adtRoleRight: TADODataSet;
    IntegerField4: TIntegerField;
    BooleanField2: TBooleanField;
    adtRoleRightRoleId: TIntegerField;
    adtRoleRightId: TAutoIncField;
    mte_RoleRightFormName: TStringField;
    DBGridEh6: TDBGridEh;
    mteUser: TMemTableEh;
    AdtUser: TADODataSet;
    dsoUser: TDataSource;
    dsdUser: TDataSetDriverEh;
    adtUserLookUp: TADODataSet;
    mte_UserRight: TMemTableEh;
    adtUserRight: TADODataSet;
    adtUserRightId: TAutoIncField;
    adtUserRightUserId: TIntegerField;
    adtUserRightFormId: TIntegerField;
    adtUserRightIsSelect: TBooleanField;
    mte_UserRightId: TAutoIncField;
    mte_UserRightUserId: TIntegerField;
    mte_UserRightFormId: TIntegerField;
    mte_UserRightIsSelect: TBooleanField;
    mte_UserRightFormName: TStringField;
    adtRole: TADODataSet;
    mteRole: TMemTableEh;
    dsoRole: TDataSource;
    dsdRole: TDataSetDriverEh;
    ImageList1: TImageList;
    RzPanel12: TRzPanel;
    btnAddRight: TAdvGlowButton;
    btnDeleteRight: TAdvGlowButton;
    btnAddRight2: TAdvGlowButton;
    btnDeleteRight2: TAdvGlowButton;
    RzPanel14: TRzPanel;
    GRD1: TDBGridEh;
    RzPanel13: TRzPanel;
    Label2: TLabel;
    Image2: TImage;
    RzPanel8: TRzPanel;
    RzPanel11: TRzPanel;
    lbl_02: TLabel;
    Image3: TImage;
    DBGridEh3: TDBGridEh;
    procedure adtRoleAfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure mteUserAfterScroll(DataSet: TDataSet);
    procedure mteRoleAfterScroll(DataSet: TDataSet);
    procedure btnAddRightClick(Sender: TObject);
    procedure btnDeleteRightClick(Sender: TObject);
    procedure btnRoleUserClick(Sender: TObject);
    procedure btn_DeleteRoleUserClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
    procedure btnAddRight2Click(Sender: TObject);
    procedure btnDeleteRight2Click(Sender: TObject);
    procedure adtUserNewRecord(DataSet: TDataSet);
    procedure adtUserAfterPost(DataSet: TDataSet);
    procedure Grd01Columns1DropDownBoxGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure Grd01Columns1DropDownBoxApplyTextFilter(Sender: TCustomDBGridEh;
      Column: TColumnEh; DataSet: TDataSet; FieldName: string;
      Operation: TLSAutoFilterTypeEh; FilterText: string);
    procedure mteUserAfterPost(DataSet: TDataSet);
    procedure mte_UserRightNewRecord(DataSet: TDataSet);
    procedure DBGridEh2CellClick(Column: TColumnEh);
    procedure mte_UserRightFormNameChange(Sender: TField);
  private
    procedure Proc_DeleteCurrentRowData(mte:TMemTableEh);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRightManager: TfrmRightManager;

implementation
  uses UnData;
{$R *.dfm}

procedure TfrmRightManager.adtRoleAfterScroll(DataSet: TDataSet);
begin
  inherited;
 //  lbl_02.Caption.SetTextBuf(PWideChar('Ȩ�޹���---��'+DataSet.FieldByName('RoleName').AsString;+'��Ȩ���б�');

  end;

procedure TfrmRightManager.btnRoleUserClick(Sender: TObject);
var
   UserId,RoleId:string;
   sql:string;
   adoconn: TADOConnection;
   adocommand: TADOCommand;

begin
    RoleId:=mteRole.FieldByName('Id').AsString;

  psql:='select Id From Sys_User where IsSelect=1  and  Id not in '
        +'(select UserId from  Sys_UserRole where RoleId='+RoleId+')' ;

  // Psql:='select Id From Sys_User where IsSelect=1 and Id not in ('
   //     +'select  UserId from Sys_UserRole where  RoleId='
 //       +mteRole.FieldByName('Id').AsString+')';

   dm_DaTa.QuseryData(Qry,Psql);
   {if Qry.RecordCount=0 then
    begin
       ShowMessage('��û��ѡ��Ҫ��ӵ��û�');
       Exit;
    end;
               }

   while not Qry.Eof  do
   begin
      UserId:=Qry.FieldByName('Id').AsString;
      sql:=sql+' insert into Sys_UserRole(UserId,RoleId) '
        +' values('+UserId+','+RoleId+')';

      Qry.Next;


   end;

   if sql>'' then
    begin
      adoconn := TADOConnection.Create(self);
      adoconn.ConnectionString := dm_DaTa.adoconn.ConnectionString;
      adoconn.LoginPrompt := False;
      adoconn.Open();
      adoconn.BeginTrans;
      adocommand := TADOCommand.Create(nil);
      adocommand.Connection := adoconn;
      adocommand.CommandText := sql;
//  showmessage(SqlStr);
      adocommand.Execute();
      adoconn.CommitTrans;
      adoconn.Close;
      adoconn.Free;
    end;

    //���±�־λ
   psql:='update Sys_User set IsSelect=0 ';
   dm_DaTa.Execsql(Qry,psql);


   AdtUser.Requery();
   mteUser.close;
   mteUser.open;

   AdtRoleUser.Requery();
   mteRoleUser.close;
   mteRoleUser.open;



end;

procedure TfrmRightManager.btn_DeleteRoleUserClick(Sender: TObject);
begin
  Proc_DeleteCurrentRowData(mteRoleUser);
end;

procedure TfrmRightManager.Proc_DeleteCurrentRowData(mte:TMemTableEh);
begin
  if Application.MessageBox('��ȷ������ѡ�����ݵĽ���ɾ����', '��ʾ', MB_OKCANCEL) = 1 then
  begin
     if mte.RecordCount=0  then  Exit;
      mte.Delete;
      ShowMessage('����ɾ���ɹ�');
  end;
end;

procedure TfrmRightManager.btnDeleteUserClick(Sender: TObject);
begin
 // mteRoleUser
   Proc_DeleteCurrentRowData(mteUser);
end;

procedure TfrmRightManager.adtUserAfterPost(DataSet: TDataSet);
begin
  inherited;
 //  Grd01.Columns[1].ButtonStyle:=TCellButtonStyleEh.cbsNone;
end;

procedure TfrmRightManager.adtUserNewRecord(DataSet: TDataSet);
begin
 // inherited;
  //  Grd01.Columns[1].ButtonStyle:=TCellButtonStyleEh.cbsDropDown;
   // Grd01.Columns[1].DropDown;
end;

procedure TfrmRightManager.btnAddRight2Click(Sender: TObject);
var
  sql:string;
  RoleId,FormId:string;
  adoconn: TADOConnection;
  adocommand: TADOCommand;

begin
if Application.MessageBox('��ȷ������ѡ���ģ�������Ȩ��','��ʾ',MB_OKCANCEL)=1
 then
begin
  RoleId:=mteRole.FieldByName('Id').AsString;

  psql:='select id from  sys_form_mk where IsSelect=1  and  id not in '
        +'(select FormId from  Sys_RoleFormRight where RoleId='+RoleId+')' ;
  dm_DaTa.QuseryData(Qry,psql);
  //�û�Id
 { if Qry.RecordCount=0 then
  begin
    ShowMessage('��ѡ��ϵͳ���ܵ�ģ��������Ȩ');
    Exit;
  end;     }
  while not  Qry.Eof do
   begin
     //����Id
     FormId:=Qry.FieldByName('id').AsString;
     sql:=sql+' insert into Sys_RoleFormRight(RoleId,FormId) values('
          +RoleId+','+FormId+')';

     Qry.Next;

   end;

   if sql>'' then
    begin
        adoconn := TADOConnection.Create(self);
      adoconn.ConnectionString := dm_DaTa.adoconn.ConnectionString;
      adoconn.LoginPrompt := False;
      adoconn.Open();
      adoconn.BeginTrans;
      adocommand := TADOCommand.Create(nil);
      adocommand.Connection := adoconn;
      adocommand.CommandText := sql;
//  showmessage(SqlStr);
      adocommand.Execute();
      adoconn.CommitTrans;
      adoconn.Close;
      adoconn.Free;
    end;

    //���±�־λ
   psql:='update sys_form_mk set IsSelect=0 ';
   dm_DaTa.Execsql(Qry,psql);


   AdtFunction.Requery();
   mteFunction.close;
   mteFunction.open;


   adtRoleRight.Requery();
   mte_RoleRight.close;
   mte_RoleRight.open;


 end;


end;

procedure TfrmRightManager.btnAddRightClick(Sender: TObject);
var
  sql:string;
  UserId,FormId:string;
  adoconn: TADOConnection;
  adocommand: TADOCommand;

begin
if Application.MessageBox('��ȷ������ѡ���ģ�������Ȩ��','��ʾ',MB_OKCANCEL)=1
 then
begin
  UserId:=mteUser.FieldByName('Id').AsString;

  psql:='select id from  sys_form_mk where IsSelect=1  and  id not in '
        +'(select FormId from  Sys_UserFormRight where UserId='+UserId+')' ;
  dm_DaTa.QuseryData(Qry,psql);
  //�û�Id
 { if Qry.RecordCount=0 then
  begin
    ShowMessage('��ѡ��ϵͳ���ܵ�ģ��������Ȩ');
    Exit;
  end;     }
  while not  Qry.Eof do
   begin
     //����Id
     FormId:=Qry.FieldByName('id').AsString;
     sql:=sql+' insert into Sys_UserFormRight(UserId,FormId) values('
          +UserId+','+FormId+')';

     Qry.Next;

   end;

   if sql>'' then
    begin
        adoconn := TADOConnection.Create(self);
      adoconn.ConnectionString := dm_DaTa.adoconn.ConnectionString;
      adoconn.LoginPrompt := False;
      adoconn.Open();
      adoconn.BeginTrans;
      adocommand := TADOCommand.Create(nil);
      adocommand.Connection := adoconn;
      adocommand.CommandText := sql;
//  showmessage(SqlStr);
      adocommand.Execute();
      adoconn.CommitTrans;
      adoconn.Close;
      adoconn.Free;
    end;

    //���±�־λ
   psql:='update sys_form_mk set IsSelect=0 ';
   dm_DaTa.Execsql(Qry,psql);


   AdtFunction.Requery();
   mteFunction.close;
   mteFunction.open;


   adtUserRight.Requery();
   mte_UserRight.close;
   mte_UserRight.open;


 end;

end;

procedure TfrmRightManager.btnDeleteRight2Click(Sender: TObject);
begin
  if Application.MessageBox('��ȷ������ѡ��Ľ�ɫȡ����Ȩ��','��ʾ',MB_OKCANCEL)=1
 then
 BEGIN
   psql:='delete from Sys_RoleFormRight where IsSelect=1 and RoleId='
         +mteRole.FieldByName('Id').AsString;
   dm_DaTa.Execsql(Qry,psql);
   adtRoleRight.Requery();
   mte_RoleRight.Close;
   mte_roleRight.Open;
 end;

end;

procedure TfrmRightManager.btnDeleteRightClick(Sender: TObject);
begin
 if Application.MessageBox('��ȷ������ѡ���ģ��ȡ����Ȩ��','��ʾ',MB_OKCANCEL)=1
 then
 BEGIN
   psql:='delete from Sys_UserFormRight where IsSelect=1 and UserId='
         +mteUser.FieldByName('Id').AsString;
   dm_DaTa.Execsql(Qry,psql);
   adtUserRight.Requery();
   mte_UserRight.Close;
   mte_UserRight.Open;
 end;

end;

procedure TfrmRightManager.Button1Click(Sender: TObject);
begin
  inherited;
    lbl_01.Caption:='001';
end;

procedure TfrmRightManager.DBGridEh2CellClick(Column: TColumnEh);
begin
  inherited;
   if mte_UserRight.RecordCount=0 then    Exit;

end;

procedure TfrmRightManager.Grd01Columns1DropDownBoxApplyTextFilter(
  Sender: TCustomDBGridEh; Column: TColumnEh; DataSet: TDataSet;
  FieldName: string; Operation: TLSAutoFilterTypeEh; FilterText: string);
begin
//  inherited;
  // FilterText:=
end;

procedure TfrmRightManager.Grd01Columns1DropDownBoxGetCellParams(
  Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
//inherited;
  //olumn.Field.Value:=
end;

procedure TfrmRightManager.mteRoleAfterScroll(DataSet: TDataSet);

  var
  str:string;
begin
   DBGridEh5.Columns[0].Title.Caption:='��'+DataSet.FieldByName('RoleName').AsString+'���û��б�';


   str:='Ȩ�޹���---��'+DataSet.FieldByName('RoleName').AsString+'��Ȩ���б�';
 //  ShowMessage(str);
   lbl_02.Caption:=str;
end;

procedure TfrmRightManager.mteUserAfterPost(DataSet: TDataSet);
begin
 // mteUser.ApplyUpdates(0);
  //mteUser.a

end;

procedure TfrmRightManager.mteUserAfterScroll(DataSet: TDataSet);
var
  str:string;
begin
   str:='Ȩ�޹���---��'+mteUser.FieldByName('UserName').AsString+'��Ȩ���б�';
 //  ShowMessage(str);
   lbl_01.Caption:=str;
 // RzPanel10.Refresh;
end;

procedure TfrmRightManager.mte_UserRightFormNameChange(Sender: TField);
begin
  inherited;
   if mte_UserRight.FieldByName('FormId').isnull then   Exit;

end;

procedure TfrmRightManager.mte_UserRightNewRecord(DataSet: TDataSet);
begin
  inherited;
  mte_UserRight.Cancel;
end;

end.
