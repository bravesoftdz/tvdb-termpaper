object FormReportSeries: TFormReportSeries
  Left = 0
  Top = 0
  Caption = 'FormReportSeries'
  ClientHeight = 701
  ClientWidth = 1065
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 80
    Top = 0
    Width = 881
    Height = 257
    BevelOuter = bvNone
    BorderStyle = cxcbsNone
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataModuleMain.DataSource1
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoGroupsAlwaysExpanded]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.ColumnAutoWidth = True
      object cxGrid1DBTableView1seriesName: TcxGridDBColumn
        DataBinding.FieldName = 'seriesName'
        Visible = False
        GroupIndex = 1
        Width = 236
      end
      object cxGrid1DBTableView1seriesDescription: TcxGridDBColumn
        DataBinding.FieldName = 'seriesDescription'
        PropertiesClassName = 'TcxMemoProperties'
        Options.CellMerging = True
        Width = 299
      end
      object cxGrid1DBTableView1seriesLength: TcxGridDBColumn
        DataBinding.FieldName = 'seriesLength'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Options.CellMerging = True
        Width = 35
      end
      object cxGrid1DBTableView1personName: TcxGridDBColumn
        DataBinding.FieldName = 'personName'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taLeftJustify
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        Options.CellMerging = True
        Width = 116
      end
      object cxGrid1DBTableView1genreName: TcxGridDBColumn
        DataBinding.FieldName = 'genreName'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.WordWrap = True
        Options.CellMerging = True
        Width = 118
      end
      object cxGrid1DBTableView1episodeSeason: TcxGridDBColumn
        DataBinding.FieldName = 'episodeSeason'
        PropertiesClassName = 'TcxLabelProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Options.CellMerging = True
        Width = 32
      end
      object cxGrid1DBTableView1episodeNumber: TcxGridDBColumn
        DataBinding.FieldName = 'episodeNumber'
        PropertiesClassName = 'TcxLabelProperties'
        Width = 33
      end
      object cxGrid1DBTableView1episodeName: TcxGridDBColumn
        DataBinding.FieldName = 'episodeName'
        PropertiesClassName = 'TcxLabelProperties'
        Width = 167
      end
      object cxGrid1DBTableView1episodeDescription: TcxGridDBColumn
        DataBinding.FieldName = 'episodeDescription'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.ScrollBars = ssVertical
        Properties.VisibleLineCount = 10
        Width = 235
      end
      object cxGrid1DBTableView1countryName: TcxGridDBColumn
        DataBinding.FieldName = 'countryName'
        Visible = False
        GroupIndex = 0
        Width = 47
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
end
