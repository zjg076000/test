inherited FrmOverTime_CopyData: TFrmOverTime_CopyData
  Caption = 'FrmOverTime_CopyData'
  ClientHeight = 383
  ClientWidth = 528
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'Tahoma'
  ExplicitWidth = 544
  ExplicitHeight = 421
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Width = 528
    ExplicitWidth = 463
    object RzDBLabel1: TRzDBLabel
      Left = 82
      Top = 11
      Width = 113
      Height = 17
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
  end
  inherited RzPanel4: TRzPanel
    Top = 342
    Width = 528
    ExplicitTop = 342
    ExplicitWidth = 463
    inherited btnSaveAdd: TSpeedButton
      Left = 284
      Width = 105
      Caption = #25209#37327#22797#21046#25968#25454
      ExplicitLeft = 284
      ExplicitWidth = 105
    end
    inherited btnSave: TSpeedButton
      Left = 144
      Visible = False
      ExplicitLeft = 144
    end
    inherited btnCancel: TSpeedButton
      Left = 395
      Top = 5
      ExplicitLeft = 395
      ExplicitTop = 5
    end
  end
  inherited RzPanel2: TRzPanel
    Width = 528
    Height = 308
    ExplicitTop = 35
    ExplicitWidth = 546
    ExplicitHeight = 308
    object Label21: TLabel
      Left = 168
      Top = 13
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
    object lbl_Person: TRzLabel
      Left = 230
      Top = 11
      Width = 110
      Height = 14
      AutoSize = False
      Caption = 'lbl_Person'
      BorderInner = fsFlat
      BorderSides = [sdBottom]
    end
    object Label31: TLabel
      Left = 167
      Top = 43
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
    object Label1: TLabel
      Left = 168
      Top = 126
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
    object Label28: TLabel
      Left = 168
      Top = 169
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
      Left = 171
      Top = 209
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
      Left = 171
      Top = 243
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
      Left = 168
      Top = 278
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
    object RzPanel3: TRzPanel
      Left = 6
      Top = 6
      Width = 147
      Height = 296
      BorderOuter = fsFlat
      TabOrder = 0
      object ListBox1: TListBox
        Left = 1
        Top = 1
        Width = 145
        Height = 294
        Align = alClient
        BorderStyle = bsNone
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object DBEdit2: TDBEdit
      Left = 226
      Top = 40
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
      TabOrder = 1
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 226
      Top = 124
      Width = 139
      Height = 19
      BevelEdges = [beBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      BevelKind = bkFlat
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 228
      Top = 168
      Width = 136
      Height = 21
      BevelEdges = [beBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'BeginTime'
      DynProps = <>
      EditButtons = <>
      TabOrder = 3
      Visible = True
      EditFormat = 'yyyy-mm-dd hh:nn'
    end
    object DBDateTimeEditEh2: TDBDateTimeEditEh
      Left = 228
      Top = 204
      Width = 136
      Height = 21
      BevelEdges = [beBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'EndTime'
      DynProps = <>
      EditButtons = <>
      TabOrder = 4
      Visible = True
      EditFormat = 'yyyy-mm-dd hh:nn'
    end
    object DBEdit12: TDBEdit
      Left = 226
      Top = 239
      Width = 140
      Height = 18
      AutoSize = False
      BevelEdges = [beBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      Ctl3D = True
      DataField = 'HourTime'
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      ParentCtl3D = False
      TabOrder = 5
    end
    object DBDateTimeEditEh3: TDBDateTimeEditEh
      Left = 230
      Top = 274
      Width = 134
      Height = 21
      BevelEdges = [beBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      DataField = 'LeaveDate'
      DynProps = <>
      EditButtons = <>
      TabOrder = 6
      Visible = True
      EditFormat = 'yyyy-mm-dd '
    end
  end
  inherited adt: TADODataSet
    Active = False
    CommandText = ' select top 1  *  from  Hrm_OverTime'
  end
end
