unit UnOverTime_CopyData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unbase_addEdit, Unbase_pnl, Vcl.Buttons,
  RzButton, Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  DBCtrlsEh, Vcl.DBCtrls, Vcl.Mask, RzLabel, RzDBLbl;

type
  TFrmOverTime_CopyData = class(Tfrmbase_AddEdit)
    RzPanel3: TRzPanel;
    ListBox1: TListBox;
    Label21: TLabel;
    lbl_Person: TRzLabel;
    Label31: TLabel;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label28: TLabel;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label3: TLabel;
    DBDateTimeEditEh2: TDBDateTimeEditEh;
    Label40: TLabel;
    DBEdit12: TDBEdit;
    Label41: TLabel;
    DBDateTimeEditEh3: TDBDateTimeEditEh;
    RzDBLabel1: TRzDBLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOverTime_CopyData: TFrmOverTime_CopyData;

implementation

{$R *.dfm}

end.
