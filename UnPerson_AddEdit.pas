unit UnPerson_AddEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvGlowButton, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, RzPanel, Vcl.Buttons, RzLabel, RzDBLbl,
  Vcl.ComCtrls, RzDTP, RzDBDTP, Data.DB, DBCtrlsEh, Data.Win.ADODB, RzBorder,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, MemTableDataEh, DataDriverEh, MemTableEh,
  Vcl.ExtDlgs;

type
  TFrmPerson_AddEdit = class(TForm)
    RzPanel1: TRzPanel;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton3: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    btn_DeletePicture: TAdvGlowButton;
    RzPanel4: TRzPanel;
    btnSaveAdd: TSpeedButton;
    btnSave: TSpeedButton;
    btnCancel: TSpeedButton;
    RzDBLabel1: TRzDBLabel;
    adt: TADODataSet;
    dso: TDataSource;
    RzPanel5: TRzPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label44: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label45: TLabel;
    AdvGlowButton8: TAdvGlowButton;
    AdvGlowButton9: TAdvGlowButton;
    AdvGlowButton10: TAdvGlowButton;
    RzPanel6: TRzPanel;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBComboBox1: TDBComboBox;
    RzDBDateTimePicker2: TRzDBDateTimePicker;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBComboBox6: TDBComboBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit1: TDBEdit;
    lbl_Dept: TLabel;
    RzBorder1: TRzBorder;
    pnl_Dept: TRzPanel;
    btnDept: TSpeedButton;
    adtPersonId: TAutoIncField;
    adtPCode: TWideStringField;
    adtPName: TWideStringField;
    adtSex: TWideStringField;
    adtDeptId: TIntegerField;
    adtMarried: TWideStringField;
    adtPoliticalStatus: TWideStringField;
    adtNation: TWideStringField;
    adtNative_Place: TWideStringField;
    adtIdCard: TWideStringField;
    adtBirthday: TDateTimeField;
    adtPosition: TWideStringField;
    adtEducation: TWideStringField;
    adtGraduateSchool: TWideStringField;
    adtEmail: TWideStringField;
    adtContactNumber: TWideStringField;
    adtAddress: TWideStringField;
    adtHireDate: TDateTimeField;
    adtTermDate: TDateTimeField;
    adtLinkMan: TWideStringField;
    adtLinkMan_Phone: TWideStringField;
    adtIsStatus: TWideStringField;
    adtPicture: TBlobField;
    adtMajor: TWideStringField;
    adtEmploymentType: TWideStringField;
    adt_dept: TADODataSet;
    dso_Dept: TDataSource;
    adq: TADOQuery;
    mte_Dept: TMemTableEh;
    dsd_dept: TDataSetDriverEh;
    Grd: TDBGridEh;
    Label2: TLabel;
    RzDBLabel2: TRzDBLabel;
    image: TDBImage;
    dlgOpenPic: TOpenPictureDialog;
    RzDBDateTimePicker1: TRzDBDateTimePicker;
    Label3: TLabel;
    DBEdit15: TDBEdit;
    Label4: TLabel;
    RzDBDateTimePicker3: TRzDBDateTimePicker;
    Label5: TLabel;
    RzDBDateTimePicker4: TRzDBDateTimePicker;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    RzLabel1: TRzLabel;
    Label9: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    RzLabel2: TRzLabel;
    Label10: TLabel;
    RzDBDateTimePicker5: TRzDBDateTimePicker;
    Label11: TLabel;
    RzDBDateTimePicker6: TRzDBDateTimePicker;
    Label12: TLabel;
    RzDBDateTimePicker7: TRzDBDateTimePicker;
    Label13: TLabel;
    DBEdit19: TDBEdit;
    DBEdit13: TDBEdit;
    adtContractDate: TDateTimeField;
    adtTrialPeriod: TWideStringField;
    adtPositiveDate: TDateTimeField;
    adtBankAccount: TWideStringField;
    adtSocialSecurity: TWideStringField;
    adtCurrentAddress: TWideStringField;
    adtIdCard_BeginTime: TDateTimeField;
    adtIdCard_EndTime: TDateTimeField;
    adtIssuingUnit: TWideStringField;
    adtProvidentFund: TWideStringField;
    adtIsSelect: TBooleanField;
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDeptClick(Sender: TObject);
    procedure GrdDblClick(Sender: TObject);
    procedure adtAfterScroll(DataSet: TDataSet);
    procedure btn_DeletePictureClick(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
  private
    strsql: string;
    _PersonId: iNTEGER; // ����һ������  Ա�����
    _AddOrEdit: string;

  public

  published
    property PersonId: integer read _PersonId write _PersonId;
    property AddOrEdit: string read _AddOrEdit write _AddOrEdit;
  end;

var
  FrmPerson_AddEdit: TFrmPerson_AddEdit;

implementation
    uses undata;
{$R *.dfm}

procedure TFrmPerson_AddEdit.adtAfterScroll(DataSet: TDataSet);
begin
   if DataSet.FieldByName('deptId').IsNull then
   begin
    lbl_Dept.Caption:='';
    exit;
   end;
   strsql:='select * From Hrm_Dept where DeptId='+DataSet.FieldByName('deptId').AsString;
   dm_Data.QuseryData(adq,strsql);
   lbl_Dept.Caption:=adq.FieldByName('deptname').AsString;
end;

procedure TFrmPerson_AddEdit.btnDeptClick(Sender: TObject);
begin
   pnl_dept.Visible:=not pnl_dept.Visible;
end;

procedure TFrmPerson_AddEdit.FormCreate(Sender: TObject);
begin
 //  adt.Append;
end;

procedure TFrmPerson_AddEdit.FormShow(Sender: TObject);
begin
  if AddOrEdit = 'Add' then
  begin
    strsql := 'select top 1 * from Hrm_Person order by PersonId  desc ';
    dm_Data.proc_ActiveAdodataset(adt, strsql);
    adt.append;
  end
  else
  begin
    strsql := 'select * from Hrm_Person where PersonId='+inttostr(PersonId) ;
    dm_Data.proc_ActiveAdodataset(adt, strsql);
    adt.Edit;
  end;
end;

procedure TFrmPerson_AddEdit.GrdDblClick(Sender: TObject);
begin
    adt.FieldByName('DeptId').AsInteger:=mte_dept.FieldByName('DeptId').AsInteger;

    lbl_dept.Caption:=mte_dept.FieldByName('DeptName').asstring;
    pnl_dept.Visible:=false;
end;

procedure TFrmPerson_AddEdit.btnSaveAddClick(Sender: TObject);
begin
     adt.Append;
     image.Picture:=nil;
end;

procedure TFrmPerson_AddEdit.btnSaveClick(Sender: TObject);
begin
   adt.post;
   close;
end;

procedure TFrmPerson_AddEdit.btn_DeletePictureClick(Sender: TObject);
begin
    image.Picture:=nil;
end;

procedure TFrmPerson_AddEdit.AdvGlowButton1Click(Sender: TObject);
var
  strFile:string;
begin
     if dlgOpenPic.Execute then
     begin
      strFile:=dlgOpenPic.FileName;
      TGraphicField(adt.FieldByName('Picture')).LoadFromFile(strFile);
     end;
end;

procedure TFrmPerson_AddEdit.btnCancelClick(Sender: TObject);
begin
  adt.Cancel;
  close;
end;

end.
