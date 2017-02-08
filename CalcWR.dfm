object fCalcWR: TfCalcWR
  Left = 450
  Top = 195
  Caption = #1050#1072#1083#1100#1082#1091#1083#1103#1090#1086#1088' '#1074#1088#1077#1084#1077#1085#1080
  ClientHeight = 438
  ClientWidth = 613
  Color = clBtnFace
  Constraints.MinWidth = 291
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnUp: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 29
    Align = alTop
    TabOrder = 0
    DesignSize = (
      613
      29)
    object sp2: TShape
      Left = 288
      Top = 5
      Width = 21
      Height = 21
      Brush.Style = bsClear
      Pen.Color = clGray
      Visible = False
    end
    object imArrowFrom: TImage
      Left = 291
      Top = 7
      Width = 16
      Height = 16
      Hint = #1042#1077#1088#1085#1091#1090#1100' '#1087#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1099#1081' '#1080#1090#1086#1075
      AutoSize = True
      ParentShowHint = False
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000100B0000100B0000000000000000
        0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0A76400A76400A76400A76400A76400A76400A76400A76400
        A76400A76400D3B983C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FCA900FCA900FCA9
        00FCA900FCA900FCA900FCA900FCA900FCA900D3B983C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0FCA900FACD1BFACD1BFACD1BFACD1BFACD1BFACD1BFCA900
        D3B983C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FCA900FACD1BFACD
        1BFACD1BFACD1BFCA900FCA900D7B776C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0FCA900FACD1BFACD1BFACD1BFCA900FCA900A76400E4B24E
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FCA900FACD1BFACD
        1BFCA900FACD1BFCA900FCA900A76400E4B24EC8BDA7C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0FCA900FACD1BFCA900FCA900FCA900FACD1BFCA900FCA900
        A76400E4B24EC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FCA900FACD1BFCA9
        00E8B141FBAA05FCA900FACD1BFCA900FCA900A76400E3B24FC7BDA9C0C0C0C0
        C0C0C0C0C0C0C0C0FCA900FCA900D5B87EC0C0C0E2B354FAAA08FCA900FACD1B
        FCA900FCA900A76400EAB03AC0C0C0C0C0C0C0C0C0C0C0C0FCA900D5B87EC0C0
        C0C0C0C0C6BEACE4B24EFBAA05FCA900FACD1BFCA900FCA900DAB66DC0C0C0C0
        C0C0C0C0C0C0C0C0D5B87EC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0E3B351FAAA08
        FCA900FCA900EAB03BC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C2BFB8E3B351FBAA05E9B03EC0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C5BEAF
        DFB45DC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0}
      ShowHint = True
      OnClick = imArrowFromClick
      OnMouseEnter = imArrowFromMouseEnter
      OnMouseLeave = imArrowFromMouseLeave
    end
    object lbW: TLabel
      Left = 390
      Top = 8
      Width = 86
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1057#1072#1081#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      Visible = False
    end
    object lbWWW: TLabel
      Left = 482
      Top = 8
      Width = 123
      Height = 13
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'http://olegivanoff.xyz/soft'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      Visible = False
      OnClick = lbWWWClick
    end
    object btnClr: TBitBtn
      Left = 84
      Top = 3
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1088#1072#1089#1095#1077#1090
      Caption = #1055
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clMaroon
      Font.Height = -16
      Font.Name = 'Wingdings 2'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnClrClick
      NumGlyphs = 2
    end
    object btnClrALL: TBitBtn
      Left = 110
      Top = 3
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1042#1057#1045
      Caption = #1055
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'Wingdings 2'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnClrALLClick
    end
    object btnDelRow: TBitBtn
      Left = 58
      Top = 3
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1089#1090#1088#1086#1082#1091
      Caption = #1055
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Wingdings 2'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnDelRowClick
      NumGlyphs = 2
    end
    object btnSave: TBitBtn
      Left = 3
      Top = 3
      Width = 25
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'ZapfDingbats BT'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnSaveClick
      Glyph.Data = {
        AE020000424DAE02000000000000AE0100002800000010000000100000000100
        08000000000000010000120B0000120B00005E0000005E00000000000000FFFF
        FF00FF00FF002244100000920100008A010000730000019B020004A308000A90
        10000A6B0E000FAC1E0010A81F0010AF22000C691900698F6E00186A2500439E
        520018A632001EBA40003FD95F002682390038A4530037994F0053C271007BD9
        95006FB9830043B766004ED3750058EB84005E926E00086B2A004FB07000378F
        570066CE8F004F956A007DE3A70083E8AD005BD994001EA95F00528E6E007DF3
        B6003A8E650073EFB20065EAAD006CEFB20034BA800070F5B90068DFAB004D89
        6E005BAD92000F6C560071BAAF004C9E960092F7F30063C4C500A0FFFF00DDFF
        FF00EDFFFF0095FBFF00C1FCFD00CAFEFF00ADF9FE00BBFAFE006ECBD3009DF3
        FD008BF1FF0087E2EF0091F1FF0087EEFE0089EFFF0086EBFF0081E6FF004CC8
        E90052C9EB007EE4FF0078BACF00BFE6F200C8EAF500D2F4FF0042BDE80075DB
        FF00A5E8FF009CD7EB00E6F7FD0038ABD90038A0C80070D6FF0081D1F1000070
        A30058C7F60064CBFB0000446500FFFFFF00025C5C5C5C020202020202020202
        020202594F5A505C5C5C5C0202020202020202594D51515151574A5C5C5C5C02
        020202594C524848314B48484848495C02020259564F4231373145424246475C
        02020259554E3137302D283B3B3B44435C0259585B3134262C2F2B283838413C
        5C02595831341822192429291E3F3E395C02332A0A0A0E1F272E2525250F3F3A
        3A5C33232016100A0C132E1B20345401015C594F3620150A070B130335405C5C
        5C5C59533E32170A04070D033D3C590202020259591A1B0A0604080359595902
        0202020202211C0A0A060403020202020202020202111D141209050302020202
        0202020202020A0A0A0A0A02020202020202}
      Spacing = 1
    end
    object btnLoad: TBitBtn
      Left = 29
      Top = 3
      Width = 25
      Height = 25
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'ZapfDingbats BT'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnLoadClick
      Glyph.Data = {
        9A020000424D9A020000000000009A0100002800000010000000100000000100
        08000000000000010000120B0000120B0000590000005900000000000000FFFF
        FF00FF00FF0023440E0020471800008D0000008A0000006B0000005C00000053
        00001F481F0006920900056E0800055B0600049E09000F7A1600139D1F0015A2
        220019AB250011AA230014AD28001AAD32001FA73A0042DB620022B9470027BF
        50001C4C2B0019AB4A0027B6590040B1680073CC920078E3A6005FB78B004874
        5E0031AE72004AA67A006BEAAD0069E2AA0074F8BB0067D5A10055B0850069EE
        B2001AA86E004FC695001C6B5400A2FEFE00BAFFFF00C9FFFF00D2FFFF00D6FF
        FF00DDFFFF00EDFFFF0094FAFF0096CED3007BE1EC005FBBC7008BF1FE0087E2
        EF0091F1FF009BF1FE0074D9EA0082EAFB0089EFFF00ACF3FE0085EBFF00BBF2
        FD0081E6FF00A7EDFF0054C6E90065C5E500BDE5F200D3F4FF00E3F7FD0043BD
        E9004CC4ED0075DBFF00CBF1FF00CAEAF5001C85AD002896C20040A7D00057C7
        F50070D6FF0082D3F20046ACDB004095BB007AC3E30000446600FFFFFF000257
        5757570202020202020202020202574E4751495757575702020202020202574E
        4D4B4B4B4B52445757575702020257504E4342424242424242424A5702025754
        4E4C3721213C3D38383E4057020257564E21212B2921213834343A3957025753
        4421282B242625212D2D3B2F570257534521201E1F1F27212E2E3F3257025753
        36211D1B2A2B1E21313041333357573521211515131922213546480101572C11
        120C0F0B0E141623040A1A575757021117100807050E14181C034F0202020202
        1117110807050E14035502020202020202111710090706030202020202020202
        02021117110D030202020202020202020202021111110202020202020202}
      Spacing = 1
    end
    object ukClrAfterMem: TCheckBox
      Left = 139
      Top = 1
      Width = 138
      Height = 26
      Caption = #1059#1076#1072#1083#1103#1090#1100' '#1088#1072#1089#1095#1077#1090' '#1087#1086#1089#1083#1077' '#1087#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1086#1075#1086' '#1080#1090#1086#1075#1072
      Checked = True
      State = cbChecked
      TabOrder = 5
      WordWrap = True
      OnClick = ukClrAfterMemClick
    end
    object btnClrMem: TBitBtn
      Left = 318
      Top = 3
      Width = 25
      Height = 25
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1099#1077' '#1080#1090#1086#1075#1080
      Font.Charset = SYMBOL_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Wingdings 2'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      Visible = False
      OnClick = btnClrMemClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FFFFFFFFFFFF
        7878D45C5CCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6D
        DA8A8AE6FFFFFFFFFFFFFFFFFF6868CF0606B70909BA4040C2FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF5050D13838EE4040F78181E8FFFFFF8F8FDB0707B5
        0606B70909BA0C0CBD4141C3FFFFFFFFFFFFFFFFFFFFFFFF4C4CCD2F2FE43636
        EC3B3BF23D3DF48A8AE57F7FD75454CE0909B70808B90B0BBC0E0EC04242C5FF
        FFFFFFFFFF4949CA2626DA2C2CE03131E63535EB3636EC6C6CD9FFFFFF6868CF
        5555CF0B0BB90A0ABB0D0DBF1111C34343C54646C81E1ED12323D62727DB2B2B
        E02E2EE34F4FD0FFFFFFFFFFFFFFFFFF6868CF5555D00C0CBB0C0CBE0F0FC113
        13C51717C91B1BCE1F1FD22222D62525D94C4CCDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6969CF5656D00E0EBC0E0EBF1111C31414C61717CA1A1ACD1E1ED14848
        CAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6969D04D4DCF0C0CBD0E
        0EC01111C31414C61616C94646C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF4E4EC52E2EC41D1DC10E0EBE0E0EC01010C21313C54343C5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4FC63434C43232C53030C52F
        2FC62828C52020C41F1FC51F1FC64C4CC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        5050C63939C43636C43434C43232C53030C56868D73131C72E2EC72E2EC82D2D
        C94C4CC6FFFFFFFFFFFFFFFFFF5353C73E3EC53B3BC53939C43636C43434C44E
        4EC57070D27070D93232C62F2FC62E2EC62E2EC74D4DC6FFFFFF8989DB5454CC
        4141C63E3EC53B3BC53939C44F4FC6FFFFFFFFFFFF7171D27171D83333C53030
        C53030C53030C56969CEA8A8E59898E65353CC4141C63E3EC55050C6FFFFFFFF
        FFFFFFFFFFFFFFFF7171D27272D83535C53232C43232C48686D8FFFFFFA1A1E4
        9898E65454CC5353C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7171D27474
        D83838C47A7AD5FFFFFFFFFFFFFFFFFFA8A8E58989DBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8787D99999DEFFFFFFFFFFFF}
    end
  end
  object pnLeft: TPanel
    Left = 0
    Top = 29
    Width = 281
    Height = 390
    Align = alLeft
    Constraints.MinWidth = 281
    TabOrder = 1
    ExplicitHeight = 409
    object sgrWR: TStringGrid
      Left = 1
      Top = 1
      Width = 279
      Height = 355
      Align = alClient
      Anchors = [akLeft, akTop, akBottom]
      ColCount = 3
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goAlwaysShowEditor]
      ParentFont = False
      PopupMenu = ppMnu
      TabOrder = 0
      OnContextPopup = sgrWRContextPopup
      OnDrawCell = sgrWRDrawCell
      OnGetEditMask = sgrWRGetEditMask
      OnKeyUp = sgrWRKeyUp
      OnSelectCell = sgrWRSelectCell
      ExplicitHeight = 374
      ColWidths = (
        85
        80
        89)
    end
    object pnDnLeft: TPanel
      Left = 1
      Top = 356
      Width = 279
      Height = 33
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 375
      DesignSize = (
        279
        33)
      object Label1: TLabel
        Left = 5
        Top = 8
        Width = 49
        Height = 16
        Caption = #1048#1058#1054#1043#1054':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object sp1: TShape
        Left = 146
        Top = 6
        Width = 21
        Height = 21
        Brush.Style = bsClear
        Pen.Color = clGray
        Visible = False
      end
      object imArrowTo: TImage
        Left = 148
        Top = 8
        Width = 16
        Height = 16
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1099#1081' '#1080#1090#1086#1075
        AutoSize = True
        ParentShowHint = False
        Picture.Data = {
          07544269746D617036030000424D360300000000000036000000280000001000
          000010000000010018000000000000030000100B0000100B0000000000000000
          0000C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0DFB45DC5BEAFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0E9B03EFBAA05E3B351C2BFB8C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0EAB03BFCA9
          00A76400FAAA08E3B351C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0D5B87EC0C0C0C0
          C0C0C0C0C0C0C0C0DAB66DFCA900FCA900FCA900A76400FBAA05E4B24EC6BEAC
          C0C0C0C0C0C0D5B87EA76400C0C0C0C0C0C0C0C0C0C0C0C0EAB03AFCA900FACD
          1BFCA900FCA900A76400FAAA08E2B354C0C0C0D5B87EA76400FCA900C0C0C0C0
          C0C0C0C0C0C0C0C0C7BDA9E3B24FFCA900FACD1BFCA900FCA900A76400FBAA05
          E8B141A76400FCA900FCA900C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0E4B2
          4EFCA900FACD1BFCA900FCA900A76400C7A20FFACD1BFCA900FCA900C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C8BDA7E4B24EFCA900FACD1BFCA900FCA900
          A76400FACD1BFCA900FCA900C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0E4B24EFCA900FACD1BFCA900FACD1BFACD1BFCA900FCA900C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0D7B776FCA900FCA900FACD1B
          FACD1BFACD1BFCA900FCA900C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0D3B983FCA900FACD1BFACD1BFACD1BFACD1BFACD1BFCA900FCA900C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0D3B983FCA900FCA900FCA900FCA900FCA900
          FCA900FCA900FCA900FCA900C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0D3B983FCA9
          00FCA900FCA900FCA900FCA900FCA900FCA900FCA900FCA900FCA900C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0}
        ShowHint = True
        OnClick = imArrowToClick
        OnMouseEnter = imArrowFromMouseEnter
        OnMouseLeave = imArrowFromMouseLeave
      end
      object pITOGO: TMaskEdit
        Left = 60
        Top = 5
        Width = 85
        Height = 24
        Color = clBtnFace
        EditMask = '!99990:00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '     :  '
      end
      object pItogoDay: TEdit
        Left = 174
        Top = 8
        Width = 97
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BorderStyle = bsNone
        Color = clBtnFace
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '___'
      end
    end
  end
  object pnRes: TPanel
    Left = 281
    Top = 29
    Width = 332
    Height = 390
    Align = alClient
    TabOrder = 2
    ExplicitHeight = 409
    object pnFootIT: TPanel
      Left = 1
      Top = 356
      Width = 330
      Height = 33
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 375
      DesignSize = (
        330
        33)
      object Label2: TLabel
        Left = 4
        Top = 8
        Width = 49
        Height = 16
        Caption = #1048#1058#1054#1043#1054':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        OnDblClick = Label2DblClick
      end
      object pITOGs: TMaskEdit
        Left = 56
        Top = 5
        Width = 89
        Height = 24
        Color = clBtnFace
        EditMask = '!99990:00;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 8
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '     :  '
      end
      object pItogDaysALL: TEdit
        Left = 152
        Top = 8
        Width = 171
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        BorderStyle = bsNone
        Color = clBtnFace
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '___'
      end
    end
    object sgrIT: TStringGrid
      Left = 1
      Top = 1
      Width = 330
      Height = 355
      Align = alClient
      ColCount = 2
      DefaultRowHeight = 21
      FixedCols = 0
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnDrawCell = sgrWRDrawCell
      OnSelectCell = sgrITSelectCell
      ExplicitHeight = 374
      ColWidths = (
        230
        75)
    end
  end
  object pnSets: TPanel
    Left = 320
    Top = 120
    Width = 209
    Height = 225
    TabOrder = 3
    Visible = False
    DesignSize = (
      209
      225)
    object Shape1: TShape
      Left = 8
      Top = 181
      Width = 193
      Height = 1
      Anchors = [akLeft, akRight, akBottom]
      Pen.Color = clWhite
      ExplicitTop = 165
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 24
      Width = 195
      Height = 146
      TabOrder = 3
      object Label4: TLabel
        Left = 20
        Top = 118
        Width = 80
        Height = 13
        Caption = #1052#1072#1089#1082#1072' '#1074#1088#1077#1084#1077#1085#1080
        WordWrap = True
      end
      object cbListMask: TComboBox
        Left = 106
        Top = 114
        Width = 68
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          '9:00'
          '09:00'
          '99:00'
          '009:00'
          '099:00'
          '9:00:00'
          '09:00:00'
          '009:00:00'
          '099:00:00')
      end
      object ukNoMask: TCheckBox
        Left = 20
        Top = 86
        Width = 154
        Height = 17
        Alignment = taLeftJustify
        Caption = #1042#1074#1086#1076' '#1074#1088#1077#1084#1077#1085#1080' '#1073#1077#1079' '#1084#1072#1089#1082#1080
        TabOrder = 1
        OnClick = ukNoMaskClick
      end
      object ukSetClrAfterMem: TCheckBox
        Left = 20
        Top = 45
        Width = 154
        Height = 26
        Alignment = taLeftJustify
        Caption = #1059#1076#1072#1083#1103#1090#1100' '#1088#1072#1089#1095#1077#1090' '#1087#1086#1089#1083#1077' '#1087#1088#1086#1084#1077#1078#1091#1090#1086#1095#1085#1086#1075#1086' '#1080#1090#1086#1075#1072
        Checked = True
        State = cbChecked
        TabOrder = 2
        WordWrap = True
      end
      object ukCollapseTray: TCheckBox
        Left = 20
        Top = 14
        Width = 154
        Height = 17
        Alignment = taLeftJustify
        Caption = #1057#1074#1086#1088#1072#1095#1080#1074#1072#1090#1100' '#1074' '#1090#1088#1077#1081
        TabOrder = 3
      end
    end
    object pnHeadSets: TPanel
      Left = 1
      Top = 1
      Width = 207
      Height = 19
      Align = alTop
      Alignment = taLeftJustify
      Caption = ' '#1053#1072#1089#1090#1088#1086#1081#1082#1080
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnMouseMove = pnHeadSetsMouseMove
    end
    object btnCancelSets: TButton
      Left = 120
      Top = 190
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1042#1099#1093#1086#1076
      TabOrder = 1
      OnClick = btnCancelSetsClick
    end
    object btnOKsets: TButton
      Left = 16
      Top = 190
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      TabOrder = 2
      OnClick = btnOKsetsClick
    end
  end
  object stsBar: TStatusBar
    Left = 0
    Top = 419
    Width = 613
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        Text = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1079#1085#1072#1095#1077#1085#1080#1081
        Width = 120
      end
      item
        Width = 30
      end
      item
        Alignment = taRightJustify
        Bevel = pbNone
        Text = #1057#1088#1077#1076#1085#1077#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
        Width = 120
      end
      item
        Width = 50
      end>
    ExplicitLeft = 312
    ExplicitTop = 224
    ExplicitWidth = 0
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '*.ini'
    Left = 64
    Top = 104
  end
  object OpenDlg: TOpenDialog
    DefaultExt = '*.ini'
    Left = 160
    Top = 104
  end
  object ppMnu: TPopupMenu
    Left = 120
    Top = 176
    object ppInvert: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1085#1072#1082
      OnClick = ppInvertClick
    end
    object ppUmn: TMenuItem
      Caption = #1059#1084#1085#1086#1078#1080#1090#1100' '#1085#1072' ...'
      OnClick = ppUmnClick
    end
    object ppDiv: TMenuItem
      Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1100' '#1085#1072' ...'
      OnClick = ppDivClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object ppDelRow: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnClick = btnDelRowClick
    end
    object ppUndoDel: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1091#1076#1072#1083#1077#1085#1080#1077
      Enabled = False
      OnClick = ppUndoDelClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object ppSets: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      OnClick = ppSetsClick
    end
  end
  object ppIcon: TPopupMenu
    Left = 545
    Top = 333
    object ppOpen: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = ppOpenClick
    end
    object ppClose: TMenuItem
      Caption = #1042#1099#1093#1086#1076
      OnClick = ppCloseClick
    end
  end
end
