﻿unit UnDept;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unbase_pnl, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, RzButton, Vcl.ExtCtrls, RzPanel, Vcl.Mask, Vcl.DBCtrls,
  AdvSmoothLabel, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, AdvGlowButton, MemTableDataEh,
  Data.DB, MemTableEh, DataDriverEh, Data.Win.ADODB, System.ImageList,
  Vcl.ImgList;

type
  TFrmDept = class(Tfrmbase_pnl)
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    TreeView1: TTreeView;
    Label1: TLabel;
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    RzPanel8: TRzPanel;
    RzPanel6: TRzPanel;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    advsmthlbl1: TAdvSmoothLabel;
    RzPanel10: TRzPanel;
    AdvGlowButton2: TAdvGlowButton;
    RzPanel12: TRzPanel;
    lbl_User: TLabel;
    RzPanel13: TRzPanel;
    AdvGlowButton5: TAdvGlowButton;
    AdvGlowButton6: TAdvGlowButton;
    Splitter1: TSplitter;
    RzPanel9: TRzPanel;
    GRD: TDBGridEh;
    RzPanel7: TRzPanel;
    Label4: TLabel;
    RzPanel11: TRzPanel;
    AdvGlowButton1: TAdvGlowButton;
    AdvGlowButton4: TAdvGlowButton;
    adt: TADODataSet;
    dsd: TDataSetDriverEh;
    dso: TDataSource;
    mte: TMemTableEh;
    adtUser: TADODataSet;
    dsdUser: TDataSetDriverEh;
    dsoUser: TDataSource;
    mteUser: TMemTableEh;
    Grd01: TDBGridEh;
    ImageList1: TImageList;
    query_dept: TADOQuery;
    Adt_dept: TADODataSet;
    dso_dept: TDataSource;
    AdvGlowButton7: TAdvGlowButton;
    AdvGlowButton3: TAdvGlowButton;
    procedure mteAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public

  end;

var
  FrmDept: TFrmDept;

implementation
   uses UnCommon,undata;
{$R *.dfm}




procedure TFrmDept.FormCreate(Sender: TObject);
begin
  inherited;
  UnCommon.MakeTree(query_dept,TreeView1,'DeptId','ParentId','DeptName');
end;

procedure TFrmDept.mteAfterScroll(DataSet: TDataSet);
begin
  //inherited;
  lbl_User.Caption:='【'+mte.FieldByName('PName').AsString+'】的用户资料';
end;

procedure TFrmDept.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  Adt_dept.Locate('DeptName',TreeView1.Selected.Text,[]);

end;

end.
