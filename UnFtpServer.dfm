inherited FrmFtpServer: TFrmFtpServer
  Caption = 'FrmFtpServer'
  ClientHeight = 519
  ClientWidth = 820
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'Tahoma'
  WindowState = wsMaximized
  ExplicitWidth = 836
  ExplicitHeight = 557
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Width = 820
    ExplicitWidth = 820
    inherited RzToolbarButton1: TRzToolbarButton
      Tag = 1004
      Left = 757
      ExplicitLeft = 757
    end
    object Label3: TLabel
      Left = 18
      Top = 7
      Width = 48
      Height = 13
      Caption = #26381#21153#22120#65306
    end
    object Label4: TLabel
      Left = 218
      Top = 7
      Width = 48
      Height = 13
      Caption = #31471#21475#21495#65306
    end
    object edt_Localhost: TEdit
      Left = 71
      Top = 6
      Width = 130
      Height = 18
      BevelEdges = [beBottom]
      BevelInner = bvLowered
      BevelKind = bkFlat
      BevelOuter = bvRaised
      BorderStyle = bsNone
      TabOrder = 0
      Text = '10.1.2.248'
    end
    object edt_port: TEdit
      Left = 272
      Top = 3
      Width = 63
      Height = 21
      BevelEdges = [beBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      TabOrder = 1
      Text = '21'
    end
    object btnFixCell: TAdvGlowButton
      Left = 347
      Top = 2
      Width = 62
      Height = 22
      Caption = #36830#25509
      Font.Charset = GB2312_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      Picture.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        61000000EE49444154384FA593010DC2301045DF1C20010948980424CC01C301
        0E0007480007A080E1000938803CD22E5D592164972CDBDADEEBBFDF5EC567CC
        8115500355987E0267600FDCD394B8208EED8005E0FB98B197400B5C81759C4B
        015D483C8CA84A879A0072A35EA23B0AF8951C414204B42AB06613ADF99FD093
        4680BBFB93D79CC3F4205DE37F2D40E9EF7ABE840A4D50ED2359D79500BAAD32
        C3EF4D28D1CDD21805CC42491ED72580F4274F16545410214A2E25F780928942
        7C06372FD1DF9B38F918854EBA4851D5A4AB9C37D316388D34935D7A0B47FB9E
        CEBBD1313DF1EC75DF368EEBBCAD963A30F505DF8C39B1322F775D0000000049
        454E44AE426082}
      TabOrder = 2
      Appearance.ColorChecked = 16111818
      Appearance.ColorCheckedTo = 16367008
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 16111818
      Appearance.ColorDownTo = 16367008
      Appearance.ColorHot = 16117985
      Appearance.ColorHotTo = 16372402
      Appearance.ColorMirrorHot = 16107693
      Appearance.ColorMirrorHotTo = 16775412
      Appearance.ColorMirrorDown = 16102556
      Appearance.ColorMirrorDownTo = 16768988
      Appearance.ColorMirrorChecked = 16102556
      Appearance.ColorMirrorCheckedTo = 16768988
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
    end
  end
end
