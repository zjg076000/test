unit Unbase_pnl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, RzButton, ExtCtrls, RzPanel;

type
  Tfrmbase_pnl = class(TForm)
    RzPanel1: TRzPanel;
    RzToolbarButton1: TRzToolbarButton;
    procedure RzToolbarButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
     Psql:string;
  end;

var
  frmbase_pnl: Tfrmbase_pnl;

implementation
   uses unmain,undata;
{$R *.dfm}

procedure Tfrmbase_pnl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     //  freeAndNil(Tform(Sender));
end;

procedure Tfrmbase_pnl.FormCreate(Sender: TObject);
begin
 //    Self.RzToolbarButton1.Tag:=dm_data.Tag;
end;

procedure Tfrmbase_pnl.RzToolbarButton1Click(Sender: TObject);
begin
        frmmain.proc_closeform(TRzToolButton(Sender).Tag);

end;

end.
