inherited FrmLeaveType: TFrmLeaveType
  BorderIcons = [biSystemMenu]
  Caption = #35831#20551#31867#22411
  ClientHeight = 341
  ClientWidth = 185
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'Tahoma'
  Position = poMainFormCenter
  ExplicitWidth = 201
  ExplicitHeight = 379
  PixelsPerInch = 96
  TextHeight = 13
  inherited RzPanel1: TRzPanel
    Top = 313
    Width = 185
    Align = alBottom
    ExplicitTop = 313
    ExplicitWidth = 185
    inherited RzToolbarButton1: TRzToolbarButton
      Left = 122
      ExplicitLeft = 122
    end
    object AdvGlowButton1: TAdvGlowButton
      Left = 9
      Top = -6
      Width = 64
      Height = 26
      Caption = #20445#23384
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
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
        610000017F49444154384F8D53C155C250109C898847432A80F784AB58815881
        74201C3107B002A102F09078142B502B20768057F03DB001884745B3BE4D0043
        444D4EF97FFFCEEECCEC1289CFBC9EE40DF9688A48856459C3029952E005066F
        FD46D18BA7307EB09CE71E28CD2468E2DC0BDE321DFFA2E0EBFD1A20E78CEF49
        9CFE931C86456438B74B476B80949537B1855733FBA0C525E7499ACA51753C80
        A810D80F9829306D75015E5558DF2E0D2D67DC06710941873977EC1138FEAB03
        813C0977AB7EA330359D5199E0808429C0232D772C91321127CB1DF5019EAD00
        B56579CFD45475D319D50CF22616F3D7000278F3F3E289D99D98DC5B78040FB5
        C5995D6C6BC236AA227861CE1D0DC3C79142FD995DAA2B08B28BBCF2D57F23BB
        E882AC2569461412C31388D47DBBD4D7C76137D9C56035913F745211B7D9A820
        303865803B15EB3781431B237E4B5BD20E43B420A13EDFA39CC2CEB83373BB58
        DDD885D49D2CED5E816D6C63289CAE73F0D9120695953B3A4814C30B8C9D9E0E
        539CE9175201C2B6CAE380A90000000049454E44AE426082}
      Transparent = True
      TabOrder = 0
      OnClick = AdvGlowButton1Click
      Appearance.BorderColor = 14727579
      Appearance.BorderColorHot = 10079963
      Appearance.BorderColorDown = 4548219
      Appearance.Color = 15653832
      Appearance.ColorTo = 16178633
      Appearance.ColorChecked = 7915518
      Appearance.ColorCheckedTo = 11918331
      Appearance.ColorDisabled = 15921906
      Appearance.ColorDisabledTo = 15921906
      Appearance.ColorDown = 7778289
      Appearance.ColorDownTo = 4296947
      Appearance.ColorHot = 15465983
      Appearance.ColorHotTo = 11332863
      Appearance.ColorMirror = 15586496
      Appearance.ColorMirrorTo = 16245200
      Appearance.ColorMirrorHot = 5888767
      Appearance.ColorMirrorHotTo = 10807807
      Appearance.ColorMirrorDown = 946929
      Appearance.ColorMirrorDownTo = 5021693
      Appearance.ColorMirrorChecked = 10480637
      Appearance.ColorMirrorCheckedTo = 5682430
      Appearance.ColorMirrorDisabled = 11974326
      Appearance.ColorMirrorDisabledTo = 15921906
      Appearance.GradientHot = ggVertical
      Appearance.GradientMirrorHot = ggVertical
      Appearance.GradientDown = ggVertical
      Appearance.GradientMirrorDown = ggVertical
      Appearance.GradientChecked = ggVertical
    end
  end
  object Grd: TDBGridEh
    Left = 0
    Top = 0
    Width = 185
    Height = 313
    Align = alClient
    AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
    BorderStyle = bsNone
    ColumnDefValues.AlwaysShowEditButton = True
    ColumnDefValues.Title.TitleButton = True
    ColumnDefValues.ToolTips = True
    Ctl3D = True
    DataSource = ds
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    FooterParams.Color = clBtnFace
    FooterParams.FillStyle = cfstThemedEh
    FooterParams.HorzLines = True
    FooterParams.VertLines = False
    GridLineParams.DataHorzLines = True
    GridLineParams.DataVertLines = True
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    IndicatorParams.HorzLines = True
    IndicatorParams.VertLines = True
    IndicatorTitle.TitleButton = True
    IndicatorTitle.UseGlobalMenu = False
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghFooter3D, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghHotTrack, dghExtendVertLines]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    RowDetailPanel.Height = 350
    RowDetailPanel.BevelEdges = []
    RowDetailPanel.BevelInner = bvNone
    RowDetailPanel.BevelOuter = bvNone
    RowDetailPanel.BorderStyle = bsNone
    RowHeight = 20
    RowSizingAllowed = True
    ShowHint = True
    SortLocal = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 1
    TitleParams.HorzLines = True
    TitleParams.MultiTitle = True
    TitleParams.VertLines = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Alignment = taLeftJustify
        Title.Caption = #31867#21035#21517#31216
        Title.EndEllipsis = True
        Title.ShowImageAndText = False
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Width = 146
      end>
    object TRowDetailPanelControlEh
    end
  end
  object adt: TADODataSet
    Active = True
    Connection = dm_DaTa.adoconn
    CursorType = ctStatic
    CommandText = 'select * from Hrm_LeaveType'
    Parameters = <>
    Left = 56
    Top = 144
  end
  object ds: TDataSource
    DataSet = mte
    Left = 104
    Top = 136
  end
  object mte: TMemTableEh
    Active = True
    Params = <>
    DataDriver = dsd
    Left = 56
    Top = 216
  end
  object dsd: TDataSetDriverEh
    ProviderDataSet = adt
    Left = 88
    Top = 232
  end
end
