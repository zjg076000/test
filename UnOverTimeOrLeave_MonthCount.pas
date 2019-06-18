unit UnOverTimeOrLeave_MonthCount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unbase_pnl, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, AdvGlowButton,
  Vcl.ComCtrls, RzDTP, Vcl.StdCtrls,System.Generics.Collections, Data.DB,
  Data.Win.ADODB, Vcl.CheckLst, MemTableDataEh, MemTableEh, Datasnap.DBClient,
  Vcl.Grids, Vcl.DBGrids, DataDriverEh;

type
  TFrmOverTimeOrLeave_MonthCount = class(Tfrmbase_pnl)
    pnl_locate: TRzPanel;
    date_begin: TRzDateTimePicker;
    btn_OrderNum_Locate: TAdvGlowButton;
    Grd: TDBGridEh;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton5: TAdvGlowButton;
    RzToolbarButton11: TRzToolbarButton;
    RzToolbarButton2: TRzToolbarButton;
    qry: TADOQuery;
    AdvGlowButton2: TAdvGlowButton;
    RzToolbarButton3: TRzToolbarButton;
    AdvGlowButton3: TAdvGlowButton;
    Adt_Person: TADODataSet;
    ds_TypeData: TDataSource;
    cdt_TypeData: TClientDataSet;
    intgrfld_TypeDataTypeId: TIntegerField;
    strngfld_TypeDataName: TStringField;
    strngfld_TypeDataTableName: TStringField;
    adt_MonthCount: TADODataSet;
    ds_monthcount: TDataSource;
    dsd_MonthCount: TDataSetDriverEh;
    mte_MonthCount: TMemTableEh;
    Label1: TLabel;
    procedure btn_OrderNum_LocateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvGlowButton3Click(Sender: TObject);
    procedure AdvGlowButton2Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton5Click(Sender: TObject);
  private

    Sql:string;
    listType:TList<string>;

    procedure  Proc_Locate(str_Month:string);

    procedure AddHeaderData;    //����ͷ����

    procedure AddTypeToList(qry:TADOQuery;strsql,TableName:String);



    function AddData(cdt_TypeData:TClientDataSet;str_Month:string): boolean;

    //��������ͳ������
    procedure  Proc_BatchData;
    procedure MonthCount_Head;
  public

  end;

var
  FrmOverTimeOrLeave_MonthCount: TFrmOverTimeOrLeave_MonthCount;
      strsql:string;
implementation

  uses UnData;


{$R *.dfm}

function TFrmOverTimeOrLeave_MonthCount.AddData(cdt_TypeData:TClientDataSet;str_Month:string): boolean;
var
    str,str_value,colname,colvalue,colcount:string;
    i,col_count,CountField_Index,Count_TypeId:Integer;     // col_count:ͳ�Ƶ�������CountField_Index��ͳ���ֶε�����ֵ
    PersonId,DeptId:Integer;
    LeaveData_Count,OvertimeData_Count:Real;
    datebegin:string;
begin

     datebegin:=FormatDateTime('yyyy-mm',date_begin.DateTime);
     if cdt_TypeData.RecordCount=0  then     Exit;

    if Adt_Person.RecordCount=0 then  Exit;
     Adt_Person.First;
     while not Adt_Person.Eof  do
     begin
        PersonId:=Adt_Person.FieldByName('PersonId').AsInteger;
        DeptId:=Adt_Person.FieldByName('DeptId').AsInteger;
     cdt_TypeData.First;
     //1.ȡ��ͳ�Ƶ�����
      col_count:=cdt_TypeData.RecordCount;
      str:='insert into  Hrm_OverTimeOrLeave_MonthCount(';

      //'''+datebegin+''''+','+IntToStr(PersonId)
         //  +','+IntToStr(DeptId)+',';

     //1.����cdt_typedata.��¼��  ����SQL���� ǰ���
       for I := 1 to col_count do
       begin
       // if colname='' then
           //  colname:='TD01'
        //else
       //  begin
             if i<10 then

             colname:=colname+','+'TD0'+IntToStr(i)
             else
               colname:=colname+','+'TD'+IntToStr(i);
        // end;

        //     if
           cdt_TypeData.MoveBy(i);
         //   SHOWMESSAGE(cdt_TypeData.FieldByName('TableName').AsString);
          if cdt_TypeData.FieldByName('TableName').AsString='Hrm_LeaveType' then
            PSQL:='Select sum(HourTime) num from Hrm_Leave where PersonId='+IntToStr(PersonId)
                +' and Convert(varchar(7),BeginTime,120) >='''+ datebegin + ''' and '
                +' LeaveType='+cdt_TypeData.FieldByName('TypeId').asstring
           ELSE
            PSQL:='Select sum(HourTime) num from Hrm_OverTime where PersonId='+IntToStr(PersonId)
                +' and Convert(varchar(7),BeginTime,120) >='''+ datebegin + ''' and '
                +' OvertimeType='+cdt_TypeData.FieldByName('TypeId').asstring ;

            dm_DaTa.QuseryData(qry,Psql);
             colcount :=FloatToStr(qry.FieldByName('num').asfloat);

            if colcount='' then    colcount:='0';
          if i=1 then


             colvalue:=','+colcount
        else
            colvalue:=colvalue+','+colcount ;

         end;

     str:='insert into  Hrm_OverTimeOrLeave_MonthCount(ComputeMonth,PersonId,DeptId'+colname+') ' ;
     str_value:=' values('''+datebegin+''''+','+IntToStr(PersonId)+','+IntToStr(DeptId)+colvalue+')';

 //   Sql:=str+str_value;


      if Sql=''  then

       Sql:=str+str_value
      else

      Sql:=Sql+' '+str+str_value;;

    //�ٴγ�ʼ��
     colname:='';
     colvalue:='';
       Adt_Person.Next;


    end;




   //  ShowMessage(Sql) ;
      // colvalue
    // ShowMessage(str);
        // InsertSql:=InsertSql+
       {
      //2. ���ɲ���ֵ



     while not  cdt_TypeData.Eof do
        begin


            //2.ȡ��ͳ�Ƶ�����
            colname:=cdt_TypeData.FieldByName('Name').asstring;
            Count_TypeId:=cdt_TypeData.FieldByName('TypeId').asinteger;
            //3.���������� ��ѯ �������ͼӰ����� ��ȡ�����ID
             Psql:='select * from   Hrm_OvertimeType where name='''+colname+'''';
         //   dm_DaTa.QuseryData(qry,Psql);
            //ͳ���ֶ�����ֵ
            CountField_Index:=i+3;//��

            if qry.RecordCount=0 then        //�����������û�У����ҼӰ����
            begin
               Psql:='select * from   Hrm_OvertimeType where name='''+colname+'''';
               dm_DaTa.QuseryData(qry,Psql);
               if qry.RecordCount=0  then  exit     //����������û�в�����ͳ��
               else       //���ݼӰ�����ҵ��Ӱ�ID ͳ��Ա���ļӰ�����
                begin
                  Count_TypeId:=qry.FieldbyName('Id').asinteger;
                  //��ÿ��Ա��ͳ��
                  if Adt_Person.RecordCount=0 then Exit;    //û��Ա��������ͳ��

                  while not Adt_Person.Eof  do
                  begin
                    PersonId:=Adt_Person.FieldByName('PersonId').asinteger;
                    //ͳ�Ƹ�Ա�����·ݵ��������
                     psql:='select sum(HourTime) num from  Hrm_Leave where '
                      +'(Convert(varchar(7),a.BeginTime,120) >='''+ datebegin + ''' and PersonId='+IntToStr(PersonId);
                     dm_DaTa.QuseryData(qry,psql);



                    // dm_DaTa.qry
                    // LeaveData_Count

                  end;




                end;



            end
            else      //����������ID ͳ��Ա����ٵ�����
            begin

            end;







            str:='  insert into Hrm_Hrm_OverTimeOrLeave_MonthCount_DataCol('
                +'ComputeMonth,ColName) values('''+str_Month+''','''+colname+''')' ;
            InsertSql:=InsertSql+str;


       end;    }
      Proc_BatchData;
     result:=True;
end;

//end;

procedure TFrmOverTimeOrLeave_MonthCount.AddHeaderData;
var
   i:Integer;
begin
   // listType:=TList<string>.Create;
  //  DictTypeData:=TDictionary<integer,string>.Create;
     cdt_TypeData.EmptyDataSet;
    //1.����������
    psql:='select * From Hrm_LeaveType';
    AddTypeToList(qry,psql,'Hrm_LeaveType');
    Psql:='select * from Hrm_OvertimeType';
    AddTypeToList(qry,psql,'Hrm_OvertimeType');

   // for i:=0 to listType.Count-1 do
   // ListBox1.items.Add(listType[i]);


end;





procedure TFrmOverTimeOrLeave_MonthCount.AddTypeToList(qry: TADOQuery;strsql,TableName:string);
begin
     dm_DaTa.QuseryData(qry,strsql);
      with qry do
       begin
         while not Eof  do
          begin
            //����insert sql���
          //  listType.Add(FieldByName('name').AsString);
            cdt_TypeData.Append;

            cdt_TypeData.FieldByName('TypeId').asinteger:=FieldByName('TypeId').asinteger;
            cdt_TypeData.FieldByName('Name').asstring:=FieldByName('Name').asstring;
             cdt_TypeData.FieldByName('TableName').asstring:=TableName;

            cdt_TypeData.Post;
           // ListBox1.Items.Text:=DictTypeData.Keys+':'+DictTypeData.Values;
            Next;
          end;
       end;
end;

procedure TFrmOverTimeOrLeave_MonthCount.AdvGlowButton1Click(Sender: TObject);
begin
   dm_data.DbGridEhToExcel(Grd);
end;

procedure TFrmOverTimeOrLeave_MonthCount.AdvGlowButton2Click(Sender: TObject);
var
  datebegin: string;
begin
 datebegin:=formatdatetime('yyyy-MM',date_begin.DateTime);
  IF   application.MessageBox('��ȷ��Ҫɾ������ͳ��������','��ʾ',MB_OKCANCEL
)=1 then
   begin
      psql:='delete from  Hrm_OverTimeOrLeave_MonthCount '
          +' WHERE  Convert(varchar(7),ComputeMonth,120) ='''+ datebegin + ''' ' ;
      dm_Data.Execsql(qry,psql);
      showmessage('ɾ���ɹ���');

   end;

   Proc_Locate(datebegin);

end;

procedure TFrmOverTimeOrLeave_MonthCount.AdvGlowButton3Click(Sender: TObject);
BEGIN
  //��������ͳ������
  IF   application.MessageBox('��ȷ��Ҫͳ�Ƹ�����ټӰ�������','��ʾ',MB_OKCANCEL
)=1 then
   begin
    //1.����ͷ����
   MonthCount_Head;
   AddData(cdt_TypeData,FormatDateTime('yyyy-MM',date_begin.DateTime));
   showmessage('ͳ��������ɣ�');
   Proc_Locate(formatdatetime('yyyy-MM',date_begin.DateTime));
   end;
end;

procedure TFrmOverTimeOrLeave_MonthCount.AdvGlowButton5Click(Sender: TObject);
begin
  dm_Data.GrdParamter(grd);
end;

procedure TFrmOverTimeOrLeave_MonthCount.btn_OrderNum_LocateClick(
  Sender: TObject);
begin
  MonthCount_Head;

  Proc_Locate(formatdatetime('yyyy-MM',date_begin.DateTime));

end;
procedure TFrmOverTimeOrLeave_MonthCount.FormCreate(Sender: TObject);
begin
 // inherited;
  cdt_TypeData.CreateDataSet;
   cdt_TypeData.Active:=True;
 // cdt_TypeData.CreateDataSet;

end;

procedure  TFrmOverTimeOrLeave_MonthCount.Proc_BatchData;
var I,x:integer;
    SqlStr,MsgStr:string;
    ID,Name:string;
    Time:Cardinal;
begin

  // һ�β���1�������� ��ʱ��Լ4��
 // Time:=GetTickCount;

  //1.������ͳ��ʱ����Щ������Ҫͳ������



 { while not Adt_Person.eof  do
  begin
      PersonId:=Adt_Person.FieldByName('PersonId').AsInteger;
      DeptId:=Adt_Person.FieldByName('DeptId').AsInteger;

    SqlStr:=SqlStr+'   insert into Hrm_OverTime(PersonId,DeptId,OvertimeType,'
                  +'Reason,BeginTime,EndTime,OvertimeDate,HourTime) values('+IntToStr(PersonId)
                  +','+IntToStr(DeptId)+','+IntToStr(OvertimeType)+',+'''+Reason+''', '
                  +''''+BeginTime+''','''+EndTime+''','''+OverTimeDate+''','+HourTime+')';

     Adt_Person.Next;
  end;             }


//  showmessage(SqlStr);
  dm_Data.adoconn.BeginTrans;
  dm_Data.ADOCommand.CommandText:=Sql;
 // showmessage(SqlStr);
  dm_Data.ADOCommand.Execute();
  dm_Data.adoconn.CommitTrans;
 end;

procedure TFrmOverTimeOrLeave_MonthCount.MonthCount_Head;
var
  i: Integer;
begin
  //1.����ͷ����
  AddHeaderData;
  //for I := Low to High do
  cdt_TypeData.First;
  for I := 3 to 14 do
    Grd.Columns[i].Visible := false;
  i := 3;
  while not cdt_TypeData.EOF do
  begin
    Grd.Columns[i].Title.Caption := cdt_TypeData.FieldByName('Name').AsString;
    Grd.Columns[i].Visible := True;
    i := i + 1;
    cdt_TypeData.Next;
  end;
end;
procedure TFrmOverTimeOrLeave_MonthCount.Proc_Locate(str_Month: string);
var
  datebegin, dateend: String;
  workstate: integer;
begin
  datebegin := formatdatetime('yyyy-MM', date_begin.Date);

  Psql := 'select   c.PCode,c.PName,b.DeptName,a.*  FROM Hrm_OverTimeOrLeave_MonthCount a '
         +' left   join   Hrm_Dept b   on   a.DeptId=b.DeptId '
         +' left   join   Hrm_Person c   on   a.PersonId=c.PersonId '
         +' WHERE  Convert(varchar(7),a.ComputeMonth,120) ='''+ datebegin + ''' ' ;


  with adt_MonthCount do
  begin
    close;
    commandtext:=Psql;
    open;
  end;

    Mte_MonthCount.close;
    Mte_MonthCount.open;



end;

end.

