unit UnPositive;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UnBase_AddEdit, DBCtrlsEh, Vcl.DBCtrls,
  Vcl.StdCtrls, Vcl.Mask, RzLabel, Data.DB, Data.Win.ADODB, Vcl.Buttons,
  Vcl.ExtCtrls, RzPanel, RzDBLbl;

type
  TfrmPositive = class(TFrmBase_AddEdit)
    RzPanel3: TRzPanel;
    Label1: TLabel;
    RzPanel5: TRzPanel;
    Label31: TLabel;
    Label3: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    dbedtLeaderCheck: TDBEdit;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label5: TLabel;
    dbedtAuditor: TDBEdit;
    adq: TADOQuery;
    RzDBLabel1: TRzDBLabel;
    procedure adtAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPositive: TfrmPositive;

implementation

{$R *.dfm}

uses UnData,UnPerson;

procedure TfrmPositive.adtAfterScroll(DataSet: TDataSet);
begin
 {  if DataSet.FieldByName('PersonId').IsNull then
   begin
   // lbl_Person.Caption:='';
    exit;
   end;
   Psql:='select * From Hrm_Person where PersonId='+DataSet.FieldByName('PersonId').AsString;
   dm_Data.QuseryData(adq,Psql);
   lbl_Person.Caption:=adq.FieldByName('PName').AsString;      }
end;

end.
