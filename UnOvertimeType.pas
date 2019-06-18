unit UnOvertimeType;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unbase_pnl, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Data.DB, Data.Win.ADODB,
  MemTableDataEh, DataDriverEh, MemTableEh, AdvGlowButton, AdvSmoothLabel;

type
  TFrmOvertimeType = class(Tfrmbase_pnl)
    adt: TADODataSet;
    ds: TDataSource;
    mte: TMemTableEh;
    dsd: TDataSetDriverEh;
    Grd: TDBGridEh;
    AdvGlowButton1: TAdvGlowButton;
    procedure RzToolbarButton1Click(Sender: TObject);
    procedure AdvGlowButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmOvertimeType: TFrmOvertimeType;

implementation

{$R *.dfm}
  uses UnData;
procedure TFrmOvertimeType.AdvGlowButton1Click(Sender: TObject);
begin
 if (mte.State=dsInsert) or (mte.State=dseDit) then
         mte.Post;

end;

procedure TFrmOvertimeType.RzToolbarButton1Click(Sender: TObject);
begin
  Close;
end;

end.
