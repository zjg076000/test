inherited FrmOverTime_AddEdit: TFrmOverTime_AddEdit
  Caption = 'FrmOverTime_AddEdit'
  ClientHeight = 391
  ClientWidth = 472
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'Tahoma'
  ExplicitWidth = 488
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Width = 472
    ExplicitWidth = 472
    object Label2: TLabel
      Left = 28
      Top = 12
      Width = 48
      Height = 12
      Caption = #35760#24405#21495'  '
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object RzDBLabel1: TRzDBLabel
      Left = 86
      Top = 11
      Width = 113
      Height = 17
      Alignment = taRightJustify
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      BorderInner = fsFlat
      BorderSides = [sdBottom]
      BorderWidth = 1
      DataField = 'OverTimeId'
      DataSource = dso
    end
  end
  inherited RzPanel4: TRzPanel
    Top = 350
    Width = 472
    ExplicitTop = 350
    ExplicitWidth = 472
    inherited btnSaveAdd: TSpeedButton
      Left = 120
      ExplicitLeft = 120
    end
    inherited btnSave: TSpeedButton
      Left = 203
      ExplicitLeft = 203
    end
    inherited btnCancel: TSpeedButton
      Left = 287
      ExplicitLeft = 287
    end
  end
  inherited RzPanel2: TRzPanel
    Width = 472
    Height = 316
    ExplicitWidth = 472
    ExplicitHeight = 316
    object Label21: TLabel
      Left = 29
      Top = 19
      Width = 42
      Height = 12
      Caption = #22995'   '#21517
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object btn_select: TSpeedButton
      Left = 210
      Top = 11
      Width = 20
      Height = 20
      Caption = #8595
      OnClick = btn_selectClick
    end
    object Label31: TLabel
      Left = 28
      Top = 49
      Width = 48
      Height = 12
      Caption = #21152#29677#20107#30001
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label28: TLabel
      Left = 29
      Top = 175
      Width = 48
      Height = 12
      Caption = #24320#22987#26102#38388
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 215
      Width = 48
      Height = 12
      Caption = #32467#26463#26102#38388
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label40: TLabel
      Left = 32
      Top = 249
      Width = 36
      Height = 12
      Caption = #23567#26102#25968
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object Label41: TLabel
      Left = 29
      Top = 284
      Width = 48
      Height = 12
      Caption = #30003#35831#26085#26399
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object lbl_Person: TRzLabel
      Left = 91
      Top = 17
      Width = 110
      Height = 14
      AutoSize = False
      Caption = 'lbl_Person'
      BorderInner = fsFlat
      BorderSides = [sdBottom]
    end
    object Label1: TLabel
      Left = 29
      Top = 132
      Width = 48
      Height = 12
      Caption = #21152#29677#31867#22411
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object DBEdit2: TDBEdit
      Left = 87
      Top = 46
      Width = 290
      Height = 66
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
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 89
      Top = 174
      Width = 136
      Height = 21
      BevelEdges = [beBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'BeginTime'
      DataSource = dso
      DynProps = <>
      EditButtons = <>
      TabOrder = 1
      Visible = True
      EditFormat = 'yyyy-mm-dd hh:nn'
    end
    object DBEdit12: TDBEdit
      Left = 87
      Top = 245
      Width = 140
      Height = 18
      AutoSize = False
      BevelEdges = [beBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = True
      DataField = 'HourTime'
      DataSource = dso
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ParentCtl3D = False
      TabOrder = 2
    end
    object DBDateTimeEditEh3: TDBDateTimeEditEh
      Left = 91
      Top = 280
      Width = 134
      Height = 21
      BevelEdges = [beBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'OvertimeDate'
      DataSource = dso
      DynProps = <>
      EditButtons = <>
      TabOrder = 3
      Visible = True
      EditFormat = 'yyyy-mm-dd '
    end
    object DBDateTimeEditEh2: TDBDateTimeEditEh
      Left = 89
      Top = 210
      Width = 136
      Height = 21
      BevelEdges = [beBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'EndTime'
      DataSource = dso
      DynProps = <>
      EditButtons = <>
      TabOrder = 4
      Visible = True
      EditFormat = 'yyyy-mm-dd hh:nn'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 87
      Top = 130
      Width = 139
      Height = 19
      BevelEdges = [beBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      Ctl3D = False
      DataField = 'OvertimeType'
      DataSource = dso
      KeyField = 'TypeId'
      ListField = 'Name'
      ListSource = dsoType
      ParentCtl3D = False
      TabOrder = 5
    end
  end
  object pnl_select: TPanel [3]
    Left = 255
    Top = 40
    Width = 185
    Height = 248
    Caption = 'pnl_select'
    TabOrder = 3
    Visible = False
    object RzPanel3: TRzPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 22
      Align = alTop
      BorderOuter = fsFlat
      TabOrder = 0
      object edt: TEdit
        Left = 1
        Top = 1
        Width = 181
        Height = 20
        Align = alClient
        BorderStyle = bsNone
        TabOrder = 0
        OnChange = edtChange
      end
    end
    object RzPanel5: TRzPanel
      Left = 1
      Top = 23
      Width = 183
      Height = 224
      Align = alClient
      BorderOuter = fsFlat
      BorderSides = [sdLeft, sdRight, sdBottom]
      TabOrder = 1
      object Grd: TDBGrid
        Left = 1
        Top = 0
        Width = 181
        Height = 223
        Align = alClient
        BorderStyle = bsNone
        DataSource = dso_person
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = GrdDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'PName'
            Title.Caption = #22995#21517
            Visible = True
          end>
      end
    end
  end
  inherited adt: TADODataSet
    AfterScroll = adtAfterScroll
    CommandText = 'select * from Hrm_OverTime'
  end
  object adt_person: TADODataSet
    Connection = dm_DaTa.adoconn
    CursorType = ctStatic
    CommandText = 'select * from Hrm_Person'
    Parameters = <>
    Left = 320
    Top = 296
  end
  object dso_person: TDataSource
    DataSet = adt_person
    Left = 408
    Top = 290
  end
  object adq: TADOQuery
    Connection = dm_DaTa.adoconn
    Parameters = <>
    Left = 343
    Top = 208
  end
  object adotype: TADODataSet
    Active = True
    Connection = dm_DaTa.adoconn
    CursorType = ctStatic
    CommandText = 'select *  from    Hrm_OvertimeType'
    Parameters = <>
    Left = 232
    Top = 200
  end
  object dsoType: TDataSource
    DataSet = adotype
    Left = 224
    Top = 248
  end
end
