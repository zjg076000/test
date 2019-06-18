unit unLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, htmlbtns, AdvEdit, AdvOfficeButtons, inifiles,
  AdvGlowButton, AdvGDIPicture,ActnList, DB, ADODB, AdvSmoothPanel,System.Generics.Collections;

type
  TfrmLogin = class(TForm)
    adq: TADOQuery;
    adq2: TADOQuery;
    AdvSmoothPanel3: TAdvSmoothPanel;
    edt_User: TAdvEdit;
    edt_Pass: TAdvEdit;
    chk: TAdvOfficeCheckBox;
    btnOk: TAdvGlowButton;
    btnExit: TAdvGlowButton;
    procedure Button1Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_PassKeyPress(Sender: TObject; var Key: Char);
  private
     sql:string;
  public
     user_code,user_name,dept_name,begin_time,posi,ip_address,mokuai_name,end_time:string;
    function Login: Boolean;  //��¼����
    function  proc_Loginok:boolean;
    // ȡ�ý�ɫ�Ͳ��ŵ�Ȩ�������ַ���
   function getuser_if (str_tablename:String;str_fieldname:string;uid:string):string;

  end;

var
  frmLogin: TfrmLogin;

implementation
    uses unmain, UnData;
{$R *.dfm}
procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
     //���ͨ����飬����OK
   if proc_Loginok=true then
    BEGIN
     //���ݱ����½Ȩ��
     if chk.Checked then
       dm_DaTa.Proc_WriteIni('��������','UserName',trim(edt_User.text))
       else
        dm_DaTa.Proc_WriteIni('��������','UserName','');

      Self.ModalResult := mrOk;
    END;
end;
function tfrmLogin.proc_Loginok:boolean;
var
  i:integer;
  t_Action:TAction;
  uid:integer;
  str_user_if,str_Dept_if,str_Role_if:String;
  strsql:string;
   str_if:string;
  p:DWORD;

   RoleId,UserId:string;

   IsUser:BOOL;

begin



    if ( edt_user.text='SYSTEM' ) AND  ( edt_Pass.text='MANAGER' ) Then
     BEGIN
         // frmmain.lbl_User.Caption:='�û���:  SYSTEM '+'�� ϵͳ����Ա ��';

         dm_DaTa.UserCode:=edt_user.text;
         dm_DaTa.UserName:='ϵͳ����Ա';
         frmlogin.visible:=false;
         frmlogin.refresh;
         frmmain:=TFrmMain.Create(Self);

        Result:=True;

        frmmain.showmodal;

        EXIT;
     END;


    with adq do
  begin
    Close;
    sql.text:= 'select * from  Sys_User ' +
      'where UserCode = ''' + edt_user.Text + ''' and PassWord='''+edt_Pass.Text+'''';
    Open;
  end;
    if adq.RecordCount>0    then   isUser:=True;

    if isUser=True then
    begin
          //�õ��û�ID
          UserId:=ADQ.FieldByName('Id').AsString;
         dm_DaTa.UserCode:=edt_user.text;
         dm_DaTa.UserName:=ADQ.FieldByName('UserName').AsString;
           frmmain:=TFrmMain.Create(Self);
          //1.��ѯ�û��б� ��Ȩ��  ���뵽Ȩ���б���
           frmmain.FormRightList:=TList<Integer>.Create;
          //2.ȡ���û�Ȩ�ޱ�
            strsql:='select * from Sys_UserFormRight where UserId='+UserId;
            dm_DaTa.QuseryData(adq,strsql);

            while not adq.Eof  do
            begin
             frmmain.FormRightList.Add(adq.FieldByName('FormId').asinteger);
             adq.next;
            end;


         //3.��ɫ�û�Ȩ��
            strsql:='select * from Sys_UserRole where UserId='+UserId;
            //ȡ���û���ɫ
            dm_DaTa.QuseryData(adq,strsql);
            RoleId:='';
            while not  adq.Eof  do
            begin
               if RoleId>'' then
                 RoleId:=RoleId+','+adq.FieldByName('RoleId').AsString
               else
                 RoleId:=adq.FieldByName('RoleId').AsString;
               adq.Next;
            end;

            if RoleId>'' then
            begin
               strsql:='select a.* from Sys_RoleFormRight a  inner join  Sys_Role b '
                    +' on  a.RoleId=b.Id  and a.RoleId in ('+RoleId+')';
               dm_DaTa.QuseryData(adq,strsql);
               while not adq.Eof  do
                begin
                  //�����ظ�Ȩ��
                  if frmmain.FormRightList.Contains(adq.FieldByName('FormId').asinteger)=false then
                    frmmain.FormRightList.Add(adq.FieldByName('FormId').asinteger);
                  adq.next;
                end;
             end;

            Result:=True;

           frMMain.showmodal;

     end

     else
      begin
          Application.Messagebox('��Ч���û�����,����������!', 'ϵͳ��¼', MB_OK+MB_ICONERROR);
         edt_user.Tag := edt_user.Tag + 1;
          edt_user.SetFocus;
         Result:=false;
      end;

   


end;
procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
    Self.ModalResult := mrCancel;
    // application.Terminate;
end;

procedure TfrmLogin.Button1Click(Sender: TObject);
begin

   //  close();
end;

procedure TfrmLogin.edt_PassKeyPress(Sender: TObject; var Key: Char);
begin
      if Key=#13  then
       btnOk.Click;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
   var user,sql:string;
   user:=dm_DaTa.ReadIni('��������','UserName');
   if   Trim(user)>'' then
   begin
      sql:='select * from Sys_User where UserCode='''+User+'''';
      dm_DaTa.QuseryData(Self.adq,sql);
      if adq.RecordCount>0 then
      begin
       edt_User.Text:=user;
       edt_Pass.Text:=adq.FieldByName('PassWord').AsString;;
       chk.Checked:=True;
      end;
     { else
      begin
      / edt_User.SetFocus;
       ShowMessage('�û��������벻��ȷ');
       Exit;

      end;}


   end;
end;

// ȡ�ý�ɫ�Ͳ��ŵ�Ȩ�������ַ���
function Tfrmlogin.getuser_if (str_tablename:String;str_fieldname:string;uid:string):string;
var
   str:string;
begin
    with adq2 do
    begin
     Close;
     SQL.Text:='select * from '+str_tablename+' where uid='+uid;
     open;
     while not eof do
     begin
        if str='' then
          str:=str_fieldname+'='+fieldbyname(str_fieldname).asstring
        else
          str:=str+ 'and '+str_fieldname+'='+fieldbyname(str_fieldname).asstring;
         next;
     end;
     Result:=str;

    end;
end;

function TfrmLogin.Login: Boolean;
begin  //��̬������¼����
 with TfrmLogin.Create(nil) do
  begin  //ֻ�з���OK��ʱ����Ϊ��¼�ɹ�
   Result := ShowModal() = mrOk;
   Free;
 end;
end;
end.
