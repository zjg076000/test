unit UnLocate_ColumnParameter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, AdvGlowButton, Vcl.ExtCtrls, RzPanel, EhLibVCL,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls;

type
  TFrmLocate_ColumnParameter = class(TForm)
    RzPanel1: TRzPanel;
    btnCancel: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    RzPanel2: TRzPanel;
    Grd: TDBGridEh;
    chk: TCheckBox;
    AdvGlowButton1: TAdvGlowButton;
    procedure GrdDblClick(Sender: TObject);
    procedure chkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLocate_ColumnParameter: TFrmLocate_ColumnParameter;

implementation

uses undata;
{$R *.dfm}

procedure TFrmLocate_ColumnParameter.chkClick(Sender: TObject);
var
  i: integer;
begin

  if chk.Checked = FALSE then
  begin
    dm_data.FDMTbl_parameters.First;
    while not dm_data.FDMTbl_parameters.eof do
    begin
      dm_data.FDMTbl_parameters.EDIT;
      dm_data.FDMTbl_parameters.FieldByName('IsVisible').AsBoolean := FALSE;
      dm_data.FDMTbl_parameters.Post;
      dm_data.FDMTbl_parameters.next;
    end;
  end
  else
  begin
    dm_data.FDMTbl_parameters.First;
    while not dm_data.FDMTbl_parameters.eof do
    begin
      dm_data.FDMTbl_parameters.EDIT;
      dm_data.FDMTbl_parameters.FieldByName('IsVisible').AsBoolean := true;
      dm_data.FDMTbl_parameters.Post;
      dm_data.FDMTbl_parameters.next;
    end;
  end;

END;

procedure TFrmLocate_ColumnParameter.GrdDblClick(Sender: TObject);
begin
  // if DBGridEh1.Column.FieldName='IsVisible' then
  // begin
  dm_data.FDMTbl_parameters.EDIT;
  if dm_data.FDMTbl_parameters.FieldByName('IsVisible').AsBoolean = true then
    dm_data.FDMTbl_parameters.FieldByName('IsVisible').AsBoolean := FALSE
  else
    dm_data.FDMTbl_parameters.FieldByName('IsVisible').AsBoolean := true;

  // end;
end;

end.
