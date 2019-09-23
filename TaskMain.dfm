object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Demo for Delphi interface to Windows Task Scheduler 2.0'
  ClientHeight = 453
  ClientWidth = 727
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbDetails: TGroupBox
    Left = 0
    Top = 197
    Width = 727
    Height = 256
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 55
    DesignSize = (
      727
      256)
    object Label1: TLabel
      Left = 10
      Top = 143
      Width = 76
      Height = 13
      Caption = 'Time schedules:'
    end
    object edUserAccount: TLabeledEdit
      Left = 455
      Top = 115
      Width = 266
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 67
      EditLabel.Height = 13
      EditLabel.Caption = 'User account:'
      ReadOnly = True
      TabOrder = 3
    end
    object edComment: TLabeledEdit
      Left = 295
      Top = 35
      Width = 426
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 57
      EditLabel.Height = 13
      EditLabel.Caption = 'Description:'
      ReadOnly = True
      TabOrder = 4
    end
    object edCreator: TLabeledEdit
      Left = 10
      Top = 115
      Width = 156
      Height = 21
      TabStop = False
      EditLabel.Width = 41
      EditLabel.Height = 13
      EditLabel.Caption = 'Creator:'
      ReadOnly = True
      TabOrder = 5
    end
    object edStatus: TLabeledEdit
      Left = 175
      Top = 115
      Width = 111
      Height = 21
      TabStop = False
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Created:'
      ReadOnly = True
      TabOrder = 6
    end
    object edApplication: TLabeledEdit
      Left = 10
      Top = 35
      Width = 276
      Height = 21
      TabStop = False
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = 'Application:'
      ReadOnly = True
      TabOrder = 7
    end
    object edParameters: TLabeledEdit
      Left = 10
      Top = 75
      Width = 276
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      EditLabel.Width = 56
      EditLabel.Height = 13
      EditLabel.Caption = 'Arguments:'
      ReadOnly = True
      TabOrder = 8
    end
    object edWorkDir: TLabeledEdit
      Left = 295
      Top = 75
      Width = 276
      Height = 21
      TabStop = False
      EditLabel.Width = 88
      EditLabel.Height = 13
      EditLabel.Caption = 'Start in (optional):'
      ReadOnly = True
      TabOrder = 9
    end
    object lbTriggers: TListBox
      Left = 10
      Top = 160
      Width = 534
      Height = 86
      TabStop = False
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 10
    end
    object btnDelete: TBitBtn
      Left = 558
      Top = 180
      Width = 161
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = 'Delete task'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDD0000000000000DD77777777777770DD7FFBFBFBFBFB70DD7FBFBFBFBFBF
        70DD7FFBFBFBFBFB70DD7FBFBFB97FBF70DD7FFBFBF99BFB771D7FBFBFB797BF
        797D7FFFFFFF997F99DD7777777779999DDDD7FBFB7D79997DDDDD7777D79999
        7DDDDDDDDD7997D997DDDDDDDDDDDDDD997DDDDDDDDDDDDDD997}
      TabOrder = 1
      OnClick = btnDeleteClick
    end
    object btbNew: TBitBtn
      Left = 558
      Top = 145
      Width = 161
      Height = 31
      Anchors = [akRight, akBottom]
      Caption = 'New task'
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000000000000000000010000000070000000402040004FE
        0400848284000402FC0004FEFC00FC02FC00FCFEFC0000000000000000000000
        0000000000000000000000000000000000000000000000000000555555555555
        5555500000000000005522222222222220552664646464642055264646464646
        2055266460046464205526464010464620552664640104642055264646401046
        2055266666660106205522222222201025555264642555010555552222555550
        1055555555555555030555555555555550555555555555555555}
      ModalResult = 1
      TabOrder = 0
      OnClick = btbNewClick
    end
    object btbCancel: TBitBtn
      Left = 558
      Top = 215
      Width = 161
      Height = 31
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Close'
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF000000FF000000FF
        000000FF000000FF0000000000000000000080808000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF000000FF000000FF
        000000FF000000FF000000FF000000BF000000000000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000FF000000FF000000FF
        000000FF000000FF000000BF000000FF000000BF000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
        0000000000000000000000FF000000BF000000BF000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000000BF000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00000000000000000000BF000000000000FF00FF00FF00
        FF000000000000FF000000000000000000000000000000000000000000000000
        0000000000000000000000FF000000BF000000BF000000000000FF00FF000000
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000BF000000FF000000BF0000000000000000000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000BF000000000000FF00FF00FF00FF000000
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF00000000000000000000FF00FF00FF00FF00FF00FF00FF00
        FF000000000000FF000000000000000000000000000000000000000000000000
        0000000000000000000080808000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF000000000000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ModalResult = 2
      TabOrder = 2
      OnClick = btbCancelClick
    end
    object edCompat: TLabeledEdit
      Left = 580
      Top = 75
      Width = 141
      Height = 21
      TabStop = False
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = 'Compatibility:'
      ReadOnly = True
      TabOrder = 11
    end
    object edLogonType: TLabeledEdit
      Left = 295
      Top = 115
      Width = 151
      Height = 21
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'Logon type:'
      ReadOnly = True
      TabOrder = 12
    end
  end
  object lvTasks: TListView
    Left = 0
    Top = 0
    Width = 727
    Height = 197
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Columns = <
      item
        Caption = 'Name'
        Width = 200
      end
      item
        Caption = 'Status'
        Width = 75
      end
      item
        Caption = 'Last run time'
        Width = 120
      end
      item
        Caption = 'Next run time'
        Width = 120
      end>
    FlatScrollBars = True
    GridLines = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
    OnSelectItem = lvTasksSelectItem
  end
end
