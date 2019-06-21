unit UnData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB,DBGridEhImpExp,DBGridEh,Dialogs,vcl.forms,
  Controls,RzEdit,inifiles,windows, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client,DateUtils,Vcl.StdCtrls,MemTableEh,MemTableDataEh;

type
  Tdm_DaTa = class(TDataModule)
    adoconn: TADOConnection;
    FDMTbl_parameters: TFDMemTable;
    FDMTbl_parametersTbl_FieldName: TStringField;
    FDMTbl_parametersIsVisible: TBooleanField;
    FDMTbl_parametersTypeId: TIntegerField;
    FDMTbl_parametersTitleValue: TStringField;
    dso_Paramter: TDataSource;
    adocommand: TADOCommand;
    qry: TADOQuery;
    adoerp: TADOConnection;
    adoconn_old: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
     UserName,UserCode:string;
     FormTag:Integer;
     procedure DbGridEhToExcel(ADgEh: TDBGridEh);
     procedure GrdParamter(Grd: TDBGridEh);

     procedure proc_ActiveAdodataset(adT:tadoDATASET;strsql:string);
     procedure QuseryData(adq:tadoquery;strsql:string);

     Procedure Execsql(adq:tadoquery;strsql:string);

     procedure FilerData(str_IF,str_Table,str_Field: string; Adt: TADODataSet);
        //ͨ��id��ʾ����
    function getName(adq:Tadoquery;tbl_name:string;fid,fName:String;fid_value:string):string;

      //дIni�ļ�
     Procedure  Proc_WriteIni(SectionName:string;KeyName:string;KeyValue:string);
     //��ȡINI�ļ�
     Function   ReadIni(SectionName:string;KeyName:string):string;

     Function  Get_item_list(Query:TADOQuery;strsql,fdname:String;alist:TStrings):Boolean;


     //��������Ƶ���ʽ
      procedure SaveGridEhStyle(Grd:TDBGridEh;FormChinaDesc:string);
    //�ָ������Ƶ���ʽ
      procedure RestoreGridEhStyle(Grd:TDBGridEh;FormChinaDesc:string);

      //�ڴ��ȫѡ
      procedure  MemDataIsSelect(chk:tCheckBox;mte:TMemTableEh);

      //��Ϣ��
      function FunMsg(Msg,Title:string):Boolean;

      //����ִ��SQL���
      procedure Proc_BatchExecuteSql(sql: string);
 end;

var
  dm_DaTa: Tdm_DaTa;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses UnLocate_ColumnParameter;

{$R *.dfm}


procedure Tdm_DaTa.Proc_BatchExecuteSql(sql: string);
var
  adoconn:Tadoconnection;
  adocommand:tadocommand;
begin
 try
  adoconn := TADOConnection.Create(self);
  adoconn.ConnectionString := dm_Data.adoconn.ConnectionString;
  adoconn.LoginPrompt := False;
  adoconn.Connected := True;
  adoconn.BeginTrans;
  adocommand := TADOCommand.Create(self);
  adocommand.Connection := adoconn;
  adocommand.CommandText := sql;
  adocommand.Execute;
  adoconn.CommitTrans;
  FreeAndNil(adoconn);
  FreeAndNil(adocommand);
 except
  adoconn.RollbackTrans



 end;
end;


procedure Tdm_DaTa.GrdParamter(Grd: TDBGridEh);
var
  i: INTEGER;
begin
  dm_data.FDMTbl_parameters.EmptyDataSet;

  for i := 0 to Grd.Columns.Count - 1 do
  begin
    dm_data.FDMTbl_parameters.Append;
    dm_data.FDMTbl_parameters.FieldByName('Tbl_FieldName').AsString :=
      Grd.Columns[i].FieldName;
    dm_data.FDMTbl_parameters.FieldByName('TitleValue').AsString :=
      Grd.Columns[i].Title.Caption;

    if Grd.Columns[i].Visible = true then

      dm_data.FDMTbl_parameters.FieldByName('IsVisible').AsBoolean := true
    else
      dm_data.FDMTbl_parameters.FieldByName('IsVisible').AsBoolean := false;
    dm_data.FDMTbl_parameters.Post;

  end;

  // FDMTbl_parameters.Close;
  // FDMTbl_parameters.Open;
    FrmLocate_ColumnParameter := TFrmLocate_ColumnParameter.Create(self);

  IF FrmLocate_ColumnParameter.ShowModal = 1 then
  begin
    if dm_data.FDMTbl_parameters.State = dsedit then
      dm_data.FDMTbl_parameters.Post;
    for i := 0 to Grd.Columns.Count - 1 do
    begin
      if dm_data.FDMTbl_parameters.Locate('Tbl_FieldName',
        Grd.Columns[i].FieldName, []) then
      begin
        if dm_data.FDMTbl_parameters.FieldByName('IsVisible').AsBoolean = true
        then
          Grd.Columns[i].Visible := true
        else
          Grd.Columns[i].Visible := false;
      end;

    end;
    Grd.Refresh;
  end;
end;
procedure Tdm_DaTa.MemDataIsSelect(chk: tCheckBox; mte: TMemTableEh);
begin
   if mte.RecordCount>50  then
   begin
     ShowMessage('һ�����ѡ��ļ�¼�����ܴ���50��');
     Exit;
   end;

     mte.First;
     var  i:Integer;
   if chk.Checked=True then
    begin

       for I := 1 to mte.RecordCount do

        begin
           mte.edit;
           mte.FieldByName('IsSelect').AsBoolean:=True;
           mte.Post;
           if i<mte.RecordCount then

           mte.Next;
        end;
    end;
      if chk.Checked=false then
    begin
        for I := 1 to mte.RecordCount do

        begin
           mte.edit;
           mte.FieldByName('IsSelect').AsBoolean:=False;
           mte.Post;
            if i<mte.RecordCount then
           mte.Next;
        end;
    end;
end;

procedure Tdm_DaTa.DataModuleCreate(Sender: TObject);
begin
    FDMTbl_parameters.Active:=true;
end;

procedure Tdm_data.DbGridEhToExcel(ADgEh: TDBGridEh);
var
  ExpClass: TDBGridEhExportclass;
  Ext: string;
  FSaveDialog:TSaveDialog;
begin
  try
    if ADgEh.DataSource.DataSet.IsEmpty then
    begin
     // showmessage(PChar('û�пɵ���������'));
      Application.MessageBox(PChar('û�пɵ���������'), PChar('��ʾ'), MB_OK +
       MB_ICONINFORMATION);
      exit;
    end;
    FSaveDialog := TSaveDialog.Create(Self);
    FSaveDialog.Filter :=
      'Excel �ĵ� (*.xls)|*.XLS|Text files (*.txt)|*.TXT|Comma separated values (*.csv)|*.CSV|HTML file (*.htm)|*.HTM|Word �ĵ� (*.rtf)|*.RTF';
    if FSaveDialog.Execute and (trim(FSaveDialog.FileName) <> '') then
    begin
      case FSaveDialog.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsXLS;
            Ext := 'xls';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsText;
            Ext := 'txt';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        5:
          begin
            ExpClass := TDBGridEhExportAsRTF;
            Ext := 'rtf';
          end;
      end;
      if ExpClass <> nil then
      begin
        if UpperCase(Copy(FSaveDialog.FileName, Length(FSaveDialog.FileName) -
          2, 3)) <> UpperCase(Ext) then
          FSaveDialog.FileName := FSaveDialog.FileName + '.' + Ext;
        if FileExists(FSaveDialog.FileName) then
        begin
          if application.MessageBox('�ļ����Ѵ��ڣ��Ƿ񸲸�   ', '��ʾ',
            MB_ICONASTERISK or MB_OKCANCEL) <> idok then
            exit;
        end;
        Screen.Cursor := crHourGlass;
        SaveDBGridEhToExportFile(ExpClass, ADgEh, FSaveDialog.FileName, true);
        Screen.Cursor := crDefault;
        MessageBox(application.Handle, '�����ɹ�  ', '��ʾ', MB_OK +
          MB_ICONINFORMATION);
      end;
    end;
    FSaveDialog.Destroy;
  except
    on e: exception do
    begin
      Application.MessageBox(PChar(e.message), '����', MB_OK + MB_ICONSTOP);
    end;
  end;
end;
 procedure Tdm_DaTa.Execsql(adq: tadoquery; strsql: string);
begin
   with adq do
   begin
     close;
     sql.Text:=strsql;
     execsql;
   end;
end;

procedure Tdm_DaTa.FilerData(str_IF,str_Table,str_Field: string; Adt: TADODataSet);
 begin
  str_IF:='%'+str_IF+'%';
  with Adt do
  begin
     Close;
     commandtext:='select * from '+str_Table+' where '+str_Field+' like '''+str_IF+'''';
     Open;
  end;
end;

function Tdm_DaTa.FunMsg(Msg, Title:string): Boolean;
begin
    if Application.MessageBox(PWideChar(Msg), PWideChar(Title), MB_OKCANCEL) = IDOK then
      Result:=True;
end;

procedure Tdm_data.QuseryData(adq:tadoquery;strsql:string);
 begin
       with adq do
        begin
          close;
          sql.Text:=strsql;
          open;
        end;
 end;

Function Tdm_data.ReadIni(SectionName:string;KeyName:string):string;
var
   myinifile:Tinifile;
   strfile:string;
begin
  strfile:=getcurrentdir+'\Config.ini';
   //��D�̵� 1.ini �ļ���
  myinifile:=Tinifile.create(strfile);
 // д��INI�ļ���
  Result:=myinifile.readstring(SectionName,KeyName,'');
  myinifile.Free;

end;

procedure Tdm_DaTa.RestoreGridEhStyle(Grd: TDBGridEh; FormChinaDesc: string);
var
  RestoreParams:TDBGridEhRestoreParams;
  fileName:string;
begin

   RestoreParams:=[grpColIndexEh, grpColWidthsEh, grpSortMarkerEh,
    grpColVisibleEh, grpRowHeightEh, grpDropDownRowsEh, grpDropDownWidthEh];
   fileName:=GetCurrentDir+'\'+FormChinaDesc+'.ini' ;
   if FileExists(fileName) then
     Grd.RestoreGridLayoutIni(fileName,FormChinaDesc,RestoreParams);
end;

procedure Tdm_DaTa.SaveGridEhStyle(Grd: TDBGridEh; FormChinaDesc: string);
begin
   if Application.MessageBox('��ȷ��Ҫ���浱ǰ�ı�����ݵĸ�ʽ��','��ʾ',MB_OKCANCEL)=IDok   then
   begin
     //  DeleteFile(PWideChar()
       Grd.SaveGridLayoutIni(GetCurrentDir+'\'+FormChinaDesc+'.ini',FormChinaDesc,true);
   end;
end;

Procedure Tdm_Data.Proc_WriteIni(SectionName:string;KeyName:string;KeyValue:string);
var
   myinifile:Tinifile;
   strfile:string;
begin
  strfile:=getcurrentdir+'\Config.ini';
   //��D�̵� 1.ini �ļ���
  myinifile:=Tinifile.create(strfile);
  myinifile.writestring(SectionName,KeyName,KeyValue);
  myinifile.Free;



end;

procedure Tdm_data.proc_ActiveAdodataset(adT:tadoDATASET;strsql:string);
 begin
       with adT do
        begin
          close;
          commandText:=strsql;
          open;
        end;
 end;



//ͨ��id��ʾ����
function Tdm_data.getName(adq:Tadoquery;tbl_name:string;fid,fName:String;fid_value:string):string;
begin
   with adq  do
   begin
     close;
     sql.Text:='select top 1 * from '+tbl_name+' where '+fid+'='+fid_value;
     open;
     if recordcount>0 then
       result:=fieldbyname(fName).asstring;

   end;


end;


Function Tdm_data.Get_item_list(Query:TADOQuery;strsql,fdname:String;alist:TStrings):Boolean;
Begin
  alist.BeginUpdate;
  alist.Clear;
  Try
    Try
      With Query  Do
      Begin
        Try
          Close;
          Sql.Clear;
          SQL.Add(strsql);
          Open;
          While Not Eof Do
          Begin
            alist.Add(FieldByName(fdname).AsString);
            Next;
          End;
          Close;
        Finally
      //   exit;
         // Free;
        End;
      End;
    Except On E: Exception Do
      Begin
        Application.MessageBox(PChar(E.Message), 'msg', 64);
      End;
    End;
  Finally
    alist.EndUpdate;
  End;
End;



end.
