unit UnLeave;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unbase_pnl, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, Vcl.ComCtrls, RzDTP, RzDBDTP, RzBorder, Vcl.StdCtrls,
  Vcl.DBCtrls, AdvGlowButton, Vcl.WinXPanels, MemTableDataEh, Data.DB,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, MemTableEh, DataDriverEh, Data.Win.ADODB;

type
  TFrmLeave = class(Tfrmbase_pnl)
    RzToolbarButton3: TRzToolbarButton;
    RzToolbarButton6: TRzToolbarButton;
    adt: TADODataSet;
    dsd: TDataSetDriverEh;
    dso: TDataSource;
    mte: TMemTableEh;
    Grd: TDBGridEh;
    pnl_locate: TRzPanel;
    Label1: TLabel;
    edt_name: TEdit;
    Label2: TLabel;
    date_begin: TRzDateTimePicker;
    Label3: TLabel;
    date_end: TRzDateTimePicker;
    btn_OrderNum_Locate: TAdvGlowButton;
    chk_locate: TCheckBox;
    btnEdit: TRzToolbarButton;
    adtPCode: TWideStringField;
    adtPName: TWideStringField;
    adtDeptName: TWideStringField;
    adtLeaveId: TLargeintField;
    adtPersonId: TIntegerField;
    adtDeptId: TIntegerField;
    adtLeaveDate: TDateTimeField;
    adtReason: TWideStringField;
    adtBeginTime: TDateTimeField;
    adtEndTime: TDateTimeField;
    adtHourTime: TBCDField;
    adtOnDate: TDateTimeField;
    adtName: TWideStringField;
    adtLeaveType: TIntegerField;
    RzToolbarButton11: TRzToolbarButton;
    RzToolbarButton2: TRzToolbarButton;
    AdvGlowButton5: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    procedure chk_locateClick(Sender: TObject);
    procedure RzToolbarButton3Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btn_OrderNum_LocateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure AdvGlowButton5Click(Sender: TObject);
  private
    // strsql:string;
    procedure LocateData; // ��ѯ����

  public

  end;

var
  FrmLeave: TFrmLeave;

implementation

{$R *.dfm}

uses UnLeave_AddEdit, UnData;

procedure TFrmLeave.AdvGlowButton1Click(Sender: TObject);
begin
   dm_data.DbGridEhToExcel(Grd);
end;

procedure TFrmLeave.AdvGlowButton5Click(Sender: TObject);
begin
  inherited;
    dm_Data.GrdParamter(grd);
end;

procedure TFrmLeave.btnEditClick(Sender: TObject);
var
  LeaveId: integer;
begin
  if mte.RecordCount = 0 then
    exit;
  LeaveId := adt.FieldByName('LeaveId').asinteger;
  FrmLeave_AddEdit := tFrmLeave_AddEdit.create(self);
  FrmLeave_AddEdit.keyId := mte.FieldByName('LeaveId').asinteger;
  LeaveId := mte.FieldByName('LeaveId').asinteger;
   FrmLeave_AddEdit.Psql :=
    'select top 1 * from Hrm_Leave  where LeaveId='+inttostr(LeaveId);
  dm_Data.proc_ActiveAdodataset(FrmLeave_AddEdit.adt, FrmLeave_AddEdit.Psql);
  FrmLeave_AddEdit.adt.Edit;
  FrmLeave_AddEdit.Caption := '�����������';
  FrmLeave_AddEdit.AddOrEdit := 'Edit';
  FrmLeave_AddEdit.ShowModal;
  adt.close;
  adt.open;
  mte.close;
  mte.open;
  mte.locate('LeaveId', LeaveId, []);
  // grd.Refresh;
  { if  FrmPerson_AddEdit.showmodal()=Idok then
    begin


    end;
  }

end;

procedure TFrmLeave.btn_OrderNum_LocateClick(Sender: TObject);
begin
 // inherited;
   LocateData;
end;

procedure TFrmLeave.chk_locateClick(Sender: TObject);
begin
  if chk_locate.Checked then
    pnl_locate.visible := true
  else
    pnl_locate.visible := false;

end;

procedure TFrmLeave.FormCreate(Sender: TObject);
begin
  date_begin.DateTime:=now;
  date_end.DateTime:=now;

end;

procedure TFrmLeave.LocateData;
var
  datebegin, dateend: String;
  workstate: integer;
begin
  datebegin := formatdatetime('yyyy-mm-dd', date_begin.Date);
  dateend := formatdatetime('yyyy-mm-dd', date_end.Date);
  Psql := 'select   c.PCode,c.PName,b.DeptName,d.Name,a.*  FROM Hrm_Leave a '
         +' left   join   Hrm_Dept b   on   a.DeptId=b.DeptId '
         +' left   join   Hrm_Person c   on   a.PersonId=c.PersonId '
         +' left   join   Hrm_LeaveType d  on  a.LeaveType=d.TypeId '
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

procedure TFrmLeave.RzToolbarButton3Click(Sender: TObject);
begin

  FrmLeave_AddEdit := tFrmLeave_AddEdit.create(self);
  FrmLeave_AddEdit.Caption := '������ټ�¼';
  FrmLeave_AddEdit.Psql :=
    'select top 1 * from Hrm_Leave order by LeaveId desc ';
  dm_Data.proc_ActiveAdodataset(FrmLeave_AddEdit.adt, FrmLeave_AddEdit.Psql);
  FrmLeave_AddEdit.adt.Append;
  FrmLeave_AddEdit.adt.FieldByName('begintime').AsDateTime :=
    strtodatetime(formatdatetime('yyyy-mm-dd hh:nn', now));
  FrmLeave_AddEdit.adt.FieldByName('Endtime').AsDateTime := now;

  IF FrmLeave_AddEdit.ShowModal = Idok then;
  begin
    adt.Requery();

    mte.close;
    mte.open;

  end;
end;

end.
