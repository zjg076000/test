inherited frmPositive: TfrmPositive
  Caption = #21592#24037#36716#27491
  ClientHeight = 333
  ClientWidth = 468
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'Tahoma'
  ExplicitTop = -58
  ExplicitWidth = 484
  ExplicitHeight = 371
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Width = 468
    ExplicitWidth = 468
    object RzPanel3: TRzPanel
      Left = 0
      Top = 0
      Width = 468
      Height = 34
      Align = alTop
      Alignment = taLeftJustify
      AlignmentVertical = avTop
      BorderOuter = fsNone
      BorderSides = []
      BorderColor = clWhite
      BorderShadow = clWhite
      TabOrder = 0
      object Label1: TLabel
        Left = 33
        Top = 8
        Width = 48
        Height = 13
        Caption = #21592#24037#22995#21517
      end
      object RzDBLabel1: TRzDBLabel
        Left = 97
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
        DataField = 'PName'
        DataSource = frmPerson.dso
      end
    end
  end
  inherited RzPanel4: TRzPanel
    Top = 292
    Width = 468
    ExplicitTop = 292
    ExplicitWidth = 468
    inherited btnSaveAdd: TSpeedButton
      Left = 192
      Top = 11
      Visible = False
      ExplicitLeft = 192
      ExplicitTop = 11
    end
    inherited btnSave: TSpeedButton
      Left = 275
      Top = 11
      ExplicitLeft = 275
      ExplicitTop = 11
    end
    inherited btnCancel: TSpeedButton
      Left = 359
      Top = 11
      ExplicitLeft = 359
      ExplicitTop = 11
    end
  end
  inherited RzPanel2: TRzPanel
    Width = 468
    Height = 258
    ExplicitWidth = 468
    ExplicitHeight = 258
    object RzPanel5: TRzPanel
      Left = 0
      Top = 1
      Width = 468
      Height = 256
      Align = alClient
      BorderOuter = fsFlat
      BorderSides = []
      TabOrder = 0
      object Label31: TLabel
        Left = 33
        Top = 17
        Width = 48
        Height = 12
        Caption = #36716#27491#20107#30001
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 33
        Top = 99
        Width = 48
        Height = 12
        Caption = #39046#23548#24847#35265
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 33
        Top = 191
        Width = 48
        Height = 12
        Caption = #36716#27491#26085#26399
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 45
        Top = 154
        Width = 36
        Height = 12
        Caption = #23457#25209#20154
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 33
        Top = 226
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
      object DBEdit2: TDBEdit
        Left = 95
        Top = 14
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
        Left = 95
        Top = 187
        Width = 134
        Height = 21
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        DataField = 'PositiveDate'
        DataSource = dso
        DynProps = <>
        EditButtons = <>
        TabOrder = 3
        Visible = True
        EditFormat = ''
      end
      object dbedtLeaderCheck: TDBEdit
        Left = 95
        Top = 86
        Width = 290
        Height = 51
        AutoSize = False
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        Ctl3D = True
        DataField = 'LeaderCheck'
        DataSource = dso
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentCtl3D = False
        TabOrder = 1
      end
      object DBDateTimeEditEh2: TDBDateTimeEditEh
        Left = 95
        Top = 222
        Width = 134
        Height = 21
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        DataField = 'OnDate'
        DataSource = dso
        DynProps = <>
        EditButtons = <>
        TabOrder = 4
        Visible = True
        EditFormat = ''
      end
      object dbedtAuditor: TDBEdit
        Left = 95
        Top = 151
        Width = 134
        Height = 18
        AutoSize = False
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        Ctl3D = True
        DataField = 'Auditor'
        DataSource = dso
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentCtl3D = False
        TabOrder = 2
      end
    end
  end
  inherited adt: TADODataSet
    AfterScroll = adtAfterScroll
    CommandText = ' select top 1  *  from  [Hrm_Positive]'
  end
  object adq: TADOQuery
    Connection = dm_DaTa.adoconn
    Parameters = <>
    Left = 335
    Top = 232
  end
end
