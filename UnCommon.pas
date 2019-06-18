unit UnCommon;

interface
   uses IdFTP,System.Classes,System.Generics.Collections,IdFTPList, IdFTPCommon,System.SysUtils, Data.Win.ADODB,
        Vcl.ComCtrls;

     //连接FTP服务器
   function FtpDirectoryExists(IdFtp:TIdFtp;ADir:string):Boolean;
   procedure MakeTree(Query: TAdoQuery;TreeView:TTreeView;KeyId,ParentId,Name:string);
implementation

     //判断当面工作目录下的子目录是否存在
function FtpDirectoryExists(IdFtp:TIdFtp;ADir:string):Boolean;
begin

end;
procedure MakeTree(Query: TAdoQuery;TreeView:TTreeView;KeyId,ParentId,Name:string);
var
   List: TStringList ;
   Node:TTreeNode;
   Index:Integer;
begin
  TreeView.Items.BeginUpdate;
  try
    TreeView.Items.Clear;

    List := TStringList.Create;
    try
      List.Sorted := True;
      while not Query.Eof do
      begin
        if Query.FieldByName(ParentId).AsInteger = 0 then    { ParentID=0，顶层节点 }
        begin
          Node := TreeView.Items.AddChild(nil,
            Query.FieldByName(Name).AsString);

          Node.ImageIndex:=0;
        end
        else
        begin
          Index := List.IndexOf(Query.FieldByName(ParentID).AsString);
          Node := TreeView.Items.AddChild(TTreeNode(List.Objects[Index]),
            Query.FieldByName(Name).AsString);
             Node.ImageIndex:=Node.Level;
          //if Node.ImageIndex:=TreeView.get then

        end;
        List.AddObject(Query.FieldByName(KeyId).AsString, Node);
        Query.Next;
      end;
    finally
      List.Free;
    end;
  finally
    TreeView.Items.EndUpdate;
  end;
end;
end.
