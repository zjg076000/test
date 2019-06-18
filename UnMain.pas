unit UnMain;

interface

uses
  windows,ShellAPI, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, RzPanel, RzButton,
  Vcl.StdCtrls, Vcl.Menus,system.types, Vcl.ComCtrls, RzListVw, RzTreeVw,
  AdvGlowButton, Vcl.BaseImageCollection, Vcl.ImageCollection, System.ImageList,
  Vcl.ImgList, Vcl.VirtualImageList, Vcl.Mask, RzEdit, Vcl.WinXCtrls,
  AdvOfficePager, cxImageList, cxGraphics, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompExtCtrls, Vcl.WinXPickers, Data.DB,
  Datasnap.DBClient,System.StrUtils, Data.Win.ADODB, dxGDIPlusClasses,System.Generics.Collections,
  Vcl.WinXPanels, AdvPanel, AdvSmoothLabel, AdvShape, RzBorder, RzRadChk,MidasLib,Generics.Collections,
  IdBaseComponent, IdZLibCompressorBase, IdCompressorZLib,GDIPOBJ, GDIPAPI,uFtpServer,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP;



type
  TFrmMain = class(TForm)
    pnl_bottom: TRzPanel;
    pnl_Begin: TPanel;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzPanel5: TRzPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    RzPanel4: TRzPanel;
    AdvOfficePage: TAdvOfficePager;
    advpage_navigate: TAdvOfficePage;
    lsv_Main: TRzListView;
    cxImageList1: TcxImageList;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ImageList1: TImageList;
    RzPanel6: TRzPanel;
    lbl_date: TLabel;
    lbl_time: TLabel;
    RzPanel7: TRzPanel;
    lbl_User: TLabel;
    data_pg: TClientDataSet;
    data_pgfid: TIntegerField;
    data_pgfcode: TStringField;
    adq: TADOQuery;
    Image1: TImage;
    rzpnl1: TRzPanel;
    img2: TImage;
    Image8: TImage;
    Image9: TImage;
    img4: TImage;
    Image15: TImage;
    Image19: TImage;
    Image20: TImage;
    RzPanel10: TRzPanel;
    img1: TImage;
    shp1: TShape;
    advsmthlbl1: TAdvSmoothLabel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    rzpnl2: TRzPanel;
    RzPanel9: TRzPanel;
    AdvSmoothLabel16: TAdvSmoothLabel;
    AdvGlowButton44: TAdvGlowButton;
    AdvGlowButton45: TAdvGlowButton;
    AdvGlowButton46: TAdvGlowButton;
    AdvGlowButton48: TAdvGlowButton;
    AdvGlowButton49: TAdvGlowButton;
    AdvGlowButton50: TAdvGlowButton;
    AdvGlowButton51: TAdvGlowButton;
    RzPanel11: TRzPanel;
    btn9: TAdvGlowButton;
    RzPanel1: TRzPanel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    pg_Flow: TAdvOfficePage;
    Image2: TImage;
    RzButton1: TRzButton;
    RzBorder2: TRzBorder;
    btnPerson: TAdvGlowButton;
    btnQuick: TAdvGlowButton;
    btnClose: TAdvGlowButton;
    btnUser: TAdvGlowButton;
    Image3: TImage;
    AdvSmoothLabel5: TAdvSmoothLabel;
    card_menu: TCardPanel;
    CardPerson: TCard;
    CardQuick: TCard;
    RzPanel8: TRzPanel;
    SearchBox1: TSearchBox;
    RzTreeView1: TRzTreeView;
    RzPanel12: TRzPanel;
    SearchBox2: TSearchBox;
    RzListView1: TRzListView;
    btnMenu: TAdvGlowButton;
    AdvGlowButton1: TAdvGlowButton;
    Timer1: TTimer;
    timer2: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Switch_01: TToggleSwitch;
    Switch_02: TToggleSwitch;
    RzPanel13: TRzPanel;
    IdCompressorZLib1: TIdCompressorZLib;
    PNL_Flow: TRzPanel;
    Shape1: TShape;
    Image24: TImage;
    Image25: TImage;
    Image26: TImage;
    Image27: TImage;
    Image28: TImage;
    Image29: TImage;
    Image30: TImage;
    Image31: TImage;
    Image32: TImage;
    Image33: TImage;
    Image34: TImage;
    Image35: TImage;
    Image36: TImage;
    Image37: TImage;
    Image38: TImage;
    Image39: TImage;
    Image40: TImage;
    Image41: TImage;
    Image42: TImage;
    Image43: TImage;
    Image44: TImage;
    Image45: TImage;
    Image46: TImage;
    img9: TImage;
    shp2: TShape;
    shp4: TShape;
    AdvGlowButton23: TAdvGlowButton;
    AdvGlowButton24: TAdvGlowButton;
    AdvGlowButton25: TAdvGlowButton;
    AdvGlowButton26: TAdvGlowButton;
    AdvGlowButton27: TAdvGlowButton;
    AdvGlowButton28: TAdvGlowButton;
    AdvGlowButton29: TAdvGlowButton;
    AdvGlowButton30: TAdvGlowButton;
    AdvGlowButton31: TAdvGlowButton;
    AdvGlowButton32: TAdvGlowButton;
    AdvGlowButton33: TAdvGlowButton;
    AdvGlowButton34: TAdvGlowButton;
    AdvGlowButton35: TAdvGlowButton;
    AdvGlowButton36: TAdvGlowButton;
    AdvGlowButton37: TAdvGlowButton;
    btn1: TAdvGlowButton;
    AdvGlowButton38: TAdvGlowButton;
    AdvGlowButton39: TAdvGlowButton;
    btn2: TAdvGlowButton;
    btn3: TAdvGlowButton;
    btn4: TAdvGlowButton;
    btn5: TAdvGlowButton;
    btn6: TAdvGlowButton;
    AdvGlowButton40: TAdvGlowButton;
    btn7: TAdvGlowButton;
    btn8: TAdvGlowButton;
    AdvGlowButton41: TAdvGlowButton;
    AdvGlowButton42: TAdvGlowButton;
    AdvGlowButton17: TAdvGlowButton;
    AdvGlowButton13: TAdvGlowButton;
    AdvGlowButton12: TAdvGlowButton;
    AdvGlowButton11: TAdvGlowButton;
    AdvGlowButton14: TAdvGlowButton;
    AdvGlowButton18: TAdvGlowButton;
    AdvGlowButton22: TAdvGlowButton;
    btn10: TAdvGlowButton;
    AdvGlowButton52: TAdvGlowButton;
    AdvGlowButton2: TAdvGlowButton;
    AdvGlowButton3: TAdvGlowButton;
    IdFTP1: TIdFTP;
    SaveDialog1: TSaveDialog;
    procedure RzButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lsv_MainDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lsv_MainDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure lsv_MainMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuItem1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lsv_MainDblClick(Sender: TObject);
    procedure AdvGlowButton44Click(Sender: TObject);
    procedure AdvGlowButton45Click(Sender: TObject);
    procedure AdvGlowButton46Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure AdvGlowButton52Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure AdvGlowButton48Click(Sender: TObject);
    procedure AdvGlowButton51Click(Sender: TObject);
    procedure AdvGlowButton50Click(Sender: TObject);
    procedure AdvGlowButton47Click(Sender: TObject);
    procedure AdvGlowButton49Click(Sender: TObject);
    procedure AdvGlowButton43Click(Sender: TObject);
    procedure lsv_MainMouseEnter(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnPersonClick(Sender: TObject);
    procedure btnQuickClick(Sender: TObject);
    procedure timer2Timer(Sender: TObject);
    procedure Switch_02Click(Sender: TObject);
    procedure Switch_01Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure AdvGlowButton2Click(Sender: TObject);
  private
    i:Integer;

    fid,img_index,dockflag:integer;
    tp:array[1..2] of TAdvOfficePage;



    procedure CreateForm(const FormClassName, FormName : string);  //��������


    procedure proc_openform(mstr:string;pid:integer;form_name:string); //�򿪴���
   // procedure proc_pub_open(form_id:integer);
    procedure proc_pub_open(itemname:string);
    procedure Proc_UpdateUserRight;
  public
       //Ȩ���б�
      FormRightList:TList<Integer>;
      procedure proc_closeform(i:integer);    //�رմ���
  end;

var
  FrmMain: TFrmMain;




implementation                                                 //ftpӦ�õ�Ԫ
    uses undata, UnMes_AlertedParamter, UnMes_AlteredDispose, IdFTPList,
         IdFTPCommon,IdAllFTPListParsers;
{$R *.dfm}
//procedure Tfrmmain.proc_pub_open(form_id:integer);
procedure Tfrmmain.proc_pub_open(itemname:string);
begin
    // fid:=form_id;
    // showmessage(inttostr(fid));

    with adq do
     begin
      close;
      //  SELECT *  FROM [OusentApp].[dbo].[sys_form_mk]

      sql.text:='SELECT *  FROM sys_form_mk  where mkname='''+itemname+'''';
  //    showmessage(sql.text);
      open;
      if recordcount=0 then
        showmessage('�ù���ģ�鲻���ڻ��Ѿ���')
      else
      begin
        fid:=fieldbyname('mkid_tag').asinteger;
        dockflag:=fieldbyname('dockflag').asinteger;
       // dm_DaTa.Tag:=fid;
        proc_openform(trim(fieldbyname('mkname').asstring),fid,fieldbyname('mkcaption').AsString);
      end;
    end;
 end;
procedure Tfrmmain.proc_openform(mstr:string;pid:integer;form_name:string);
var
 str:string;
begin
   if dockflag=0 then
   begin
       str:=RightStr(form_name,length(trim(form_name))-1);
      // SHOWMESSAGE(str);
      // showmessage(Str);
       CreateForm(form_name,str);
     exit;
   end;


   if data_pg.locate('fid',pid,[]) then
     begin
      //   RzPageControl1.ActivePage:=tp[fid];
       AdvOfficePage.ActivePage:=tp[fid];

      end
    else
     begin

      data_pg.append;
      data_pg.fieldbyname('fid').asinteger:=fid;
      data_pg.post;

     //tp[fid]:=TbsSkinTabSheet.Create(bsPageControl);


     tp[fid]:=TAdvOfficePage.Create(application);

     AdvOfficePage.InsertControl(tp[fid]);
     tp[fid].AdvOfficePager:=AdvOfficePage;
     tp[fid].Align :=alclient;
     tp[fid].Caption:=mstr;

    //  img_index:=img_index+1;
    //  showmessage(inttostr(img_index));

     tp[fid].Parent:=AdvOfficePage;
     tp[fid].ImageIndex:=2;
   //   tp[fid].Color:=$0055B919;
      //$00FDF5EE;
     AdvOfficePage.ActivePage:= tp[fid];
     if fid=pid then
    begin
       //  createform(form_name);
    //  SHOWMESSAGE(form_name);
    //   str:=copy(form_name,2,(length(trim(form_name))));
      str:=RightStr(form_name,length(trim(form_name))-1);
      // SHOWMESSAGE(str);
      // showmessage(Str);
       CreateForm(form_name,str);
    end;
  end;
end;

procedure Tfrmmain.proc_closeform(i:integer);
begin
  //   close;
     with    data_pg  do
      begin
        if   data_pg.locate('fid',i,[]) then
            data_pg.Delete;
      end;
      AdvOfficePage.ActivePage.Free;
      //AdvOfficePage.ActivePage.dispo
    // freeAndNil(AdvOfficePage.ActivePage);
     AdvOfficePage.ActivePage:=advpage_navigate;

end;

procedure TFrmMain.Proc_UpdateUserRight;
begin
  lsv_Main.Items.Clear;
  //�����û�����Ȩ�� �������ڵ�
 // FormRightList;
  var I: Integer;    var FormId:string;
    FormId:='';
  for I:= 0 to FormRightList.Count-1 do
  begin
      if FormId='' then  FormId:=FormRightList.Items[i].ToString
       else
         FormId:=FormId+','+FormRightList.Items[i].ToString;
  end;

  var sql:string;
  sql:='select  * from  sys_form_mk   where id in ('+FormId+')';
  dm_DaTa.QuseryData(adq,sql);

  //��ӽڵ�
   var   Titem:Tlistitem;       //�˴�һ��ҪԤ������ʱ��¼�洢����.
  while not adq.Eof  do
   begin
     Titem:=lsv_Main.Items.add;

     Titem.Caption:=adq.FieldByName('mkname').asstring;
     Titem.ImageIndex:=adq.FieldByName('ImageIndex').asinteger;
     adq.next;

   end;

end;

procedure Tfrmmain.CreateForm(const FormClassName, FormName : string);
begin
  if Application.FindComponent(FormName)=nil then begin
  if GetClass(FormClassName) <> nil then
  with TForm(TComponentClass(FindClass(FormClassName)).Create(Application)) do
  begin
   Name := FormName;
   TForm(Application.FindComponent(FormName)).ManualDock(tp[fid],nil,alClient);

  Show;
  end
  else ShowMessage(Format( '��%sδע�� ',[FormClassName])); end
  else begin
 //  ShowMessage(Format( '����%s�Ѵ����� ',[FormName]));
   TForm(Application.FindComponent(FormName)).ManualDock(tp[fid],nil,alClient);

  TForm(Application.FindComponent(FormName)).Show;
  end;
end;
procedure TFrmMain.btnCloseClick(Sender: TObject);
begin
      close;
end;

procedure TFrmMain.btnPersonClick(Sender: TObject);
begin
    card_menu.ActiveCard:=CardPerson;
   //   card_menu.ActiveCardIndex:=0;
 //   card_menu.Refresh;
end;

procedure TFrmMain.btnQuickClick(Sender: TObject);
begin
    card_menu.ActiveCard:=CardQuick;
   // card_menu.ActiveCardIndex:=0;
end;

procedure TFrmMain.btnUserClick(Sender: TObject);
begin

   //  card_menu.Refresh;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Application.Terminate;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
   { str
     list:=TList<Integer>.Create;
     str:=dm_DaTa.ReadIni('Ȩ�޹���','ģ��ID');
      STR:=str.Split('|');  }
  // AdvOfficePage.ActivePageIndex:=0;
  // pg_Flow.TabEnabled:=False;

    data_pg.CreateDataSet;
    data_pg.open;
    pg_Flow.Visible:=False;
    pg_Flow.TabVisible:=False;


   Brush.Style :=bsClear;

   Tag:=0; //ʹ��Form��Tag��������־λ

end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin
    data_pg.EmptyDataSet;
    data_pg.Free;
end;

procedure TFrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key=27 then Close();//�ж��������ESC�����˳�����
end;

procedure TFrmMain.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   Tag:=1; //��λ

Canvas.MoveTo(X,Y); //��Pen��λ���Ƶ���ǰ

//ȡ�����

Randomize;

Canvas.Pen.Width := Random(30);//���û��ʵĿ��

Canvas.Pen.Color :=RGB(Random(255),Random(255),Random(255));//���û��ʵ���ɫ
end;

procedure TFrmMain.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 Tag:=1; //��λ

Canvas.MoveTo(X,Y); //��Pen��λ���Ƶ���ǰ

//ȡ�����

Randomize;

Canvas.Pen.Width := Random(30);//���û��ʵĿ��

Canvas.Pen.Color :=RGB(Random(255),Random(255),Random(255));//���û��ʵ���ɫ

end;

procedure TFrmMain.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 Tag:=0; //��־λ
end;

procedure TFrmMain.FormResize(Sender: TObject);
begin
  pnl_begin.Visible:=false;
end;

procedure TFrmMain.FormShow(Sender: TObject);
var
  I,J: Integer;
  S: string;
  A: TArray<string>;
  list:TList<string>;
  list2:TList<STRING>;

begin
   lbl_User.Caption:=dm_DaTa.UserCode+':'+dm_DaTa.UserName;
   if dm_DaTa.UserCode<>'SYSTEM' then
     Proc_UpdateUserRight;


 { list:=TList<string>.Create;
  list2:=TList<string>.Create;
  S := dm_data.ReadIni('Ȩ�޹���','ģ��ID');
  A := S.Split(['|']);
  list.AddRange(A);

  for I := 0 to lsv_Main.Items.Count-1 do
   begin
       J:=I+1;
       if list.Contains(IntToStr(J)) then
        begin
          list2.Add(lsv_Main.Items[I].Caption);
            end
         else
         Continue ;


   end;

    for i:=lsv_Main.Items.Count-1 downto 0 Do
     if  List2.Contains(lsv_Main.Items[i].Caption) then  Continue
     else
        lsv_Main.Items.Item[i].Delete(); //ɾ����ǰѡ����

    lsv_main.IconOptions.AutoArrange:=not lsv_main.IconOptions.AutoArrange;
      MenuItem1.Checked :=not    MenuItem1.Checked ;   }
end;

procedure TFrmMain.MenuItem1Click(Sender: TObject);
begin
      lsv_main.IconOptions.AutoArrange:=not lsv_main.IconOptions.AutoArrange;
      MenuItem1.Checked :=not    MenuItem1.Checked ;
end;

procedure TFrmMain.RzButton1Click(Sender: TObject);
begin
   pnl_begin.Visible:= not pnl_begin.Visible;
   pnl_begin.Left:=0;
 //  showmessage(inttostr(frmmain.Height));
   pnl_begin.Top:=frmmain.Height-pnl_begin.Height-pnl_bottom.height-37;
  // panel1.ClientOrigin.IsZero:=true;
 //  Panel1.Parent:=RzButton1;
end;

procedure TFrmMain.Switch_01Click(Sender: TObject);
begin
  // if Switch_02.State=tssOn then
       timer2.Enabled:=True;

end;

procedure TFrmMain.Switch_02Click(Sender: TObject);
var
   flag:Boolean;
begin
  if Switch_02.State=tssOn then
       flag:=True
   else
       flag:=False;

    pg_Flow.visible:=flag;
    pg_Flow.TabVisible:=flag;
    if pg_Flow.Visible=false then
     AdvOfficePage.ActivePageIndex:=0
     else
     AdvOfficePage.ActivePage:=pg_Flow;

end;

procedure TFrmMain.AdvGlowButton2Click(Sender: TObject);
var
   DownFileName ,FileName,FilePath:string;

  tr : Tstrings;
  str:TArray<String>;
begin
    tr := TStringlist.Create;
   DownFileName:='OusentApp.exe';
   if uFtpServer.FtpConnect(IdFTP1,'10.1.2.248','21','zjg','123') then
     begin
         IdFTP1.RetrieveCurrentDir;
         IdFTP1.ChangeDir('ee'); //���뵽ftp��Ŀ¼
         IdFTP1.ChangeDir('2019');

          IdFTP1.List(tr); //�õ�FTPĿ¼�������ļ��б�   ���벻���ٵ� ���������ʧ��
          //
       //      Memo1.Lines.Assign(tr);

            tr.Free;
         // SaveDialog1.FileName:=DownFileName;
        if SaveDialog1.Execute then
         begin

            FileName:=ExtractFileName(SaveDialog1.FileName);
            FilePath:=ExtractFilePath(SaveDialog1.FileName);
           // SaveDialog1.FileName:=FilePath+DownFileName;
            //����
            if uFtpServer.FtpFileExists(IdFTP1,DownFileName) then
            begin
              //  showmessage(
               if   uFtpServer.FtpDownLoad(IdFTP1,DownFileName,FilePath,FileName) then
                  showmessage('���سɹ�')
                 else
                  showmessage('����ʧ��');
            end;


         end;

     end;
end;

procedure TFrmMain.AdvGlowButton43Click(Sender: TObject);
begin
  ShellExecute(Handle,'open', PChar('AMsger.exe'),nil, nil,SW_SHOW);
end;

procedure TFrmMain.AdvGlowButton44Click(Sender: TObject);
begin
    ShellExecute(Self.Handle, 'open', 'Explorer.exe', '::{20D04FE0-3AEA-1069-A2D8-08002B30309D}',nil,  1);
end;

procedure TFrmMain.AdvGlowButton45Click(Sender: TObject);
begin
 winexec('calc.exe',1);
end;

procedure TFrmMain.AdvGlowButton46Click(Sender: TObject);
begin
   PostMessage(HWND_BROADCAST,WM_SYSCOMMAND,SC_MINIMIZE,0);
end;

procedure TFrmMain.AdvGlowButton47Click(Sender: TObject);
begin
     ShellExecute(Handle,'open', PChar('Foxmail'),nil, nil,SW_SHOW);

    //   WinExec('foxmail.exe',1);
end;

procedure TFrmMain.AdvGlowButton48Click(Sender: TObject);
begin
      WinExec('mspaint.exe',1);
end;

procedure TFrmMain.AdvGlowButton49Click(Sender: TObject);
begin
  ShellExecute(handle, 'open', 'http://www.baidu.com', nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmMain.AdvGlowButton50Click(Sender: TObject);
begin
//  ShellExecute(Handle,'open', PChar('excel.exe'),nil, nil,SW_SHOW);
 ShellExecute(handle, 'open','c:\1.XLS','�ִ�����',nil, SW_SHOWNORMAL);
  //     WinExec('excel.exe',1);
end;

procedure TFrmMain.AdvGlowButton51Click(Sender: TObject);
begin
  ShellExecute(Handle,'open', PChar('winword.exe'),nil, nil,SW_SHOW);
  //  WinExec('winword.exe',1);
end;

procedure TFrmMain.AdvGlowButton52Click(Sender: TObject);
begin
   FrmMes_AlteredDispose:=TFrmMes_AlteredDispose.Create(self);
   FrmMes_AlteredDispose.ShowModal;
end;

procedure TFrmMain.btn10Click(Sender: TObject);
begin
    FrmMes_AlertedParater:=tFrmMes_AlertedParater.Create(self);
    FrmMes_AlertedParater.ShowModal;
end;

procedure TFrmMain.btn9Click(Sender: TObject);
begin
  WinExec('notepad.exe',1);
end;

procedure TFrmMain.Timer1Timer(Sender: TObject);
begin
  lbl_time.Caption:=formatdatetime('hh:nn:ss',now);
  lbl_date.Caption:=formatdatetime('yyyy-mm-dd',now);
end;

procedure TFrmMain.timer2Timer(Sender: TObject);
var
   flag:Boolean;
begin
  if Switch_01.State=tssOn then
       flag:=True
   else
       flag:=False;
 if flag=true then
 begin

    SetWindowPos(FrmMain.Handle,HWND_BOTTOM,
  0,
 0,
  FrmMain.Width ,
  FrmMain.HEIGHT,
  SWP_SHOWWINDOW);

 end
 else
  begin
     SetWindowPos(FrmMain.Handle,HWND_NOTOPMOST,
  0,
 0,
  FrmMain.Width ,
  FrmMain.HEIGHT,
  SWP_SHOWWINDOW);
  end;
  if flag=False then

  timer2.Enabled:=False;
end;

procedure TFrmMain.lsv_MainDblClick(Sender: TObject);
begin
    if lsv_Main.Selected<>nil then
          proc_pub_open(lsv_Main.Selected.Caption);
end;

procedure TFrmMain.lsv_MainDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  PosPoint:TPoint;
begin
  PosPoint.x:=x;
  PosPoint.y:=Y;
  (Source As TRzListView).Selected.SetPosition(PosPoint);
end;

procedure TFrmMain.lsv_MainDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
       Accept:=Source is TRzListView;
end;

procedure TFrmMain.lsv_MainMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if button=mbleft then
  begin
    with sender as TRzListView do
    begin
      if GetItemAt(x,y)<>nil then
        begindrag(false);
    end;
  end;
end;

procedure TFrmMain.lsv_MainMouseEnter(Sender: TObject);
begin
        pnl_begin.Visible:=false;
end;

end.
