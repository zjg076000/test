unit UnOverTime_BatchData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unbase_addEdit, Unbase_pnl, Vcl.Buttons,
  RzButton, Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  DBCtrlsEh, Vcl.DBCtrls, Vcl.Mask, RzLabel, RzDBLbl, RzEdit, Vcl.ComCtrls,
  RzDBCmbo, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, AdvOfficeImage,StrUtils;

type
  TFrmOverTime_BatchData = class(TFrmBase_AddEdit)
    RzPanel3: TRzPanel;
    RzPanel6: TRzPanel;
    SpeedButton1: TSpeedButton;
    lbl2: TLabel;
    lbl3: TLabel;
    rzpnl1: TRzPanel;
    Label4: TLabel;
    mmo_Personlist: TRzMemo;
    Label31: TLabel;
    mmo_rease: TRzMemo;
    Label1: TLabel;
    cbb_Type: TRzDBLookupComboBox;
    Label28: TLabel;
    dtp_begintime: TDateTimePicker;
    Label3: TLabel;
    dtp_endtime: TDateTimePicker;
    Label40: TLabel;
    Label41: TLabel;
    dtp_overtimeDate: TDateTimePicker;
    lbl1: TLabel;
    chk: TCheckBox;
    AdvOfficeImage1: TAdvOfficeImage;
    Adt_Person: TADODataSet;
    dso_Person: TDataSource;
    edt_Name: TEdit;
    RzPanel5: TRzPanel;
    GRD: TDBGridEh;
    Adt_OverTimeType: TADODataSet;
    dso_OvertimeType: TDataSource;
    edt_Hour3: TMaskEdit;
    edt_Hour: TEdit;
    procedure GRDDblClick(Sender: TObject);
    procedure chkClick(Sender: TObject);
    procedure edt_NameChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure edt_Hour3KeyPress(Sender: TObject; var Key: Char);
  private
    procedure SelectData;
    procedure  Proc_BatchData(PersonId,DeptId,OvertimeType:Integer;
           Reason,BeginTime,EndTime,OverTimeDate,HourTime:string);
  public
    { Public declarations }
  end;

var
  FrmOverTime_BatchData: TFrmOverTime_BatchData;

implementation
    uses UnData;
{$R *.dfm}

procedure TFrmOverTime_BatchData.btnSaveClick(Sender: TObject);
var
  PersonId,DeptId,OvertimeType:Integer;
           Reason,BeginTime,EndTime,OverTimeDate,HourTime:string;
begin
   // RecordNum:=Adt_Person.RecordCount;//��¼����
  if Adt_Person.RecordCount=0 then
    begin
       ShowMessage('��û��ѡ����Ա');
       Exit;
    end;

  Adt_Person.First;
  PersonId:=Adt_Person.FieldByName('PersonId').AsInteger;
  DeptId:=Adt_Person.FieldByName('DeptId').AsInteger;
  OvertimeType:=cbb_Type.KeyValue;

  Reason:=mmo_rease.Lines.Text;
  BeginTime:=FormatDateTime('yyyy-MM-dd HH:mm',dtp_begintime.DateTime);
  EndTime:=FormatDateTime('yyyy-MM-dd HH:mm',dtp_endtime.DateTime);
  OverTimeDate:=FormatDateTime('yyyy-MM-dd HH:mm',dtp_overtimeDate.DateTime);
  HourTime:=floattostr(strtofloat(edt_Hour.Text));


  Proc_BatchData(PersonId,DeptId,OvertimeType,Reason,BeginTime,EndTime,OverTimeDate,HourTime);
  Close;
  end;

procedure TFrmOverTime_BatchData.chkClick(Sender: TObject);

begin
  SelectData;

end;

procedure TFrmOverTime_BatchData.edt_Hour3KeyPress(Sender: TObject;
  var Key: Char);

 var
 edt: TEdit;
 str, strL, strR: string;
 p: integer;
begin
   // ��ȡ��ǰ�ı�����, ע��Ҫȥ��ѡ�в���(��Ϊ�ᱻ��д).
 edt_Hour := TEdit(Sender);
 str := edt_Hour.text;
 if Length(edt_Hour.SelText) <> 0 then
 begin
   strL := LeftStr(edt_Hour.text, edt_Hour.SelStart);
   strR := RightStr(edt_Hour.text, Length(edt_Hour.text) - edt_Hour.SelStart - edt_Hour.SelLength);
   str := strL + strR;
 end;
   // ������������/С����/�˸��
 if not (Key in [#8, #13, #127, '.', '-', '0'..'9']) then Key := #0;
   //����ֻ������һ��С����
 if Key = '.' then
 begin
   p := Pos('.', edt_Hour.Text);
   if p > 0 then Key := #0;
 end;
   //����ֻ���ڵ�һλ������ֻ������һ��'-'��
 if Key = '-' then
 begin
   if edt_Hour.SelStart > 0 then Key := #0;
   p := Pos('-', edt_Hour.Text);
   if p > 0 then Key := #0;
 end;

end;

procedure TFrmOverTime_BatchData.edt_NameChange(Sender: TObject);

begin
   dm_DaTa.FilerData(edt_Name.Text,'Hrm_Person','PName',Adt_Person);


end;

procedure TFrmOverTime_BatchData.GRDDblClick(Sender: TObject);
begin
 if Adt_Person.RecordCount=0 then  Exit;

    Adt_Person.EDIT;
  if Adt_Person.FieldByName('IsSelect').AsBoolean = true then
    Adt_Person.FieldByName('IsSelect').AsBoolean := FALSE
  else
   Adt_Person.FieldByName('IsSelect').AsBoolean := true;


end;

procedure TFrmOverTime_BatchData.SpeedButton1Click(Sender: TObject);
begin
 mmo_Personlist.Lines.Clear;
 chk.Checked:=True;
 SelectData;
 if Adt_Person.RecordCount=0 then  Exit;

 Adt_Person.First;
 while not   Adt_Person.Eof  do
  begin
   if mmo_Personlist.Lines.text='' then
    mmo_Personlist.Lines.text:=Adt_Person.FieldByName('PName').AsString
   else
    mmo_Personlist.Lines.text:=mmo_Personlist.Lines.text+','+Adt_Person.FieldByName('PName').AsString;
   Adt_Person.Next;
 end
end;

procedure TFrmOverTime_BatchData.SelectData;
begin
  with Adt_Person do
  begin
    Close;
    if chk.Checked = false then
      commandtext := 'select * from Hrm_Person '
    else
      commandtext := 'select * from Hrm_Person where IsSelect=1 ';
    Open;
  end;
end;
procedure  TFrmOverTime_BatchData.Proc_BatchData(PersonId,DeptId,OvertimeType:Integer;
           Reason,BeginTime,EndTime,OverTimeDate,HourTime:string);
var I,x:integer;
    SqlStr,MsgStr:string;
    ID,Name:string;
    Time:Cardinal;
begin

  // һ�β���1�������� ��ʱ��Լ4��
 // Time:=GetTickCount;



  while not Adt_Person.eof  do
  begin
      PersonId:=Adt_Person.FieldByName('PersonId').AsInteger;
      DeptId:=Adt_Person.FieldByName('DeptId').AsInteger;

    SqlStr:=SqlStr+'   insert into Hrm_OverTime(PersonId,DeptId,OvertimeType,'
                  +'Reason,BeginTime,EndTime,OvertimeDate,HourTime) values('+IntToStr(PersonId)
                  +','+IntToStr(DeptId)+','+IntToStr(OvertimeType)+',+'''+Reason+''', '
                  +''''+BeginTime+''','''+EndTime+''','''+OverTimeDate+''','+HourTime+')';

     Adt_Person.Next;
  end;


//  showmessage(SqlStr);
  dm_Data.adoconn.BeginTrans;
  dm_Data.ADOCommand.CommandText:=SqlStr;
 // showmessage(SqlStr);
  dm_Data.ADOCommand.Execute();
  dm_Data.adoconn.CommitTrans;
 end;
end.
