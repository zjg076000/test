inherited FrmAdjustPost: TFrmAdjustPost
  Caption = #23703#20301#35843#25972
  ClientHeight = 364
  ClientWidth = 476
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'Tahoma'
  ExplicitTop = -3
  ExplicitWidth = 492
  ExplicitHeight = 402
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Width = 476
    ExplicitWidth = 631
    object Label1: TLabel
      Left = 39
      Top = 9
      Width = 48
      Height = 13
      Caption = #21592#24037#22995#21517
    end
    object RzDBLabel2: TRzDBLabel
      Left = 101
      Top = 8
      Width = 121
      Height = 17
      BorderInner = fsFlat
      BorderSides = [sdBottom]
      FlyByEnabled = True
      DataField = 'PName'
      DataSource = frmPerson.dso
    end
  end
  inherited RzPanel4: TRzPanel
    Top = 323
    Width = 476
    ExplicitLeft = 8
    ExplicitTop = 339
    ExplicitWidth = 476
    inherited btnSaveAdd: TSpeedButton
      Left = 211
      Visible = False
      ExplicitLeft = 211
    end
    inherited btnSave: TSpeedButton
      Left = 294
      ExplicitLeft = 294
    end
    inherited btnCancel: TSpeedButton
      Left = 378
      ExplicitLeft = 378
    end
  end
  inherited RzPanel2: TRzPanel
    Width = 476
    Height = 289
    ExplicitWidth = 631
    ExplicitHeight = 265
    object RzPanel3: TRzPanel
      Left = 0
      Top = 1
      Width = 476
      Height = 287
      Align = alClient
      BorderOuter = fsFlat
      BorderSides = []
      TabOrder = 0
      ExplicitTop = 9
      object Label31: TLabel
        Left = 28
        Top = 93
        Width = 48
        Height = 13
        Caption = #35843#25972#20107#30001
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 29
        Top = 154
        Width = 48
        Height = 12
        Caption = #35843#32844#31867#22411
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 245
        Top = 154
        Width = 48
        Height = 12
        Caption = #35843#32844#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 29
        Top = 194
        Width = 60
        Height = 12
        Caption = #22791'   '#27880'   '
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 29
        Top = 260
        Width = 60
        Height = 12
        Caption = #21150#29702#26085#26399#65306
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object RzDBLabel1: TRzDBLabel
        Left = 88
        Top = 258
        Width = 193
        Height = 17
        BorderInner = fsFlat
        BorderSides = [sdBottom]
        FlyByEnabled = True
        DataField = 'OnDate'
        DataSource = dso
      end
      object Label6: TLabel
        Left = 248
        Top = 24
        Width = 36
        Height = 18
        Caption = #26032#37096#38376
      end
      object RzDBLabel4: TRzDBLabel
        Left = 94
        Top = 23
        Width = 121
        Height = 17
        BorderInner = fsFlat
        BorderSides = [sdBottom]
        FlyByEnabled = True
        DataField = 'DeptName'
        DataSource = frmPerson.dso
      end
      object Label7: TLabel
        Left = 39
        Top = 58
        Width = 36
        Height = 13
        Caption = #28304#23703#20301
      end
      object RzDBLabel5: TRzDBLabel
        Left = 94
        Top = 56
        Width = 121
        Height = 17
        BorderInner = fsFlat
        BorderSides = [sdBottom]
        FlyByEnabled = True
        DataField = 'Position'
        DataSource = frmPerson.dso
      end
      object Label8: TLabel
        Left = 33
        Top = 25
        Width = 48
        Height = 13
        Caption = #25152#23646#37096#38376
      end
      object Label2: TLabel
        Left = 248
        Top = 58
        Width = 36
        Height = 13
        Caption = #26032#23703#20301
      end
      object DBEdit2: TDBEdit
        Left = 95
        Top = 88
        Width = 322
        Height = 46
        AutoSize = False
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        Ctl3D = True
        DataField = 'Reason'
        DataSource = dso
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentCtl3D = False
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 87
        Top = 151
        Width = 138
        Height = 19
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'TypeId'
        DataSource = dso
        KeyField = 'TypeId'
        ListField = 'Name'
        ListSource = dsoType
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBEdit1: TDBEdit
        Left = 95
        Top = 195
        Width = 322
        Height = 40
        AutoSize = False
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        Ctl3D = True
        DataField = 'Note'
        DataSource = dso
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentCtl3D = False
        TabOrder = 3
      end
      object DBDateTimeEditEh1: TDBDateTimeEditEh
        Left = 303
        Top = 150
        Width = 114
        Height = 21
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        DataField = 'adjustDate'
        DataSource = dso
        DynProps = <>
        EditButtons = <>
        TabOrder = 2
        Visible = True
        EditFormat = ''
      end
      object RzDBEdit1: TRzDBEdit
        Left = 290
        Top = 54
        Width = 127
        Height = 21
        DataSource = dso
        DataField = 'newPosition'
        TabOrder = 4
      end
      object DBLookupComboBox2: TDBLookupComboBox
        Left = 295
        Top = 23
        Width = 123
        Height = 19
        BevelEdges = [beBottom]
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        Ctl3D = False
        DataField = 'NewDeptId'
        DataSource = dso
        KeyField = 'DeptId'
        ListField = 'DeptName'
        ListSource = dso_Dept
        ParentCtl3D = False
        TabOrder = 5
      end
    end
  end
  inherited dso: TDataSource
    Top = 0
  end
  inherited adt: TADODataSet
    Active = False
    CommandText = 'select * from Hrm_AdjustPost'
    Top = 0
  end
  object adttype: TADODataSet
    Active = True
    Connection = dm_DaTa.adoconn
    CursorType = ctStatic
    CommandText = ' select   *  from  Hrm_AdjustPostType'
    Parameters = <>
    Left = 373
    Top = 136
  end
  object dsoType: TDataSource
    DataSet = adttype
    Left = 424
    Top = 136
  end
  object adt_Dept: TADODataSet
    Active = True
    Connection = dm_DaTa.adoconn
    CursorType = ctStatic
    CommandText = 'select * from Hrm_Dept'
    Parameters = <>
    Left = 189
  end
  object dso_Dept: TDataSource
    DataSet = adt_Dept
    Left = 232
  end
  object qry: TADOQuery
    Connection = dm_DaTa.adoconn
    Parameters = <>
    Left = 176
    Top = 235
  end
end
