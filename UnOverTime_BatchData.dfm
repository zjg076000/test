inherited FrmOverTime_BatchData: TFrmOverTime_BatchData
  Caption = #25209#37327#22686#21152
  ClientHeight = 419
  ClientWidth = 528
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'Tahoma'
  ExplicitTop = -168
  ExplicitWidth = 544
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel [0]
    Left = 175
    Top = 51
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
  inherited RzPanel2: TRzPanel [1]
    Top = 22
    Width = 528
    Height = 362
    ExplicitTop = 22
    ExplicitWidth = 528
    ExplicitHeight = 362
    object lbl3: TLabel
      Left = 15
      Top = 14
      Width = 72
      Height = 12
      Caption = #36873#25321#21152#29677#21592#24037
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object RzPanel3: TRzPanel
      Left = 0
      Top = 1
      Width = 161
      Height = 360
      Align = alLeft
      BorderOuter = fsFlat
      BorderSides = [sdRight]
      TabOrder = 0
      object RzPanel6: TRzPanel
        Left = 0
        Top = 329
        Width = 160
        Height = 31
        Align = alBottom
        BorderOuter = fsFlat
        BorderSides = [sdTop]
        TabOrder = 0
        object SpeedButton1: TSpeedButton
          Left = 82
          Top = 3
          Width = 72
          Height = 23
          Caption = #28155#21152#21592#24037
          OnClick = SpeedButton1Click
        end
        object chk: TCheckBox
          Left = 7
          Top = 6
          Width = 69
          Height = 17
          Caption = #26174#31034#36873#21462
          TabOrder = 0
          OnClick = chkClick
        end
      end
      object edt_Name: TEdit
        Left = 0
        Top = 0
        Width = 160
        Height = 21
        Align = alTop
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 1
        OnChange = edt_NameChange
      end
      object RzPanel5: TRzPanel
        Left = 0
        Top = 21
        Width = 161
        Height = 308
        Align = alLeft
        BorderOuter = fsFlat
        BorderSides = [sdRight]
        TabOrder = 2
        object GRD: TDBGridEh
          Left = 0
          Top = 0
          Width = 160
          Height = 308
          Align = alClient
          AutoFitColWidths = True
          Border.EdgeBorders = []
          BorderStyle = bsNone
          Ctl3D = False
          DataSource = dso_Person
          DynProps = <>
          Flat = True
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 0
          OnDblClick = GRDDblClick
          Columns = <
            item
              Alignment = taCenter
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'IsSelect'
              Footers = <>
              Title.Caption = #26174#31034
              Width = 31
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'PName'
              Footers = <>
              Title.Caption = #22995#21517
              Width = 103
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object rzpnl1: TRzPanel
      Left = 161
      Top = 1
      Width = 367
      Height = 360
      Align = alClient
      BorderOuter = fsFlat
      BorderSides = []
      TabOrder = 1
      object Label4: TLabel
        Left = 6
        Top = 8
        Width = 48
        Height = 12
        Caption = #21152#29677#20154#21592
        Font.Charset = GB2312_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
      object Label31: TLabel
        Left = 6
        Top = 78
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
        Left = 12
        Top = 142
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
        Left = 12
        Top = 183
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
        Left = 15
        Top = 233
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
        Left = 15
        Top = 269
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
        Left = 16
        Top = 304
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
      object mmo_Personlist: TRzMemo
        Left = 71
        Top = 5
        Width = 276
        Height = 54
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 0
      end
      object mmo_rease: TRzMemo
        Left = 71
        Top = 74
        Width = 276
        Height = 54
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 1
      end
      object cbb_Type: TRzDBLookupComboBox
        Left = 71
        Top = 138
        Width = 165
        Height = 21
        BevelEdges = []
        BevelKind = bkFlat
        KeyField = 'TypeId'
        ListField = 'Name'
        ListSource = dso_OvertimeType
        TabOrder = 2
        FrameSides = [sdBottom]
        FrameVisible = True
        FramingPreference = fpCustomFraming
      end
      object dtp_begintime: TDateTimePicker
        Left = 71
        Top = 179
        Width = 167
        Height = 21
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        Date = 43564.000000000000000000
        Format = 'yyyy-MM-dd  hh:mm'
        Time = 0.404969780094688800
        TabOrder = 3
      end
      object dtp_endtime: TDateTimePicker
        Left = 71
        Top = 229
        Width = 167
        Height = 21
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        Date = 43564.000000000000000000
        Format = 'yyyy-MM-dd  hh:mm'
        Time = 0.404969780094688800
        TabOrder = 4
      end
      object dtp_overtimeDate: TDateTimePicker
        Left = 72
        Top = 300
        Width = 167
        Height = 21
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        Date = 43564.000000000000000000
        Format = 'yyyy-MM-dd  hh:mm'
        Time = 0.404969780094688800
        TabOrder = 6
      end
      object edt_Hour3: TMaskEdit
        Left = 127
        Top = 254
        Width = 158
        Height = 20
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 5
        Text = ''
        Visible = False
        OnKeyPress = edt_Hour3KeyPress
      end
      object edt_Hour: TEdit
        Left = 72
        Top = 264
        Width = 169
        Height = 21
        BevelEdges = [beBottom]
        BevelKind = bkFlat
        BorderStyle = bsNone
        TabOrder = 7
        Text = 'edt_Hour'
        OnKeyPress = edt_Hour3KeyPress
      end
    end
  end
  inherited RzPanel1: TRzPanel [2]
    Width = 528
    Height = 22
    ExplicitWidth = 528
    ExplicitHeight = 22
    object lbl1: TLabel
      Left = 22
      Top = 3
      Width = 48
      Height = 12
      Caption = #36873#21462#21592#24037
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    object AdvOfficeImage1: TAdvOfficeImage
      Left = 5
      Top = 2
      Width = 15
      Height = 17
      Picture.Data = {
        89504E470D0A1A0A0000000D4948445200000022000000200806000000778FAA
        C9000003F4494441545847B5574B4E1B41107D35C60E590524922DCE027076E4
        04E106F806381246D9D99CC0F60918EF2240627C03FB067003B20A9F05B00D96
        30AB38369E8AAA7BFE33CC0C468CC4024F77CFABAAF75E55135EF3EC0D77C05C
        53471059385CE9CD7B1CCDB55100C06E03540EEFE75BC068CF03E8654076EFB7
        60F08907807106465B67046D10BE69600AD03E0E57FA7903CD074400105A206C
        391FFA059B9A38FE781AFA905EE703629C82D189AD4B40970E240A807107501B
        472B566AA4F5610D6001B4AA13940D2819C88F8732ECA7030055E7838F606A66
        0288A21340C426800FCEAB3E8C857DFC5CBE8D2E0D031100B3690B445A09C023
        0013930513D6F2286FBD43EB6A0F4B283D3501C89F06C46CA150EC04016920B2
        B8383D0800905F3BAF021045ED036A79AF04D0B4B82F4112F68655309F80B0E4
        10B107A3D84E4ADF5C19896E52659F8AF4771CFE8C00DA27D4EF4FB5ECF8178C
        62F5CD0024019A3D59EADB8C3301D20761DBAB1D532F8FDC5E951DA546DEF1A8
        C01890E247696A7AA9D288B4434E0A83B9499AC891D936D86E8268D37FCD3D4C
        8A4D5F354A31B32648F50E87DD188160C158E8CE5D326D050D306A3E0F217660
        A15030DD73E33EA2D95D03A3E91992674A64E2786590AB2CBBC36D10CB198E1B
        2B63BB03293BB0A2994E7756ED901289D343DCB29185C9423756361D4443ED09
        3644E949202BCD1009429C68CF8886AC9B9D1CAE25E73EE20340D7F9B711F121
        C9C0000C33CFF9A21AB1DB1B708EB4FB1E20D6EFDA7614F623C0FD5C5EE497EF
        2BA13E3441DC70CC2CDF3CE1BAA426A0DBD8A4FE52B2EC76109D6798BA9A23F1
        6E296A1152C579905436F92DABBC2E7FB408B48B07BA7998ACDAEE65A12627BF
        917C85BC446670704A564DFDCF2648BA65809C091D3355C6F14E2E91F514798F
        3E9D47F7A6CB37D9E4D2A7AED8341737AFA400089795164AE32E3EDF3E3F6F24
        991CF339C890F4EAC95D4DF401FB4E31AF10909BF212268B0D01720ED0AA62FC
        8CBBF872119B9E421B6326277D491E67A2CF615E6AF9EF4A1905D2D60FBE235C
        556A603A09B894051B9D4C403193E31E6CB232D523000CB4006F0A0488BF6B8E
        E897FEB0A214C3A728A083B58BF0A49ECAD09497D7952DCCE426407EEF11F2DA
        684BD061B2EA7A39F325B9CE790EB0898D8BF96E7197951DDD795D00ACE7E0D2
        D80CF23259350268BA58854D812B01DFAA3B4B693C4825B6244507B4AD2E5FE4
        71E70E06B7511CF793F6675FB02ED7AB60438619B7038F54869294E6280020C9
        AAE39E7C06B24D6C5CA5DEFAB281B865BF5ADB041782262780FA8AD8F268024A
        33F487709A9958BF8E9957B28FBC947C9AD832C509A8480776EA6FC3CA545DE4
        BBF93312052C65F8F75E3CC0B90D521FEFFE5A99FC7926F0FF87C2F9B4CF7A8B
        900000000049454E44AE426082}
      Stretch = True
      Version = '1.1.1.0'
    end
  end
  inherited RzPanel4: TRzPanel [3]
    Top = 384
    Width = 528
    Height = 35
    ExplicitTop = 384
    ExplicitWidth = 528
    ExplicitHeight = 35
    inherited btnSaveAdd: TSpeedButton
      Left = 284
      Top = 4
      Width = 105
      Caption = #25209#37327#28155#21152
      ExplicitLeft = 284
      ExplicitTop = 4
      ExplicitWidth = 105
    end
    inherited btnSave: TSpeedButton
      Left = 184
      Top = 5
      Width = 94
      Caption = #25209#37327#20445#23384
      ExplicitLeft = 184
      ExplicitTop = 5
      ExplicitWidth = 94
    end
    inherited btnCancel: TSpeedButton
      Left = 395
      Top = 3
      ExplicitLeft = 395
      ExplicitTop = 3
    end
  end
  inherited dso: TDataSource
    Left = 480
    Top = 144
  end
  inherited adt: TADODataSet
    Active = False
    CommandText = ' select top 1  *  from  Hrm_OverTime'
    Left = 453
    Top = 144
  end
  object Adt_Person: TADODataSet
    Active = True
    Connection = dm_DaTa.adoconn
    CursorType = ctStatic
    CommandText = 'select  *   from   Hrm_Person'
    Parameters = <>
    Left = 64
    Top = 232
  end
  object dso_Person: TDataSource
    DataSet = Adt_Person
    Left = 57
    Top = 287
  end
  object Adt_OverTimeType: TADODataSet
    Active = True
    Connection = dm_DaTa.adoconn
    CursorType = ctStatic
    CommandText = 'select  *    from Hrm_OvertimeType'
    Parameters = <>
    Left = 464
    Top = 224
  end
  object dso_OvertimeType: TDataSource
    DataSet = Adt_OverTimeType
    Left = 473
    Top = 279
  end
end
