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
    adtAmount: TIntegerField;
    adtPrice: TBCDField;
    adtAmountMoney: TBCDField;
    adtShippedNum: TIntegerField;
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
    mteAmount: TIntegerField;
    mtePrice: TBCDField;
    mteAmountMoney: TBCDField;
    mteShippedNum: TIntegerField;
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
  private

    str_datebegin,str_dateend:string;
     var  VarMonth:Integer;

    procedure OrderNumInput;
    procedure Proc_LocateData;     //产生订单跟踪表
    procedure UpdateOutData;
    procedure Proc_LocateOutOrderDate(var OrderType: string; var OrderNum: string; var ProductType: string; var Amount: Integer; var EstimateDate: string; var ShippingDate: string);     //根据销货单统计延时记录
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
  FrmSalerRight.TypeName:='业务员';
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
    ShowMessage('请选择要更改交期的产品型号');
    Exit;
   end;
   mte.First;
   msg:='你确定对选择的产品设置更改交期为：【'+pwidechar(datetostr(date_change.Date))+'】？';

  if Application.MessageBox(PWideChar(msg), '提示', MB_OKCANCEL) = IDOK then
   begin

    // while not  mte.eof do
   //  begin
    var i:Integer:=1;
      for I := 1 to mte.recordcount do
      begin
        mte.Edit;

        case Length(Trim(mte.FieldByName('ChangeDueDate').Asstring)) of
          0:Symbol:='①' ;
          11:Symbol:='②' ;
          22:Symbol:='③' ;
          33:Symbol:='④' ;
          44:Symbol:='⑤' ;

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

   msg:='你确定对选择日期的产品型号进行计算吗？';

  if Application.MessageBox(PWideChar(msg), '提示', MB_OKCANCEL) = IDOK then
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
   dm_DaTa.Proc_WriteIni('查询参数','月份',IntToStr(sped_month.Value));

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
    ShowMessage('请选择要更改订单状态的产品型号');
    Exit;
   end;
  if dm_DaTa.FunMsg('你真的要改变选择产品订单的订单状态吗','提示') then
   begin
      var i:Integer:=1;
      for I := 1 to mte.recordcount do
      begin
        mte.Edit;
        var OrderState:string;
       if Switch_01.State=TToggleSwitchState.tssOn then
         OrderState:='未发货'
        else
         OrderState:='已发货';
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
    ShowMessage('请选择要设置交期的产品');
    Exit;
   end;
   mte.First;
   msg:='你确定对选择的产品设置回复交期：【'+pwidechar(datetostr(date_Return.Date))+'】？';
  if Application.MessageBox(PWideChar(msg), '提示', MB_OKCANCEL) = IDOK then
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

  VarMonth:=StrToInt(dm_DaTa.ReadIni('查询参数','月份'));
  sped_month.Value:=VarMonth;
  datebegin.Date:=IncMonth(now,VarMonth);
  dateend.Date:=now;
  UpdateOutData;
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
  if mte.FieldByName('OrderState').AsString = '已发货' then
   　AFont.color := clRed;
  if mte.FieldByName('OrderState').AsString = '未发货' then
   　AFont.color := clBlack;
  if mte.FieldByName('OrderState').AsString = '部分发货' then
   begin
   　AFont.color :=clWebBlue;
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

procedure TFrmOrderTracking.OrderNumInput;
var
  MaxOrderNum,sql:string;
  OrderType,OrderDate,OrderNum,CustOrderNum,CustCode,CustProdType,ProductType,OrderNumNote,
  Amount,ShippedNum,DeliveryDate,EstimateDate,Note,SaleMan,Specifications,Price,AmountMoney,OrderState,Currency:string;
begin
   psql:='select max(OrderNum) ordernum from  Pd_OrderTracking ';

   dm_DaTa.QuseryData(qry,psql);
   //查询近30天已经审核的的订单数据
   psql:='select a.TC001,a.TC002,a.TC003,a.TC004,a.TC006,a.TC008,a.TC012,a.TCI01,a.TC052,'
        +'b.TD005,b.TD006,b.TD008,b.TD009,b.TD013,b.TD014,b.TD020,b.TD011,b.TD012 '
        +' from  COPTC a inner   JOIN  COPTD b  ON a.TC002=b.TD002 and a.TC001=b.TD001  '
        +' AND a.TC027=''Y'' ';
        // AND  a.TC003>CONVERT(varchar(100), GETDATE()-30, 112) ';
      MaxOrderNum:=qry.FieldByName('ordernum').AsString;
   if MaxOrderNum='' then
       psql:=psql
   else
      psql:=psql+' AND  a.TC002>'''+MaxOrderNum+'''';

    dm_DaTa.QuseryData(qry_erp,Psql);
    while not qry_erp.Eof  do
    begin

     OrderType:=qry_erp.FieldByName('TC001').AsString;  //订单类型
     OrderNum:=qry_erp.FieldByName('TC002').AsString;   //订单号
     OrderDate:=qry_erp.FieldByName('TC003').AsString;  //订单日期
     CustOrderNum:=qry_erp.FieldByName('TC012').AsString; //客户订单号
     CustCode:=qry_erp.FieldByName('TC004').AsString;     //客户编号
     CustProdType:=qry_erp.FieldByName('TD014').AsString; //客户类型
     ProductType:=qry_erp.FieldByName('TD005').AsString;  //公司型号
     Amount:=qry_erp.FieldByName('TD008').AsString; //产品数量
    // DeliveryDate:=qry_erp.FieldByName('TCI01').AsString; //订单要求发货日期
     //EstimateDate
     DeliveryDate:=qry_erp.FieldByName('TD013').AsString; //预计发货日期
     Note:=qry_erp.FieldByName('TD020').AsString;        //产品备注
     Specifications:=qry_erp.FieldByName('TD006').AsString; //产品规格
     Price:=FloatToStr(qry_erp.FieldByName('TD011').Asfloat); //产品规格
     AmountMoney:=FloatToStr(qry_erp.FieldByName('TD012').AsFloat); //产品规格
     ShippedNum:=qry_erp.FieldByName('TD009').AsString;//交货数量

     SaleMan:=qry_erp.FieldByName('TC006').AsString;       //销售人员
     Currency:=qry_erp.FieldByName('TC008').AsString;      //币种
     OrderNumNote:=qry_erp.FieldByName('TC052').AsString;   //订单备注
     OrderState:='未发货';



    // if  StrToInt(ShippedNum) =strtoint(Amount) then  OrderState:='已发货';
   //  if  (StrToInt(ShippedNum) <StrToInt(Amount)) and (StrToInt(ShippedNum)>0) then  OrderState:='部分发货';


     //生成插入SQL语句
     sql:=sql+' insert into Pd_OrderTracking(OrderType,OrderDate,OrderNum,CustOrderNum,OrderNumNote,'
          +'CustCode,CustProdType,ProductType,Amount,DeliveryDate,Note,SaleMan,Specifications,Price,AmountMoney,ShippedNum,OrderState,Currency)'
          +'  values('''+OrderType+''','''+OrderDate+''','''+OrderNum+''','''+CustOrderNum+''','''+OrderNumNote+''','
          +''''+CustCode+''','''+CustProdType+''','''+ProductType+''','+Amount+','''+DeliveryDate+''','
          +''''+Note+''','''+SaleMan+''','''+Specifications+''','+Price+','+AmountMoney+','+ShippedNum+','''+OrderState+''','''+Currency+''')';

     qry_erp.Next;

    end;
 if sql>'' then
 begin
  dm_Data.adoconn.BeginTrans;
  dm_Data.ADOCommand.CommandText:=sql;
//  showmessage(SqlStr);
  dm_Data.ADOCommand.Execute();
  dm_Data.adoconn.CommitTrans;
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

   str:=dm_DaTa.ReadIni('参数设置','业务员');
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

procedure TFrmOrderTracking.UpdateOutData;
var
  OrderType,OrderNum,ProductType,OrderState,sql,ShippingDate,ShippedNum,EstimateDate,OffsetDay:string;
  Amount:integer;
  IsDelay:String;
begin
  str_datebegin:=FormatDateTime('yyyy-MM-dd',datebegin.DateTime);
  str_dateend:=FormatDateTime('yyyy-MM-dd',dateend.DateTime);

 IsDelay:='0';
  //1. 从查询的数据中过滤出"未发货"和"部分发货"的 的订单数据
  psql:='select * from Pd_OrderTracking where (OrderState=''未发货'' or  OrderState=''部分发货'' or  OrderState=''已发货.交期空'') and '
       +'   (CONVERT(VARCHAR(10),OrderDate,120)>='''+str_datebegin+''''
    +' AND  CONVERT(VARCHAR(10),OrderDate,120)<='''+str_dateend+''') ORDER BY Id  ASC   ';

  dm_DaTa.QuseryData(qry,psql);
  //查询未发货或者部分发货的
  while  not  qry.eof  do
  begin
       OrderType := qry.Fieldbyname('OrderType').asstring;
      //订单类型
      OrderNum := qry.Fieldbyname('OrderNum').asstring;
      //客户订单号
      ProductType := qry.Fieldbyname('ProductType').asstring;
      //品名
      Amount := qry.Fieldbyname('Amount').asinteger;
   //   DeliveryDate := formatdatetime('yyyymmdd', qry.Fieldbyname('DeliveryDate').asdatetime);
      //客户要求发货
      EstimateDate :=formatdatetime('yyyy-mm-dd', qry.Fieldbyname('EstimateDate').asdatetime);
      //  psql:='select   FROM  OrderNum

      //查找出货记录有没有改出货单号
      psql := 'select TOP 1 TH002 from COPTH where  TH014=''' + OrderType + ''' And  TH015=''' + OrderNum + '''  ' + ' and TH005=''' + ProductType + ''' and  TH020=''Y''  ORDER BY  CREATE_DATE DESC';
      dm_Data.QuseryData(qry_erp, psql);
       //取得日期 最后出货日期
      ShippingDate := Copy(qry_erp.fieldbyname('TH002').asstring, 1, 8);
      //如果出货记录中没有对应的单号
      if ShippingDate='' then
      begin
          qry.next;
          continue;
      end;


      //统计销货单中订单号和该型号的销售数量
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
       //只有回复交期和接受交期都为空的时候
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
           //根据订单型号结束订单
                OrderState:='部分发货';


            sql:=sql+' Update Pd_OrderTracking set ShippedNum='+ShippedNum
                   +',ShippingDate='''+ShippingDate+''',OrderState='''+OrderState+''',OffsetDay='+OffsetDay
                   +',IsDelay='+IsDelay+'  where OrderNum='''+OrderNum+''' and OrderType='''+OrderType+'''  '
                   +' and ProductType='''+ProductType+'''';

         //  ShowMessage(sql);
        END
         else
         begin
          //if  qry.FieldByName('EstimateDate').asdatetime<StrToDateTime('1900-01-01 00:00:00') then
          //  OrderState:='已发货.交期空'
          // else
            OrderState:='已发货';
            sql:=sql+' Update Pd_OrderTracking set ShippedNum='+ShippedNum
                   +',ShippingDate='''+ShippingDate+''',OrderState='''+OrderState+''',OffsetDay='+OffsetDay
                     +',IsDelay='+IsDelay+'  where OrderNum='''+OrderNum+''' and OrderType='''+OrderType+''' '
                   +' and ProductType='''+ProductType+'''';

         //  ShowMessage(sql);
        END
         end;

      qry.next;

       end;

 // end;

  if sql>'' then
 begin
  dm_Data.adoconn.BeginTrans;
  dm_Data.ADOCommand.CommandText:=sql;
//  showmessage(SqlStr);
  dm_Data.ADOCommand.Execute();
  dm_Data.adoconn.CommitTrans;
 end;




end;



procedure TFrmOrderTracking.Proc_LocateOutOrderDate(var OrderType: string; var OrderNum: string; var ProductType: string; var Amount: Integer; var EstimateDate: string; var ShippingDate: string);
var
  DeliveryDate: string;
begin

end;


end.
