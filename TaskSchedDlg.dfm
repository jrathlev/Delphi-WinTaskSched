object TaskScheduleDialog: TTaskScheduleDialog
  Left = 380
  Top = 321
  BorderStyle = bsDialog
  Caption = 'Scheduled Task Wizard'
  ClientHeight = 370
  ClientWidth = 465
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 0
    Top = 46
    Width = 465
    Height = 278
    ActivePage = tsProgram
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object tsProgram: TTabSheet
      TabVisible = False
      object edWorkDir: TLabeledEdit
        Left = 5
        Top = 110
        Width = 416
        Height = 21
        EditLabel.Width = 88
        EditLabel.Height = 13
        EditLabel.Caption = 'Start in (optional):'
        TabOrder = 0
      end
      object btnProg: TBitBtn
        Left = 425
        Top = 17
        Width = 26
        Height = 26
        Hint = 'Add backup task'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnProgClick
      end
      object edProg: TLabeledEdit
        Left = 5
        Top = 20
        Width = 416
        Height = 21
        EditLabel.Width = 110
        EditLabel.Height = 13
        EditLabel.Caption = 'Program to be started:'
        TabOrder = 1
      end
      object btWorkDir: TBitBtn
        Left = 425
        Top = 107
        Width = 26
        Height = 26
        Hint = 'Select backup directory'
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000120B0000120B00000000000000000000C0DCC0000000
          C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
          DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
          DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          C0DCC0C0DCC0000000000000000000000000000000C0DCC0000000000000C0DC
          C0000000000000C0DCC0C0DCC0686868C0DCC0C0DCC068686868686868686868
          6868686868C0DCC0686868686868C0DCC0686868686868C0DCC0C0DCC0000000
          00000000000000000000CBFF00CBFF00CBFF000000C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868686868686868686868B3B3B3B3B3B3B3
          B3B3686868C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          C0DCC0C0DCC000000000CBFF00CBFF000000000000C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868C0DCC0C0DCC0686868B3B3B3B3B3B368
          6868686868C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          C0DCC0C0DCC0C0DCC0000000000000C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868C0DCC0C0DCC0C0DCC0686868686868C0
          DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
          DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          C0DCC0C0DCC0000000000000000000000000000000C0DCC0000000000000C0DC
          C0000000000000C0DCC0C0DCC0686868C0DCC0C0DCC068686868686868686868
          6868686868C0DCC0686868686868C0DCC0686868686868C0DCC0C0DCC0000000
          00000000000000000000CBFF00CBFF00CBFF000000C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868686868686868686868B3B3B3B3B3B3B3
          B3B3686868C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          C0DCC0C0DCC000000000CBFF00CBFF000000000000C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868C0DCC0C0DCC0686868B3B3B3B3B3B368
          6868686868C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          C0DCC0C0DCC0C0DCC0000000000000C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868C0DCC0C0DCC0C0DCC0686868686868C0
          DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
          DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000000000
          000000000000000000C0DCC0000000000000C0DCC0000000000000000000C0DC
          C0C0DCC0C0DCC0C0DCC0686868686868686868686868686868C0DCC068686868
          6868C0DCC0686868686868686868C0DCC0C0DCC0C0DCC0C0DCC000000000CBFF
          00CBFF00CBFF000000C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0686868B3B3B3B3B3B3B3B3B3686868C0DCC0C0DCC0C0
          DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC000000000CBFF
          00CBFF000000000000C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0686868B3B3B3B3B3B3686868686868C0DCC0C0DCC0C0
          DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0000000
          000000C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
          C0C0DCC0C0DCC0C0DCC0C0DCC0686868686868C0DCC0C0DCC0C0DCC0C0DCC0C0
          DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
        NumGlyphs = 2
        Spacing = -1
        TabOrder = 3
        OnClick = btWorkDirClick
      end
      object edOptions: TLabeledEdit
        Left = 5
        Top = 65
        Width = 446
        Height = 21
        TabStop = False
        EditLabel.Width = 128
        EditLabel.Height = 13
        EditLabel.Caption = 'Command line parameters:'
        TabOrder = 4
      end
      object rgPriority: TRadioGroup
        Left = 5
        Top = 140
        Width = 416
        Height = 71
        Caption = 'Process priority'
        Columns = 4
        ItemIndex = 2
        Items.Strings = (
          'Idle'
          'Very low'
          'Low'
          'Normal'
          'High'
          'Very high'
          'Time critical')
        TabOrder = 5
      end
    end
    object tsSchedule: TTabSheet
      ImageIndex = 1
      TabVisible = False
      object pcSteps: TPageControl
        Left = 195
        Top = 5
        Width = 256
        Height = 241
        ActivePage = tsOneTime
        Style = tsButtons
        TabOrder = 2
        object tsDaily: TTabSheet
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label1: TLabel
            Left = 15
            Top = 25
            Width = 28
            Height = 13
            Caption = 'Start:'
            FocusControl = tpStartDaily
          end
          object laDay: TLabel
            Left = 10
            Top = 5
            Width = 152
            Height = 13
            Caption = 'Settings for daily schedule:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object tpStartDaily: TDateTimePicker
            Left = 115
            Top = 40
            Width = 76
            Height = 21
            Date = 39626.613225104170000000
            Format = 'HH:mm'
            Time = 39626.613225104170000000
            Kind = dtkTime
            TabOrder = 1
            OnChange = SyncTimes
          end
          object dpStartDaily: TDateTimePicker
            Left = 15
            Top = 40
            Width = 91
            Height = 21
            Date = 39626.618183761570000000
            Time = 39626.618183761570000000
            TabOrder = 0
            OnChange = SyncDates
          end
          object pnlDaily: TPanel
            Left = 5
            Top = 75
            Width = 241
            Height = 81
            BevelOuter = bvNone
            TabOrder = 2
            object Label2: TLabel
              Left = 10
              Top = 5
              Width = 85
              Height = 13
              Caption = 'Perform this task:'
            end
            object laDays: TLabel
              Left = 150
              Top = 52
              Width = 23
              Height = 13
              Caption = 'days'
            end
            object rbEveryDay: TRadioButton
              Left = 10
              Top = 25
              Width = 81
              Height = 17
              Caption = 'Every day'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbEveryDayClick
            end
            object rbSkipDays: TRadioButton
              Left = 10
              Top = 50
              Width = 56
              Height = 17
              Caption = 'Every'
              TabOrder = 1
              OnClick = rbEveryDayClick
            end
            object udDays: TUpDown
              Left = 94
              Top = 50
              Width = 16
              Height = 21
              AlignButton = udLeft
              Associate = edDays
              Min = 2
              Max = 99
              Position = 2
              TabOrder = 2
            end
            object edDays: TEdit
              Left = 110
              Top = 50
              Width = 31
              Height = 21
              Alignment = taRightJustify
              TabOrder = 3
              Text = '2'
            end
          end
          object btAdvDaily: TBitBtn
            Left = 25
            Top = 160
            Width = 171
            Height = 30
            Hint = 'Advanced settings ...'
            Caption = 'Advanced settings ...'
            Glyph.Data = {
              96090000424D9609000000000000360000002800000028000000140000000100
              18000000000060090000120B0000120B00000000000000000000C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A217D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA91567D
              4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898984F4F4FC0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA91
              567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898989898984F4F4F
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898989898989898989898984F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA91567D4A
              21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898984F4F4FC0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A217D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F4F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
            Layout = blGlyphRight
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btAdvDailyClick
          end
        end
        object tsWeekly: TTabSheet
          ImageIndex = 1
          ParentShowHint = False
          ShowHint = False
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label4: TLabel
            Left = 15
            Top = 25
            Width = 28
            Height = 13
            Caption = 'Start:'
            FocusControl = tpStartWeekly
          end
          object Label5: TLabel
            Left = 120
            Top = 78
            Width = 30
            Height = 13
            Caption = 'weeks'
          end
          object Label6: TLabel
            Left = 15
            Top = 78
            Width = 28
            Height = 13
            Caption = 'Every'
          end
          object laWeek: TLabel
            Left = 10
            Top = 5
            Width = 165
            Height = 13
            Caption = 'Settings for weekly schedule:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object tpStartWeekly: TDateTimePicker
            Left = 115
            Top = 40
            Width = 76
            Height = 21
            Date = 39626.613225104170000000
            Format = 'HH:mm'
            Time = 39626.613225104170000000
            Kind = dtkTime
            TabOrder = 1
            OnChange = SyncTimes
          end
          object pnlWeekDays: TPanel
            Left = 5
            Top = 105
            Width = 241
            Height = 126
            BevelOuter = bvNone
            TabOrder = 2
            object Label12: TLabel
              Left = 10
              Top = 5
              Width = 164
              Height = 13
              Caption = 'On the following days of the week'
            end
            object cbMonday: TCheckBox
              Left = 15
              Top = 25
              Width = 106
              Height = 17
              Caption = 'Monday'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = cbMondayClick
            end
            object cbTuesday: TCheckBox
              Left = 15
              Top = 50
              Width = 106
              Height = 17
              Caption = 'Tuesday'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = cbMondayClick
            end
            object cbWednesday: TCheckBox
              Left = 15
              Top = 75
              Width = 106
              Height = 17
              Caption = 'Wednesday'
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = cbMondayClick
            end
            object cbThursday: TCheckBox
              Left = 135
              Top = 25
              Width = 106
              Height = 17
              Caption = 'Thursday'
              Checked = True
              State = cbChecked
              TabOrder = 3
              OnClick = cbMondayClick
            end
            object cbFriday: TCheckBox
              Left = 135
              Top = 50
              Width = 106
              Height = 17
              Caption = 'Friday'
              Checked = True
              State = cbChecked
              TabOrder = 4
              OnClick = cbMondayClick
            end
            object cbSaturday: TCheckBox
              Left = 135
              Top = 75
              Width = 106
              Height = 17
              Caption = 'Saturday'
              TabOrder = 5
              OnClick = cbMondayClick
            end
            object cbSunday: TCheckBox
              Left = 135
              Top = 99
              Width = 106
              Height = 17
              Caption = 'Sunday'
              TabOrder = 6
              OnClick = cbMondayClick
            end
          end
          object dpStartWeekly: TDateTimePicker
            Left = 15
            Top = 40
            Width = 91
            Height = 21
            Date = 39626.618183761570000000
            Time = 39626.618183761570000000
            TabOrder = 0
            OnChange = SyncDates
          end
          object btExtWeek: TBitBtn
            Left = 210
            Top = 31
            Width = 31
            Height = 31
            Hint = 'Advanced settings ...'
            Glyph.Data = {
              96090000424D9609000000000000360000002800000028000000140000000100
              18000000000060090000120B0000120B00000000000000000000C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A217D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA91567D
              4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898984F4F4FC0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA91
              567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898989898984F4F4F
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898989898989898989898984F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA91567D4A
              21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898984F4F4FC0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A217D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F4F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = btAdvDailyClick
          end
          object udWeeks: TUpDown
            Left = 69
            Top = 75
            Width = 16
            Height = 21
            AlignButton = udLeft
            Associate = edWeeks
            Min = 1
            Max = 24
            Position = 1
            TabOrder = 4
          end
          object edWeeks: TEdit
            Left = 85
            Top = 75
            Width = 31
            Height = 21
            Alignment = taRightJustify
            TabOrder = 5
            Text = '1'
          end
        end
        object tsMonthly: TTabSheet
          ImageIndex = 2
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object laMonth: TLabel
            Left = 10
            Top = 5
            Width = 172
            Height = 13
            Caption = 'Settings for monthly schedule:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label10: TLabel
            Left = 15
            Top = 25
            Width = 28
            Height = 13
            Caption = 'Start:'
            FocusControl = tpStartMonthly
          end
          object tpStartMonthly: TDateTimePicker
            Left = 115
            Top = 40
            Width = 76
            Height = 21
            Date = 39626.613225104170000000
            Format = 'HH:mm'
            Time = 39626.613225104170000000
            Kind = dtkTime
            TabOrder = 1
            OnChange = SyncTimes
          end
          object pnlSelectDays: TPanel
            Left = 5
            Top = 65
            Width = 241
            Height = 56
            BevelOuter = bvNone
            TabOrder = 2
            object rbDayOfMonth: TRadioButton
              Left = 10
              Top = 8
              Width = 56
              Height = 17
              Caption = 'Days:'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbDayOfMonthClick
            end
            object rbSpecialday: TRadioButton
              Left = 10
              Top = 35
              Width = 56
              Height = 17
              Caption = 'On:'
              TabOrder = 2
              OnClick = rbDayOfMonthClick
            end
            object ccWeekdays: TCheckComboBox
              Left = 135
              Top = 33
              Width = 101
              Height = 22
              ColorNotFocus = clWindow
              ColorFocus = clSkyBlue
              DefaultIndex = 0
              Caption = ''
              Items.Strings = (
                'Monday|Mo'
                'Tuesday|Tu'
                'Wednesday|We'
                'Thursday|Th'
                'Friday|Fr'
                'Saturday|Sa'
                'Sunday|Su')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object ccMonthStart: TCheckComboBox
              Left = 70
              Top = 33
              Width = 61
              Height = 22
              ColorNotFocus = clWindow
              ColorFocus = clSkyBlue
              DefaultIndex = 0
              Caption = ''
              Items.Strings = (
                'First|1st'
                'Second|2nd'
                'Third|3rd'
                'Fourth|4th'
                'Fifth|5th'
                'Last')
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
            end
            object ccMonthDays: TCheckComboBox
              Left = 70
              Top = 5
              Width = 166
              Height = 22
              ColorNotFocus = clWindow
              ColorFocus = clSkyBlue
              DefaultIndex = 0
              DropDownCount = 15
              Caption = ''
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
            end
          end
          object pnlMonths: TPanel
            Left = 5
            Top = 125
            Width = 241
            Height = 101
            Alignment = taLeftJustify
            BevelOuter = bvNone
            TabOrder = 3
            object Label11: TLabel
              Left = 5
              Top = 5
              Width = 116
              Height = 13
              Caption = 'of the following months:'
            end
            object cbJan: TCheckBox
              Left = 10
              Top = 25
              Width = 51
              Height = 17
              Caption = 'Jan'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = cbJanClick
            end
            object cbFeb: TCheckBox
              Left = 10
              Top = 50
              Width = 51
              Height = 17
              Caption = 'Feb'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = cbJanClick
            end
            object cbMar: TCheckBox
              Left = 10
              Top = 75
              Width = 51
              Height = 17
              Caption = 'Mar'
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = cbJanClick
            end
            object cbApr: TCheckBox
              Left = 70
              Top = 25
              Width = 51
              Height = 17
              Caption = 'Apr'
              Checked = True
              State = cbChecked
              TabOrder = 3
              OnClick = cbJanClick
            end
            object cbMay: TCheckBox
              Left = 70
              Top = 50
              Width = 51
              Height = 17
              Caption = 'May'
              Checked = True
              State = cbChecked
              TabOrder = 4
              OnClick = cbJanClick
            end
            object cbJun: TCheckBox
              Left = 70
              Top = 75
              Width = 51
              Height = 17
              Caption = 'Jun'
              Checked = True
              State = cbChecked
              TabOrder = 5
              OnClick = cbJanClick
            end
            object cbJul: TCheckBox
              Left = 130
              Top = 25
              Width = 51
              Height = 17
              Caption = 'Jul'
              Checked = True
              State = cbChecked
              TabOrder = 6
              OnClick = cbJanClick
            end
            object cbAug: TCheckBox
              Left = 130
              Top = 50
              Width = 51
              Height = 17
              Caption = 'Aug'
              Checked = True
              State = cbChecked
              TabOrder = 7
              OnClick = cbJanClick
            end
            object cbSep: TCheckBox
              Left = 130
              Top = 75
              Width = 51
              Height = 17
              Caption = 'Sep'
              Checked = True
              State = cbChecked
              TabOrder = 8
              OnClick = cbJanClick
            end
            object cbOct: TCheckBox
              Left = 190
              Top = 25
              Width = 51
              Height = 17
              Caption = 'Oct'
              Checked = True
              State = cbChecked
              TabOrder = 9
              OnClick = cbJanClick
            end
            object cbNov: TCheckBox
              Left = 190
              Top = 50
              Width = 51
              Height = 17
              Caption = 'Nov'
              Checked = True
              State = cbChecked
              TabOrder = 10
              OnClick = cbJanClick
            end
            object cbDec: TCheckBox
              Left = 190
              Top = 75
              Width = 51
              Height = 17
              Caption = 'Dec'
              Checked = True
              State = cbChecked
              TabOrder = 11
              OnClick = cbJanClick
            end
          end
          object dpStartMonthly: TDateTimePicker
            Left = 15
            Top = 40
            Width = 91
            Height = 21
            Date = 39626.618183761570000000
            Time = 39626.618183761570000000
            TabOrder = 0
            OnChange = SyncDates
          end
          object btExtMon: TBitBtn
            Left = 210
            Top = 31
            Width = 31
            Height = 31
            Hint = 'Advanced settings ...'
            Glyph.Data = {
              96090000424D9609000000000000360000002800000028000000140000000100
              18000000000060090000120B0000120B00000000000000000000C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A217D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA91567D
              4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898984F4F4FC0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA91
              567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898989898984F4F4F
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898989898989898989898984F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA91567D4A
              21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898984F4F4FC0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A217D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F4F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = btAdvDailyClick
          end
        end
        object tsOneTime: TTabSheet
          ImageIndex = 4
          TabVisible = False
          object Label18: TLabel
            Left = 25
            Top = 40
            Width = 28
            Height = 13
            Caption = 'Start:'
            FocusControl = dpOneTime
          end
          object laSingle: TLabel
            Left = 10
            Top = 5
            Width = 164
            Height = 13
            Caption = 'Settings for one time trigger:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object tpOneTime: TDateTimePicker
            Left = 125
            Top = 55
            Width = 71
            Height = 21
            Date = 39626.613225104170000000
            Format = 'HH:mm'
            Time = 39626.613225104170000000
            Kind = dtkTime
            TabOrder = 1
            OnChange = SyncTimes
          end
          object dpOneTime: TDateTimePicker
            Left = 25
            Top = 55
            Width = 91
            Height = 21
            Date = 39626.618183761570000000
            Time = 39626.618183761570000000
            TabOrder = 0
            OnChange = SyncDates
          end
          object btAdvOneTime: TBitBtn
            Left = 25
            Top = 160
            Width = 171
            Height = 31
            Caption = 'Advanced settings ...'
            Glyph.Data = {
              96090000424D9609000000000000360000002800000028000000140000000100
              18000000000060090000120B0000120B00000000000000000000C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A217D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA91567D
              4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898984F4F4FC0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA91
              567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898989898984F4F4F
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898989898989898989898984F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA91567D4A
              21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898984F4F4FC0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A217D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F4F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
            Layout = blGlyphRight
            NumGlyphs = 2
            TabOrder = 3
            OnClick = btAdvDailyClick
          end
          object paRandom: TPanel
            Left = 15
            Top = 85
            Width = 221
            Height = 61
            BevelOuter = bvNone
            TabOrder = 2
            object cbRndUnit: TComboBox
              Left = 85
              Top = 30
              Width = 96
              Height = 21
              Style = csDropDownList
              ItemIndex = 2
              TabOrder = 1
              Text = 'seconds(s)'
              OnCloseUp = cbRndUnitCloseUp
              Items.Strings = (
                'hour(s)'
                'minute(s)'
                'seconds(s)')
            end
            object cbRandom: TCheckBox
              Left = 10
              Top = 5
              Width = 191
              Height = 17
              Caption = 'Delay task for up to (random delay):'
              TabOrder = 0
              OnClick = cbRandomClick
            end
            object udRandom: TUpDown
              Left = 29
              Top = 30
              Width = 16
              Height = 21
              AlignButton = udLeft
              Associate = edRandom
              Min = 1
              Max = 3599
              Position = 30
              TabOrder = 2
            end
            object edRandom: TEdit
              Left = 45
              Top = 30
              Width = 31
              Height = 21
              Alignment = taRightJustify
              TabOrder = 3
              Text = '30'
            end
          end
        end
        object tsEvent: TTabSheet
          ImageIndex = 5
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object laEvent: TLabel
            Left = 10
            Top = 5
            Width = 49
            Height = 13
            Caption = 'On logon'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object laUser: TLabel
            Left = 25
            Top = 20
            Width = 3
            Height = 13
          end
          object cbActivate: TCheckBox
            Left = 25
            Top = 35
            Width = 86
            Height = 17
            Caption = 'Activate:'
            TabOrder = 0
            OnClick = cbActivateClick
          end
          object dpEventTime: TDateTimePicker
            Left = 25
            Top = 55
            Width = 91
            Height = 21
            Date = 39626.618183761570000000
            Time = 39626.618183761570000000
            Enabled = False
            TabOrder = 1
            OnChange = SyncDates
          end
          object tpEventTime: TDateTimePicker
            Left = 125
            Top = 55
            Width = 76
            Height = 21
            Date = 39626.613225104170000000
            Format = 'HH:mm'
            Time = 39626.613225104170000000
            Kind = dtkTime
            TabOrder = 2
            OnChange = SyncTimes
          end
          object btEvAdv: TBitBtn
            Left = 25
            Top = 160
            Width = 171
            Height = 31
            Caption = 'Advanced settings ...'
            Glyph.Data = {
              96090000424D9609000000000000360000002800000028000000140000000100
              18000000000060090000120B0000120B00000000000000000000C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A217D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA91567D
              4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898984F4F4FC0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA91
              567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898989898984F4F4F
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898989898989898989898984F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
              DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
              98989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA91567D4A
              21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898989898989898989898989898984F4F4FC0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
              9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
              989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C07D4A21DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
              9898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A217D4A21C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F4F4F4FC0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
              C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
              C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
              DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
            Layout = blGlyphRight
            NumGlyphs = 2
            TabOrder = 4
            OnClick = btAdvDailyClick
          end
          object paDelay: TPanel
            Left = 15
            Top = 85
            Width = 221
            Height = 61
            BevelOuter = bvNone
            TabOrder = 3
            object cbDelUnit: TComboBox
              Left = 85
              Top = 30
              Width = 96
              Height = 21
              Style = csDropDownList
              ItemIndex = 2
              TabOrder = 1
              Text = 'seconds(s)'
              OnCloseUp = cbDelUnitCloseUp
              Items.Strings = (
                'hour(s)'
                'minute(s)'
                'seconds(s)')
            end
            object cbDelay: TCheckBox
              Left = 10
              Top = 5
              Width = 191
              Height = 17
              Caption = 'Delay task for:'
              TabOrder = 0
              OnClick = cbDelayClick
            end
            object udDelay: TUpDown
              Left = 29
              Top = 30
              Width = 16
              Height = 21
              AlignButton = udLeft
              Associate = edDelay
              Min = 1
              Max = 99
              Position = 1
              TabOrder = 2
            end
            object edDelay: TEdit
              Left = 45
              Top = 30
              Width = 31
              Height = 21
              Alignment = taRightJustify
              TabOrder = 3
              Text = '1'
            end
          end
        end
        object tsUser: TTabSheet
          ImageIndex = 3
          TabVisible = False
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object Label14: TLabel
            Left = 15
            Top = 60
            Width = 3
            Height = 13
          end
          object Label16: TLabel
            Left = 40
            Top = 153
            Width = 221
            Height = 13
            AutoSize = False
            WordWrap = True
          end
          object leDesc: TLabeledEdit
            Left = 5
            Top = 15
            Width = 241
            Height = 21
            EditLabel.Width = 57
            EditLabel.Height = 13
            EditLabel.Caption = 'Description:'
            TabOrder = 0
          end
          object gbSecurity: TGroupBox
            Left = 5
            Top = 50
            Width = 241
            Height = 176
            Caption = 'Start this task:'
            TabOrder = 1
            object rbAnyUser: TRadioButton
              Left = 15
              Top = 49
              Width = 201
              Height = 17
              Caption = 'As any user with password'
              TabOrder = 1
              OnClick = rbLoggedUserClick
            end
            object rbLoggedUser: TRadioButton
              Left = 15
              Top = 20
              Width = 211
              Height = 17
              Caption = 'As logged-on user'
              Checked = True
              TabOrder = 0
              TabStop = True
              OnClick = rbLoggedUserClick
            end
            object edPwd: TLabeledEdit
              Left = 30
              Top = 125
              Width = 171
              Height = 21
              EditLabel.Width = 50
              EditLabel.Height = 13
              EditLabel.Caption = 'Password:'
              EditLabel.WordWrap = True
              PasswordChar = '*'
              TabOrder = 3
              TextHint = 'Password'
            end
            object edUser: TLabeledEdit
              Left = 30
              Top = 85
              Width = 171
              Height = 21
              EditLabel.Width = 55
              EditLabel.Height = 13
              EditLabel.Caption = 'User name:'
              TabOrder = 2
              TextHint = 'User name'
            end
          end
        end
      end
      object rgCycle: TRadioGroup
        Left = 5
        Top = 20
        Width = 186
        Height = 181
        Caption = 'Perform this task:'
        ItemIndex = 0
        Items.Strings = (
          'Daily'
          'Weekly'
          'Monthly'
          'One time only'
          'On logon'
          'On waking up the computer')
        TabOrder = 0
        OnClick = rgCycleClick
      end
      object cbEnabled: TCheckBox
        Left = 15
        Top = 215
        Width = 171
        Height = 17
        Caption = 'Trigger enabled'
        TabOrder = 1
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 465
    Height = 46
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object edJobName: TLabeledEdit
      Left = 10
      Top = 20
      Width = 446
      Height = 21
      TabStop = False
      EditLabel.Width = 118
      EditLabel.Height = 13
      EditLabel.Caption = 'Name of scheduled task:'
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 324
    Width = 465
    Height = 46
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 1
    TabOrder = 2
    object btnCancel: TBitBtn
      Left = 360
      Top = 5
      Width = 96
      Height = 31
      Cancel = True
      Caption = 'Cancel'
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000120B0000120B00000000000000000000C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        BDD9C04049AF4049AFBDD9C0C0DCC0C0DCC0C0DCC0C0DCC0BDD9C04049AF4049
        AFBDD9C0C0DCC0C0DCC0C0DCC0C0DCC0BFDABF778077778077BFDABFC0DCC0C0
        DCC0C0DCC0C0DCC0BFDABF778077778077BFDABFC0DCC0C0DCC0C0DCC0BDD9C0
        3C44AF191AB0191AB03C44AFBDD9C0C0DCC0C0DCC0BDD9C03C44AF191AB0191A
        B03C44AFBDD9C0C0DCC0C0DCC0BFDABF757D75656665656665757D75BFDABFC0
        DCC0C0DCC0BFDABF757D75656665656665757D75BFDABFC0DCC0C0DCC04650B1
        1E1FB33B3BC83B3BC81E1FB43F47B1BDD9C0BDD9C03F47B11E1FB43C3CC83B3B
        C81E1FB44650B1C0DCC0C0DCC07C857C686A68818181818181696B69788078BF
        DABFBFDABF788078696B69828282818181696B697C857CC0DCC0C0DCC04852B3
        2324B64545CD4141CC4646CD2324B64149B24149B22324B64646CD4242CC4545
        CD2324B64852B3C0DCC0C0DCC07E877E6C6D6C8989898686868989896C6D6C79
        81797981796C6D6C8989898787878989896C6D6C7E877EC0DCC0C0DCC0BDD9C0
        444CB42829BA5050D14A4AD05050D12C2DBB2C2DBB5050D14A4AD05050D12829
        BA444CB4BDD9C0C0DCC0C0DCC0BFDABF7C847C7172719090908D8D8D90909074
        75747475749090908D8D8D9090907172717C847CBFDABFC0DCC0C0DCC0C0DCC0
        BDD9C0464EB62F30BB5959D65252D45B5BD75B5BD75353D45959D62F30BB464E
        B6BDD9C0C0DCC0C0DCC0C0DCC0C0DCC0BFDABF7E867E75767597979793939399
        99999999999393939797977576757E867EBFDABFC0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0BDD9C04850B73638C06565DB6363DB6363DB6565DB3638C04850B7BDD9
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0BFDABF8088807B7D7BA0A0A09F
        9F9F9F9F9FA0A0A07B7D7B808880BFDABFC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0BDD9C04B53B93C3EC46E6EDF6A6ADF6A6ADF6E6EDF3D3FC44B53B9BDD9
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0BFDABF828A82808180A7A7A7A5
        A5A5A5A5A5A7A7A7818281828A82BFDABFC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        BDD9C04D55BB3D3EC57676E36A6AE17777E47777E46969E17676E33D3EC54D55
        BBBDD9C0C0DCC0C0DCC0C0DCC0C0DCC0BFDABF848C84828382ADADADA6A6A6AE
        AEAEAEAEAEA5A5A5ADADAD828382848C84BFDABFC0DCC0C0DCC0C0DCC0BDD9C0
        5058BC4041C77E7EE67171E47F7FE64547C94547C97F7FE67272E47E7EE64142
        C85058BCBDD9C0C0DCC0C0DCC0BFDABF868E86838483B2B2B2ABABABB3B3B387
        8887878887B3B3B3ABABABB2B2B2848684868E86BFDABFC0DCC0C0DCC05962BE
        4647C98686E77878E58888E74748C9535BBD535BBD4748C98888E77979E58787
        E74647C95962BEC0DCC0C0DCC08B958B878887B7B7B7AFAFAFB8B8B888898888
        9088889088888988B8B8B8AFAFAFB7B7B78788878B958BC0DCC0C0DCC05B65BF
        4C4DCB8F8FE99090E94D4ECB555DC0BEDAC0BEDAC0555DC04D4ECB9090E98F8F
        E94C4DCB5B65BFC0DCC0C0DCC08D978D8B8C8BBCBCBCBDBDBD8C8D8C8B938BBF
        DBBFBFDBBF8B938B8C8D8CBDBDBDBCBCBC8B8C8B8D978DC0DCC0C0DCC0BEDAC0
        575FC05051CC5152CC575FC0BEDAC0C0DCC0C0DCC0BEDAC05860C05253CD5253
        CC5860C0BEDAC0C0DCC0C0DCC0BFDBBF8C948C8E8F8E8E8F8E8C948CBFDBBFC0
        DCC0C0DCC0BFDBBF8C948C8F908F8F908F8C948CBFDBBFC0DCC0C0DCC0C0DCC0
        BEDAC05F69C26069C2BEDAC0C0DCC0C0DCC0C0DCC0C0DCC0BEDAC06069C26069
        C2BEDAC0C0DCC0C0DCC0C0DCC0C0DCC0BFDBBF919A91919A91BFDBBFC0DCC0C0
        DCC0C0DCC0C0DCC0BFDBBF919A91919A91BFDBBFC0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
      ModalResult = 2
      NumGlyphs = 2
      TabOrder = 1
    end
    object btnNext: TBitBtn
      Left = 270
      Top = 5
      Width = 90
      Height = 31
      Caption = 'Next'
      Default = True
      Glyph.Data = {
        96090000424D9609000000000000360000002800000028000000140000000100
        18000000000060090000120B0000120B00000000000000000000C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C07D4A217D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
        4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA91567D
        4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898984F4F4FC0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C07D4A21DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
        9898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
        9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
        989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
        DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
        98984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA91
        567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC04F4F4F9898989898989898989898989898989898989898984F4F4F
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
        9898989898989898989898989898989898989898989898984F4F4FC0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
        9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
        989898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156
        DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898989898
        98989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA91567D4A
        21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC04F4F4F9898989898989898989898989898989898984F4F4FC0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C07D4A21DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
        9898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
        9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
        989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA91567D4A21
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898984F4F4FC0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC07D4A21DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC04F4F4F9898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C07D4A21DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
        9898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A217D4A21C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F4F4F4FC0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
      Layout = blGlyphRight
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnNextClick
    end
    object btnBack: TBitBtn
      Left = 180
      Top = 5
      Width = 90
      Height = 31
      Caption = 'Back'
      Glyph.Data = {
        96090000424D9609000000000000360000002800000028000000140000000100
        18000000000060090000120B0000120B00000000000000000000C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A217D4A21C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F4F4F4FC0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA91567D4A21C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC04F4F4F9898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC07D4A21DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F
        4F4F9898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA91
        56DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F989898989898989898
        4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA91567D4A21C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC04F4F4F9898989898989898989898984F4F4FC0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC07D4A21DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F
        4F9898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156
        DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898
        98989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA9156DA91
        56DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC04F4F4F989898989898989898989898989898989898989898
        4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C07D4A21DA9156DA9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F
        9898989898989898989898989898989898989898989898984F4F4FC0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA
        9156DA9156DA9156DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898989898989898
        989898989898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156
        DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98989898989898989898989898
        98989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA91
        56DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC04F4F4F989898989898989898989898989898989898
        4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC07D4A21DA9156DA9156DA9156DA9156DA91567D4A21C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC04F4F4F9898989898989898989898989898984F4F4FC0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC07D4A21DA9156DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C04F4F4F9898989898989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        7D4A21DA9156DA9156DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F98
        98989898989898984F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA91
        56DA91567D4A21C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F989898989898
        4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A21DA91567D4A21C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F9898984F4F4FC0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC07D4A217D4A21C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC04F4F4F4F4F4FC0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0
        C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DC
        C0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0
        DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0C0DCC0}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnBackClick
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'exe'
    Filter = 'Programs|*.exe|all|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Select program to be started'
    Left = 24
    Top = 327
  end
end
