unit UnPerson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unbase_pnl, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, AdvOfficeImage, Vcl.StdCtrls, GradientLabel,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, MemTableDataEh,
  Data.DB, Data.Win.ADODB, DataDriverEh, MemTableEh, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, AdvGlowButton, frxClass, frxDBSet,System.Generics.Collections,
  Vcl.Mask, DBCtrlsEh, RzCmboBx, frxDesgn;

type
  TfrmPerson = class(Tfrmbase_pnl)
    RzPanel2: TRzPanel;
    dso: TDataSource;
    mte: TMemTableEh;
    dsd: TDataSetDriverEh;
    adt: TADODataSet;
    RzToolbarButton5: TRzToolbarButton;
    RzToolbarButton6: TRzToolbarButton;
    RzPanel3: TRzPanel;
    Grd1: TDBGridEh;
    RzPanel4: TRzPanel;
    RzToolbarButton11: TRzToolbarButton;
    RzToolbarButton3: TRzToolbarButton;
    chk_select: TCheckBox;
    btn_tel: TAdvGlowButton;
    btn_GrdCol: TAdvGlowButton;
    btn_PersonCard: TAdvGlowButton;
    rep: TfrxReport;
    frxdb: TfrxDBDataset;
    chk_locate: TCheckBox;
    RzToolbarButton2: TRzToolbarButton;
    AdvGlowButton8: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    btnAdd: TAdvGlowButton;
    btnEdit: TAdvGlowButton;
    Label1: TLabel;
    LBL: TLabel;
    cmbType: TComboBox;
    GRD: TDBGridEh;
    btnPositive: TAdvGlowButton;
    RzToolbarButton4: TRzToolbarButton;
    qry: TADOQuery;
    btnPrint: TAdvGlowButton;
    RzToolbarButton7: TRzToolbarButton;
    frxDesigner1: TfrxDesigner;
    procedure btnAdd2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnEdit3Click(Sender: TObject);
    procedure btn_telClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btn_GrdColClick(Sender: TObject);
    procedure btn_PersonDataClick(Sender: TObject);
    procedure btn_PersonCardClick(Sender: TObject);
    procedure rb_telClick(Sender: TObject);
    procedure rb_personDataClick(Sender: TObject);
    procedure Grd1DblClick(Sender: TObject);
    procedure chk_selectClick(Sender: TObject);
    procedure DBEditEh1Change(Sender: TObject);
    procedure chk_locateClick(Sender: TObject);
    procedure rb_birthdayClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure AdvGlowButton8Click(Sender: TObject);
    procedure GrdColumns15GetCellParams(Sender: TObject; EditMode: Boolean;
      Params: TColCellParamsEh);
    procedure GRDGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure AdvGlowButton1Click(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPositiveClick(Sender: TObject);
  private
    procedure UpdatePersonData;
    procedure ExportData;      //��������
    { Private declarations }
  public
    KeyId:integer;
  end;

var
  frmPerson: TfrmPerson;

implementation
     uses undata, UnPerson_AddEdit, UnLocate_ColumnParameter, UnDimission,
  UnAdjustPost, UnPositive;
{$R *.dfm}

procedure TfrmPerson.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   freeandnil(frmPerson);
end;

procedure TfrmPerson.FormCreate(Sender: TObject);
begin
   adt.active:=true;
   mte.Active:=true;

end;

procedure TfrmPerson.Grd1DblClick(Sender: TObject);
begin
 // ShowMessage(IntToStr(Grd.Columns.Items[Grd.Col].Index));
  if  Grd.SelectedIndex=0 then
   begin
     mte.Edit;
     mte.FieldByName('IsSelect').AsBoolean:=not  mte.FieldByName('IsSelect').AsBoolean;
     mte.post;
   end
   else
   UpdatePersonData ;
 // else

end;

procedure TfrmPerson.GrdColumns15GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
 ��
end;

procedure TfrmPerson.GRDGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  //inherited;
  if mte.FieldByName('IsStatus').AsString = '��ְ' then

������AFont.color := clRed;
end;

procedure TfrmPerson.rb_birthdayClick(Sender: TObject);
begin
 //     Grd.set
      grd.SearchPanel.Visible:=true;
      grd.SearchPanel.SearchingText :='-'+FormatDateTime('mm',now)+'-';
      grd.SearchPanel.ApplySearchFilter;

end;

procedure TfrmPerson.rb_personDataClick(Sender: TObject);
var
    i:integer;
begin

 for i := 0 to Grd.Columns.Count - 1 do
    begin



          Grd.Columns[i].Visible := true


    end;

end;

procedure TfrmPerson.UpdatePersonData;
var
  person_id: Integer;
begin
   if mte.RecordCount=0 then     exit;
  person_id := adt.FieldByName('personid').asinteger;
  FrmPerson_AddEdit := tFrmPerson_AddEdit.create(self);
  FrmPerson_AddEdit.PersonId := mte.FieldByName('personid').AsInteger;
  person_id := mte.FieldByName('personid').AsInteger;
  FrmPerson_AddEdit.Caption := '����Ա������';
  FrmPerson_AddEdit.AddOrEdit := 'Edit';
  FrmPerson_AddEdit.ShowModal;
  adt.close;
  adt.open;
  mte.close;
  mte.open;
  mte.locate('PersonId', person_id, []);
end;

procedure TfrmPerson.ExportData;
var
  list: System.Generics.Collections.TList<Integer>;
  i: Integer;
const
  Arr2: array[0..3] of Integer = (2, 5, 9, 10);
  Arr: array[0..15] of Integer = (0, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15);
  Arr3: array[0..1] of Integer = (2,9);

begin
  list := TList<Integer>.create;
  case cmbType.ItemIndex  of
     0: list.AddRange(Arr);
     1: list.AddRange(Arr2);
     2: list.AddRange(Arr3);
  end;


  for i := 0 to Grd1.Columns.Count - 1 do
  begin
    if list.Contains(i) = true then
      Grd1.Columns[i].Visible := true
    else
      Grd1.Columns[i].Visible := false;
  end;
end;

procedure TfrmPerson.rb_telClick(Sender: TObject);
begin
  ExportData;
end;

procedure TfrmPerson.btnAddClick(Sender: TObject);
begin
  FrmPerson_AddEdit:=tFrmPerson_AddEdit.create(self);
  FrmPerson_AddEdit.Caption:='��Ա����ְ';
  IF  FrmPerson_AddEdit.ShowModal =Idok then;
   begin
     adt.Requery();

     mte.close;
     mte.open;


   end;

end;

procedure TfrmPerson.AdvGlowButton1Click(Sender: TObject);
begin
   KeyId:=mte.FieldByName('PersonId').AsInteger;
   FrmAdjustPost:=TFrmAdjustPost.create(Self);

  FrmAdjustPost.Psql :=
    'select  * from Hrm_AdjustPost where PersonId='+IntToStr(mte.FieldByName('PersonId').asinteger);
  dm_Data.proc_ActiveAdodataset(FrmAdjustPost.adt, FrmAdjustPost.Psql);
  if FrmAdjustPost.adt.RecordCount=0 then
   begin
     FrmAdjustPost.adt.Append;
     FrmAdjustPost.adt.FieldByName('PersonId').AsInteger:=mte.FieldByName('PersonId').asinteger;
     FrmAdjustPost.adt.FieldByName('DeptId').AsInteger:=mte.FieldByName('DeptId').AsInteger;
    // frmDimission.adt.FieldByName('DeptId').AsInteger:=adt.FieldByName('DeptId').AsInteger;


   end
  else
     begin
      FrmAdjustPost.adt.Locate('PersonId',mte.FieldByName('PersonId').asinteger,[]);
     //  frmDimission.RzPanel2.Enabled:=False;
     end;

 IF  FrmAdjustPost.ShowModal =Idok then;
   begin
     adt.Requery();

     mte.close;
     mte.open;
    mte.Locate('PersonId',KeyId,[]);

   end;

end;

procedure TfrmPerson.btnPositiveClick(Sender: TObject);
begin

   KeyId:=mte.FieldByName('PersonId').AsInteger;
   frmPositive:=TfrmPositive.create(Self);

  frmPositive.Psql :=
    'select  * from Hrm_Positive where PersonId='+IntToStr(mte.FieldByName('PersonId').asinteger);
  dm_Data.proc_ActiveAdodataset(frmPositive.adt, frmPositive.Psql);
  if frmPositive.adt.RecordCount=0 then
   begin
     frmPositive.adt.edit;
     frmPositive.adt.FieldByName('PersonId').AsInteger:=mte.FieldByName('PersonId').asinteger;
     frmPositive.adt.FieldByName('DeptId').AsInteger:=mte.FieldByName('DeptId').AsInteger;
    // frmDimission.adt.FieldByName('DeptId').AsInteger:=adt.FieldByName('DeptId').AsInteger;
   //  frmPositive.adt.FieldByName('EmploymentType').asstring:='��ʽ��';


   end
  else
     begin
      frmPositive.adt.Locate('PersonId',mte.FieldByName('PersonId').asinteger,[]);
     //  frmDimission.RzPanel2.Enabled:=False;
     end;

 IF  frmPositive.ShowModal =Idok then;
   begin
   //  adt.Requery();
     mte.edit;
     mte.fieldbyname('EmploymentType').asstring:='��ʽ��';
     mte.fieldbyname('PositiveDate').asdatetime:=frmPositive.adt.fieldbyname('PositiveDate').asdatetime;
     mte.post;
    // mte.open;
   // mte.Locate('PersonId',KeyId,[]);

   end;



end;

procedure TfrmPerson.AdvGlowButton8Click(Sender: TObject);
begin
   KeyId:=mte.FieldByName('PersonId').AsInteger;
   frmDimission:=TfrmDimission.create(Self);

  frmDimission.Psql :=
    'select  * from Hrm_Dimission where PersonId='+IntToStr(mte.FieldByName('PersonId').asinteger);
  dm_Data.proc_ActiveAdodataset(frmDimission.adt, frmDimission.Psql);
  if frmDimission.adt.RecordCount=0 then
   begin
     frmDimission.adt.Append;
     frmDimission.adt.FieldByName('PersonId').AsInteger:=mte.FieldByName('PersonId').asinteger;
     frmDimission.adt.FieldByName('DeptId').AsInteger:=mte.FieldByName('DeptId').AsInteger;
    // frmDimission.adt.FieldByName('DeptId').AsInteger:=adt.FieldByName('DeptId').AsInteger;


   end
  else
     begin
      frmDimission.adt.Locate('PersonId',mte.FieldByName('PersonId').asinteger,[]);
     //  frmDimission.RzPanel2.Enabled:=False;
     end;

 IF  frmDimission.ShowModal =Idok then;
   begin
     adt.Requery();

     mte.close;
     mte.open;
    mte.Locate('PersonId',KeyId,[]);

   end;
end;

procedure TfrmPerson.btnAdd2Click(Sender: TObject);
begin


 
  {   frmEmployeeDetail:=TfrmEmployeeDetail.create(Self);
  frmEmployeeDetail.EmpNo:=adt_employee.FieldByName('EmpNo').AsString;
  frmEmployeeDetail.AddOrEdit:='Add';
 if  frmEmployeeDetail.showmodal()=Idok then
   adt_employee.Requery();
                                        }


end;

procedure TfrmPerson.btnEdit3Click(Sender: TObject);
begin

   //grd.Refresh;
 {if  FrmPerson_AddEdit.showmodal()=Idok then
  begin


  end;
       }

end;

procedure TfrmPerson.btnEditClick(Sender: TObject);
begin
   UpdatePersonData;

end;

procedure TfrmPerson.btnPrintClick(Sender: TObject);
begin
 rep.LoadFromFile(GetCurrentDir+'\report\Rep_PersonCard.fr3');
  rep.DesignReport();
end;

procedure TfrmPerson.btn_GrdColClick(Sender: TObject);
begin


    dm_Data.GrdParamter(grd);

end;

procedure TfrmPerson.btn_PersonCardClick(Sender: TObject);
begin

   rep.LoadFromFile(GetCurrentDir+'\report\Rep_PersonCard.fr3');
   rep.ShowReport();
end;

procedure TfrmPerson.btn_PersonDataClick(Sender: TObject);
begin
   dm_data.DbGridEhToExcel(Grd);
end;

procedure TfrmPerson.btn_telClick(Sender: TObject);
begin
  if cmbType.Text='�Զ���' then
     dm_data.DbGridEhToExcel(Grd)
   else
    begin

       ExportData;
      dm_data.DbGridEhToExcel(Grd1);
    end;

end;

procedure TfrmPerson.chk_locateClick(Sender: TObject);
begin
  if chk_locate.Checked then
   begin
      grd.SearchPanel.Visible:=true;
     grd.SearchPanel.SearchingText :='';
     grd.SearchPanel.RestartFind;
   end
 else
  begin
      grd.SearchPanel.Visible:=False;
  end;


end;

procedure TfrmPerson.chk_selectClick(Sender: TObject);
var
  bookmark:TBookmark ;
begin
  if chk_select.Checked=true   then
   psql:='update Hrm_Person set  IsSelect=1'
  else
    psql:='update Hrm_Person set  IsSelect=0';

   dm_Data.Execsql(qry,psql);
   adt.Requery();
   mte.Close;
   mte.open;

end;

procedure TfrmPerson.DBEditEh1Change(Sender: TObject);
begin
 //  grd.SearchPanel.SearchingText :='1';
  // grd.SearchPanel.RestartFind;

end;

end.
