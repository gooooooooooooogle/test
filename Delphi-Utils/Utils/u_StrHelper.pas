unit u_StrHelper;

interface
  uses SysUtils, StrUtils;
   
  function Replicate(pcChar:Char; piCount:integer):string;
  function PadLStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;
  function PadRStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;
  function HexToDec(hexstr :string) : integer;overload;
  function HexToDec(i: byte): Integer;overload;
  function DecToHex(i:byte): Integer;
  function DecToBin(i: integer): string;
  function BinToDec(Value : string): Integer;
  function IntToBin(int : Integer; Size: Integer): String;
  function BinToInt(bin: String): Integer;
  procedure CopyBytes(buffer:array of Byte; iStart, iLength:Integer; var SubBuffer: array of Byte);
  function tzstrx(bb: string): string;
  function GetJy(Str : string): string;
  function GetJy2(Str : string): string;

implementation    

function Replicate(pcChar:Char; piCount:integer):string;
begin
    Result:='';
    SetLength(Result,piCount);
    fillChar(Pointer(Result)^,piCount,pcChar)
end;

//���ش�psInput�ַ�����߿�ʼ��pcPadWith�����ܳ���ΪPiWidth���ַ���
function PadLStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;
begin
	Result:=Replicate(pcPadWith,piWidth-Length(psInput))+psInput
end;

//���ش�psInput�ַ����ұ߿�ʼ��pcPadWith�����ܳ���ΪPiWidth���ַ���
function PadRStr(psInput:String; piWidth:Integer; pcPadWith:Char):String;
begin
	Result:=psInput+Replicate(pcPadWith,piWidth-Length(psInput))
end;

//16����ת10����
function HexToDec(hexstr :string) : integer;
begin
    Result := StrToInt('$' + hexstr);
end;
function HexToDec(i: byte): Integer;
begin
    try
      if (i = $ae) or (i = $fd) then result := 0
      else
          result := StrToInt(Format('%x',[i]));
    except
          result := 0;
    end;
end;

//ʮ����תʮ������
function DecToHex(i:byte): Integer;
begin
    result := strToInt('$' + intToStr(i));
end;

//ʮ����תΪ������
function DecToBin(i: integer): string;
begin
   while i <>0 do
   begin
       result := Format('%d' + result,[i mod 2]);
       i := i div 2
   end
end;

//������תΪʮ����
function BinToDec(Value : string): Integer;
var
    str : String;
    Int : Integer;
    i : integer;
BEGIN
    Str := UpperCase(Value);
    Int := 0;
    FOR i := 1 TO Length(str) DO
      Int := Int * 2+ ORD(str[i]) - 48;
    Result := Int;
end;

//ʮ����ת������
function IntToBin(int : Integer; Size: Integer): String;
var
  i : Integer;
begin
    Result := '';
    for i := Size - 1 downto 0 do
    begin
        if int and (1 shl i) <> 0 then
            Result := Result + '1'
        else
            Result := Result + '0';
    end;
end;

//������תʮ����
function BinToInt(bin: String): Integer;
var
   i,Size:   Integer;
begin
    Result := 0;
    Size := Length(bin);
    for i := Size downto 1 do
    begin
        if Copy(bin , i, 1) = '1' then
            Result := Result + (1 shl (Size-i));
    end;
end;

//��ȡ�ֽ�����
procedure CopyBytes(buffer:array of Byte; iStart, iLength:Integer; var SubBuffer:array of Byte);
var
    i : Integer;
begin
    if (Length(SubBuffer) > iLength) or (Length(buffer) - iStart < iLength) then
        raise Exception.Create('���鳤���쳣!');
    for i := 0 to iLength - 1 do
    begin
        SubBuffer[i] := buffer[iStart + i];
    end;
end;

//BCD����
function tzstrx(bb: string): string;
var lenn, i: integer;
    aa: string;
begin
    lenn := length(bb);
    aa := '';
    i := lenn;
    while i > 0 do
    begin
        aa := aa + copy(bb, i - 1, 2);
        lenn := lenn - 2;
        i := lenn;
    end;
    tzstrx := aa;
end;

//����Ч��λ������1�ֽ�)
function GetJy(Str : string): string;
var
  i, j : integer;
  sTest : string;
begin
    j := 0;
    for i :=1  to (length(Str) div 2)  do
    begin
        sTest := copy(Str, 2*i-1, 2);

        j := j + HexToDec(sTest);
    end;

    result := PadLStr(RightStr(IntToHex(j, 1), 2), 2, '0');
end;

//����Ч��λ������2�ֽ�)
function GetJy2(Str : string): string;
var
  i, j : integer;
  sTest : string;
begin
    j := 0;
    for i :=1  to (length(Str) div 2)  do
    begin
        sTest := copy(Str, 2*i-1, 2);

        j := j + HexToDec(sTest);
    end;

    result := PadLStr(RightStr(IntToHex(j, 1), 4), 4, '0');
end;

end.
