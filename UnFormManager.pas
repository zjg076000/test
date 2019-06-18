unit UnFormManager;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unbase_pnl, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh,
  AdvOfficeImage, GradientLabel, MemTableDataEh, Data.DB, MemTableEh,
  DataDriverEh, Data.Win.ADODB,EhLibADO,EhLibMTE;

type
  TFrmFormManager = class(Tfrmbase_pnl)
    RzPanel3: TRzPanel;
    RzPanel5: TRzPanel;
    Label1: TLabel;
    GradientLabel1: TGradientLabel;
    AdvOfficeImage1: TAdvOfficeImage;
    RzPanel4: TRzPanel;
    RzPanel6: TRzPanel;
    Label2: TLabel;
    DBGridEh1: TDBGridEh;
    dso_Zb: TDataSource;
    dsd_zb: TDataSetDriverEh;
    mte_Zb: TMemTableEh;
    Grd: TDBGridEh;
    adt_Zb: TADODataSet;
    mte_Cb: TMemTableEh;
    dsd_cb: TDataSetDriverEh;
    adt_cb: TADODataSet;
    dso_cb: TDataSource;
    adt_cbid: TAutoIncField;
    adt_cbmkname: TStringField;
    adt_cbmkid_tag: TIntegerField;
    adt_cbmkcaption: TStringField;
    adt_cbflid: TIntegerField;
    adt_cbDockFlag: TIntegerField;
    adt_cbImageIndex: TIntegerField;
    mte_Cbid: TAutoIncField;
    mte_Cbmkname: TStringField;
    mte_Cbmkid_tag: TIntegerField;
    mte_Cbmkcaption: TStringField;
    mte_Cbflid: TIntegerField;
    mte_CbDockFlag: TIntegerField;
    mte_CbImageIndex: TIntegerField;
    procedure RzToolbarButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFormManager: TFrmFormManager;

implementation
   uses undata,unmain;
{$R *.dfm}

procedure TFrmFormManager.RzToolbarButton1Click(Sender: TObject);
begin
  close;

end;

end.
