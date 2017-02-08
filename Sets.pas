unit Sets;

interface

uses SysUtils;

// ftmShort - часы не более 23:59 без секунд
// ftmMidle - часы более 24-х без секунд
// ftmLong  - часы не более 23:59:59 с сек.
// ftmFull  - часы более 24-х с сек.
type TFrmWR = (ftmShort, ftmMidle, ftmLong, ftmFull);

function FormatTimeEx(Value: integer; FrmWR: TFrmWR = ftmMidle): string; overload;
function FormatTimeEx(Value: currency; sMask: string): string; overload;
//function TimeToMin(Value: TDateTime): integer; overload;
function TimeToSecond(Value: currency): integer; // overload;
function strTimeToSec(sValue: string): integer;

const
  eol = #13#10;
  
var
  AppPath: string;
  FrmWR: TFrmWR;

implementation

function strTimeToSec(sValue: string): integer;
var Wr: TDateTime;
begin
  Wr := strToTimeDef(sValue, 0);
  result := round(Wr * 86400);
end;

//function TimeToMin(Value: TDateTime): integer;
//begin
//  result := round(Value*1440*60) div 60;
//end;

function TimeToSecond(Value: currency): integer;      // Value -  время в долях часа!
begin
  result := round(Value*3600);                     // секунды
end;


function FormatTimeEx(Value: currency; sMask: string): string; overload;
var j, h, n, s: integer;          // , iVal
    sH, sN, sS, sDirect: string;
    m1,m2,m3: string;
    val, qqq: currency;
begin
  sDirect := '';
  if Value < 0 then sDirect := '-';

  h := abs(trunc(Value));
  val := (abs(Value) - h) * 60;
  qqq := int(val);
  n := trunc(qqq);
  s := trunc((val - n)*60);

  j := pos(':',sMask);
  if j > 0 then begin
    m1 := copy(sMask,1,j-1);
    sMask := copy(sMask,j+1,9);
    j := pos(':',sMask);
    if j > 0 then begin
      m2 := copy(sMask,1,j-1);
      m3 := copy(sMask,j+1,2);
    end else begin
      m2 := sMask;
      m3 := '';
    end;
  end;

  sS := '';
  sH := StringOfChar('0',length(m1)-length(IntToStr(h)))+ IntToStr(h);
  if m3 = '' then begin
    if s > 30 then inc(n);
    sN := IntToStr(n);
    if n < 10 then sN := '0' + sN;
  end else begin
    sN := IntToStr(n);
    if n < 10 then sN := '0' + sN;
    sS := IntToStr(s);
    if s < 10 then sS := '0' + sS;
  end;

  if sS = '' then
    Result := sDirect + sH+':'+sN
  else
    Result := sDirect + sH+':'+sN+':'+sS;

end;

function FormatTimeEx(Value: integer; FrmWR: TFrmWR = ftmMidle): string;   // Value -  время в секундах
var h,n, s, val: integer;
    sH, sN, sS, sDirect: string;
begin
  sDirect := '';
  if Value < 0 then sDirect := '-';

  val := Abs(Value);
  h := Val div 3600;
  n := (Val - h * 3600) div 60;
  if FrmWR = ftmLong then
    s := Val - h*3600 - n*60
  else
    s := 0;

  if ((FrmWR = ftmShort) or (FrmWR = ftmLong)) and (h >= 24) then
    h := h - (h div 24) * 24;

  sH := IntToStr(h);
  if (length(sH) = 1) then    //   and (sh[1] <> '0')
    sH := '0' + sH;
  sN := IntToStr(n);
  if n < 10 then sN := '0' + sN;
  if FrmWR = ftmLong then begin
    sS := IntToStr(s);
    if s < 10 then sS := '0' + sS;
    Result := sDirect + sH + ':' + sN + ':' + sS;
  end else
    Result := sDirect + sH + ':' + sN
end;

end.
