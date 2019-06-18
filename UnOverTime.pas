unit UnOverTime;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unbase_pnl, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, MemTableDataEh, Data.DB, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, AdvGlowButton, Vcl.ComCtrls, RzDTP,
  Vcl.StdCtrls, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, MemTableEh,
  Data.Win.ADODB, DataDriverEh;

type
  TFrmOvertime = class(Tfrmbase_pnl)
    dsd: TDataSetDriverEh;
    adt: TADODataSet;
    adtPCode: TWideStringField;
    adtPName: TWideStringField;
    adtDeptName: TWideStringField;
    adtPersonId: TIntegerField;
    adtDeptId: TIntegerField;
    adtReason: TWideStringField;
    adtBeginTime: TDateTimeField;
    adtEndTime: TDateTimeField;
    adtHourTime: TBCDField;
    adtOnDate: TDateTimeField;
    dso: TDataSource;
    mte: TMemTableEh;
    Grd: TDBGridEh;
    pnl_locate: TRzPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_name: TEdit;
    date_begin: TRzDateTimePicker;
    date_end: TRzDateTimePicker;
    btn_OrderNum_Locate: TAdvGlowButton;
    btnAdd: TRzToolbarButton;
    btnEdit: TRzToolbarButton;
    adtOverTimeId: TLargeintField;
    adtOvertimeDate: TDateTimeField;
    RzToolbarButton6: TRzToolbarButton;
    btnBatchData: TRzToolbarButton;
    chk_locate: TCheckBox;
    RzToolbarButton4: TRzToolbarButton;
    adtName: TWideStringField;
    adtOvertimeType: TIntegerField;
    AdvGlowButton1: TAdvGlowButton;
    RzToolbarButton11: TRzToolbarButton;
    AdvGlowButton5: TAdvGlowButton;
    RzToolbarButton5: TRzToolbarButton;
    procedure btnAddClick(Sender: TObject);
    procedure chk_locateClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btn_OrderNum_LocateClick(Sender: TObject);
    procedure btnBatchDataClick(Sender: TObject);
    procedure AdvGlowButton5Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
  private
    procedure LocateData; // ��ѯ����
  public
    { Public declarations }
  end;

var
  FrmOvertime: TFrmOvertime;

implementation
       uses undata, UnOvertime_AddEdit, UnOverTime_BatchData;
{$R *.dfm}



procedure TFrmOvertime.btnBatchDataClick(Sender: TObject);
begin
    FrmOverTime_BatchData:=tFrmOverTime_BatchData.Create(self);
   IF FrmOverTime_BatchData.ShowModal = Idok then;
  begin
    adt.Requery();

    mte.close;
    mte.open;

  end;

end;

procedure TFrmOvertime.btnEditClick(Sender: TObject);
var
  OverTimeId: integer;
begin
  if mte.RecordCount = 0 then
    exit;
  OverTimeId := adt.FieldByName('OverTimeId').asinteger;
  FrmOverTime_AddEdit := tFrmOverTime_AddEdit.create(self);
  FrmOverTime_AddEdit.keyId := mte.FieldByName('OverTimeId').asinteger;
  OverTimeId := mte.FieldByName('OverTimeId').asinteger;
   FrmOverTime_AddEdit.Psql :=
    'select top 1 * from Hrm_OverTime  where OverTimeId='+inttostr(OverTimeId);
  dm_Data.proc_ActiveAdodataset(FrmOverTime_AddEdit.adt, FrmOverTime_AddEdit.Psql);
  FrmOverTime_AddEdit.adt.Edit;
  FrmOverTime_AddEdit.Caption := '�����������';
  FrmOverTime_AddEdit.AddOrEdit := 'Edit';
  FrmOverTime_AddEdit.ShowModal;
  adt.close;
  adt.open;
  mte.close;
  mte.open;
  mte.locate('OverTimeId', OverTimeId, []);
end;

procedure TFrmOvertime.btn_OrderNum_LocateClick(Sender: TObject);
begin
  LocateData;

end;

procedure TFrmOvertime.chk_locateClick(Sender: TObject);
begin
    if chk_locate.Checked then
    pnl_locate.visible := true
  else
    pnl_locate.visible := false;

end;

procedure TFrmOvertime.AdvGlowButton1Click(Sender: TObject);
begin
  inherited;
  dm_data.DbGridEhToExcel(Grd);
end;

procedure TFrmOvertime.AdvGlowButton5Click(Sender: TObject);
begin
  inherited;
    dm_Data.GrdParamter(grd);
end;

procedure TFrmOvertime.btnAddClick(Sender: TObject);
begin
  FrmOverTime_AddEdit := tFrmOverTime_AddEdit.create(self);
  FrmOverTime_AddEdit.Caption := '����Ӱ��¼';
  FrmOverTime_AddEdit.Psql :=
    'select top 1 * from Hrm_OverTime order by OverTimeId desc ';
  dm_Data.proc_ActiveAdodataset(FrmOverTime_AddEdit.adt, FrmOverTime_AddEdit.Psql);
  FrmOverTime_AddEdit.adt.Append;
  FrmOverTime_AddEdit.adt.FieldByName('begintime').AsDateTime :=
    strtodatetime(formatdatetime('yyyy-mm-dd hh:nn', now));
  FrmOverTime_AddEdit.adt.FieldByName('Endtime').AsDateTime := now;

  IF FrmOverTime_AddEdit.ShowModal = Idok then;
  begin
    adt.Requery();

    mte.close;
    mte.open;

  end;
end;
procedure TFrmOvertime.LocateData;
var
  datebegin, dateend: String;
  workstate: integer;
begin
  datebegin := formatdatetime('yyyy-mm-dd', date_begin.Date);
  dateend := formatdatetime('yyyy-mm-dd', date_end.Date);
  Psql := 'select   c.PCode,c.PName,b.DeptName,d.name,a.*  FROM Hrm_OverTime a '
         +' left   join   Hrm_Dept b   on   a.DeptId=b.DeptId '
         +' left   join   Hrm_Person c   on   a.PersonId=c.PersonId '
         +' left   join   Hrm_OvertimeType d on  d.TypeId=a.OvertimeType '
         +' WHERE  (Convert(varchar(10),a.BeginTime,120) >='''+ datebegin + ''' '
         + ' and Convert(varchar(10),a.BeginTime,120) <=''' +dateend + ''')';
 if  edt_name.Text>''  then
   Psql:=Psql+' and   c.PName='''+edt_name.Text+'''';

  with adt do
  begin
    close;
    commandtext:=Psql;
    open;
  end;

    Mte.close;
    Mte.open;

end;

end.
