unit UnFtpServer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,unbase_pnl, AdvGlowButton, Vcl.StdCtrls,
  Vcl.Buttons, RzButton, Vcl.ExtCtrls, RzPanel;

type
  TFrmFtpServer = class(Tfrmbase_pnl)
    Label3: TLabel;
    Label4: TLabel;
    edt_Localhost: TEdit;
    edt_port: TEdit;
    btnFixCell: TAdvGlowButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFtpServer: TFrmFtpServer;

implementation

{$R *.dfm}

end.
