object dm_DaTa: Tdm_DaTa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 394
  Width = 600
  object adoconn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=OST@2018;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=OusentApp;Data Source=10.1.2.252;Use' +
      ' Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Wo' +
      'rkstation ID=IT01;Use Encryption for Data=False;Tag with column ' +
      'collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 288
    Top = 168
  end
  object FDMTbl_parameters: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'Tbl_FieldName'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IsVisible'
        DataType = ftBoolean
      end
      item
        Name = 'TypeId'
        DataType = ftInteger
      end
      item
        Name = 'TitleValue'
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 308
    Top = 264
    object FDMTbl_parametersTbl_FieldName: TStringField
      DisplayWidth = 33
      FieldName = 'Tbl_FieldName'
      Size = 50
    end
    object FDMTbl_parametersIsVisible: TBooleanField
      DisplayWidth = 26
      FieldName = 'IsVisible'
    end
    object FDMTbl_parametersTypeId: TIntegerField
      DisplayWidth = 10
      FieldName = 'TypeId'
    end
    object FDMTbl_parametersTitleValue: TStringField
      DisplayWidth = 40
      FieldName = 'TitleValue'
      Size = 40
    end
  end
  object dso_Paramter: TDataSource
    DataSet = FDMTbl_parameters
    Left = 380
    Top = 264
  end
  object adocommand: TADOCommand
    Connection = adoconn
    Parameters = <>
    Left = 232
    Top = 264
  end
  object qry: TADOQuery
    Connection = adoconn
    Parameters = <>
    Left = 368
    Top = 176
  end
  object adoerp: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=OST@2018;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=OSTYFA01;Data Source=10.1.2.252;Use ' +
      'Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Wor' +
      'kstation ID=IT01;Use Encryption for Data=False;Tag with column c' +
      'ollation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 137
    Top = 176
  end
  object adoconn_old: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=ousent;Persist Security Info=True;U' +
      'ser ID=sa;Initial Catalog=Ousent_ATS;Data Source=10.1.2.175;Use ' +
      'Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Wor' +
      'kstation ID=IT01;Use Encryption for Data=False;Tag with column c' +
      'ollation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 169
    Top = 72
  end
end
