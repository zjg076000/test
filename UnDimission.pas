unit UnDimission;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UnBase_AddEdit, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, Unbase_pnl, Data.DB, Data.Win.ADODB, RzLabel,
  Vcl.StdCtrls, DBCtrlsEh, Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  RzDBLbl;

type
  TfrmDimission = class(TFrmBase_AddEdit)
    adt_Person: TADODataSet;
    dso_person: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label31: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label28: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    dsotype: TDataSource;
    adttype: TADODataSet;
    Label5: TLabel;
    RzDBLabel1: TRzDBLabel;
    RzDBLabel2: TRzDBLabel;
    RzDBLabel3: TRzDBLabel;
    qry: TADOQuery;
    procedure RzToolbarButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDimission: TfrmDimission;

implementation
       uses UnPerson,undata;
{$R *.dfm}

procedure TfrmDimission.btnSaveClick(Sender: TObject);
var
   TermDate:string;
begin
  IF   application.MessageBox('��ȷ��Ҫ�����Ա����ְ����ְ��Ա����Ϣ���ܸ��ģ�','��ʾ',MB_OKCANCEL
)=1 then
begin
     inherited;
     TermDate:=FormatDateTime('yyyy-MM-dd',adt.FieldByName('Dimission_Date').AsDateTime);

   Psql:='update Hrm_Person set   IsStatus=''��ְ'' , TermDate='''+TermDate+''''
       +' where PersonId='+adt.Fieldbyname('PersonId').asstring;
   dm_data.Execsql(qry,Psql);

end;


end;

procedure TfrmDimission.FormShow(Sender: TObject);
begin
  inherited;
 // KeyId:=frmPerson.adt.FieldByName('PersonId').asinteger;
end;

procedure TfrmDimission.RzToolbarButton1Click(Sender: TObject);
begin
  close;
end;

end.
