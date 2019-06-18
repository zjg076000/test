unit UnPurchaseTracking;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Unbase_pnl, MemTableDataEh, Data.DB,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Data.Win.ADODB, MemTableEh, DataDriverEh,
  AdvGlowButton, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, Vcl.Samples.Spin,DateUtils, AdvSmoothLabel,System.Generics.Collections,
  Vcl.WinXCtrls ;

type
  TFrmPurchaseTracking = class(Tfrmbase_pnl)
    RzPanel3: TRzPanel;
    Label1: TLabel;
    RzPanel4: TRzPanel;
    Label28: TLabel;
    Label2: TLabel;
    datebegin: TDateTimePicker;
    dateend: TDateTimePicker;
    btn_OrderNum_Locate: TAdvGlowButton;
    chk_select: TCheckBox;
    GRD: TDBGridEh;
    adt: TADODataSet;
    dsd: TDataSetDriverEh;
    dso: TDataSource;
    qry: TADOQuery;
    qry_erp: TADOQuery;
    adtId: TLargeintField;
    adtOrderType: TWideStringField;
    adtOrderDate: TDateTimeField;
    adtOrderNum: TWideStringField;
    adtSupplier: TWideStringField;
    adtProductType: TWideStringField;
    adtAmount: TBCDField;
    adtPrice: TFMTBCDField;
    adtCurrency: TWideStringField;
    adtAmountMoney: TBCDField;
    adtReceivedNum: TBCDField;
    adtDeliveryDate: TDateTimeField;
    adtEstimateDate: TDateTimeField;
    adtReceivedDate: TDateTimeField;
    adtOffsetDay: TIntegerField;
    adtOrderState: TWideStringField;
    adtBuyer: TWideStringField;
    adtNote: TWideStringField;
    adtOrderNumNote: TWideStringField;
    adtNote02: TWideStringField;
    adtIsDelay: TBooleanField;
    adtSpecifications: TWideStringField;
    adtSupplierName: TWideStringField;
    adtReturnedNum: TBCDField;
    adtReturnedDate: TDateTimeField;
    mte: TMemTableEh;
    mteId: TLargeintField;
    mteOrderType: TWideStringField;
    mteOrderDate: TDateTimeField;
    mteOrderNum: TWideStringField;
    mteSupplier: TWideStringField;
    mteProductType: TWideStringField;
    mteAmount: TBCDField;
    mtePrice: TFMTBCDField;
    mteCurrency: TWideStringField;
    mteAmountMoney: TBCDField;
    mteReceivedNum: TBCDField;
    mteDeliveryDate: TDateTimeField;
    mteEstimateDate: TDateTimeField;
    mteReceivedDate: TDateTimeField;
    mteOffsetDay: TIntegerField;
    mteOrderState: TWideStringField;
    mteBuyer: TWideStringField;
    mteNote: TWideStringField;
    mteOrderNumNote: TWideStringField;
    mteNote02: TWideStringField;
    mteIsDelay: TBooleanField;
    mteSpecifications: TWideStringField;
    mteSupplierName: TWideStringField;
    mteReturnedNum: TBCDField;
    mteReturnedDate: TDateTimeField;
    RzToolbarButton7: TRzToolbarButton;
    btn_tel: TAdvGlowButton;
    adtIsSelect: TBooleanField;
    mteIsSelect: TBooleanField;
    adtChangeDueDate: TWideStringField;
    mteChangeDueDate: TWideStringField;
    advsmthlbl1: TAdvSmoothLabel;
    RzToolbarButton3: TRzToolbarButton;
    btn_ServiceRight: TAdvGlowButton;
    RzToolbarButton2: TRzToolbarButton;
    btnSaveStyle: TAdvGlowButton;
    sped_month: TSpinEdit;
    Label4: TLabel;
    btn_Month: TAdvGlowButton;
    Label5: TLabel;
    RzPanel2: TRzPanel;
    Label3: TLabel;
    SpinEdt: TSpinEdit;
    btnFixCell: TAdvGlowButton;
    date_Return: TDateTimePicker;
    btn_returndate: TAdvGlowButton;
    date_change: TDateTimePicker;
    btnChangDueDate: TAdvGlowButton;
    RzPanel5: TRzPanel;
    Label6: TLabel;
    RzToolbarButton5: TRzToolbarButton;
    Switch_01: TToggleSwitch;
    btn_OrderState: TAdvGlowButton;
    chkUpdate: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btn_OrderNum_LocateClick(Sender: TObject);
    procedure GRDGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure btnFixCellClick(Sender: TObject);
    procedure chkUpdateClick(Sender: TObject);
    procedure btn_telClick(Sender: TObject);
    procedure btn_returndateClick(Sender: TObject);
    procedure btnChangDueDateClick(Sender: TObject);
    procedure btn_ServiceRightClick(Sender: TObject);
    procedure GRDDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btn1Click(Sender: TObject);
    procedure btnSaveStyleClick(Sender: TObject);
    procedure btn_MonthClick(Sender: TObject);
    procedure chk_selectClick(Sender: TObject);
    procedure btn_OrderStateClick(Sender: TObject);
  private
    str_datebegin,str_dateend:string;
     adoconn:TADOConnection;
   adocommand:TADOCommand;
    VarMonth:Integer;
    procedure OrderNumInput;       //�ɹ�������������
    procedure Proc_LocateData;     //�����������ٱ�
    procedure UpdateInData;         //���ݽ���������
    procedure UpdateReturnGoodData;    //�����˻�������

    procedure UpdateOrderState;
    procedure Proc_ExecuteSql(sql: string);



  public
    { Public declarations }
  end;

var
  FrmPurchaseTracking: TFrmPurchaseTracking;

implementation
     uses UnData, UnSalerRight;
{$R *.dfm}

{ TFrmPurchaseTracking }

procedure TFrmPurchaseTracking.btn_ServiceRightClick(Sender: TObject);

begin
  FrmSalerRight:=tFrmSalerRight.Create(Self);
  FrmSalerRight.TypeName:='�ɹ�Ա';
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

procedure TFrmPurchaseTracking.btn1Click(Sender: TObject);
var
  RestoreParams:TDBGridEhRestoreParams;
begin
  RestoreParams:=[grpColIndexEh, grpColWidthsEh, grpSortMarkerEh,
    grpColVisibleEh, grpRowHeightEh, grpDropDownRowsEh, grpDropDownWidthEh];
  GRD.RestoreGridLayoutIni('C:\test.ini','test',RestoreParams);

end;

procedure TFrmPurchaseTracking.btnChangDueDateClick(Sender: TObject);
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

procedure TFrmPurchaseTracking.btnFixCellClick(Sender: TObject);
begin
  GRD.FrozenCols:=SpinEdt.Value;

end;

procedure TFrmPurchaseTracking.btnSaveStyleClick(Sender: TObject);
begin
  dm_DaTa.SaveGridEhStyle(GRD,Self.Caption);

end;

procedure TFrmPurchaseTracking.btn_MonthClick(Sender: TObject);
begin
  dm_DaTa.Proc_WriteIni('��ѯ����','�·�',IntToStr(sped_month.Value));

end;

procedure TFrmPurchaseTracking.btn_OrderNum_LocateClick(Sender: TObject);
begin
  Proc_LocateData;

end;

procedure TFrmPurchaseTracking.btn_OrderStateClick(Sender: TObject);
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
         OrderState:='�ѽ���';
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

procedure TFrmPurchaseTracking.btn_returndateClick(Sender: TObject);
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

  if Application.MessageBox(PWideChar(msg),'��ʾ', MB_OKCANCEL) = IDOK then
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

procedure TFrmPurchaseTracking.btn_telClick(Sender: TObject);
begin
  dm_data.DbGridEhToExcel(Grd);
end;

procedure TFrmPurchaseTracking.chkUpdateClick(Sender: TObject);
begin
  //inherited;
  //  GRD.Columns[16].ReadOnly:=not  chkUpdate.Checked;
    GRD.Columns[19].ReadOnly:=not  chkUpdate.Checked;

end;

procedure TFrmPurchaseTracking.chk_selectClick(Sender: TObject);
begin
 dm_DaTa.MemDataIsSelect(chk_select,mte);

end;

procedure TFrmPurchaseTracking.FormCreate(Sender: TObject);
begin
  OrderNumInput;

 dm_DaTa.RestoreGridEhStyle(GRD,self.Caption);

  VarMonth:=StrToInt(dm_DaTa.ReadIni('��ѯ����','�·�'));
  sped_month.Value:=VarMonth;
  datebegin.Date:=IncMonth(now,VarMonth);
  dateend.Date:=now;
  UpdateInData;

//  UpdateOutData;

  UpdateReturnGoodData;
  UpdateOrderState;
  Proc_LocateData;


end;

procedure TFrmPurchaseTracking.GRDDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if  Column.FieldName='OrderState'  then

   if Column.Field.Value='���ֽ���' then
    begin
     GRD.Canvas.Pen.Color :=clFuchsia;
     GRD.Canvas.Pen.Width :=4;
   ///  GRD.Canvas.Rectangle(Rect.Right,Rect.Top,Rect.Right+1,Rect.Bottom+1);
 //  GRD.Canvas.Rectangle(Rect.Left,Rect.Bottom,rect.Right+1,Rect.Bottom+1);

   ///  GRD.Canvas.Rectangle(Rect.Left,Rect.top,Rect.Right+1,Rect.top+1);

   ///  GRD.Canvas.Rectangle(Rect.Left,Rect.top,Rect.left+1,Rect.bottom+1);
    // GRD.Canvas.Rectangle(Rect.Left,Rect.Bottom,Rect.Right+1,Rect.Bottom+1);

    end;

  end;


procedure TFrmPurchaseTracking.GRDGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if mte.FieldByName('OrderState').AsString = '�ѽ���' then
   ��AFont.color := clRed;
  if mte.FieldByName('OrderState').AsString = 'δ����' then
   ��AFont.color := clBlack;
  if mte.FieldByName('OrderState').AsString = '���ֽ���' then
   begin
   ��AFont.color :=clWebBlue;
     if (Column.FieldName='Amount')  or
        (Column.FieldName='ReceivedNum')
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

procedure TFrmPurchaseTracking.OrderNumInput;
var
  MaxOrderNum,sql:string;
  OrderType,OrderDate,OrderNum,Supplier,SupplierName,ProductType,OrderNumNote,Currency,Payment,Buyer,
  Amount,ShippedNum,DeliveryDate,EstimateDate,Note,Specifications,Price,AmountMoney,OrderState:string;
  ReceivedNum,ReturnedNum:string;

begin
   psql:='select max(OrderNum) ordernum from  PD_PurchaseTracking ';

   dm_DaTa.QuseryData(qry,psql);
   //��ѯ��30���Ѿ���˵ĵĶ�������
   psql:='select a.TC001,a.TC002,a.TC003,a.TC004,a.TC005,a.TC008,a.TC009,a.TC011,'
        +'b.TD001,b.TD005,b.TD006,b.TD008,b.TD010,b.TD011,b.TD012,c.MA002 '
        +' from  (PURTC a   INNER JOIN  PURTD b  ON a.TC002=b.TD002 and a.TC001=b.TD001 '
        +' AND a.TC014=''Y'')  INNER JOIN PURMA c on a.TC004=c.MA001 ';
        // AND  a.TC003>CONVERT(varchar(100), GETDATE()-30, 112) ';
      MaxOrderNum:=qry.FieldByName('ordernum').AsString;
   if MaxOrderNum='' then
       psql:=psql
   else
      psql:=psql+' AND  a.TC002>'''+MaxOrderNum+'''';

    dm_DaTa.QuseryData(qry_erp,Psql);
    while not qry_erp.Eof  do
    begin

     OrderType:=qry_erp.FieldByName('TC001').AsString;  //��������
     OrderNum:=qry_erp.FieldByName('TC002').AsString;   //������
     OrderDate:=qry_erp.FieldByName('TC003').AsString;  //��������
     Supplier:=qry_erp.FieldByName('TC004').AsString;     //��Ӧ�̱��
     SupplierName:=qry_erp.FieldByName('MA002').AsString;     //��Ӧ�̱��

     Currency:=qry_erp.FieldByName('TC005').AsString;      //����
     Payment:=qry_erp.FieldByName('TC008').AsString; //���ʽ
     Buyer:=qry_erp.FieldByName('TC011').AsString; //�ɹ�Ա
     OrderNumNote:=qry_erp.FieldByName('TC009').AsString; //��ע


     ProductType:=qry_erp.FieldByName('TD005').AsString;  //��Ʒ�ͺ��ͺ�
     Specifications:=qry_erp.FieldByName('TD006').AsString; //��Ʒ���
     Amount:=qry_erp.FieldByName('TD008').AsString; //��Ʒ����
     Price:=FloatToStr(qry_erp.FieldByName('TD010').Asfloat); //����

     AmountMoney:=FloatToStr(qry_erp.FieldByName('TD011').AsFloat); //���

     DeliveryDate:=qry_erp.FieldByName('TD012').AsString; //����Ҫ�󷢻�����


   //  EstimateDate:=qry_erp.FieldByName('TD013').AsString; //Ԥ�Ʒ�������
   //  Note:=qry_erp.FieldByName('TD020').AsString;        //��Ʒ��ע

//ShippedNum:=qry_erp.FieldByName('TD009').AsString;//��������

   //  SaleMan:=qry_erp.FieldByName('TC006').AsString;       //������Ա

    // OrderNumNote:=qry_erp.FieldByName('TC052').AsString;   //������ע
   //  OrderState:='δ����';
    // if  StrToInt(ShippedNum) =strtoint(Amount) then  OrderState:='�ѷ���';
    // if  (StrToInt(ShippedNum) <StrToInt(Amount)) and (StrToInt(ShippedNum)>0) then  OrderState:='���ַ���';


     //���ɲ���SQL���
     sql:=sql+' insert into PD_PurchaseTracking(OrderType,OrderDate,OrderNum,Supplier,Currency,Buyer,OrderNumNote,'
          +'ProductType,Specifications,Amount,Price,AmountMoney,DeliveryDate,SupplierName,ReceivedNum,ReturnedNum) '
          +'  values('''+OrderType+''','''+OrderDate+''','''+OrderNum+''','''+Supplier+''','''+Currency+''','
          +''''+Buyer+''','''+OrderNumNote+''','''+ProductType+''','''+Specifications+''','+Amount+','+Price+','+AmountMoney+','
          +''''+DeliveryDate+''','''+SupplierName+''',0,0)';

     qry_erp.Next;

    end;
 if sql>'' then
 begin
    Proc_ExecuteSql(sql);
 end;
end;

procedure TFrmPurchaseTracking.Proc_LocateData;
var
  str:string;
  list:TList<STRING>;
  i:Integer;
begin
  list:=TList<String>.Create;


  str_datebegin:=FormatDateTime('yyyy-MM-dd',datebegin.DateTime);
  str_dateend:=FormatDateTime('yyyy-MM-dd',dateend.DateTime);
  Psql := 'select * from PD_PurchaseTracking WHERE '
    +' CONVERT(VARCHAR(100),OrderDate,23)>='''+str_datebegin+''''
    +' AND  CONVERT(VARCHAR(100),OrderDate,23)<='''+str_dateend+''' ';

  str:=dm_DaTa.ReadIni('��������','�ɹ�Ա');
  if Trim(str)>'' then
  begin
    list.AddRange(str.Split(['|']));
    str:='';
    for   I := 0 to list.Count-1 do
     begin
       if str='' then
         str:='rtrim(Buyer)='''+list[i]+''''
      else
         str:=str+' or rtrim(Buyer)='''+list[i]+'''';
     end;
      Psql:=Psql+'and  ('+str+')';
   end;

  //   CONVERT(VARCHAR(100),[OrderDate],23)

 // showmessage(Psql);
  dm_DaTa.proc_ActiveAdodataset(adt,Psql);
//  adt.Requery;
  mte.Close;
  mte.Open;
end;



procedure TFrmPurchaseTracking.UpdateInData;
var
  CREATE_DATE:string;
  BillNo,BillDate,ProductType,Amount,PurchaseNo,PurchaseType:string;
   sql:string;
begin
   //��ERP�Ѿ���˹��Ľ�����¼ ���µ� ͬ�����ҵ����ݿ����
   psql:='select max(CREATE_DATE) num from Erp_PurchaseData ';
   dm_DaTa.QuseryData(qry,Psql);
   CREATE_DATE:=qry.FieldByName('num').AsString;

  //��ERP�Ѿ���˹��Ľ�����¼ ���µ� ͬ�����ҵ����ݿ����
   psql:='select a.TG002,a.TG003,b.TH005,b.TH007,b.TH011,b.TH012,b.CREATE_DATE '
        +' from  PURTG a  INNER JOIN  PURTH b  ON  a.TG002=b.TH002 '
        +' and a.TG001=b.TH001 and a.TG013=''Y''';

   if CREATE_DATE='' then
       psql:=psql
   else
      psql:=psql+' AND  b.CREATE_DATE>'''+CREATE_DATE+'''';

  dm_DaTa.QuseryData(qry_erp,psql);        //ȡ��û��ͬ��������

  while not qry_erp.Eof  do
  begin
      BillNo:=qry_erp.FieldByName('TG002').AsString;  //��������
      Billdate:=qry_erp.FieldByName('TG003').AsString;  //��������
      ProductType:=qry_erp.FieldByName('TH005').AsString; //Ʒ��
      Amount:=qry_erp.FieldByName('TH007').AsString; //����
      PurchaseType:=qry_erp.FieldByName('TH011').AsString; //�ɹ�������
      PurchaseNo:=qry_erp.FieldByName('TH012').AsString; //�ɹ�����
      CREATE_DATE:=qry_erp.FieldByName('CREATE_DATE').AsString; //Ʒ��
      sql:=sql+' Insert into Erp_PurchaseData(BillNo,BillDate,ProductType,Amount,PurchaseNo,PurchaseType,CREATE_DATE)'
          +'  values('''+BillNo+''','''+BillDate+''','''+ProductType+''','+Amount+','
          +''''+PurchaseNo+''','''+PurchaseType+''','''+CREATE_DATE+''')';

      sql:=sql+'   update PD_PurchaseTracking set ReceivedNum=ReceivedNum+'+Amount
           +',ReceivedDate='''+Billdate+''' where  OrderNum='''+PurchaseNo+''' and   ProductType='''+ProductType+''' '
           +' and OrderType='''+PurchaseType+'''';


      qry_erp.Next;

    end;
 if sql>'' then
 begin
 { dm_Data.adoconn.BeginTrans;
  dm_Data.ADOCommand.CommandText:=sql;
//  showmessage(SqlStr);
  dm_Data.ADOCommand.Execute();
  dm_Data.adoconn.CommitTrans;    }
   Proc_ExecuteSql(sql);
 end;
  end;






procedure TFrmPurchaseTracking.UpdateOrderState;
var
 sql,OrderState,id:string;
 IsDelay,DayDelay,EstimateDate:string;
begin
     OrderState:='δ����';
     psql:='select * From PD_PurchaseTracking where   (OrderState=''δ����'') or '
           +' (OrderState=''���ݽ���'')  ';
     dm_DaTa.QuseryData(qry,psql);
     while not qry.Eof do
     begin
       id:=qry.FieldByName('Id').asstring;
       if qry.FieldByName('Amount').AsFloat=qry.FieldByName('ReceivedNum').AsFloat then
         OrderState:='�ѽ���';
        if (qry.FieldByName('Amount').AsFloat>qry.FieldByName('ReceivedNum').AsFloat) and
           (qry.FieldByName('ReceivedNum').AsFloat> 0)     then
         OrderState:='���ֽ���';
        if qry.FieldByName('ReceivedNum').AsFloat<=0 then
             OrderState:='δ����';
         EstimateDate:=qry.FieldByName('EstimateDate').AsString;

          IsDelay:='0' ;
          DayDelay:='0';
       //ֻ�лظ����ںͽ��ܽ��ڶ�Ϊ�յ�ʱ��
       if  (FormatDateTime('yyyy-mm-dd',qry.FieldByName('ReceivedDate').asdatetime)>'')
           and  (FormatDateTime('yyyy-mm-dd',qry.FieldByName('EstimateDate').asdatetime)>'') then
       begin
         if (qry.FieldByName('ReceivedDate').AsDateTime >qry.FieldByName('EstimateDate').AsDateTime)
            and (EstimateDate>'')   then
          begin
           IsDelay:='1' ;
           DayDelay:=IntToStr(DaysBetween(qry.FieldByName('ReceivedDate').AsDateTime,qry.FieldByName('EstimateDate').AsDateTime));
          end;

         if (qry.FieldByName('ReceivedDate').AsDateTime <=qry.FieldByName('EstimateDate').AsDateTime)
            and (EstimateDate>'')   then
           begin
            IsDelay:='0' ;
            DayDelay:='0'
           end;
        end;


       sql:=sql +' update PD_PurchaseTracking set OrderState='''+OrderState+''','
            +'IsDelay='+IsDelay+','+'OffsetDay='+DayDelay +' where Id='+id ;
        qry.Next;
     end;


 if sql>'' then
 begin
  {dm_Data.adoconn.BeginTrans;
  dm_Data.ADOCommand.CommandText:=sql;
//  showmessage(SqlStr);
  dm_Data.ADOCommand.Execute();
  dm_Data.adoconn.CommitTrans;    }
   Proc_ExecuteSql(sql);
  end;

end;

procedure TFrmPurchaseTracking.Proc_ExecuteSql(sql: string);
begin
  adoconn := TADOConnection.Create(self);
  adoconn.ConnectionString := dm_Data.adoconn.ConnectionString;
  adoconn.LoginPrompt := False;
  adoconn.Connected := True;
  adoconn.BeginTrans;
  adocommand := TADOCommand.Create(self);
  adocommand.Connection := adoconn;
  adocommand.CommandText := sql;
  //  showmessage(SqlStr);
  adocommand.Execute;
  adoconn.CommitTrans;
  FreeAndNil(adoconn);
  FreeAndNil(adocommand);
end;

procedure TFrmPurchaseTracking.UpdateReturnGoodData;
var
  CREATE_DATE:string;
  BillNo,BillDate,ProductType,Amount,PurchaseNo,PurchaseType:string;
  sql:string;
begin

   //��ERP�Ѿ���˹��Ľ�����¼ ���µ� ͬ�����ҵ����ݿ����
   psql:='select max(CREATE_DATE) num from Erp_ReturnGoodData ';
   dm_DaTa.QuseryData(qry,Psql);
   CREATE_DATE:=qry.FieldByName('num').AsString;

  //��ERP�Ѿ���˹����˻���¼ ���µ� ͬ�����ҵ����ݿ����
   psql:='select a.TI002,a.TI003,b.TJ005,b.TJ009,b.TJ016,b.TJ017,b.CREATE_DATE '
        +' from  PURTI  a  INNER JOIN  PURTJ b  ON  a.TI001=b.TJ001 '
        +' and  a.TI002=b.TJ002 and a.TI013=''Y''';

   if CREATE_DATE='' then
       psql:=psql
   else
      psql:=psql+' AND  b.CREATE_DATE>'''+CREATE_DATE+'''';

  dm_DaTa.QuseryData(qry_erp,psql);        //ȡ��û��ͬ��������

  while not qry_erp.Eof  do
  begin
      BillNo:=qry_erp.FieldByName('TI002').AsString;  //��������
      Billdate:=qry_erp.FieldByName('TI003').AsString;  //��������
      ProductType:=qry_erp.FieldByName('TJ005').AsString; //Ʒ��


      Amount:=qry_erp.FieldByName('TJ009').AsString; //����
       if Amount='' then  Amount:='0';
      PurchaseType:=qry_erp.FieldByName('TJ016').AsString; //�ɹ�������
      PurchaseNo:=qry_erp.FieldByName('TJ017').AsString; //�ɹ�����
      CREATE_DATE:=qry_erp.FieldByName('CREATE_DATE').AsString; //Ʒ��
      sql:=sql+' Insert into Erp_ReturnGoodData(BillNo,BillDate,ProductType,Amount,PurchaseNo,PurchaseType,CREATE_DATE)'
          +'  values('''+BillNo+''','''+BillDate+''','''+ProductType+''','+Amount+','
          +''''+PurchaseNo+''','''+PurchaseType+''','''+CREATE_DATE+''')';

      sql:=sql+'   update PD_PurchaseTracking set ReturnedNum=ReturnedNum+'+Amount
           +' where  OrderNum='''+PurchaseNo+''' and   ProductType='''+ProductType+''' '
           +' and OrderType='''+PurchaseType+'''';


      qry_erp.Next;

    end;
 if sql>'' then
 begin
 { dm_Data.adoconn.BeginTrans;
  dm_Data.ADOCommand.CommandText:=sql;
//  showmessage(SqlStr);
  dm_Data.ADOCommand.Execute();
  dm_Data.adoconn.CommitTrans;    }
   Proc_ExecuteSql(sql);
 end;
end;

end.
