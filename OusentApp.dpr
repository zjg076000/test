program OusentApp;

uses
  Vcl.Forms,
  Classes,
  Vcl.Dialogs,
  UnData in 'UnData.pas' {dm_DaTa: TDataModule},
  UnMain in 'UnMain.pas' {FrmMain},
  unLogin in 'unLogin.pas' {frmLogin},
  Unbase_pnl in 'Unbase_pnl.pas' {frmbase_pnl},
  UnPerson in 'UnPerson.pas' {frmPerson},
  UnFormManager in 'UnFormManager.pas' {FrmFormManager},
  UnAts_8472 in 'UnAts_8472.pas' {frmAts_8472},
  UnLeave in 'UnLeave.pas' {FrmLeave},
  UnPerson_AddEdit in 'UnPerson_AddEdit.pas' {FrmPerson_AddEdit},
  UnLocate_ColumnParameter in 'UnLocate_ColumnParameter.pas' {FrmLocate_ColumnParameter},
  UnLeave_AddEdit in 'UnLeave_AddEdit.pas' {FrmLeave_AddEdit},
  UnBase_AddEdit in 'UnBase_AddEdit.pas' {FrmBase_AddEdit},
  UnOverTime in 'UnOverTime.pas' {FrmOvertime},
  UnOvertime_AddEdit in 'UnOvertime_AddEdit.pas' {FrmOverTime_AddEdit},
  UnOverTime_BatchData in 'UnOverTime_BatchData.pas' {FrmOverTime_BatchData},
  UnMes_AlertedParamter in 'UnMes_AlertedParamter.pas' {FrmMes_AlertedParater},
  UnMes_AlteredDispose in 'UnMes_AlteredDispose.pas' {FrmMes_AlteredDispose},
  UnOverTimeOrLeave_MonthCount in 'UnOverTimeOrLeave_MonthCount.pas' {FrmOverTimeOrLeave_MonthCount},
  UnUser in 'UnUser.pas' {FrmUser},
  UnOvertimeType in 'UnOvertimeType.pas' {FrmOvertimeType},
  UnLeaveType in 'UnLeaveType.pas' {FrmLeaveType},
  UnDimission in 'UnDimission.pas' {frmDimission},
  UnDimissionType in 'UnDimissionType.pas' {frmDimissionType},
  UnPositive in 'UnPositive.pas' {frmPositive},
  UnAdjustPost in 'UnAdjustPost.pas' {FrmAdjustPost},
  UnAdjustPostType in 'UnAdjustPostType.pas' {FrmAdjustPostType},
  UnOrderTracking in 'UnOrderTracking.pas' {FrmOrderTracking},
  UnOrderNumData in 'UnOrderNumData.pas' {FrmOrderNumData},
  UnOrderNumData_Add in 'UnOrderNumData_Add.pas' {FrmOrderNumData_Add},
  UnPurchaseTracking in 'UnPurchaseTracking.pas' {FrmPurchaseTracking},
  UnSalerRight in 'UnSalerRight.pas' {FrmSalerRight},
  UnRightManage in 'UnRightManage.pas' {frmRightManager},
  UnProduceOrderTracking in 'UnProduceOrderTracking.pas' {FrmProduceOrderTracking},
  UnSalesOrderReport in 'UnSalesOrderReport.pas' {FrmSalesOrderReport},
  UnFtpServer in 'UnFtpServer.pas' {FrmFtpServer},
  uFtpServer in 'uFtpServer.pas',
  UnCommon in 'UnCommon.pas',
  UnDept in 'UnDept.pas' {FrmDept};

{$R *.res}


begin
  Application.Initialize;

  Application.MainFormOnTaskbar := True;
  Application.Title := '������ŷ������Ϣ����ϵͳ';

  Application.CreateForm(Tdm_DaTa, dm_DaTa);
  Application.CreateForm(TfrmLogin, frmLogin);
  { dm_DaTa.QuseryData(dm_DaTa.qry,'select * from sys_form_mk ');

  while not dm_DaTa.qry.eof do
   begin
     // Application.CreateForm(TForm(TComponentClass(FindClass(dm_DaTa.qry.FieldByName('mkcaption').AsString)
     // TForm(TComponentClass(FindClass(dm_DaTa.qry.FieldByName('mkcaption').AsString)).Create(Application)) ;

   // ShowMessage(dm_DaTa.qry.FieldByName('mkcaption').AsString);
   // if Application.FindComponent(FormName)=nil then begin
  if GetClass(dm_DaTa.qry.FieldByName('mkcaption').AsString)= nil then
   // if FindClass(dm_DaTa.qry.FieldByName('mkcaption').AsString)<>nil then
    //  RegisterClass(GetClass(dm_DaTa.qry.FieldByName('mkcaption').AsString));
    //  RegisterClass(GetClass(dm_DaTa.qry.FieldByName('mkcaption').AsString));
    dm_DaTa.qry.Next;
   end;
     }
  RegisterClass(TfrmPerson);
  RegisterClass(TFrmLeave);
  RegisterClass(TFrmLeaveType);
  RegisterClass(TFrmOverTime);
  RegisterClass(TFrmOverTimeType);
  RegisterClass(TFrmFormManager);
  RegisterClass(TFrmOverTimeOrLeave_MonthCount);

  RegisterClass(TfrmDimissionType);
  RegisterClass(TfrmDimission);
   RegisterClass(TFrmAdjustPostType);
  RegisterClass(TFrmOrderTracking);
   RegisterClass(TFrmOrderNumData);
 //  RegisterClass(TFrmPurchaseTracking);
   RegisterClass(TFrmPurchaseTracking);
   RegisterClass(TFrmProduceOrderTracking);
   RegisterClass(TFrmSalesOrderReport);
    RegisterClass(TfrmRightManager);
     RegisterClass(TFrmFtpServer);
        RegisterClass(TFrmDept);
  // frmlogin.Login() then
      Application.Run ;
 // else
   // Application.Terminate;
  //pplication.Run;
end.
