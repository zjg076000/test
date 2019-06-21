unit UnOrderTracking;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Unbase_pnl, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls,
  MemTableDataEh, Data.DB, Data.Win.ADODB, MemTableEh, DataDriverEh,
  Vcl.ComCtrls, AdvGlowButton, AdvSmoothLabel, Vcl.Samples.Spin,System.Generics.Collections,System.DateUtils,
  Vcl.WinXCtrls;

type
  TFrmOrderTracking = class(Tfrmbase_pnl)
    RzPanel3: TRzPanel;
    Label1: TLabel;
    RzPanel4: TRzPanel;
    chk_select: TCheckBox;
    GRD: TDBGridEh;
    adt: TADODataSet;
    dsd: TDataSetDriverEh;
    dso: TDataSource;
    mte: TMemTableEh;
    qry: TADOQuery;
    qry_erp: TADOQuery;
    btn_tel: TAdvGlowButton;
    RzToolbarButton3: TRzToolbarButton;
    RzToolbarButton7: TRzToolbarButton;
    Label28: TLabel;
    datebegin: TDateTimePicker;
    Label2: TLabel;
    dateend: TDateTimePicker;
    btn_OrderNum_Locate: TAdvGlowButton;
    adtId: TLargeintField;
    adtOrderType: TWideStringField;
    adtOrderDate: TDateTimeField;
    adtOrderNum: TWideStringField;
    adtCustOrderNum: TWideStringField;
    adtCustCode: TWideStringField;
    adtCustProdType: TWideStringField;
    adtProductType: TWideStringField;
    adtSpecifications: TWideStringField;
    adtDeliveryDate: TDateTimeField;
    adtEstimateDate: TDateTimeField;
    adtShippingDate: TDateTimeField;
    adtOffsetDay: TIntegerField;
    adtOrderState: TWideStringField;
    adtSaleMan: TWideStringField;
    adtNote: TWideStringField;
    adtOrderNumNote: TWideStringField;
    adtIsSelect: TBooleanField;
    adtIsDelay: TBooleanField;
    adtIsOutBuy: TBooleanField;
    mteId: TLargeintField;
    mteOrderType: TWideStringField;
    mteOrderDate: TDateTimeField;
    mteOrderNum: TWideStringField;
    mteCustOrderNum: TWideStringField;
    mteCustCode: TWideStringField;
    mteCustProdType: TWideStringField;
    mteProductType: TWideStringField;
    mteSpecifications: TWideStringField;
    mteDeliveryDate: TDateTimeField;
    mteEstimateDate: TDateTimeField;
    mteShippingDate: TDateTimeField;
    mteOffsetDay: TIntegerField;
    mteOrderState: TWideStringField;
    mteSaleMan: TWideStringField;
    mteNote: TWideStringField;
    mteIsSelect: TBooleanField;
    mteIsDelay: TBooleanField;
    mteIsOutBuy: TBooleanField;
    mteOrderNumNote: TWideStringField;
    RzPanel2: TRzPanel;
    adtCurrency: TWideStringField;
    adtNote02: TWideStringField;
    mteCurrency: TWideStringField;
    mteNote02: TWideStringField;
    Label3: TLabel;
    SpinEdt: TSpinEdit;
    btnFixCell: TAdvGlowButton;
    advsmthlbl1: TAdvSmoothLabel;
    date_Return: TDateTimePicker;
    btn_returndate: TAdvGlowButton;
    date_change: TDateTimePicker;
    btnChangDueDate: TAdvGlowButton;
    adtChangeDueDate: TWideStringField;
    mteChangeDueDate: TWideStringField;
    AdvGlowButton8: TAdvGlowButton;
    RzToolbarButton2: TRzToolbarButton;
    btnSaveStyle: TAdvGlowButton;
    RzToolbarButton4: TRzToolbarButton;
    btn_Month: TAdvGlowButton;
    Label5: TLabel;
    sped_month: TSpinEdit;
    Label4: TLabel;
    RzPanel5: TRzPanel;
    Label6: TLabel;
    RzToolbarButton5: TRzToolbarButton;
    Switch_01: TToggleSwitch;
    btn_OrderState: TAdvGlowButton;
    chkUpdate: TCheckBox;
    qry_erp2: TADOQuery;
    adtAmount: TFMTBCDField;
    adtPrice: TFMTBCDField;
    adtAmountMoney: TBCDField;
    adtShippedNum: TFMTBCDField;
    adtCREATE_DATE: TWideStringField;
    adtAuditing: TWideStringField;
    mteAmount: TFMTBCDField;
    mtePrice: TFMTBCDField;
    mteAmountMoney: TBCDField;
    mteShippedNum: TFMTBCDField;
    mteCREATE_DATE: TWideStringField;
    mteAuditing: TWideStringField;
    btn_UpdataData: TAdvGlowButton;
    procedure chk_locateClick(Sender: TObject);
    procedure btn_GrdColClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_OrderNum_LocateClick(Sender: TObject);
    procedure btn_telClick(Sender: TObject);
    procedure GRDEnter(Sender: TObject);
    procedure GRDColEnter(Sender: TObject);
    procedure chkUpdateClick(Sender: TObject);
    procedure btnFixCellClick(Sender: TObject);
    procedure GRDGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure btn_returndateClick(Sender: TObject);
    procedure btnChangDueDateClick(Sender: TObject);
    procedure AdvGlowButton8Click(Sender: TObject);
    procedure btn_ComputerClick(Sender: TObject);
    procedure btnSaveStyleClick(Sender: TObject);
    procedure chk_selectClick(Sender: TObject);
    procedure btn_MonthClick(Sender: TObject);
    procedure btn_OrderStateClick(Sender: TObject);
    procedure btn_UpdataDataClick(Sender: TObject);
  private

    str_datebegin,str_dateend:string;
     var  VarMonth:Integer;

    procedure OrderNumInput;
    procedure Proc_LocateData;     //�����������ٱ�
    procedure UpdateOutData;      //���ݳ�����¼���¶���״̬
    procedure UpdateAuditingOrderData;  //����δ��˵Ķ��� �������ݵ�����

    procedure Proc_LocateOutOrderDate(var OrderType: string; var OrderNum: string; var ProductType: string; var Amount: Integer; var EstimateDate: string; var ShippingDate: string);     //����������ͳ����ʱ��¼
  public
    { Public declarations }
  end;

var
  FrmOrderTracking: TFrmOrderTracking;

implementation
    uses UnData, UnSalerRight;
{$R *.dfm}

{ TFrmOrderTracking }

procedure TFrmOrderTracking.chkUpdateClick(Sender: TObject);
var
   bookmark:TBookmark ;
begin
   bookmark:=mte.GetBookmark;
   var i:Integer;
   for I :=0 to GRD.Columns.Count-1 do
   begin
      if GRD.Columns[i].FieldName='OrderNumNote' then
        GRD.Columns[i].ReadOnly:=not  chkUpdate.Checked;

   end;
  mte.GotoBookmark(bookmark);

end;

procedure TFrmOrderTracking.AdvGlowButton8Click(Sender: TObject);
begin
  FrmSalerRight:=tFrmSalerRight.Create(Self);
  FrmSalerRight.TypeName:='ҵ��Ա';
  with FrmSalerRight.adt   do
    begin
      Close;
      commandtext:='select * From Erp_ServiceRight where TypeName='''+FrmSalerRight.TypeName+'''' ;
      open;
      FrmSalerRight.mte.Close;
      FrmSalerRight.mte.open;

    end;
  FrmSalerRight.Show;
end;

procedure TFrmOrderTracking.btnChangDueDateClick(Sender: TObject);
var
    iLen:Integer;
    Symbol:string;
    msg:string;
begin
   mte.Filter:='isSelect=1';
   mte.Filtered:=True;
   if mte.RecordCount=0 then
   begin
    ShowMessage('��ѡ��Ҫ���Ľ��ڵĲ�Ʒ�ͺ�');
    Exit;
   end;
   mte.First;
   msg:='��ȷ����ѡ��Ĳ�Ʒ���ø��Ľ���Ϊ����'+pwidechar(datetostr(date_change.Date))+'����';

  if Application.MessageBox(PWideChar(msg), '��ʾ', MB_OKCANCEL) = IDOK then
   begin

    // while not  mte.eof do
   //  begin
    var i:Integer:=1;
      for I := 1 to mte.recordcount do
      begin
        mte.Edit;

        case Length(Trim(mte.FieldByName('ChangeDueDate').Asstring)) of
          0:Symbol:='��' ;
          11:Symbol:='��' ;
          22:Symbol:='��' ;
          33:Symbol:='��' ;
          44:Symbol:='��' ;

        end;
        mte.FieldByName('ChangeDueDate').Asstring:=
           mte.FieldByName('ChangeDueDate').Asstring+Symbol+datetostr(date_change.date);
        mte.FieldByName('IsSelect').AsBoolean:=False;

        mte.post;
        if I<mte.recordcount  then
             mte.next;
      end;
      mte.RefreshRecord ;
   end;

end;

procedure TFrmOrderTracking.btnFixCellClick(Sender: TObject);
begin
  inherited;
   GRD.FrozenCols:=SpinEdt.Value;
end;

procedure TFrmOrderTracking.btnSaveStyleClick(Sender: TObject);
begin
  dm_DaTa.SaveGridEhStyle(GRD,Self.Caption);

end;

procedure TFrmOrderTracking.btn_ComputerClick(Sender: TObject);
var
    iLen:Integer;
    Symbol:string;
    msg:string;
begin

   msg:='��ȷ����ѡ�����ڵĲ�Ʒ�ͺŽ��м�����';

  if Application.MessageBox(PWideChar(msg), '��ʾ', MB_OKCANCEL) = IDOK then
   begin
     UpdateOutData;
     Proc_LocateData;
   end;

end;

procedure TFrmOrderTracking.btn_GrdColClick(Sender: TObject);
begin
   dm_Data.GrdParamter(grd);

end;

procedure TFrmOrderTracking.btn_MonthClick(Sender: TObject);
begin
   dm_DaTa.Proc_WriteIni('��ѯ����','�·�',IntToStr(sped_month.Value));

end;

procedure TFrmOrderTracking.btn_OrderNum_LocateClick(Sender: TObject);
begin
  Proc_LocateData;

end;

procedure TFrmOrderTracking.btn_OrderStateClick(Sender: TObject);
begin
   mte.Filter:='isSelect=1';
   mte.Filtered:=True;
   if mte.RecordCount=0 then
   begin
    ShowMessage('��ѡ��Ҫ���Ķ���״̬�Ĳ�Ʒ�ͺ�');
    Exit;
   end;
  if dm_DaTa.FunMsg('�����Ҫ�ı�ѡ���Ʒ�����Ķ���״̬��','��ʾ') then
   begin
      var i:Integer:=1;
      for I := 1 to mte.recordcount do
      begin
        mte.Edit;
        var OrderState:string;
       if Switch_01.State=TToggleSwitchState.tssOn then
         OrderState:='δ����'
        else
         OrderState:='�ѷ���';
        mte.FieldByName('OrderState').asstring:=OrderState;
        mte.FieldByName('IsSelect').AsBoolean:=False;
        mte.post;
        if i<mte.recordcount then
        mte.next;
      end;
   end;
  // mte.Filter:='isSelect=1 or  isSelect=0';
  // mte.Filtered:=True;
   mte.RefreshRecord;

end;

procedure TFrmOrderTracking.btn_returndateClick(Sender: TObject);
var
   msg:string;
begin
   mte.Filter:='isSelect=1';
   mte.Filtered:=True;
   if mte.RecordCount=0 then
   begin
    ShowMessage('��ѡ��Ҫ���ý��ڵĲ�Ʒ');
    Exit;
   end;
   mte.First;
   msg:='��ȷ����ѡ��Ĳ�Ʒ���ûظ����ڣ���'+pwidechar(datetostr(date_Return.Date))+'����';
  if Application.MessageBox(PWideChar(msg), '��ʾ', MB_OKCANCEL) = IDOK then
   begin
      var i:Integer:=1;
      for I := 1 to mte.recordcount do
      begin
        mte.Edit;
        mte.FieldByName('EstimateDate').AsDateTime:=StrToDateTime(formatdatetime('yyyy-mm-dd',date_Return.DateTime));
        mte.FieldByName('IsSelect').AsBoolean:=False;
        mte.post;
        if i<mte.recordcount then
        mte.next;
      end;
   end;
  // mte.Filter:='isSelect=1 or  isSelect=0';
  // mte.Filtered:=True;
   mte.RefreshRecord;

end;

procedure TFrmOrderTracking.btn_telClick(Sender: TObject);
begin
//  inherited;
  dm_data.DbGridEhToExcel(Grd);
end;

procedure TFrmOrderTracking.btn_UpdataDataClick(Sender: TObject);
begin
    UpdateOutData;
    UpdateAuditingOrderData;
    Proc_LocateData;

end;

procedure TFrmOrderTracking.chk_locateClick(Sender: TObject);
begin
 // inherited;

end;

procedure TFrmOrderTracking.chk_selectClick(Sender: TObject);
begin
  inherited;
    dm_DaTa.MemDataIsSelect(chk_select,mte);
end;

procedure TFrmOrderTracking.FormCreate(Sender: TObject);
begin
  OrderNumInput;

 dm_DaTa.RestoreGridEhStyle(GRD,self.Caption);

  VarMonth:=StrToInt(dm_DaTa.ReadIni('��ѯ����','�·�'));
  sped_month.Value:=VarMonth;
  datebegin.Date:=IncMonth(now,VarMonth);
  dateend.Date:=now;

  Proc_LocateData;

end;

procedure TFrmOrderTracking.GRDColEnter(Sender: TObject);
begin
  if  Grd.SelectedField.FieldName='OrderNum' then
  begin
    hint:=mte.FieldByName('OrderNumNote').AsString;
  end;
end;

procedure TFrmOrderTracking.GRDEnter(Sender: TObject);
begin
  // if GRD.field then


end;

procedure TFrmOrderTracking.GRDGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if mte.FieldByName('OrderState').AsString = '�ѷ���' then
   ��AFont.color := clRed;
  if mte.FieldByName('OrderState').AsString = 'δ����' then
   ��AFont.color := clBlack;
  if mte.FieldByName('OrderState').AsString = '��������' then
   ��AFont.color := clFuchsia;


  if mte.FieldByName('OrderState').AsString = '���ַ���' then
   begin
   ��AFont.color :=clWebBlue;
     if (Column.FieldName='Amount')  or
        (Column.FieldName='ShippedNum')
      then
        AFont.color :=clFuchsia
   end;


   if mte.FieldByName('IsDelay').AsBoolean = True then
   begin
     if (Column.FieldName='DeliveryDate')  or
        (Column.FieldName='ShippingDate')
      then
        AFont.color :=clWebGreen
   end;


end;

{----------------------------------------����ͬ��------------------------------------
   1. ���еĶ������ݲ��뵽���ٿ�
   * 2. ����ERP��һ����־�ֶ�   *
}

procedure TFrmOrderTracking.OrderNumInput;
var
  CREATE_DATE,MaxOrderNum,sql:string;
  OrderType,OrderDate,OrderNum,CustOrderNum,CustCode,CustProdType,ProductType,OrderNumNote,Auditing,
  Amount,ShippedNum,DeliveryDate,EstimateDate,Note,SaleMan,Specifications,Price,AmountMoney,OrderState,Currency:string;
begin
    psql:='select max(CREATE_DATE) CREATE_DATE from  Pd_OrderTracking ';
    dm_DaTa.QuseryData(qry,psql);
    CREATE_DATE:=qry.FieldByName('CREATE_DATE').AsString;
   //��ѯû��ͬ����ERP�ĵĶ�������
   psql:='select a.TC001,a.TC002,a.TC003,a.TC004,a.TC006,a.TC008,a.TC012,a.TCI01,a.TC052,'
        +'b.TD005,b.TD006,b.TD008,b.TD009,b.TD013,b.TD014,b.TD020,b.TD011,b.TD012,b.CREATE_DATE,b.TD016,b.TD021 '
        +' from  COPTC a  Right   JOIN  COPTD b  ON (b.TD002=a.TC002 and b.TD001=a.TC001 ) '
      //  +' AND  b.TD021=''Y''';
       +' where   b.CREATE_DATE>'''+CREATE_DATE+'''  order by  b.CREATE_DATE ';


    dm_DaTa.QuseryData(qry_erp,Psql);
    qry_erp.first;
    var i:integer;
    for I := 1 to qry_erp.recordcount do
    begin
     OrderDate:=qry_erp.FieldByName('TC003').AsString;  //��������
     OrderType:=qry_erp.FieldByName('TC001').AsString;  //��������
     OrderNum:=qry_erp.FieldByName('TC002').AsString;   //������
     CustOrderNum:=qry_erp.FieldByName('TC012').AsString; //�ͻ�������
       CustCode:=qry_erp.FieldByName('TC004').AsString;     //�ͻ����
       DeliveryDate:=qry_erp.FieldByName('TCI01').AsString; //����Ҫ�󷢻�����
       SaleMan:=qry_erp.FieldByName('TC006').AsString;       //������Ա
       Currency:=qry_erp.FieldByName('TC008').AsString;      //����
       OrderNumNote:=qry_erp.FieldByName('TC052').AsString;   //������ע

    // end;

     ProductType:=qry_erp.FieldByName('TD005').AsString;  //��˾�ͺ�
     if qry_erp.FieldByName('TD008').asfloat>0  then
       Amount:=qry_erp.FieldByName('TD008').AsString
     else
       Amount:='0';
       //��Ʒ����
     CustProdType:=qry_erp.FieldByName('TD014').AsString; //�ͻ�����

     //EstimateDate
     DeliveryDate:=qry_erp.FieldByName('TD013').AsString; //Ԥ�Ʒ�������
     Note:=qry_erp.FieldByName('TD020').AsString;        //��Ʒ��ע
     Specifications:=qry_erp.FieldByName('TD006').AsString; //��Ʒ���

     if qry_erp.FieldByName('TD011').Asfloat>0 then

     Price:=FloatToStr(qry_erp.FieldByName('TD011').Asfloat) //��Ʒ���
    else
     Price:='0.00';
     if   qry_erp.FieldByName('TD012').AsFloat>0 then
     AmountMoney:=FloatToStr(qry_erp.FieldByName('TD012').AsFloat) //��Ʒ���
     else
      AmountMoney:='0';
     ShippedNum:=qry_erp.FieldByName('TD009').AsString;//��������


     CREATE_DATE:=qry_erp.FieldByName('CREATE_DATE').AsString;  //��������


     Auditing:=qry_erp.FieldByName('TD021').AsString ;     //���״̬

     OrderState:='δ����';

    {--------- ����ͬ��ERP���ݵĲ������------------------------------------------------------}
     var  str_field, str_value:string;
        str_field:='CREATE_DATE,OrderType,OrderNum, OrderDate,  '
                 +'CustOrderNum,OrderNumNote,Auditing,'
                  +'CustCode,CustProdType,ProductType,'
                  +'Amount,DeliveryDate,Note,'
                  +'SaleMan,Specifications,Price,'
                  +'AmountMoney,ShippedNum,OrderState,'
                  +'Currency' ;
        str_value:=''''+CREATE_DATE+''','''+OrderType+''','''+OrderNum+''','''+OrderDate+''','
                  +''''+CustOrderNum+''','''+OrderNumNote+''','''+Auditing+''','
                  +''''+CustCode+''','''+CustProdType+''','''+ProductType+''','
                  +Amount+','''+DeliveryDate+''','''+Note+''','
                  +''''+SaleMan+''','''+Specifications+''','+Price+','
                  +AmountMoney+','+ShippedNum+','''+OrderState+''','
                  +''''+Currency+'''';


      sql:=sql+' insert into Pd_OrderTracking('+str_field+') VALUES('+str_value+')';


     if i<qry_erp.recordcount then
       qry_erp.Next;

    end;

   if sql>''  then
       begin
         dm_DaTa.Proc_BatchExecuteSql(sql);

       end;

end;

procedure TFrmOrderTracking.Proc_LocateData;
var
  str:string;
  list:TList<STRING>;
  i:Integer;
begin
  list:=TList<String>.Create;

  str_datebegin:=FormatDateTime('yyyy-MM-dd',datebegin.DateTime);
  str_dateend:=FormatDateTime('yyyy-MM-dd',dateend.DateTime);
  Psql := 'select * from Pd_OrderTracking WHERE '
    +' CONVERT(VARCHAR(10),OrderDate,120)>='''+str_datebegin+''''
    +' AND  CONVERT(VARCHAR(10),OrderDate,120)<='''+str_dateend+''' ';

   str:=dm_DaTa.ReadIni('��������','ҵ��Ա');
  if Trim(str)>'' then
  begin
    list.AddRange(str.Split(['|']));
    str:='';
    for   I := 0 to list.Count-1 do
     begin
       if str='' then
         str:='rTrim(SaleMan)='''+list[i]+''''
      else
         str:=str+' or rTrim(SaleMan)='''+list[i]+'''';
     end;
      Psql:=Psql+'and  ('+str+')';
   end;

 // showmessage(Psql);
  dm_DaTa.proc_ActiveAdodataset(adt,Psql);
//  adt.Requery;
  mte.Close;
  mte.Open;
end;
  { -------------------����δ��˶������� ------------
    1. ��ѯ�������ٱ���δ���(N)�Ķ���Ʒ�� �Ĳ�Ʒ
    2. ��ѯ ERP�Ķ����������Ƿ��Ѿ����  ������ ��ERP������  ��� ����  ���µ� �������ٱ���
    3. ͬʱ���ĸ��ٱ��иĲ�Ʒ����˱�־Y
      }
procedure TFrmOrderTracking.UpdateAuditingOrderData;
begin
   var  sql:string;
   psql:='select * From  Pd_OrderTracking where Auditing=''N''';
   dm_DaTa.QuseryData(qry,psql);
   if qry.RecordCount>0 then
   begin
     {---------ȡ�ò�Ʒ�Ķ����� ��������   ��Ʒ�ͺ�  ----------}
     var  OrderType,OrderNum,ProductType,Erp_num,Erp_Price,Erp_Money:string ;
     var  i:Integer;
      qry.first;
      for I := 1 to qry.RecordCount do
      begin
       OrderType:=qry.FieldByName('OrderType').AsString;
       OrderNum:=qry.FieldByName('OrderNum').AsString;
       ProductType:=qry.FieldByName('ProductType').AsString;
        {--------------��ѯErp���Ƿ��и� --------------}
         psql:='select * From  COPTD where TD021=''Y'' and TD001='''+OrderType+''''
               +' and TD002='''+OrderNum+'''  and  TD005='''+ProductType+'''';
         dm_DaTa.QuseryData(qry_erp,psql);
         if  qry_erp.recordcount>0  then
          begin
             Erp_num:=qry_erp.fieldbyname('TD008').asstring;     //����
             Erp_Price:=qry_erp.fieldbyname('TD011').asstring;  //����
             Erp_Money:=qry_erp.fieldbyname('TD012').asstring;   //���

             sql:=sql+'  update Pd_OrderTracking set Amount='+Erp_num+','
                 +'Price='+Erp_Price+','+'AmountMoney='+Erp_Money+','
                 +'Auditing=''Y'' where  OrderType='''+OrderType+''' and '
                 +' OrderNum='''+OrderNum+''' and  ProductType='''+ProductType+'''';


          end;





       qry.next;

      end;
   end;

  if sql>'' then
 begin
   dm_DaTa.Proc_BatchExecuteSql(sql);
 end;

end;

procedure TFrmOrderTracking.UpdateOutData;
var
  OrderType,OrderNum,ProductType,OrderState,sql,ShippingDate,ShippedNum,EstimateDate,OffsetDay:string;
  Amount:integer;
  IsDelay:String;
begin
  str_datebegin:=FormatDateTime('yyyy-MM-dd',datebegin.DateTime);
  str_dateend:=FormatDateTime('yyyy-MM-dd',dateend.DateTime);

 IsDelay:='0';
  //1. �Ӳ�ѯ�������й��˳�"δ����"��"���ַ���"�� �Ķ�������
  psql:='select * from Pd_OrderTracking where (OrderState=''δ����'' or  OrderState=''���ַ���'' or  OrderState=''�ѷ���.���ڿ�'') and '
       +'   (CONVERT(VARCHAR(10),OrderDate,120)>='''+str_datebegin+''''
    +' AND  CONVERT(VARCHAR(10),OrderDate,120)<='''+str_dateend+''') ORDER BY Id  ASC   ';

  dm_DaTa.QuseryData(qry,psql);
  //��ѯδ�������߲��ַ�����
  while  not  qry.eof  do
  begin
       OrderType := qry.Fieldbyname('OrderType').asstring;
      //��������
      OrderNum := qry.Fieldbyname('OrderNum').asstring;
      //�ͻ�������
      ProductType := qry.Fieldbyname('ProductType').asstring;
      //Ʒ��
      Amount := qry.Fieldbyname('Amount').asinteger;
   //   DeliveryDate := formatdatetime('yyyymmdd', qry.Fieldbyname('DeliveryDate').asdatetime);
      //�ͻ�Ҫ�󷢻�
      EstimateDate :=formatdatetime('yyyy-mm-dd', qry.Fieldbyname('EstimateDate').asdatetime);
      //  psql:='select   FROM  OrderNum

      //���ҳ�����¼��û�иĳ�������
      psql := 'select TOP 1 TH002 from COPTH where  TH014=''' + OrderType + ''' And  TH015=''' + OrderNum + '''  ' + ' and TH005=''' + ProductType + ''' and  TH020=''Y''  ORDER BY  CREATE_DATE DESC';
      dm_Data.QuseryData(qry_erp, psql);
       //ȡ������ ����������
      ShippingDate := Copy(qry_erp.fieldbyname('TH002').asstring, 1, 8);
      //���������¼��û�ж�Ӧ�ĵ���
      if ShippingDate='' then
      begin

       {-----------------------�ֹ���������-----�������رն��� begin---------------------
           //�������������� :Сд y          ������������ :��д Y

       }

           psql:='select  * from   COPTD  where  TD001='''+OrderType+''' And  TD002='''+OrderNum+'''  '
            +' and TD005='''+ProductType+''' and  TD016=''y'' ';
          dm_Data.QuseryData(qry_erp2, psql);

          if  qry_erp2.RecordCount>0 then
           begin
              OrderState:='��������';
              sql:=sql+' Update Pd_OrderTracking set OrderState='''+OrderState+''''
                     +'  where OrderNum='''+OrderNum+''' and OrderType='''+OrderType+''' '
                   +' and ProductType='''+ProductType+'''';
           end;
          {-----------------------�ֹ���������-----�������رն��� end---------------------}
          qry.next;
          continue;
      end;


      //ͳ���������ж����ź͸��ͺŵ���������
      psql:='select TH014,TH015,TH005,sum(TH008) num from COPTH where  TH014='''+OrderType+''' And  TH015='''+OrderNum+'''  '
            +' and TH005='''+ProductType+''' and  TH020=''Y'' group by TH014,TH015,TH005';
      dm_Data.QuseryData(qry_erp,psql);

      if qry_erp.fieldbyname('num').asinteger>0  then
       begin
        //
          ShippedNum:=qry_erp.fieldbyname('num').AsString;



          ShippingDate:=Copy(ShippingDate,1,4)+'-'+Copy(ShippingDate,5,2)+'-'+Copy(ShippingDate,7,2);

           IsDelay:='0' ;
          OffsetDay:='0';
       //ֻ�лظ����ںͽ��ܽ��ڶ�Ϊ�յ�ʱ��
       //if  (FormatDateTime('yyyy-mm-dd',qry.FieldByName('ShippingDate').asdatetime)>'')
        //   and  (FormatDateTime('yyyy-mm-dd',qry.FieldByName('EstimateDate').asdatetime)>'') then
        if  (qry.FieldByName('ShippingDate').asdatetime>StrToDateTime('1900-01-01 00:00:00'))
           and  (qry.FieldByName('EstimateDate').asdatetime>StrToDateTime('1900-01-01 00:00:00')) then
       BEGIN

          if (EstimateDate<ShippingDate) and  (EstimateDate>'')  then
          Begin
          // EstimateDate:=Copy(EstimateDate,1,4)+'-'+Copy(EstimateDate,5,2)+'-'+Copy(EstimateDate,7,2);
           IsDelay:='1';
          OffsetDay:=IntToStr(DaysBetween(strtodate(EstimateDate),strtodateTIME(ShippingDate)));
          end;

         if (EstimateDate>=ShippingDate) and  (EstimateDate>'')  then
           begin
          //  EstimateDate:=Copy(EstimateDate,1,4)+'-'+Copy(EstimateDate,5,2)+'-'+Copy(EstimateDate,7,2);
            IsDelay:='0' ;
            OffsetDay:='0';

          end;

       END;

        if Amount>qry_erp.fieldbyname('num').asinteger then
        BEGIN
           //���ݶ����ͺŽ�������
            OrderState:='���ַ���';


           {---------������һ���� ���ֶ��������������- begin-----------}

           psql:='select  * from   COPTD  where  TD001='''+OrderType+''' And  TD002='''+OrderNum+'''  '
            +' and TD005='''+ProductType+''' and  TD016=''y'' ';
          dm_Data.QuseryData(qry_erp2, psql);
          if  qry_erp2.RecordCount>0 then
           begin
              OrderState:='��������';
           end;
           {---------������һ���� ���ֶ��������������- End-----------}



            sql:=sql+' Update Pd_OrderTracking set ShippedNum='+ShippedNum
                   +',ShippingDate='''+ShippingDate+''',OrderState='''+OrderState+''',OffsetDay='+OffsetDay
                   +',IsDelay='+IsDelay+'  where OrderNum='''+OrderNum+''' and OrderType='''+OrderType+'''  '
                   +' and ProductType='''+ProductType+'''';

         //  ShowMessage(sql);
        END
         else
         begin
          //if  qry.FieldByName('EstimateDate').asdatetime<StrToDateTime('1900-01-01 00:00:00') then
          //  OrderState:='�ѷ���.���ڿ�'
          // else
            OrderState:='�ѷ���';
            sql:=sql+' Update Pd_OrderTracking set ShippedNum='+ShippedNum
                   +',ShippingDate='''+ShippingDate+''',OrderState='''+OrderState+''',OffsetDay='+OffsetDay
                     +',IsDelay='+IsDelay+'  where OrderNum='''+OrderNum+''' and OrderType='''+OrderType+''' '
                   +' and ProductType='''+ProductType+'''';

         //  ShowMessage(sql);
        END;


         end;

      qry.next;

       end;




  if sql>'' then
 begin
   dm_DaTa.Proc_BatchExecuteSql(sql);
 end;




end;



procedure TFrmOrderTracking.Proc_LocateOutOrderDate(var OrderType: string; var OrderNum: string; var ProductType: string; var Amount: Integer; var EstimateDate: string; var ShippingDate: string);
var
  DeliveryDate: string;
begin

end;


end.
