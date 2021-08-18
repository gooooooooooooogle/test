unit u_HardWare;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Nb30, Registry, WinSock;
  function GetIdeSerialNumber: pchar;
  function GetCPUIDStr:String;
  function MacStr():String;
  function GetBiosNum: String;
  function HardWareInfo : string;
type
    TASTAT = record
        adapter : TAdapterStatus;
        name_buf : TNameBuffer;
end;

type
  TCPUID = array[1..4] of Longint;
  function GetCPUID: TCPUID; assembler; register;
  procedure SetCPU(AHandle: THandle; CpuNo: Integer);
implementation


function GetIdeSerialNumber: pchar;
const IDENTIFY_BUFFER_SIZE = 512;
type
  TIDERegs = packed record
    bFeaturesReg: BYTE; // Used for specifying SMART "commands".
    bSectorCountReg: BYTE; // IDE sector count register
    bSectorNumberReg: BYTE; // IDE sector number register
    bCylLowReg: BYTE; // IDE low order cylinder value
    bCylHighReg: BYTE; // IDE high order cylinder value
    bDriveHeadReg: BYTE; // IDE drive/head register
    bCommandReg: BYTE; // Actual IDE command.
    bReserved: BYTE; // reserved for future use. Must be zero.
  end;
  TSendCmdInParams = packed record
    // Buffer size in bytes
    cBufferSize: DWORD;
    // Structure with drive register values.
    irDriveRegs: TIDERegs;
    // Physical drive number to send command to (0,1,2,3).
    bDriveNumber: BYTE;
    bReserved: array[0..2] of Byte;
    dwReserved: array[0..3] of DWORD;
    bBuffer: array[0..0] of Byte; // Input buffer.
    end;
  TIdSector = packed record
    wGenConfig: Word;
    wNumCyls: Word;
    wReserved: Word;
    wNumHeads: Word;
    wBytesPerTrack: Word;
    wBytesPerSector: Word;
    wSectorsPerTrack: Word;
    wVendorUnique: array[0..2] of Word;
    sSerialNumber: array[0..19] of CHAR;
    wBufferType: Word;
    wBufferSize: Word;
    wECCSize: Word;
    sFirmwareRev: array[0..7] of Char;
    sModelNumber: array[0..39] of Char;
    wMoreVendorUnique: Word;
    wDoubleWordIO: Word;
    wCapabilities: Word;
    wReserved1: Word;
    wPIOTiming: Word;
    wDMATiming: Word;
    wBS: Word;
    wNumCurrentCyls: Word;
    wNumCurrentHeads: Word;
    wNumCurrentSectorsPerTrack: Word;
    ulCurrentSectorCapacity: DWORD;
    wMultSectorStuff: Word;
    ulTotalAddressableSectors: DWORD;
    wSingleWordDMA: Word;
    wMultiWordDMA: Word;
    bReserved: array[0..127] of BYTE;
  end;
    PIdSector = ^TIdSector;
    TDriverStatus = packed record
    // 驱动器返回的错误代码，无错则返回0
    bDriverError: Byte;
    // IDE出错寄存器的内容，只有当bDriverError 为 SMART_IDE_ERROR 时有效
    bIDEStatus: Byte;
    bReserved: array[0..1] of Byte;
    dwReserved: array[0..1] of DWORD;
  end;
  TSendCmdOutParams = packed record
    // bBuffer的大小
    cBufferSize: DWORD;
    // 驱动器状态
    DriverStatus: TDriverStatus;
    // 用于保存从驱动器读出的数据的缓冲区，实际长度由cBufferSize决定
    bBuffer: array[0..0] of BYTE;
  end;
var
  hDevice: Thandle;
  cbBytesReturned: DWORD;
  SCIP: TSendCmdInParams;
  aIdOutCmd: array[0..(SizeOf(TSendCmdOutParams) + IDENTIFY_BUFFER_SIZE - 1) - 1] of Byte;
  IdOutCmd: TSendCmdOutParams absolute aIdOutCmd;
procedure ChangeByteOrder(var Data; Size: Integer);
var
  ptr: Pchar;
  i: Integer;
  c: Char;
begin
    ptr := @Data;
    for I := 0 to (Size shr 1) - 1 do
    begin
        c := ptr^;
        ptr^ := (ptr + 1)^;
        (ptr + 1)^ := c;
        Inc(ptr, 2);
    end;
end;
begin
    Result := ''; // 如果出错则返回空串
    if Win32Platform = VER_PLATFORM_WIN32_NT then
    begin // Windows NT, Windows 2000
        // 提示! 改变名称可适用于其它驱动器，如第二个驱动器： '\\.\PhysicalDrive1\'
        hDevice := CreateFile('\\.\PhysicalDrive0', GENERIC_READ or GENERIC_WRITE,
        FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
    end
    else // Version Windows 95 OSR2, Windows 98
        hDevice := CreateFile('\\.\SMARTVSD', 0, 0, nil, CREATE_NEW, 0, 0);
    if hDevice = INVALID_HANDLE_VALUE then Exit;
    try
        FillChar(SCIP, SizeOf(TSendCmdInParams) - 1, #0);
        FillChar(aIdOutCmd, SizeOf(aIdOutCmd), #0);
        cbBytesReturned := 0;
        // Set up data structures for IDENTIFY command.
        with SCIP do
        begin
            cBufferSize := IDENTIFY_BUFFER_SIZE;
            // bDriveNumber := 0;
            with irDriveRegs do
            begin
                bSectorCountReg := 1;
                bSectorNumberReg := 1;
                // if Win32Platform=VER_PLATFORM_WIN32_NT then bDriveHeadReg := $A0
                // else bDriveHeadReg := $A0 or ((bDriveNum and 1) shl 4);
                bDriveHeadReg := $A0;
                bCommandReg := $EC;
            end;
          end;
      if not DeviceIoControl(hDevice, $0007C088, @SCIP, SizeOf(TSendCmdInParams) - 1,
        @aIdOutCmd, SizeOf(aIdOutCmd), cbBytesReturned, nil) then
        Exit;
    finally
        CloseHandle(hDevice);
    end;
    with PIdSector(@IdOutCmd.bBuffer)^ do
    begin
        ChangeByteOrder(sSerialNumber, SizeOf(sSerialNumber));
        (Pchar(@sSerialNumber) + SizeOf(sSerialNumber))^ := #0;
        Result := Pchar(@sSerialNumber);
    end;
end;

//CPU系列号:
FUNCTION GetCPUID : TCPUID; assembler; register;
asm 
  PUSH EBX {Save affected register}
  PUSH EDI
  MOV EDI,EAX {@Resukt}
  MOV EAX,1
  DW $A20F {CPUID Command}
  STOSD {CPUID[1]}
  MOV EAX,EBX
  STOSD {CPUID[2]}
  MOV EAX,ECX
  STOSD {CPUID[3]}
  MOV EAX,EDX
  STOSD {CPUID[4]}
  POP EDI {Restore registers}
  POP EBX
END; 

function GetCPUIDStr:String; 
var 
CPUID:TCPUID; 
begin
    setcpu(GetCurrentProcess, 1);
    CPUID := GetCPUID;
    Result := IntToHex(CPUID[1],8)+IntToHex(CPUID[2],8)+IntToHex(CPUID[3],8)+IntToHex(CPUID[4],8);
end;

procedure SetCPU(AHandle: THandle; CpuNo: Integer);
var
  ProcessAffinity: Cardinal;
  _SystemAffinity: Cardinal;  
begin  
  //通过设置进程或线程的亲缘性（affinity），使进程或线程在指定的CPU（核）上运行  
  GetProcessAffinityMask(AHandle , ProcessAffinity, _SystemAffinity) ;  
  ProcessAffinity := CpuNo;  
  SetProcessAffinityMask(AHandle , ProcessAffinity);  
end;


//取MAC地址(集成网卡和非集成网卡): 

function Getmac:string; 
var 
ncb : TNCB; 
s:string; 
adapt : TASTAT;
lanaEnum : TLanaEnum; 
i, j, m : integer; 
strPart, strMac : string; 
begin 
    FillChar(ncb, SizeOf(TNCB), 0);
    ncb.ncb_command := Char(NCBEnum);
    ncb.ncb_buffer := PChar(@lanaEnum); 
    ncb.ncb_length := SizeOf(TLanaEnum); 
    s:=Netbios(@ncb); 
    for i := 0 to integer(lanaEnum.length)-1 do 
    begin 
        FillChar(ncb, SizeOf(TNCB), 0);
        ncb.ncb_command := Char(NCBReset); 
        ncb.ncb_lana_num := lanaEnum.lana[i]; 
        Netbios(@ncb); 
        Netbios(@ncb); 
        FillChar(ncb, SizeOf(TNCB), 0); 
        ncb.ncb_command := Chr(NCBAstat); 
        ncb.ncb_lana_num := lanaEnum.lana[i]; 
        ncb.ncb_callname := '* '; 
        ncb.ncb_buffer := PChar(@adapt); 
        ncb.ncb_length := SizeOf(TASTAT); 
        m:=0; 
        if (Win32Platform = VER_PLATFORM_WIN32_NT) then
        m:=1; 
        if m=1 then 
        begin 
            if Netbios(@ncb) = Chr(0) then
            strMac := '';
            for j := 0 to 5 do
            begin
                strPart := IntToHex(integer(adapt.adapter.adapter_address[j]), 2);
                strMac := strMac + strPart + '-';
            end;
            SetLength(strMac, Length(strMac)-1);
        end; 
        if m=0 then 
        if Netbios(@ncb) <> Chr(0) then
        begin 
            strMac := '';
            for j := 0 to 5 do
            begin
                strPart := IntToHex(integer(adapt.adapter.adapter_address[j]), 2);
                strMac := strMac + strPart + '-';
            end;
            SetLength(strMac, Length(strMac)-1);
        end;
    end;
    result:=strmac;
end; 

function PartitionString(StrV,PrtSymbol: string): TStringList; 
var 
iTemp: integer; 
begin 
    result := TStringList.Create;
    iTemp := pos(PrtSymbol,StrV);
    while iTemp>0 do
    begin
        if iTemp>1 then
            result.Append(copy(StrV,1,iTemp-1));
        delete(StrV,1,iTemp+length(PrtSymbol)-1);
        iTemp := pos(PrtSymbol,StrV);
    end;
    if Strv<>'' then
        result.Append(StrV);
end; 

function MacStr():String;
var 
    Str:TStrings;
    i:Integer;
    MacStr:String;
begin
    MacStr:='';
    Str:=TStringList.Create;
    Str:=PartitionString(Getmac,'-');
    for i:=0 to Str.Count-1 do
        MacStr:=MacStr+Str[i];
    Result:=MacStr;
end;

//==============================================


function HardWareInfo : string;
var
  info : string;
begin
    info := Trim(GetIdeSerialNumber);
    if info = '' then
    begin
       info := GetCPUIDStr;
       if Length(info) > 15 then
          info := Copy(info, 0, 10) + Copy(MacStr, 2, 4)
       else
          info := info + Copy(MacStr, 2, 6);
        info := MacStr;
    end;
    Result := Trim(info);
end;

{*************************************** 
author/date:
description:获取bios编号 
***************************************}
function GetBiosNum: String;
Var  
BiosDate,BiosName,BiosVersion,BiosNum,BiosCopyright:String;  
begin
Try
    SetLength(BiosDate, 100);
    BiosDate:=string(pchar(ptr($ffff5)));
    BiosName:=string(pchar(ptr($ffa68)));
    BiosVersion:=string(pchar(ptr($fe061)));  
    BiosNum:=string(pchar(ptr($fec71)));
    BiosCopyright:=string(pchar(ptr($fe091)));  
    Result:=BiosNum;  
Except  
    Result:='';  
End;
end;

end.
 