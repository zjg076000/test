
{*******************************************************}
{                                                       }
{       ����Tdbgrideh����                               }
{                                                       }
{       ��Ȩ����            }
{                                                       }
{*******************************************************}

unit uExport;

interface

uses
  DBGridEhImpExp, DBGridEh, SysUtils, Dialogs, ComObj, ActiveX, Variants, db,
  FormWait,Windows,Graphics;

procedure ExpDbgridEh(grid:TDBGridEh;OpenExcel:Boolean=True);
procedure ImpDbgridEH(Grid:TDBGridEh);

implementation

//==============================================================================
// ���ӽ�������ʾ by cxg 2008-01-05 10:08:09
//==============================================================================

procedure ImpDbgridEH(Grid:TDBGridEh);
var
  OpenDialog:TOpenDialog;
begin
  if (not Assigned(grid)) or (not grid.DataSource.DataSet.Active) then
    exit;
  OpenDialog:=TOpenDialog.create(nil);
  try
    OpenDialog.Filter:='�ı��ļ�|*.TXT';
    OpenDialog.FilterIndex:=1;
    if OpenDialog.Execute then
    begin
      ShowWaitText('���Ժ�');
      LoadDBGridEhFromImportFile(TDBGridEhImportAsText,
        Grid,OpenDialog.FileName,True);
    end;  
  finally
    OpenDialog.Free;
    ShowWaitText();
  end;   
end;  

procedure ExpDbgridEh(grid:TDBGridEh;OpenExcel:Boolean=True);
var
  ExpClass:TDBGridEhExportClass;
  Ext:String;
  SaveDialog:TSaveDialog;
  ExcelApp: Variant;
begin
  if (not Assigned(grid)) or (not grid.DataSource.DataSet.Active)
    or (grid.DataSource.DataSet.IsEmpty) then exit;
  SaveDialog:=TSaveDialog.Create(nil);
  try
    SaveDialog.FileName := '�ļ�1';
    SaveDialog.Filter:='EXCEL���ӱ��|*.XLS|HTML��ҳ|*.HTM|�ı��ļ�|*.TXT|CSV'
      +'|*.CSV|RTF���ı�|*.RTF';
    SaveDialog.FilterIndex:=1;
    if SaveDialog.Execute then
    begin
      ShowWaitText('���Ժ�');   
      try
        case SaveDialog.FilterIndex of
          1: begin ExpClass := TDBGridEhExportAsXLS; Ext := 'xls'; end;
          2: begin ExpClass := TDBGridEhExportAsHTML; Ext := 'htm'; end;
          3: begin ExpClass := TDBGridEhExportAsText; Ext := 'txt'; end;
          4: begin ExpClass := TDBGridEhExportAsCSV; Ext := 'csv'; end;
          5: begin ExpClass := TDBGridEhExportAsRTF; Ext := 'rtf'; end;
        else
          ExpClass := nil; Ext := '';
        end;
        if ExpClass <> nil then
        begin
          if UpperCase(Copy(SaveDialog.FileName,
            Length(SaveDialog.FileName)-2,3))<> UpperCase(Ext) then
            SaveDialog.FileName := SaveDialog.FileName + '.' + Ext;
          SaveDBGridEhToExportFile(ExpClass,grid,SaveDialog.FileName,true);

          if SaveDialog.FilterIndex=1 then
          begin
            if OpenExcel then
            begin
              ExcelApp := CreateOleObject( 'Excel.Application' );
              ExcelApp.visible := True;
              ExcelApp.workbooks.add;
              ExcelApp.WorkBooks.Open(SaveDialog.FileName);
              ExcelApp.ActiveSheet.PageSetup.PrintGridLines := True;
              //ExcelApp.ActiveSheet.PageSetup.CenterHeader := 'ӽ�Ϲ�����';
              ExcelApp.ActiveSheet.PageSetup.CenterFooter := '��&Pҳ';
              ExcelApp.ActiveSheet.Rows[1].Font.Name := '����';
              ExcelApp.ActiveSheet.Rows[1].Font.Color  := clBlue;
              //ExcelApp.ActiveSheet.Rows[1].Font.Bold   := True;
            end;
          end;
            //excel���д�1��ʼ����,DBGRIDEH���д�0��ʼ����
            //excel���п����ַ�Ϊ��λ,DBGRIDEH���п�ͬ
        end;
      finally
        ShowWaitText();
      end;
    end;
  finally
    FreeAndNil(SaveDialog);
  end;  
end;

end.