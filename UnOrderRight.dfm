object FrmOrderRight: TFrmOrderRight
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #36319#21333#26435#38480#31649#29702
  ClientHeight = 506
  ClientWidth = 307
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object RzPanel2: TRzPanel
    Left = 0
    Top = 473
    Width = 307
    Height = 33
    Align = alBottom
    BorderOuter = fsNone
    BorderSides = [sdBottom]
    GradientDirection = gdHorizontalBox
    TabOrder = 0
    VisualStyle = vsGradient
    object btn: TAdvGlowButton
      Left = 0
      Top = 0
      Width = 307
      Height = 33
      Align = alClient
      Caption = #35774#32622#26435#38480
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      NotesFont.Charset = DEFAULT_CHARSET
      NotesFont.Color = clWindowText
      NotesFont.Height = -11
      NotesFont.Name = 'Tahoma'
      NotesFont.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnClick
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
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 307
    Height = 33
    Align = alTop
    BorderOuter = fsFlat
    TabOrder = 1
    object advsmthlbl1: TAdvSmoothLabel
      Left = -18
      Top = 4
      Width = 139
      Height = 18
      Fill.ColorMirror = clNone
      Fill.ColorMirrorTo = clNone
      Fill.GradientType = gtVertical
      Fill.GradientMirrorType = gtSolid
      Fill.BorderColor = clNone
      Fill.Rounding = 0
      Fill.ShadowOffset = 0
      Fill.Glow = gmNone
      Caption.Text = #35774#32622#35746#21333#26435#38480
      Caption.Font.Charset = GB2312_CHARSET
      Caption.Font.Color = clWindowText
      Caption.Font.Height = -14
      Caption.Font.Name = #24494#36719#38597#40657
      Caption.Font.Style = [fsBold]
      Caption.ColorStart = clSkyBlue
      Caption.ColorEnd = clGreen
      CaptionShadow.Text = #35774#32622#35746#21333#26435#38480
      CaptionShadow.Font.Charset = DEFAULT_CHARSET
      CaptionShadow.Font.Color = clWindowText
      CaptionShadow.Font.Height = -29
      CaptionShadow.Font.Name = 'Tahoma'
      CaptionShadow.Font.Style = []
      Version = '1.6.0.2'
    end
    object chk_select: TCheckBox
      Left = 234
      Top = 7
      Width = 49
      Height = 17
      Caption = #20840#36873
      TabOrder = 0
      OnClick = chk_selectClick
    end
  end
  object GRD: TDBGridEh
    Left = 0
    Top = 33
    Width = 307
    Height = 440
    Align = alClient
    AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
    BorderStyle = bsNone
    ColumnDefValues.AlwaysShowEditButton = True
    ColumnDefValues.Title.TitleButton = True
    ColumnDefValues.ToolTips = True
    Ctl3D = True
    DataSource = dso
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    FooterParams.Color = clBtnFace
    FooterParams.FillStyle = cfstThemedEh
    FooterParams.HorzLines = True
    FooterParams.VertLines = False
    FrozenCols = 5
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghFooter3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghTraceColSizing, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghHotTrack, dghExtendVertLines]
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
    SearchPanel.CaseSensitive = True
    SearchPanel.SearchScope = gssCurrentColumnEh
    SelectionDrawParams.DrawFocusFrame = True
    SelectionDrawParams.DrawFocusFrameStored = True
    ShowHint = True
    SortLocal = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 2
    TitleParams.MultiTitle = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IsSelect'
        Footers = <>
        Title.Caption = #36873#25321
        Width = 46
      end
      item
        Alignment = taCenter
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Caption = #21517#31216
        Width = 130
      end
      item
        Alignment = taCenter
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TypeName'
        Footers = <>
        Title.Caption = #31867#21035
        Width = 81
      end>
    object TRowDetailPanelControlEh
    end
  end
  object dso: TDataSource
    DataSet = mte
    Left = 120
    Top = 200
  end
  object Adt: TADODataSet
    Active = True
    Connection = dm_DaTa.adoconn
    CursorType = ctStatic
    OnNewRecord = AdtNewRecord
    CommandText = 'select *  from   Erp_ServiceRight'
    Parameters = <>
    Left = 64
    Top = 184
  end
  object mte: TMemTableEh
    Active = True
    Params = <>
    DataDriver = dsd
    Left = 104
    Top = 152
  end
  object dsd: TDataSetDriverEh
    ProviderDataSet = Adt
    Left = 176
    Top = 137
  end
end
