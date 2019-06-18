unit uFtpServer;

interface
 uses IdFTP,System.Classes,System.Generics.Collections,IdFTPList, IdFTPCommon,System.SysUtils;

//��� Delphi indy�ؼ� FTP��ȡĿ¼ʱIdFTP1.DirectoryListing.count=0  ֻ��Uses IdFTPListParseWindowsNT,IdAllFTPListParsers ��������Ԫ�Ϳ�����


//�жϵ��湤��Ŀ¼�µ���Ŀ¼�Ƿ����
function FtpDirectoryExists(IdFtp:TIdFtp;ADir:string):Boolean;
//�ж�File�Ƿ��ڵ���Ŀ¼���ļ��Ƿ����
function FtpFileExists(IdFtp:TIdFtp;AFile:string):Boolean;

//��������
function FtpConnect(IdFtp:TIdFtp;AServer,APort,AUserName,APassWord:string):Boolean;

//�ϴ��ļ�
function  FtpUploadFile(IdFtp:TIdFTP;SourceFile,NewFileName:string):boolean;

//�����ļ�
function FtpDownLoad(IdFtp:TIdFTP;SourceFileName,newFilePath,NewFileName:string):Boolean;


implementation

//�ж�Directory�Ƿ���ڣ�Ҫ�������� Ftp Server)
function FtpDirectoryExists(IdFtp:TIdFtp;ADir:string):Boolean;
begin
   Result:=True;
   try
     IdFtp.ChangeDir(ADir);
   except
     Result:=False;
   end;
end;

//�ж�File�Ƿ����
function FtpFileExists(IdFtp:TIdFtp;AFile:string):Boolean;
var
  tt :TIdFTPListItems;
  t : TIdFTPListItem;
  i : integer;
  tfname : String;
begin
   // IdFTP.ChangeDir(CurrentDir);
  IdFTP.TransferType := ftBinary; //ָ��Ϊ�������ļ�  ���ı��ļ�ftASCII
  for i:=0 to IdFTP.DirectoryListing.Count-1 do
  begin
    tt := IdFTP.DirectoryListing; //�õ���ǰĿ¼���ļ���Ŀ¼�б�
    t := tt.Items[i]; //�õ�һ���ļ������Ϣ
    tfname := t.FileName;
    if IdFTP.DirectoryListing.Items[i].ItemType = ditFile then //������ļ�
    begin
         if tfname=AFile then
          begin
            Result:=True ;
            exit;
          end
         else
            Result:=False;
    end;
  end;
 end;

//��������
function FtpConnect(IdFtp:TIdFtp;AServer,APort,AUserName,APassWord:string):Boolean;
begin

     Result:=false;
    IdFtp.Username:=AUserName;
    IdFtp.Password:=APassWord;
    IdFtp.host:=AServer;
    IdFtp.Port:=strtoint(APort);
  //  IdFtp.Port:=strtoint(APort);
   try
      if IdFtp.Connected then  IdFtp.Disconnect;

      IdFtp.Connect;
      Result:=True;
   except

     Result:=false;
    // IdFtp.Free;
   end;

end;

function  FtpUploadFile(IdFtp:TIdFTP;SourceFile,NewFileName:string):boolean;
var

  EXT:string;

begin  //�ϴ�
   // aftp:=TIdFTP.Create;

    Result:=False;
   try
      EXT:=ExtractFileExt(SourceFile);
     NewFileName:=FormatDateTime('yyyymmdd',now)+FormatDateTime('hh',now)
                  +FormatDateTime('nn',now)+FormatDateTime('ss',now)+ext;

     IdFtp.TransferType := ftBinary;
     //����һЩ�����ڴ���Ŀ¼    �ļ����������ڼ�ʱ�����
     IdFtp.Put(SourceFile,  NewFileName);
     Result:=True;
   except
     Result:=True;

   end;
end;

function FtpDownLoad(IdFtp:TIdFTP;SourceFileName,newFilePath,NewFileName:string):Boolean;
var
  tt :TIdFTPListItems;
  t : TIdFTPListItem;
  i : integer;
  tfname : String;
begin  //����
  Result:=false;
  //IdFTP1.DirectoryListing.Items[0].FileName;
  IdFTP.TransferType := ftBinary; //ָ��Ϊ�������ļ�  ���ı��ļ�ftASCII
  for i:=0 to IdFTP.DirectoryListing.Count-1 do
  begin
    tt := IdFTP.DirectoryListing; //�õ���ǰĿ¼���ļ���Ŀ¼�б�
    t := tt.Items[i]; //�õ�һ���ļ������Ϣ

    tfname := t.FileName;
  //  showmessage(t.OwnerName+'  '+t.GroupName+'  '+t.FileName+'   '+t.LinkedItemName);
    if IdFTP.DirectoryListing.Items[i].ItemType = ditFile then //������ļ�
    begin
     if tfname=SourceFileName then
      begin
       IdFTP.Get(SourceFileName,newFilePath+NewFileName,false,True); //���ص����أ���Ϊ���ǣ���֧�ֶϵ�����
       Result:=True;
       Exit;                 //���غ��˳�
      end


    end;
  end;


end;





end.
