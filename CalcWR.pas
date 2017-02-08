unit CalcWR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Grids, Buttons, IniFiles, Menus, ShellAPI,
  ComCtrls;   //

type
  TfCalcWR = class(TForm)
    pnUp: TPanel;
    pnLeft: TPanel;
    pnRes: TPanel;
    sgrWR: TStringGrid;
    pnDnLeft: TPanel;
    Label1: TLabel;
    pITOGO: TMaskEdit;
    sp1: TShape;
    pItogoDay: TEdit;
    pnFootIT: TPanel;
    Label2: TLabel;
    pITOGs: TMaskEdit;
    pItogDaysALL: TEdit;
    sgrIT: TStringGrid;
    btnClr: TBitBtn;
    btnClrALL: TBitBtn;
    btnDelRow: TBitBtn;
    btnSave: TBitBtn;
    btnLoad: TBitBtn;
    SaveDlg: TSaveDialog;
    OpenDlg: TOpenDialog;
    ukClrAfterMem: TCheckBox;
    btnClrMem: TBitBtn;
    sp2: TShape;
    ppMnu: TPopupMenu;
    ppUmn: TMenuItem;
    ppInvert: TMenuItem;
    N3: TMenuItem;
    ppDelRow: TMenuItem;
    pnSets: TPanel;
    pnHeadSets: TPanel;
    btnCancelSets: TButton;
    btnOKsets: TButton;
    Shape1: TShape;
    N1: TMenuItem;
    ppSets: TMenuItem;
    ppUndoDel: TMenuItem;
    ppIcon: TPopupMenu;
    ppOpen: TMenuItem;
    ppClose: TMenuItem;
    imArrowFrom: TImage;
    imArrowTo: TImage;
    ppDiv: TMenuItem;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    cbListMask: TComboBox;
    ukNoMask: TCheckBox;
    ukSetClrAfterMem: TCheckBox;
    ukCollapseTray: TCheckBox;
    lbW: TLabel;
    lbWWW: TLabel;
    stsBar: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure sgrITSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure btnDelRowClick(Sender: TObject);
    procedure btnClrClick(Sender: TObject);
    procedure btnClrALLClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnClrMemClick(Sender: TObject);
    procedure ukClrAfterMemClick(Sender: TObject);
    procedure lbRetMemClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sgrWRDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure ppInvertClick(Sender: TObject);
    procedure ppUmnClick(Sender: TObject);
    procedure sgrWRContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure sgrWRGetEditMask(Sender: TObject; ACol, ARow: Integer; var Value: String);
    procedure pHKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelSetsClick(Sender: TObject);
    procedure btnOKsetsClick(Sender: TObject);
    procedure pnHeadSetsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ppSetsClick(Sender: TObject);
    procedure ppUndoDelClick(Sender: TObject);
    procedure ukNoMaskClick(Sender: TObject);
    Procedure OnMinimizeProc(Sender:TObject);
    procedure ppCloseClick(Sender: TObject);
    procedure ppOpenClick(Sender: TObject);
    procedure sgrWRKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imArrowFromMouseEnter(Sender: TObject);
    procedure imArrowFromMouseLeave(Sender: TObject);
    procedure imArrowToClick(Sender: TObject);
    procedure imArrowFromClick(Sender: TObject);
    procedure ppDivClick(Sender: TObject);
    procedure sgrWRSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure lbWWWClick(Sender: TObject);
    procedure Label2DblClick(Sender: TObject);
  private
    { Private declarations }
    sMaskTime: string;
//    function CheckStrWR(s: string; var tWR: TPoint): Boolean;
    function GetSumWR: Integer;
    function GetCountValue: integer;
    function GetSumAllWR: Integer;
    function FormatTimeAsDays(iWR: Integer): string;
    procedure ShowItogo;
    procedure ReadGrid(ini: TIniFile; sgr: TStringGrid; Cols: integer; Row: integer = 1);
    procedure ShowGrosItogo;
    procedure EraseALL;
    procedure EraseOne;
    procedure EraseMem;
    procedure DeleteRowFromSgr(sgr: TStringGrid; R: integer);
    procedure SaveToIniSgrWR(ini: TIniFile);
    procedure SaveToIniSgrMem(ini: TIniFile);
    procedure SaveBeforeDelete(NmsSgr: string; TypeDel: integer; DelOldIni: Boolean = true);
    function DefineNumForPromItog: string;
    Procedure Ic(n:Integer; Icon:TIcon);
    procedure FormatRowTime(Col, Row: integer);
    procedure CreateHtmlFile;
    procedure LoadTimeFromFile(sNmsFile: string);
  public
    { Public declarations }
  protected
   Procedure ControlWindow(Var Msg:TMessage); message WM_SYSCOMMAND;
   Procedure IconMouse(var Msg:TMessage); message WM_USER+1;
  end;

const
 Pripusk = 10;

 clWR = 0; clMin = 1; clDec = 2; clSec = 3;
 clPrim = 0; clRes = 1; clIntRes = 2;

// ClearOneRow  = 1; вместо константы бум передавать индекс удаляемой строки
 ClearFullSgr = -1;
 ClearAllSgr  = -2;

var
  fCalcWR: TfCalcWR;
  bCollapseTray: Boolean;

implementation

uses Sets;


{$R *.dfm}

procedure TfCalcWR.FormClose(Sender: TObject; var Action: TCloseAction);
var msg: TMessage;
begin
  if bCollapseTray then begin
    Msg.WParam := SC_MINIMIZE;
    ControlWindow(msg);
    Action := caNone;
  end;
end;

procedure TfCalcWR.FormCreate(Sender: TObject);
var ini: TIniFile;
begin
  Width := pnLeft.Width + Pripusk;     // sgrWR
  pnRes.Visible := false;
  AppPath := ExtractFilePath(ParamStr(0));
  if FileExists(AppPath+'000\tmp.ini') then DeleteFile(AppPath+'000\tmp.ini');
  pItogoDay.Clear;
  pItogDaysALL.Clear;
  sgrWR.Cells[clWR,0]   := 'Время';
  sgrWR.Cells[clMin,0]  := 'В минутах';
  sgrWR.Cells[clDec,0]  := 'В долях часа';
  sgrIT.Cells[clPrim,0] := 'Подпись';
  sgrIT.Cells[clRes,0]  := 'Значение';
  sgrIT.Cells[clIntRes,0] := 'Минуты';   // невидимая колонка
  imArrowTo.Tag   := integer(sp1);
  imArrowFrom.Tag := integer(sp2);

  FrmWR := ftmMidle;

  ini := TIniFile.Create(AppPath+'Sets.ini');
  try
    ukNoMask.Checked := ini.ReadBool('CalcWR','ukNoMask',false);
    if not ukNoMask.Checked then begin
      cbListMask.ItemIndex := ini.ReadInteger('CalcWR', 'IdMask', 1);
      sMaskTime := '!' + cbListMask.Text + ';1;_';
      if cbListMask.ItemIndex > 4 then begin
        FrmWR := ftmLong;
        pITOGO.EditMask := '!99990:00:00;1;_';
        pITOGs.EditMask := '!99990:00:00;1;_';
      end;
    end else
      sMaskTime := '';

    ukClrAfterMem.Checked := ini.ReadBool('CalcWR', 'ClrAfterMem', true);
    bCollapseTray := ini.ReadBool('CalcWR', 'CollapseTray', true);
  finally
    ini.Free;
  end;

  if bCollapseTray then Application.onMinimize := OnMinimizeProc;
  ActiveControl := sgrWR;

  if ParamCount > 0 then begin
    if FileExists(ParamStr(1)) then
      LoadTimeFromFile(ParamStr(1));
  end;

end;

procedure TfCalcWR.sgrWRKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var R, C, iWR, i: Integer;
//    PointWR: TPoint;
    fWR: Extended;
    GoNewRow: Boolean;
    AlterDecPoint: char;
    sWr: string;
    dWR: TDateTime;
begin
  if (Key = 13) or (Key = VK_ADD) then begin  // Enter, "Серый +" и  or (Key = VK_SUBTRACT) "Серый минус"
    C := sgrWR.Col;
    R := sgrWR.Row;
    GoNewRow := False;
    case C of
      clWR: begin                      //
        sWr := Trim(sgrWR.Cells[C,R]);
        if ukNoMask.Checked then begin
          for i:=1 to length(sWr) do
            if (sWr[i] < '0') or (sWr[i] > '9') then
              sWr[i] := ':';
          sWr := StringReplace(sWr,'::',':',[rfReplaceAll]);
          sgrWR.Cells[C,R] := sWr;
        end;
        if (sWR = ':') or (sWr = '') or (sWr = ':  :') then
          sgrWR.Col := clMin
        else if not tryStrToTime(sWr,dWR) then begin     //  CheckStrWR(sgrWR.Cells[C,R], PointWR)
          Beep;
        end else begin
          GoNewRow := True;
        end;
      end;

      clMin: begin
        if sgrWR.Cells[C,R] = '' then
          sgrWR.Col := clDec
        else if TryStrToInt(sgrWR.Cells[C,R], iWR) then begin
          GoNewRow := True;
        end else begin
          Beep;
        end;
      end;

    else
      if sgrWR.Cells[C,R] = '' then
        sgrWR.Col := clWR
      else begin
        if DecimalSeparator = '.' then
          AlterDecPoint := ','
        else
          AlterDecPoint := '.';
        i := Pos(AlterDecPoint, sgrWR.Cells[C,R]);
        if i > 0 then begin
          sWr := sgrWR.Cells[C,R];
          sWr[i] := DecimalSeparator;
          sgrWR.Cells[C,R] := sWr;
        end;
//        sgrWR.Cells[C,R] := Copy(sgrWR.Cells[C,R],1,i-1)+','+copy(sgrWR.Cells[C,R],i+1, Length(sgrWR.Cells[C,R]));
        if TryStrToFloat(sgrWR.Cells[C,R], fWR) then begin
          GoNewRow := True;
        end else
          Beep;
      end;
    end;
    if GoNewRow then begin
      R := sgrWR.Row;
      FormatRowTime(C,R);
      if R = (sgrWR.RowCount - 1) then begin
        sgrWR.RowCount := R + 2;
        sgrWR.Row := R + 1;
      end;
      ShowItogo();
    end;
  end;
end;

procedure TfCalcWR.sgrWRSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if sgrWR.Cells[clSec,ARow] <> '' then
    Caption := 'Калькулятор времени: '+sgrWR.Cells[clSec,ARow]+' сек.'
  else
    Caption := 'Калькулятор времени';
end;

//function TfCalcWR.CheckStrWR(s: string; var tWR: TPoint): Boolean;
//var i, hh, nn, Direct: Integer;
//    snn: string;
//begin
//   Result := False;
//   tWR.X  := 0;
//   tWR.Y  := 0;
//   s := Trim(s);
//   if s <> '' then begin
//     if s[1] = '-' then begin
//       Direct := -1;
//       s := Trim(Copy(s,2,Length(s)));
//     end else
//       Direct := 1;
//
//     for i:=1 to Length(s) do
//       if not TryStrToInt(s[i], hh) then begin
//         if i <= Length(s) then begin
//           snn := Copy(s, i+1, Length(S));
//           if Length(snn) = 1 then snn := snn + '0';
//           Result := TryStrToInt(Copy(s, 1, i-1), hh) and TryStrToInt(snn, nn) and (nn < 60);
//         end;
//         Break;
//       end;
//
//     if Result then begin
//       tWR.X := hh * Direct;
//       tWR.Y := nn * Direct;
//     end;
//   end;
//end;

function TfCalcWR.GetSumWR: Integer;
var R, iWR: Integer;     //  , i
//    fWR: Extended;
//    PointWR: TPoint;
//    s: string;
begin
  Result := 0;
  for R:=1 to sgrWR.RowCount-1 do begin
    if TryStrToInt(sgrWR.Cells[clSec,R], iWR) then
      Result := Result + iWR;
  end;
end;

function TfCalcWR.GetCountValue: integer;
var R, iWR: Integer;     //  , i
begin
  Result := 0;
  for R:=1 to sgrWR.RowCount-1 do begin
    if TryStrToInt(sgrWR.Cells[clSec,R], iWR) then
      Result := Result + 1;
  end;
end;

procedure TfCalcWR.FormatRowTime(Col, Row: integer);
var sWr, sDirect: string;
    WR: TDateTime;
    fWR: currency;
    iWr, j: integer;
begin
  sWr := trim(sgrWr.Cells[Col,Row]);
  if sWr <> '' then begin
    if sWR[1] = '-' then begin
      sDirect := '-';
      delete(sWR,1,1);
    end else
      sDirect := '';
    case Col of
      clWr: begin
        for j:=1 to length(sWR) do
          if (sWR[j] < '0') or (sWR[j] > '9') then
            sWR[j] := ':';
        sWR := StringReplace(sWR,'::',':',[rfReplaceAll]);
        if TryStrToTime(sWR, WR) then begin
          sgrWR.Cells[clMin,Row] := sDirect + IntToStr(round(WR*1440));
          sgrWR.Cells[clDec,Row] := sDirect + Format('%9.7f', [WR*24]);
        end;
      end;
      clMin:
        if TryStrToInt(sWr,iWr) then begin
          sgrWR.Cells[clWr,Row]  := sDirect + FormatTimeEx(iWr*60,FrmWR);
          sgrWR.Cells[clDec,Row] := sDirect + Format('%9.7f', [iWR/60]);
        end;
    else
      if tryStrToCurr(sWr, fWR) then begin
        sgrWR.Cells[clWr,Row]  := sDirect + FormatTimeEx(fWR, cbListMask.Text);
        sgrWR.Cells[clMin,Row] := sDirect + IntToStr(TimeToSecond(fWR) div 60);
      end;
    end;
    sWR := sgrWR.Cells[clWr,Row];
    sgrWR.Cells[clSec,Row] := sDirect + IntToStr(StrToInt(sgrWR.Cells[clMin,Row])*60);   // strTimeToSec(sWR)
  end;
end;

function TfCalcWR.FormatTimeAsDays(iWR: Integer): string;
begin
  if iWR < 86400 then
    Result := '0 сут. ' + FormatTimeEx(iWR, FrmWR)
  else if (iWR mod 86400) = 0 then
    Result := IntToStr(iWR div 86400)+' сут.'
  else begin
    Result := IntToStr(iWR div 86400) + ' сут. ' + FormatTimeEx(iWR, ftmShort);
  end;
end;

procedure TfCalcWR.sgrITSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if ACol = clPrim then
    sgrIT.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goEditing]
  else
    sgrIT.Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect];
end;

function TfCalcWR.GetSumAllWR: Integer;
var R, n: Integer;
begin
  Result := 0;
  for R:=1 to sgrIT.RowCount-1 do
    if TryStrToInt(sgrIT.Cells[clSec,R], n) then
      Result := Result + n;
end;

procedure TfCalcWR.btnDelRowClick(Sender: TObject);
var R: Integer;
begin
  R := sgrWR.Row;
  if (R < (sgrWR.RowCount-1)) or (sgrWR.Cells[clWr,R] <> '') or (sgrWR.Cells[clMin,R] <> '') or (sgrWR.Cells[clDec,R] <> '') then begin
    DeleteRowFromSgr(sgrWR, R);
    ShowItogo();
    sgrWR.SetFocus;
  end;
  sgrWR.SetFocus;
end;

procedure TfCalcWR.btnClrClick(Sender: TObject);
begin
  if MessageDlg('Очистить таблицу текущего расчета?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    SaveBeforeDelete('sgrWR', ClearFullSgr);
    EraseOne();
    ppUndoDel.Enabled := true;
  end;
  sgrWR.SetFocus;
end;

procedure TfCalcWR.btnClrALLClick(Sender: TObject);
begin
  if MessageDlg('Удалить ВСЕ расчеты?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    SaveBeforeDelete('sgrWR', ClearAllSgr, false);
    SaveBeforeDelete('sgrIT', ClearAllSgr, false);
    EraseALL();
    ppUndoDel.Enabled := true;
  end;
  sgrWR.SetFocus;
end;

procedure TfCalcWR.ShowItogo;
var iWR, iCnt: integer;
begin
  iWR := GetSumWR();   // считаем время в секундах
  if iWR = 0 then
    pITOGO.Clear
  else
    pITOGO.Text := FormatTimeEx(iWR, FrmWR);

  if iWR >= 86400 then
    pItogoDay.Text := FormatTimeAsDays(iWR)
  else
    pItogoDay.Clear;

  iCnt := GetCountValue();
  stsBar.Panels[1].Text := IntToStr(iCnt);
  if iCnt > 0 then begin
    stsBar.Panels[3].Text := FormatTimeEx(round(iWR/iCnt), FrmWR)+'   или '+IntToStr(round(iWR/iCnt) div 60)+' мин.  или '+format('%9.7f',[iWR/iCnt/3600])+' долей ч.';
  end else
    stsBar.Panels[3].Text := '';
end;


procedure TfCalcWR.btnSaveClick(Sender: TObject);
var C,R, iWR: Integer;
    ini: TIniFile;
begin
  C := sgrWR.Col;
  R := sgrWR.Row;
  if (sgrWR.RowCount = 2) and (not TryStrToInt(sgrWR.Cells[C,R], iWR)) and (not pnRes.Visible) then begin
    ShowMessage('Кажись, сохранять нечего...');
  end else begin
    if not DirectoryExists(AppPath+'000') then MkDir(AppPath+'000');
    SaveDlg.InitialDir := AppPath + '000';
    SaveDlg.FileName   := AppPath + '000\Расчет '+FormatDateTime('yymmdd hhnn', Now())+'.ini';
    if SaveDlg.Execute then begin
      if FileExists(SaveDlg.FileName) then DeleteFile(SaveDlg.FileName);
      ini := TIniFile.Create(SaveDlg.FileName);
      try
        SaveToIniSgrWR(ini);
        SaveToIniSgrMem(ini);
        ini.UpdateFile;
      finally
        ini.Free;
      end;
    end;
  end;
  sgrWR.SetFocus;
end;

procedure TfCalcWR.btnLoadClick(Sender: TObject);
var ini: TIniFile;
    uk: Boolean;
    R: integer;
begin
  OpenDlg.InitialDir := AppPath + '000';
  if OpenDlg.Execute then begin
//    EraseALL();
    EraseOne();
    uk := ukClrAfterMem.Checked;
    ini := TIniFile.Create(OpenDlg.FileName);
    try
      ukClrAfterMem.Checked := False;
      ReadGrid(ini, sgrWR, clSec);
      ShowItogo();
      if ini.SectionExists('sgrIT') then
        if ini.ReadBool('sgrIT', 'Visible', false) then begin
          R := 1;
          if sgrIT.Cells[1,1] <> '' then
            if MessageDlg('Очистить таблицу промежуточных итогов?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
              EraseMem()
            else
              R := sgrIT.RowCount;
          ReadGrid(ini, sgrIT, clSec, R);   // будУт прочитанЫ невидимыЕ столбцЫ
          ShowGrosItogo();
          pnRes.Visible := True;
          imArrowFrom.Visible := True;
          btnClrMem.Visible := True;
          Width := 620;
        end;
      sgrWR.Row := sgrWR.RowCount - 1;
      sgrWR.SetFocus;
    finally
      ukClrAfterMem.Checked := uk;
      ini.Free;
    end;
  end;
  sgrWR.SetFocus;
end;

procedure TfCalcWR.ReadGrid(ini: TIniFile; sgr: TStringGrid; Cols: integer; Row: integer = 1);
var C, R: Integer;
    sSgr: string;
begin
  sSgr := sgr.Name;
  C := 0;
  if Row = sgr.RowCount then sgr.RowCount := Row + 1;
  R := 1;   // номер строки из ini-файла
  while ini.ValueExists(sSgr, 'Cell'+IntToStr(C)+'_'+IntToStr(R)) do begin
    sgr.Cells[C,Row] := ini.ReadString(sSgr, 'Cell'+IntToStr(C)+'_'+IntToStr(R), '0');
    if C < Cols then
      inc(C)
    else begin
      C := 0;
      inc(R);
      inc(Row);
      if ini.ValueExists(sSgr, 'Cell'+IntToStr(C)+'_'+IntToStr(R)) then sgr.RowCount := Row + 1;
    end;
  end;
end;

procedure TfCalcWR.ShowGrosItogo;
var iWR: Integer;
    sWR: string;
begin
  iWR := GetSumAllWR();    // время в секундах
  pITOGs.Text := FormatTimeEx(iWR, FrmWR);
  if iWR >= 86400 then begin
    pItogDaysALL.Width := 171;  // sgrIT.Width - 157;    ???? никак не устанавливается, только тупо 
    sWR := FormatTimeAsDays(iWR);
    pItogDaysALL.Text := sWR;
  end else
    pItogDaysALL.Clear;
end;

procedure TfCalcWR.EraseALL;
begin
  EraseOne();
  EraseMem();
end;

procedure TfCalcWR.EraseOne;
var R, C: Integer;
begin
  for R:=1 to sgrWR.RowCount -1 do
    for C:=clWR to clSec do
      sgrWR.Cells[C,R] := '';
  sgrWR.RowCount := 2;
  pITOGO.Clear;
  pItogoDay.Clear;
  sgrWR.SetFocus;
  sgrWR.EditorMode := True;
end;

procedure TfCalcWR.btnClrMemClick(Sender: TObject);
begin
  if MessageDlg('Удалить промежуточные итоги?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    SaveBeforeDelete('sgrIT', ClearFullSgr);
    EraseMem();
  end;
end;

procedure TfCalcWR.EraseMem;
var R,C: Integer;
begin
  for R:=1 to sgrIT.RowCount -1 do
    for C:=clPrim to clSec do
      sgrIT.Cells[C,R] := '';
  sgrIT.RowCount := 2;
  pITOGs.Clear;
  pItogDaysALL.Clear;
  sgrWR.SetFocus;
  pnRes.Visible       := False;
  imArrowFrom.Visible := False;
  btnClrMem.Visible   := False;
  Width := pnLeft.Width + Pripusk;
end;

procedure TfCalcWR.ukClrAfterMemClick(Sender: TObject);
begin
  if (Self.Showing) and (sgrWR.CanFocus) then sgrWR.SetFocus;
end;

procedure TfCalcWR.lbRetMemClick(Sender: TObject);
var R,iWR: Integer;
begin
  R := sgrIT.Row;
  if TryStrToInt(sgrIT.Cells[clSec,R], iWR) then begin
    if sgrIT.RowCount > 2 then
      DeleteRowFromSgr(sgrIT, R)
    else
      EraseMem();
    R := sgrWR.RowCount - 1;
    if (sgrWR.Cells[clWR,R] <> '') or (sgrWR.Cells[clMin,R] <> '') or (sgrWR.Cells[clDec,R] <> '') then begin
      inc(R);
      sgrWR.RowCount := R + 1;
    end;
    sgrWR.Cells[clWR,R]  := FormatTimeEx(iWR, FrmWR);
    sgrWR.Cells[clMin,R] := IntToStr(iWR div 60);
    sgrWR.Cells[clDec,R] := Format('%9.7f', [iWR/3600]);
    sgrWR.Cells[clSec,R] := IntToStr(iWR);
    sgrWR.RowCount := R + 2;
    sgrWR.Row := R+1;
    ShowItogo();
    sgrWR.SetFocus;
  end else
    ShowMessage('Что-то не так...');
end;

procedure TfCalcWR.FormResize(Sender: TObject);
begin
  if not pnRes.Visible then
    pnLeft.Width := Width - 10;
  lbWWW.Visible := pnUp.Width > 424;
  lbW.Visible   := pnUp.Width > 532;
end;

procedure TfCalcWR.DeleteRowFromSgr(sgr: TStringGrid; R: integer);
var C: Integer;
begin
  SaveBeforeDelete(sgr.Name, R);       //  'sgrWR'

  if (R < (sgr.RowCount-1)) then begin
    for R:=sgr.Row to sgr.RowCount -1 do
      for C:=0 to clSec do
        sgr.Cells[C,R] := sgr.Cells[C,R+1];
  end;

  R := sgr.RowCount - 1;
  for C:=clWR to clSec do sgr.Cells[C,R] := '';

  if (sgr.RowCount > 2) then
    sgr.RowCount := sgr.RowCount - 1;

  ppUndoDel.Enabled := true;
end;

procedure TfCalcWR.sgrWRDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
const DX = 3; DY = 2;
var sgr: TStringGrid;
    cellAlign: Integer;
    S: array[0..255] of Char;
    Text: string;
begin
  sgr := TStringGrid(Sender);
  with sgr.Canvas, Rect do begin
    if (sgr.Name = 'sgrWR') or (ACol = 1) then
      cellAlign := 1           // RIGHT
    else
      cellAlign := 0;          // LEFT

    Text := sgr.Cells[ACol,ARow];
    if Text <> '' then begin
      if (ARow > 0) and (ACol <> 0) and (length(Text) > 12) then Text := copy(Text,1,12);

      if Text[1] = '-' then
        Font.Color := clRed
      else if ARow > 0 then
        Font.Color := clBlue
      else
        Font.Color := clBlack;

      if gdSelected in State then Brush.Color := clWhite;

      case cellAlign of
        0: ExtTextOut(Handle, Left + DX, Top + DY, ETO_OPAQUE or ETO_CLIPPED,
                      @Rect, StrPCopy(S, Text), Length(Text), nil);             // LEFT
        1: ExtTextOut(Handle, Right - TextWidth(Text) - DX, Top + DY, ETO_OPAQUE or ETO_CLIPPED,
                      @Rect, StrPCopy(S, Text), Length(Text), nil);             // RIGHT
      else
        ExtTextOut(Handle, Left + (Right - Left - TextWidth(Text)) div 2, Top + DY,
                   ETO_OPAQUE or ETO_CLIPPED, @Rect, StrPCopy(S, Text), Length(Text), nil);  // CENTER
      end;   // }
    end;
  end;
end;

procedure TfCalcWR.ppInvertClick(Sender: TObject);
var R, iWR: Integer;
begin
  R := sgrWR.Row;
  if TryStrToInt(sgrWR.Cells[clSec,R], iWR) then begin
    sgrWR.Cells[clWR,R]  := FormatTimeEx(-iWr, FrmWR);
    sgrWR.Cells[clMin,R] := IntToStr(-iWr div 60);
    sgrWR.Cells[clDec,R] := Format('%9.7f', [-iWR/3600]);
    sgrWR.Cells[clSec,R] := IntToStr(-iWr);
    ShowItogo();
  end else
    ShowMessage('Выберите ячейку, содержащую корректное значение!');
end;

procedure TfCalcWR.ppUmnClick(Sender: TObject);
var R, N, iWR: Integer;
    sN: string;
begin
  R := sgrWR.Row;
  if (TryStrToInt(sgrWR.Cells[clSec,R], iWR)) then begin
    sN := InputBox('Умножение '+sgrWR.Cells[clWR,R]+' на...', 'Укажите целое неотрицательное число', '2');
    if TryStrToInt(sN, N) and (N > 0) then begin
      iWR := iWR * n;
      sgrWR.Cells[clWR,R]  := FormatTimeEx(iWr, FrmWR);
      sgrWR.Cells[clMin,R] := IntToStr(iWr div 60);
      sgrWR.Cells[clDec,R] := Format('%9.7f', [iWR/3600]);
      sgrWR.Cells[clSec,R] := IntToStr(iWR);
      ShowItogo();
    end else
      ShowMessage('Введено не корректное значение!');
  end else
    ShowMessage('Выберите ячейку, содержащую корректное значение!');
end;

procedure TfCalcWR.sgrWRContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var C,R,x,y: Integer;
begin
  for x:=0 to ppMnu.Items.Count-1 do
    ppMnu.Items[x].Enabled := true;
  x := MousePos.X;
  y := MousePos.Y;
  sgrWR.MouseToCell(X, Y, c, r);
  if (R < 0) or (C < 0) then begin
    for x:=0 to ppMnu.Items.Count-1 do
      ppMnu.Items[x].Enabled := false;
    ppSets.Enabled := True;
    ppUndoDel.Enabled := FileExists(AppPath+'000\tmp.ini');
  end else begin
    sgrWR.Row := R;
    sgrWR.Col := C;
  end;
end;

procedure TfCalcWR.sgrWRGetEditMask(Sender: TObject; ACol, ARow: Integer; var Value: String);
begin
  if (ACol = clWR) and (sgrWR.EditorMode) then Value := sMaskTime;
end;

procedure TfCalcWR.pHKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key < '1') or (Key > '9')) and (Key <> #8) then Key := #0;
end;

procedure TfCalcWR.btnCancelSetsClick(Sender: TObject);
begin
  pnLeft.Enabled := True;
  pnUp.Enabled   := True;
  pnRes.Enabled  := True;
  sgrWR.SetFocus;
  pnSets.Visible := False;
end;

procedure TfCalcWR.btnOKsetsClick(Sender: TObject);
var ini: TIniFile;
//    n: Integer;
begin
   if (not ukNoMask.Checked) and (cbListMask.ItemIndex < 0) then
     ShowMessage('Выберите в списке маску или установите флажок "Без маски"!')
   else begin
     ini := TIniFile.Create(AppPath+'Sets.ini');
     try
       ini.WriteBool('CalcWR', 'ukNoMask', ukNoMask.Checked);
       ini.WriteInteger('CalcWR', 'IdMask', cbListMask.ItemIndex);
       ini.WriteBool('CalcWR', 'ClrAfterMem', ukSetClrAfterMem.Checked);
       ini.WriteBool('CalcWR', 'CollapseTray', ukCollapseTray.Checked);
       ini.UpdateFile;
     finally
       ini.Free;
     end;

     pITOGO.EditMask := '!99990:00:;1;_';
     pITOGs.EditMask := '!99990:00;1;_';

     if not ukNoMask.Checked then begin
       sMaskTime := '!' + cbListMask.Text + ';1;_';
       if cbListMask.ItemIndex > 4 then begin
         pITOGO.EditMask := '!99990:00:00;1;_';
         pITOGs.EditMask := '!99990:00:00;1;_';
       end;
     end else
       sMaskTime := '';
     ukClrAfterMem.Checked := ukSetClrAfterMem.Checked;
     bCollapseTray := ukCollapseTray.Checked;
     btnCancelSetsClick(nil);
   end;
end;

procedure TfCalcWR.pnHeadSetsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
const SC_DRAGMOVE = $F012;
begin
  ReleaseCapture;
  TPanel(TPanel(Sender).Parent).Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TfCalcWR.ppSetsClick(Sender: TObject);
var ini: TIniFile;
//    i: Integer;
begin
  pnSets.Left := (ClientWidth div 2) - (pnSets.Width div 2);
  pnSets.Top  := (ClientHeight div 2) - (pnSets.Height div 2);
  ini := TIniFile.Create(AppPath+'Sets.ini');
  try
    ukSetClrAfterMem.Checked := ini.ReadBool('CalcWR', 'ClrAfterMem', ukClrAfterMem.Checked);
    ukNoMask.Checked := ini.ReadBool('CalcWR','ukNoMask', false);
    if not ukNoMask.Checked then begin
      cbListMask.ItemIndex := ini.readInteger('CalcWR','IdMask',1);
    end;
    ukCollapseTray.Checked := bCollapseTray;  // ini.ReadBool('CalcWR', 'CollapseTray', true);
  finally
    ini.Free;
  end;
  pnSets.Visible := True;
  pnSets.SetFocus;
  pnUp.Enabled   := False;
  pnLeft.Enabled := False;
  pnRes.Enabled  := False;
end;

procedure TfCalcWR.SaveToIniSgrWR(ini: TIniFile);
var C,R: Integer;
begin
   for R:=1 to sgrWR.RowCount-1 do begin
     for C:=0 to clSec do begin
       ini.WriteString('sgrWR', 'Cell'+IntToStr(C)+'_'+IntToStr(R), sgrWR.Cells[C,R]);
     end;
   end;
   C := 0;
   R := sgrWR.RowCount;
   while ini.ValueExists('sgrWr', 'Cell'+IntToStr(C)+'_'+IntToStr(R)) do begin
     ini.DeleteKey('sgrWr', 'Cell'+IntToStr(C)+'_'+IntToStr(R));
     if C < (sgrWR.ColCount-1) then
       inc(C)
     else begin
       C := 0;
       inc(R);
     end;
   end;
end;

procedure TfCalcWR.SaveToIniSgrMem(ini: TIniFile);
var C,R: Integer;
begin
  if pnRes.Visible then begin
    ini.WriteBool('sgrIT', 'Visible', true);
    for R:=1 to sgrIT.RowCount-1 do begin
      for C:=0 to clSec do       // сохраняем невидимЫЕ колонкИ тоже
        ini.WriteString('sgrIT', 'Cell'+IntToStr(C)+'_'+IntToStr(R), sgrIT.Cells[C,R]);
    end;
  end else if ini.SectionExists('sgrIT') then
    ini.WriteBool('sgrRes', 'Visible', false);
end;

procedure TfCalcWR.SaveBeforeDelete(NmsSgr: string; TypeDel: integer; DelOldIni: Boolean);
var ini: TIniFile;
begin
  if not DirectoryExists(AppPath+'000') then MkDir(AppPath+'000');
  if DelOldIni and FileExists(AppPath+'000\tmp.ini') then DeleteFile(AppPath+'000\tmp.ini');
  ini := TIniFile.Create(AppPath+'000\tmp.ini');
  try
    if NmsSgr = 'sgrWR' then
      SaveToIniSgrWR(ini)
    else
      SaveToIniSgrMem(ini);
    ini.WriteInteger(NmsSgr, 'TypeDel', TypeDel);
  finally
    ini.Free;
  end;
end;

procedure TfCalcWR.ppUndoDelClick(Sender: TObject);
var ini: TIniFile;
    uk: Boolean;
    R,Rr: Integer;
begin
  if not FileExists(AppPath+'000\tmp.ini') then
    ShowMessage('Нет данных для восстановления!')
  else begin
    uk := ukClrAfterMem.Checked;
    ini := TIniFile.Create(AppPath+'000\tmp.ini');
    try
      ukClrAfterMem.Checked := False;
      R := ini.ReadInteger('sgrWR', 'TypeDel', -3);
      if (R = ClearFullSgr) or (R = ClearAllSgr) then begin
        if (MessageDlg('Выполнить восстановление удаленых данных?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then begin
          EraseOne();
          ReadGrid(ini, sgrWR, sgrWR.ColCount-1);
          if R = ClearAllSgr then begin
            EraseMem();
            ReadGrid(ini, sgrIT, sgrIT.ColCount);
            ShowGrosItogo();
            if TryStrToInt(sgrIT.Cells[clIntRes,1], Rr) then begin
              pnRes.Visible       := True;
              imArrowFrom.Visible := True;
              btnClrMem.Visible   := True;
              if Width < 620 then Width := 620;
            end;
          end;
        end;
      end else if (R > 0) and ini.ValueExists('sgrWR', 'Cell0_'+IntToStr(R)) then begin
        Rr := sgrWR.RowCount-1;
        if (sgrWR.Cells[clMin,Rr] = '') and (sgrWR.Cells[clDec,Rr] = '') and
           ((sgrWR.Cells[clWR,Rr] = '') or ((Trim(sgrWR.Cells[clWR,Rr]) = ':'))) then
          //
        else begin
          inc(Rr);
        end;
        sgrWR.Cells[clWR,Rr]  := ini.ReadString('sgrWR', 'Cell'+IntToStr(clWR)+'_'+IntToStr(R), '0');
        sgrWR.Cells[clMin,Rr] := ini.ReadString('sgrWR', 'Cell'+IntToStr(clMin)+'_'+IntToStr(R), '0');
        sgrWR.Cells[clDec,Rr] := ini.ReadString('sgrWR', 'Cell'+IntToStr(clDec)+'_'+IntToStr(R), '0');
        sgrWR.RowCount := Rr + 2;

        ppUndoDel.Enabled := false;
        deleteFile(AppPath+'000\tmp.ini');
        
      end else
        ShowMessage('Строка для восстановления не найдена!');
    finally
      ukClrAfterMem.Checked := uk;
      ini.Free;
    end;
    ShowItogo();
    sgrWR.Row := sgrWR.RowCount - 1;
    sgrWR.SetFocus;
  end;
end;

procedure TfCalcWR.ukNoMaskClick(Sender: TObject);
begin
  if ukNoMask.Checked then
    cbListMask.ItemIndex := -1;
  cbListMask.Enabled := not ukNoMask.Checked;
end;

function TfCalcWR.DefineNumForPromItog: string;
var R, n, maxN, j, Len: Integer;
    s, sN: string;
begin
  Result := '1';
  maxN := 0;
  Len := Length('Промежуточный итог ');
  for R:=1 to sgrIT.RowCount-1 do begin
    if Copy(sgrIT.Cells[clPrim,R],1,Len) = 'Промежуточный итог ' then begin
      s := Copy(sgrIT.Cells[clPrim,R],Len+1,99);
      sN := '';
      for j:=1 to Length(s) do begin
        if TryStrToInt(s[j],n) then sN := sN + s[j] else Break;
      end;
      if TryStrToInt(sN,n) then
        if n > maxN then maxN := n;
    end;
  end;
  if maxN > 0 then Result := IntToStr(maxN+1);
end;

procedure TfCalcWR.Ic(n: Integer; Icon: TIcon);
Var Nim: TNotifyIconData;
begin
  With Nim do Begin
    cbSize := SizeOf(Nim);
    Wnd    := Handle;
    uID    := 1;
    uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
    hicon  := Icon.Handle;
    uCallbackMessage := wm_user+1;
    szTip := 'Калькулятор времени';
  end;
  Case n OF
    1: Shell_NotifyIcon(Nim_Add, @Nim);
    2: Shell_NotifyIcon(Nim_Delete, @Nim);
    3: Shell_NotifyIcon(Nim_Modify, @Nim);
  End;
end;

procedure TfCalcWR.ControlWindow(var Msg: TMessage);
begin
  IF (bCollapseTray) and (Msg.WParam = SC_MINIMIZE) then Begin
    Ic(1, Application.Icon);     // Добавляем значок в трей
    ShowWindow(Handle,SW_HIDE);  // Скрываем программу
    ShowWindow(Application.Handle,SW_HIDE);  // Скрываем кнопку с TaskBar'а
  End else
    inherited;
end;

procedure TfCalcWR.CreateHtmlFile;
var tS: TStringList;
begin
  tS := TStringList.Create;
  try
    tS.Add('<!DOCTYPE html>');

    tS.Add('<html>');
    tS.Add('<header>');
    tS.Add('  <title>Сайт программы "Калькулятор часов"</title>');
    tS.Add('  <meta charset="utf-8">');
    tS.Add('  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>');

    tS.Add('  <style>');
    tS.Add('    html { height: 100%; }');
    tS.Add('    body { height: 100%; }');
    tS.Add('    #max {');
    tS.Add('      display: flex;');
    tS.Add('      justify-content: center;');
    tS.Add('      align-items: center;');
    tS.Add('      font-size: 21px;');
    tS.Add('      height: 75%;');
    tS.Add('    }');
    tS.Add('  </style>');

    tS.Add('  <script>');
    tS.Add('    $(document).ready(function(){');
    tS.Add('      document.location.replace("http://olegivanoff.xyz/soft");');
    tS.Add('    });');
    tS.Add('  </script>');
    tS.Add('</header>');
    tS.Add('  <div id="max">');
    tS.Add('    <a href="http://olegivanoff.xyz/soft">Сайт программы "Калькулятор часов"</a>');
    tS.Add('  </div>');
    tS.Add('<body>');

    tS.Add('</body>');

    tS.Add('</html>');
  finally
    tS.SaveToFile(AppPath+'index.html');
    tS.Free;
  end;
end;

procedure TfCalcWR.OnMinimizeProc(Sender: TObject);
begin
  PostMessage(Handle, WM_SYSCOMMAND, SC_MINIMIZE,0);
end;

procedure TfCalcWR.IconMouse(var Msg: TMessage);
Var p:tpoint;
begin
  GetCursorPos(p);      // Запоминаем координаты курсора мыши
  Case Msg.LParam OF  // Проверяем какая кнопка была нажата
    WM_LBUTTONUP,WM_LBUTTONDBLCLK: {Действия, выполняемый по одинарному или двойному щелчку левой кнопки мыши на значке. В нашем случае это просто активация приложения}
     Begin
      Ic(2,Application.Icon);                  // Удаляем значок из трея
      ShowWindow(Application.Handle, SW_SHOW); // Восстанавливаем кнопку программы
      ShowWindow(Handle, SW_SHOW);             // Восстанавливаем окно программы
     End;
    WM_RBUTTONUP: {Действия, выполняемый по одинарному щелчку правой кнопки мыши}
     Begin
      SetForegroundWindow(Handle);  // Восстанавливаем программу в качестве переднего окна
      ppIcon.Popup(p.X,p.Y);        // Заставляем всплыть тот самый TPopUp о котором я говорил чуть раньше
      PostMessage(Handle, WM_NULL, 0, 0);
     end;
  End;
end;

procedure TfCalcWR.imArrowFromClick(Sender: TObject);
var R,iWR, iX: Integer;
    wr: TDateTime;
    fX: extended;
begin
  R := sgrIT.Row;
  if not pnRes.Visible then
    Width := 281 + Pripusk
  else
  if TryStrToInt(sgrIT.Cells[clSec,R], iWR) then begin
    if sgrIT.RowCount > 2 then begin
      DeleteRowFromSgr(sgrIT, R);
      ShowGrosItogo();
    end else
      EraseMem();
    R := sgrWR.RowCount - 1;
    if (TryStrToTime(sgrWR.Cells[clWR,R], wr)) or (tryStrToInt(sgrWR.Cells[clMin,R],iX)) or (tryStrToFloat(sgrWR.Cells[clDec,R],fX)) then begin
      inc(R);
      sgrWR.RowCount := R + 1;
    end;
    sgrWR.Cells[clWR,R]  := FormatTimeEx(iWR, FrmWR);
    sgrWR.Cells[clMin,R] := IntToStr(iWR div 60);
    sgrWR.Cells[clDec,R] := Format('%9.7f', [iWR/3600]);
    sgrWR.Cells[clSec,R] := IntToStr(iWR);
    sgrWR.RowCount := R + 2;
    sgrWR.Row := R+1;
    ShowItogo();
    sgrWR.SetFocus;
  end;
//  else
//    ShowMessage('Что-то не так...');
end;

procedure TfCalcWR.imArrowFromMouseEnter(Sender: TObject);
begin
  TShape(Ptr(TControl(Sender).tag)).Visible := True;
end;

procedure TfCalcWR.imArrowFromMouseLeave(Sender: TObject);
begin
  TShape(Ptr(TControl(Sender).tag)).Visible := false;
end;

procedure TfCalcWR.imArrowToClick(Sender: TObject);
var iWR, R: Integer;
begin
  iWR := GetSumWR();
  R := sgrIT.RowCount - 1;
  if iWR <> 0 then begin
    pnRes.Visible       := True;
    imArrowFrom.Visible := True;
    btnClrMem.Visible   := True;
    if sgrIT.Cells[clRes,R] <> '' then begin
      sgrIT.RowCount := R + 2;
      Inc(R);
    end;
    sgrIT.Cells[clPrim,R] := 'Промежуточный итог '+DefineNumForPromItog();
    sgrIT.Cells[clRes,R]  := pITOGO.Text;
    sgrIT.Cells[clSec,R]  := IntToStr(iWR);
    ShowGrosItogo();
    if ukClrAfterMem.Checked then begin
      SaveBeforeDelete('sgrWR', ClearFullSgr);
      EraseOne();
    end;
  end;
  if not pnRes.Visible then
    Width := pnLeft.Width + Pripusk;
  if Width < 620 then Width := 620;
end;

procedure TfCalcWR.Label2DblClick(Sender: TObject);
begin
  ShowMessage('Top  = '+IntToStr(pItogDaysALL.Top)+eol+
              'Left = '+IntToStr(pItogDaysALL.Left)+eol+
              'Width = '+IntToStr(pItogDaysALL.Width)+eol+
              'Text = '+pItogDaysALL.Text);
end;

procedure TfCalcWR.lbWWWClick(Sender: TObject);
var iBrowse: PChar;
begin
  if not FileExists(AppPath+'index.html') then CreateHtmlFile();
  GetMem(iBrowse,255);
  try
    FindExecutable(PChar(AppPath+'index.html'),'',iBrowse);
    ShellExecute(0,'open',iBrowse,PAnsiChar(lbWWW.Caption),nil,SW_RESTORE);
  finally
    FreeMem(iBrowse);
  end;
end;

procedure TfCalcWR.LoadTimeFromFile(sNmsFile: string);
var ini: TIniFile;
    iWR,R,C: integer;
    sNmsKey, sWR, sDirect: string;
    ukBreak: boolean;
begin
  ini := TIniFile.Create(sNmsFile);
  try
    R := 1;
    while True do begin

      ukBreak := true;

      for C:=0 to 3 do begin
        sNmsKey := 'Cell'+IntToStr(C)+'_'+IntToStr(R);
        if ini.ValueExists('sgrWR', sNmsKey) then begin
          
          sWR := ini.ReadString('sgrWR', sNmsKey, '0');
          sgrWR.Cells[C,R] := sWR;

          if sWR <> '' then begin

            ukBreak := false;
            if sWR[1] = '-' then begin
              sDirect := '-';
              delete(sWR,1,1);
            end else
              sDirect := '';

            case C of
              0: iWR := strTimeToSec(sWR);
              1: iWR := StrToIntDef(sWR,0)*60;
              2: iWR := TimeToSecond(StrToCurrDef(sWR,0.0));
            else
              iWR := strToIntDef(sWR,0);  // секунды
            end;

            if sgrWR.Cells[0,R] = '' then sgrWR.Cells[0,R] := sDirect + FormatTimeEx(iWr,FrmWR);
            if sgrWR.Cells[1,R] = '' then sgrWR.Cells[1,R] := sDirect + IntToStr(iWr div 60);
            if sgrWR.Cells[2,R] = '' then sgrWR.Cells[2,R] := sDirect + Format('%9.7f', [iWR/3600]);
            if sgrWR.Cells[3,R] = '' then sgrWR.Cells[3,R] := sDirect + IntToStr(iWR);

          end;

        end;
      end;

      if ukBreak then break;

      inc(R);
      if sgrWR.RowCount <= R then sgrWR.RowCount := R + 1;

    end;
    
    sgrWR.RowCount := R + 1;
    sgrWR.Row := R;
    ShowItogo();

  finally
    ini.Free;
  end;
end;

procedure TfCalcWR.ppCloseClick(Sender: TObject);
begin
  bCollapseTray := false;
  Close;
end;

procedure TfCalcWR.ppDivClick(Sender: TObject);
var R, N, iWR: Integer;
    sN: string;
begin
  R := sgrWR.Row;
  if (TryStrToInt(sgrWR.Cells[clSec,R], iWR)) then begin
    sN := InputBox('Деление '+sgrWR.Cells[clWR,R]+' на...', 'Укажите целое неотрицательное число', '2');
    if TryStrToInt(sN, N) and (N > 0) then begin
      iWR := round(iWR / n);
      sgrWR.Cells[clWR,R]  := FormatTimeEx(iWr, FrmWR);
      sgrWR.Cells[clMin,R] := IntToStr(iWr div 60);
      sgrWR.Cells[clDec,R] := Format('%9.7f', [iWR/3600]);
      sgrWR.Cells[clSec,R] := IntToStr(iWR);
      ShowItogo();
    end else
      ShowMessage('Введено не корректное значение!');
  end else
    ShowMessage('Выберите ячейку, содержащую корректное значение!');
end;

procedure TfCalcWR.ppOpenClick(Sender: TObject);
begin
  Ic(2,Application.Icon);                  // Удаляем значок из трея
  ShowWindow(Application.Handle, SW_SHOW); // Восстанавливаем кнопку программы
  ShowWindow(Handle, SW_SHOW);             // Восстанавливаем окно программы
end;

end.
