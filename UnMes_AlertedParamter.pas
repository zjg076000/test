unit UnMes_AlertedParamter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Unbase_pnl, Vcl.Buttons, RzButton,
  Vcl.ExtCtrls, RzPanel, Vcl.WinXCtrls, Vcl.StdCtrls, RzEdit, AdvSmoothLabel;

type
  TFrmMes_AlertedParater = class(Tfrmbase_pnl)
    RzPanel2: TRzPanel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ToggleSwitch1: TToggleSwitch;
    Label3: TLabel;
    ToggleSwitch2: TToggleSwitch;
    RzPanel3: TRzPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_OKrate: TEdit;
    Label7: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Edit3: TEdit;
    Label8: TLabel;
    Label12: TLabel;
    RzPanel4: TRzPanel;
    mmo_Personlist: TRzMemo;
    AdvSmoothLabel1: TAdvSmoothLabel;
    btn_Select: TSpeedButton;
    AdvSmoothLabel2: TAdvSmoothLabel;
    procedure RzToolbarButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMes_AlertedParater: TFrmMes_AlertedParater;

implementation

{$R *.dfm}

procedure TFrmMes_AlertedParater.FormCreate(Sender: TObject);
begin
 // inherited;
  //
end;

procedure TFrmMes_AlertedParater.RzToolbarButton1Click(Sender: TObject);
begin
  Close;

end;

end.
