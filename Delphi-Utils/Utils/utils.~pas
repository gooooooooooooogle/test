unit utils;

interface

uses
    StrUtils, Classes, StdCtrls, ExtCtrls, cxCalendar, IniFiles, RzEdit,
    cxCheckBox, cxDropDownEdit, RzPanel, Dialogs, Forms, Windows, SysUtils, Math,
    ComCtrls, Messages, ADODB, ComObj, IdHTTP, superobject;

procedure aes128_data_encrypt1(Key: PByteArray; tg: PByteArray); stdcall; external 'aes2.dll';
procedure aes128_data_decrypt1(Key: PByteArray; tg: PByteArray); stdcall; external 'aes2.dll';
       
  {常用方法}
function Replicate(pcChar: Char; piCount: integer): string;
  // 返回从psInput字符串左边开始用pcPadWith填充后总长度为PiWidth的字符串
function PadLStr(psInput: string; piWidth: Integer; pcPadWith: Char): string;
  // 返回从psInput字符串右边开始用pcPadWith填充后总长度为PiWidth的字符串
function PadRStr(psInput: string; piWidth: Integer; pcPadWith: Char): string;
  // 十六进制字符串 --> 十进制整型数字  参数： hexstr : 16进制字符串
function HexToDec(hexstr: string): integer; overload;

// 获取指定长度的随机数，最大支持32位
function getRandom(byteNum : Integer) : String;


//function HexToDec(i: byte): Integer; overload;

function DecToHex(i: byte): Integer;
  // 十进制整型数字  --> 二进制字符串  参数：i：十进制数字
function DecToBin(i: integer): string;
  // 二进制字符串  --> 十进制整数数字
function BinToDec(Value: string): Integer;
  // 十进制整型数字 -->  二进制字符串  参数： int： 10进制整型数字， Size：转换后生成的二进制字符串的长度
function IntToBin(int: Integer; Size: Integer): string;
  // 二进制字符串 --> 十进制整型数字  参数: bin : 二进制字符串
function BinToInt(bin: string): Integer;

//十六进制转换为二进制
function HextoBin1(str: string): string;

procedure CopyBytes(buffer: array of Byte; iStart, iLength: Integer; var SubBuffer: array of Byte);
  // 字符串转换成16进制字符串
function StrToHexStr(const S: string): string;
  // 16进制字符串转换成字符串
function HexStrToStr(const S: string): string;
  //BCD 倒置
function tzstrx(bb: string): string;

function tzstrx1(bb: string): string;
  //
function InvertedData(s: string): string;
  // 计算效验位（返回1字节)
function GetJy(Str: string): string;
  // 计算效验位（返回2字节)
function GetJy2(Str: string): string;
  // 计算效验位（返回4字节)
function GetJy4(Str: string): string;
  // 20170505152356  ->  2017-05-05 15:23:56    or   170505152356  ->  17-05-05 15:23:56
function formatDate(dataStr: string): string;
   //
function formatDateOfHex(dataStr: string): string;
  //
function cutOutStr(var str: string; startIndex, cutLen: Integer): string;
function cutOutNewStr(var str: string; startIndex, cutLen: Integer): string;
  //
// 补码
function ComplementFun (str : string; len: Integer) : string;

// memo实现将所选文本进行添加校验和(0)，加33(1)，减33(2)的功能
procedure memoUtils (m : TMemo; funType : Integer);

// richEdit实现将所选文本进行添加校验和(0)，加33(1)，减33(2)的功能
procedure richEditUtils (r : TRichEdit; funType : Integer);

function deleteMemo1310(memoContext: string): string;
  // 检查返回数据是否合格
function legalityCheck(receiveStr: string): string;
  // 大口径水表数据解析
function bigWaterDataAnalysis(str: string): string;
  // MBUS阀控水表数据解析
function MBUSWaterDataAnalysis(str: string): string;
// MBUS阀控水表数据解析 83
function MBUSWaterDataAnalysisBy83(str: string): string;
  //获取版本号

function GetBuildInfo: string; overload;

function GetBuildInfo(sFile: string): string; overload;

  // 转换文件的时间格式
function CovFileDate(Fd: _FileTime): TDateTime;
  // 获取文件时间，Tf表示目标文件路径和名称
procedure GetFileTime(const Tf: string; var t1, t2, t3: string);
  // 加33 方法
function add33(str: string): string;
  // 减33 方法
function Less33(str: string): string;
  // CRC16 校验算法
function crcjy(bufAddr: string): string;

// 昆仑表号校验算法   （信通院）    ISO7064,MOD 11，10 校验系统校验码计算算法
function getMod11MeterNum(meterNum: string): string;

// CRC16 校验  昆仑燃气校验算法
function CRC16(data: string): string;
function CalCRC16(AData: array of Byte; AStart, AEnd: Integer): Word;

// 昆仑燃气异或运算进行加解密
function myStrToHex(s:string):string; //字串转16进制
function myHexToStr(S:string):string; //16进制转字串
function EncryptStr(const s:string;sKey:string):string; //加密
function EncryptStrDuiYing(const s:string;sKey:string):string; //加密
function DecryptStr(const s:string;sKey:string):string; //解密

  // 给字符串中每个字节之间增加空格
function AddTab(sStr: string): string;

// 698 测试系统中计算CRC校验的方法
function Hdl_State_calculateChecksum(BytePtr: string): string;

// AES128 加密
function AES128Encryption(baseDataStr, keyStr, eType : string) : string;
// AES128 解密
function AES128Decrypt(subFrame, keyStr, eType : string) : string;

// 延时处理 delay(1000)  : 延时1秒 
procedure delay(MSecs:LongInt);

// 例如 有一个2字节的数据0000000000000000， 若每一位表示一个月份，则若选择1,2,3月的话，得到的数据为0000000000000111
// sourceStr 表示数据源  例如1;2;3
// DelimiterStr  分隔符 ';'
// len 表示数据二进制总位数。2字节的数据，则len为2*8=16位
function getBinStr(sourceStr : string;DelimiterStr : Char ;len: Integer): string;

{
 *****************************昆仑燃气报文组织********************************** 
 参数说明： 
 controlWord  01: 注册下行帧 （注册回复帧）
              03: 数据对象访问请求（下行） [读、写、写回读]
              05: 结束通信（下行）指令

 ctrlStr      00: 读
              01：写
              02：写回读
              该参数只在 controlWord = 03 时 起作用。controlWord = 05 时，ctrlStr 代码中写死为 01，随便传值。controlWord = 01 时，ctrlStr 随便传值

 cmd，dataStr  数据标识和对应数据的 字符串数组
 cp           存放公共参数，比如计数器，随机数，MAC等信息            
}
function creatKunLunFrame(cmdName, gasMeterAddr, controlWord, ctrlStr : string; cmd, dataStr, cp : array of string; memo:TRichEdit): string;

// 访问昆仑接口
function getKunLunInterface(requestType, frameStr, a10_KEY : string): string;

function mapReportCode(reportCode : string): string;
function mapEvent(eventCode : string): string;
function mapFCW(fcw : string): string;
function mapOperationRule(op : string): string;
// 昆仑燃气报文解析
function AnalysisKunLunFrame(cmdName, receiveFrame, modeType, a10_KEY, pass : string;memo: TRichEdit):TStringList;


// 流量表动态解析方法
procedure autoAnalysis(protocolType, cmdName, DI, tableName1, tableName2, dataArea : string; query: TADOQuery; Memo : TRichEdit);

// 流量表质量追溯系统  动态组织发送帧的方法
function getSendFrameForFMQTS() : string;



  {串口通讯相关方法}
  // 打开串口方法
function OpenCom(com: string; iBand: cardinal; iStopBits, iParity, iByteSize: Byte; var sErrInfo: string; var MyCom: THandle): Boolean;
  // 关闭串口方法
function closeCom(hcom: THandle): Boolean;
  // 通讯方法（发送，接收命令）
function serialCommunication(hCom: THandle; sendMessage: string; var receiveMessage, msg: string; myTimer: TTimer; myProgressBar: TProgressBar): Boolean;


{Form 相关方法}
  // 设置控件是否可编辑
procedure SetComponentEnable(m_c: TComponent; bEnable: Boolean);
  // 设置Groupbox是否可编辑
procedure SetGroupboxControlsEnable(m_c: TGroupBox; bEnable: Boolean);
  // 设置PanelControls是否可编辑
procedure SetPanelControlsEnable(m_c: Tpanel; bEnable: Boolean);
  // 读取ini配置文件给控件赋值
procedure ConfigData2Component(m_c: TComponent; sPath: string);
  // 获取控件数据写入ini文件
procedure ComponentData2Config(m_c: TComponent; sPath: string);

  {测试方法}
procedure showTest(msg: string);

function repl(str1: char; long1: integer): string;

function h_dec(hex: string): string;

function AsiicstrForBT(s, wrflag: string): string;

  {其他方法}
function GetDW(iNo: string): string;

function FormatDW(sStr, sType: string; iFlag: Integer): string;

function chartohex(str: string): string;

procedure BinToHex1(Buffer: PAnsiChar; Text: PAnsiChar; BufSize: Integer);

// 小数转HEX  返回4字节的HEX  符合IEEE754标准
function floatToHex(Value: single): string;

// hex转 小数  四字节的Hex 转换为单精度浮点型小数
function HexToFloat(Value: string): Real;

// 简单记录日志
procedure WriteMESLog(msgList : array of string);

procedure WriteLog(gaugeId, msgType : Integer; msgList : array of string);




{
  通讯类
}
type
    Tsc = class
    public
        hCom: THandle;
        timer : TTimer;
        second, stopSecond : Integer;
        msg: string;
        constructor Create;
        // ComName ： 串口名称  BaudRate ： 波特率  Parity : 校验位  overtime : 超时时间    SendStr ： 发送报文
        function dbtx1(ComName, BaudRate: string; Parity, overtime : Integer; SendStr: string): string;
        function OpenCom1(com: string; iBand: cardinal; iStopBits, iParity, iByteSize: Byte; var sErrInfo: string): Boolean;
        function closeCom1(hcom: THandle): Boolean;
        procedure timerTimer(Sender: TObject);
end;

implementation

//{$R *.dfm}  // 这句代表要有form界面
constructor Tsc.Create;
begin
    inherited;
end;

function Tsc.OpenCom1(com: string; iBand: cardinal; iStopBits, iParity, iByteSize: Byte; var sErrInfo: string): Boolean;
var
    tmpdcb: DCB;
    ct: COMMTIMEOUTS;
begin

    Result := false;
    if Length(com) > 4 then
        com := '\\.\' + com;
    if (hCom = 0) then
    begin
        hCom := CreateFile(pchar(com), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, 0, 0);
        if (hCom = INVALID_HANDLE_VALUE) then
        begin
            sErrInfo := com + '打开失败！';
            exit;
        end;
        GetCommState(hCom, tmpdcb);
        tmpdcb.BaudRate := iBand;
        tmpdcb.StopBits := iStopBits;
        tmpdcb.Parity := iParity;
        tmpdcb.ByteSize := iByteSize;
        tmpdcb.Flags := tmpdcb.Flags or 2;
        tmpdcb.Flags := tmpdcb.Flags and (not $40);
        tmpdcb.Flags := tmpdcb.Flags and (not $3030);
        if not SetCommState(hCom, tmpdcb) then
        begin
            closeCom1(hCom);
            sErrInfo := '设置DCB失败！';
            exit;
        end;
        if not SetupComm(hCom, 2048, 2048) then
        begin
            closeCom1(hCom);
            sErrInfo := '设置缓冲区失败！';
            exit;
        end;
        if not GetCommTimeouts(hCom, ct) then
        begin
            closeCom1(hCom);
            sErrInfo := '查询超时配置失败！';
            exit;
        end;

        // 设置超时
        ct.ReadIntervalTimeout := 1000;
        ct.ReadTotalTimeoutMultiplier := 500;
        ct.ReadTotalTimeoutConstant := 500;
        // 设定写超时
        ct.WriteTotalTimeoutMultiplier := 500;
        ct.WriteTotalTimeoutConstant := 1000;

        if not SetCommTimeouts(hCom, ct) then
        begin
            closeCom1(hCom);
            sErrInfo := '设置超时出错！';
            exit;
        end;
        Result := true;
    end
    else if (hCom > 0) then
    begin
        sErrInfo := '串口已打开！';
        Result := true;
    end;
end;

function Tsc.closeCom1(hcom: THandle): Boolean;
begin
    if hcom <> INVALID_HANDLE_VALUE then
        CloseHandle(hcom);
    Result := True;
end;

procedure Tsc.timerTimer(Sender: TObject);

begin
    second := second + 1;
    if second + 1 > stopSecond then
    begin
       timer.Enabled := False;
    end;
end;

function Tsc.dbtx1(ComName, BaudRate: string; Parity, overtime : Integer; SendStr: string): string;
var
    receiveStr : string;
    i, j: Integer;
    s, sErrInfo, sRev, ss: string;
    len, readLen, rlen, t: cardinal;
    buf: array[1..10240] of byte;
    dwErrorFlags: DWORD;
    ComStat: TComStat;
    key, tg: PByteArray;
    iPos,iLen: Integer;
    strRz, strFhData, sj1, sj2, sj3, s1, s2, s3, s4, s5, s6: string;
    rDateErr, rReadAmount: Real;
    fWater : Double;
    sMeterNum, dqljll, jsrljll : string;
    bTemp : Boolean;
    sStatus, sTemp, sTemp1, sTemp2, sTemp3, sTemp4, sTemp5, sTemp6 : string;
    iTemp : Integer;

begin
    // 清空接收字符串
    receiveStr := '';

    if sendStr = '' then exit;
    
    sendStr := UpperCase(sendStr);
    len := length(sendStr);
    for i := 1 to len do
    begin
        if not (ansichar(sendStr[i]) in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E', 'F', ' ']) then
        begin
            Windows.Beep(1000, 500);
            receiveStr := '出现非HEX数字字符！';
        end;
    end;
    len := len div 2;
    try
        for i := 1 to len do
        begin
            buf[i] := StrToInt('$' + LeftStr(sendStr, 2));
            Delete(sendStr, 1, 2);
        end;
    except
        receiveStr := '发送HEX信息格式错误！';
    end;

    // 打开串口 
    if not openCom1(ComName, StrToInt(BaudRate), 0, Parity, 8, sErrInfo) then
    begin
        closeCom1(hcom);
        receiveStr := sErrInfo;
    end
    else
    begin
        // 发送数据
        try
            if not WriteFile(hCom, buf[1], len, rlen, nil) then
            begin
                receiveStr := '发送' + IntToStr(len) + '字节失败！';
                Windows.Beep(1000, 500);
            end;

            PurgeComm(hCom, PURGE_RXABORT + PURGE_RXCLEAR);  // 清除串口接收缓存

            timer := TTimer.Create(nil);
            timer.Interval := 1000;
            second := 0;
            stopSecond := overtime;
            timer.Enabled := True;
            timer.OnTimer := timerTimer;

            // 开始准备接收
            while timer.Enabled do
            begin
                if not ClearCommError(hCom, dwErrorFlags, @ComStat) then
                begin
                    receiveStr := '查询串口状态出错!';
                    Break;
                end;
                readLen := Min(2048, ComStat.cbInQue);
                if readLen > 0 then
                begin
                    // 读取数据
                    if not ReadFile(hCom, buf, readLen, len, nil) then
                    begin
                        receiveStr := '读取数据出错！';
                    end;
                    for i := 1 to len do
                    begin
                        receiveStr := receiveStr + Format('%.2x', [buf[i]]);
                    end;
                end
                else
                begin
                  if (RightStr(receiveStr, 2) = '16') then Break;
                end;

                application.ProcessMessages;
            end;

            if (receiveStr = '') then  receiveStr := '超时！';

        finally
            // 关闭串口
            closeCom1(hcom);
        end;
    end;

    timer.Enabled := False;
    while (Copy(receiveStr, 1, 2) = 'FE') do
    begin
       Delete(receiveStr, 1, 2);
    end;
    Result := receiveStr;
end;




procedure showTest(msg: string);
begin
    ShowMessage(msg);
end;

function repl(str1: char; long1: integer): string;
var
    j: integer;
var
    tt: string;
begin
    j := 1;
    tt := '';
    while j <= long1 do
    begin
        tt := tt + str1;
        j := j + 1;
    end;
    repl := tt;
end;

function h_dec(hex: string): string;
var
    i, c, l, x, bb, a1, c2, wd, wd1: integer;
var
    ai, dc: string;
begin
    i := 0;
    c := 0;
    x := 1;
    wd := 1;
    l := length(hex);
    while i < l do
    begin
        case i of
            0:
                x := 1;
            1:
                x := 16;
            2:
                x := 16 * 16;
            3:
                x := 16 * 16 * 16;
            4:
                x := 16 * 16 * 16 * 16;
            5:
                x := 16 * 16 * 16 * 16 * 16;
            6:
                x := 16 * 16 * 16 * 16 * 16 * 16;
        end;
        bb := l - i;
        ai := copy(hex, bb, 1);
        case ai[1] of
            'A':
                a1 := 10;
            'a':
                a1 := 10;
            'B':
                a1 := 11;
            'b':
                a1 := 11;
            'C':
                a1 := 12;
            'c':
                a1 := 12;
            'D':
                a1 := 13;
            'd':
                a1 := 13;
            'E':
                a1 := 14;
            'e':
                a1 := 14;
            'F':
                a1 := 15;
            'f':
                a1 := 15 else
            a1 := strtoint(ai);
        end;
        c2 := a1 * x;
        c := c2 + c;
        i := i + 1;
        dc := trim(inttostr(c));
        wd := length(dc);
    end;
    if wd <= 4 then
    begin
        wd1 := 4 - wd;
        dc := repl('0', wd1) + dc;
    end;
    h_dec := dc
end;

function AsiicstrForBT(s, wrflag: string): string;
var
    i: integer;
    f_str, v_str: string;
    bb: Byte;
begin
    if wrflag = 'r' then
    begin
        for i := 1 to (length(s) div 2) do
        begin
            v_str := copy(s, 2 * i - 1, 2);
            bb := StrToInt(h_dec(v_str));



            v_str := chr(bb);
            v_str := Trim(v_str);
            f_str := f_str + v_str;
        end;
    end
    else
    begin
        for i := 1 to length(s) do
        begin
            bb := ord(s[i]);
            v_str := IntToHex(bb, 2);
            f_str := f_str + v_str;
        end;
    end;
    result := f_str;
end;

procedure WriteMESLog(msgList : array of string);
var aTxt: TextFile;
    sName, sPath, timeFlag, msgTypeStr, folderName: string;
    i : Integer;
begin
  
    msgTypeStr := '[ERROR]';
//    if (msgType = 1) then msgTypeStr := '[INFO]';
//    if (msgType = 2) then msgTypeStr := '[WARNING]';
//    if (msgType = 3) then msgTypeStr := '[ERROR]';
    sName := FormatDateTime('yyyymmdd', Now);

//    if (gaugeId = 1) then folderName := '表位1';
//    if (gaugeId = 2) then folderName := '表位2';
//    if (gaugeId = 3) then folderName := '表位3';
//    if (gaugeId = 4) then folderName := '表位4';
//    if (gaugeId = 5) then folderName := '表位5';

    sPath := ExtractFilePath(Paramstr(0)) + 'MESErrorLog-' + sName + '.ini';
    AssignFile(aTxt, sPath);
    if FileExists(sPath) then
        Append(aTxt)
    else
        Rewrite(aTxt);

    timeFlag := FormatDateTime('yyyy-MM-DD HH:mm:ss', now);
    for i:=0 to Length(msgList)-1 do
    begin
       Writeln(aTxt, timeFlag + '  ' + msgTypeStr + '  ' + msgList[i]);
    end;
   CloseFile(aTxt);

end;

procedure WriteLog(gaugeId, msgType : Integer; msgList : array of string);
var aTxt: TextFile;
    sName, sPath, timeFlag, msgTypeStr, folderName: string;
    i : Integer;
begin
  
    msgTypeStr := '[INFO]';
    if (msgType = 1) then msgTypeStr := '[INFO]';
    if (msgType = 2) then msgTypeStr := '[WARNING]';
    if (msgType = 3) then msgTypeStr := '[ERROR]';
    sName := FormatDateTime('yyyymmdd', Now);

    if (gaugeId = 1) then folderName := '表位1';
    if (gaugeId = 2) then folderName := '表位2';
    if (gaugeId = 3) then folderName := '表位3';
    if (gaugeId = 4) then folderName := '表位4';
    if (gaugeId = 5) then folderName := '表位5';

    sPath := ExtractFilePath(Paramstr(0)) + '多表位系统通讯日志\' + folderName + '\' + sName + '.ini';
    AssignFile(aTxt, sPath);
    if FileExists(sPath) then
        Append(aTxt)
    else
        Rewrite(aTxt);

    timeFlag := FormatDateTime('yyyy-MM-DD HH:mm:ss', now);
    for i:=0 to Length(msgList)-1 do
    begin
       Writeln(aTxt, timeFlag + '  ' + msgTypeStr + '  ' + msgList[i]);
    end;
   CloseFile(aTxt);

end;

// richEdit实现将所选文本进行添加校验和(0)，加33(1)，减33(2), CRC校验(3)的功能
procedure richEditUtils (r : TRichEdit; funType : Integer);
var selectedStr, currentRowStr, checkStr, frontStr, midStr, backStr, tempSelectedStr : string;
    rowNum, selectedStart, selectedEnd, selectedLen, addLen : Integer;
begin
   tempSelectedStr := r.SelText;
   selectedStr := Trim(r.SelText);
   selectedStr := StringReplace(selectedStr, ' ', '', [rfReplaceAll]);
   selectedLen := Length(selectedStr);
   if (selectedStr <> '') and (selectedLen mod 2 = 0) then
   begin
      // 添加校验和(0)，加33(1)，减33(2)
      checkStr := '00';
      if (funType = 0) then
      begin
         checkStr := GetJy(selectedStr);
      end
      else if (funType = 1) then
      begin
          checkStr := add33(selectedStr);
      end
      else if (funType = 2) then
      begin
          checkStr := Less33(selectedStr);
      end
      else if (funType = 3) then
      begin
        checkStr := crcjy(selectedStr);
      end;

      // 获取光标当前所在行
      rowNum := r.CaretPos.Y;
      currentRowStr := r.Lines[rowNum];

      // 选中内容在当前行的开始,结束位置
//      selectedStart := Pos(tempSelectedStr, currentRowStr);
      selectedEnd := r.CaretPos.X;
      selectedStart := selectedEnd - r.SelLength;

      // 重新组织当前行的内容
      frontStr :=  Copy(currentRowStr, 1, selectedEnd);
      midStr := ' ' + checkStr + ' ';
      backStr :=  Copy(currentRowStr, selectedEnd+1, Length(currentRowStr) - selectedEnd);

      r.Lines[rowNum] := frontStr + midStr + backStr;

//      addLen := Length(midStr);
      // 设置光标所在位置
//      r.SetFocus;
//      r.SelStart := selectedEnd + addLen + 2;

//      PostMessage(r.Handle, EM_LINEINDEX, r.SelStart, 0);
//      r.SelLength :=0;
   end;
end;


// memo实现将所选文本进行添加校验和(0)，加33(1)，减33(2), CRC校验(3)的功能
procedure memoUtils (m : TMemo; funType : Integer);
var selectedStr, currentRowStr, checkStr, frontStr, midStr, backStr : string;
    rowNum, selectedStart, selectedEnd, selectedLen, addLen : Integer;
begin
   selectedStr := Trim(m.SelText);  // memo中若当前行存在汉字的话，SelText获取的字符串不正确？？？
   selectedStr := StringReplace(selectedStr, ':', '', [rfReplaceAll]);
   selectedStr := StringReplace(selectedStr, ' ', '', [rfReplaceAll]);
   selectedLen := Length(selectedStr);
   if (selectedStr <> '') and (selectedLen mod 2 = 0) then
   begin
      // 添加校验和(0)，加33(1)，减33(2)
      checkStr := '00';
      if (funType = 0) then
      begin
         checkStr := GetJy(selectedStr);
      end
      else if (funType = 1) then
      begin
          checkStr := add33(selectedStr);
      end
      else if (funType = 2) then
      begin
          checkStr := Less33(selectedStr);
      end
      else if (funType = 3) then
      begin
         checkStr := crcjy(selectedStr);
      end;

      // 获取光标当前所在行
      rowNum := m.CaretPos.Y;
      currentRowStr := m.Lines[rowNum];

      // 选中内容在当前行的开始,结束位置
//      selectedStart := Pos(tempSelectedStr, currentRowStr);
      selectedEnd := m.CaretPos.X;
      selectedStart := selectedEnd - m.SelLength;

      // 重新组织当前行的内容
      frontStr :=  Copy(currentRowStr, 1, selectedEnd);
      midStr := ' ' + checkStr + ' ';
      backStr :=  Copy(currentRowStr, selectedEnd+1, Length(currentRowStr) - selectedEnd);

      m.Lines[rowNum] := frontStr + midStr + backStr;

//      addLen := Length(midStr);
      // 设置光标所在位置
//      m.SetFocus;
//      m.SelStart := selectedEnd + addLen + 2;

//      PostMessage(m.Handle, EM_LINEINDEX, m.SelStart, 0);
//      m.SelLength :=0;
   end;
end;

//
function deleteMemo1310(memoContext: string): string;
var
    tempStr: string;
begin
    tempStr := memoContext;
    if (RightStr(tempStr, 2) = #13#10) then
    begin
        result := Copy(tempStr, 1, Length(tempStr) - 2);
    end
    else
    begin
        result := tempStr;
    end;
end;

// 求补码
function ComplementFun (str : string; Len : integer) : string; // str 为16进制数   len 表示str字符串长度
var
  Value, i: Integer;
  IntF : String;
begin
  IntF := '';
  for i:=0 to len-1 do
  begin
    IntF := IntF + 'F';
  end;

  Value := HexToDec(str);//转换为整数，如果整数长度不够可以用int64
  Value := - Value;//求整数补码。
//  Value := Value and $FFFFFFFFFFFF;
  Value := Value and StrToInt('$'+ IntF);
  Result := IntToHex(Value, Len);

end;

function cutOutNewStr(var str: string; startIndex, cutLen: Integer): string;
begin
    Result := Copy(str, startIndex, cutLen);
    Delete(str, startIndex, cutLen);
    // lbd hh
    // 延时，确保不卡顿
    Sleep(300);
    // 及时刷新界面
    Application.ProcessMessages;
end;


//
function cutOutStr(var str: string; startIndex, cutLen: Integer): string;
begin
    Result := Copy(str, startIndex, cutLen);
    Delete(str, startIndex, cutLen);
end;

 // 20170505152356  ->  2017-05-05 15:23:56    or   170505152356  ->  17-05-05 15:23:56
function formatDate(dataStr: string): string;
begin
    if (Length(dataStr) = 14) then
    begin
        Result := copy(dataStr, 1, 4) + '-' + copy(dataStr, 5, 2) + '-' + copy(dataStr, 7, 2) + ' ' + copy(dataStr, 9, 2) + ':' + copy(dataStr, 11, 2) + ':' + copy(dataStr, 13, 2);
    end
    else if (Length(dataStr) = 12) then
    begin
        Result := copy(dataStr, 1, 2) + '-' + copy(dataStr, 3, 2) + '-' + copy(dataStr, 5, 2) + ' ' + copy(dataStr, 7, 2) + ':' + copy(dataStr, 9, 2) + ':' + copy(dataStr, 11, 2);
    end;

end;

 //
function formatDateOfHex(dataStr: string): string;
begin
    if (Length(dataStr) = 14) then
    begin
        Result := PadLStr(IntToStr(HexToDec(copy(dataStr, 1, 4))), 2, '0') + '-' + PadLStr(IntToStr(HexToDec(copy(dataStr, 5, 2))), 2, '0') + '-' + PadLStr(IntToStr(HexToDec(copy(dataStr, 7, 2))), 2, '0') + ' ' + PadLStr(IntToStr(HexToDec(copy(dataStr, 9, 2))), 2, '0') + ':' + PadLStr(IntToStr(HexToDec(copy(dataStr, 11, 2))), 2, '0') + ':' + PadLStr(IntToStr(HexToDec(copy(dataStr, 13, 2))), 2, '0');
    end
    else if (Length(dataStr) = 12) then
    begin
        Result := PadLStr(IntToStr(HexToDec(copy(dataStr, 1, 2))), 2, '0') + '-' + PadLStr(IntToStr(HexToDec(copy(dataStr, 3, 2))), 2, '0') + '-' + PadLStr(IntToStr(HexToDec(copy(dataStr, 5, 2))), 2, '0') + ' ' + PadLStr(IntToStr(HexToDec(copy(dataStr, 7, 2))), 2, '0') + ':' + PadLStr(IntToStr(HexToDec(copy(dataStr, 9, 2))), 2, '0') + ':' + PadLStr(IntToStr(HexToDec(copy(dataStr, 11, 2))), 2, '0');
    end;

end;

function Replicate(pcChar: Char; piCount: integer): string;
begin
    Result := '';
    SetLength(Result, piCount);
    fillChar(Pointer(Result)^, piCount, pcChar)
end;

//
function PadLStr(psInput: string; piWidth: Integer; pcPadWith: Char): string;
begin
    Result := Replicate(pcPadWith, piWidth - Length(psInput)) + psInput
end;

//
function PadRStr(psInput: string; piWidth: Integer; pcPadWith: Char): string;
begin
    Result := psInput + Replicate(pcPadWith, piWidth - Length(psInput))
end;

//
function HexToDec(hexstr: string): integer;
begin
    Result := StrToInt('$' + hexstr);
end;

function getRandom(byteNum : Integer) : String;
var sGUID: string;
begin
	sGUID := CreateClassID;
	Delete(sGUID, 1, 1);
	Delete(sGUID, Length(sGUID), 1);
	sGUID:= StringReplace(sGUID, '-', '', [rfReplaceAll]);
	Result := Copy(sGUID, 1, byteNum * 2);
end;


//function HexToDec(i: byte): Integer;
//begin
//    try
//        if (i = $ae) or (i = $fd) then
//            result := 0
//        else
//            result := StrToInt(Format('%x', [i]));
//    except
//        result := 0;
//    end;
//end;

//
function DecToHex(i: byte): Integer;
begin
    result := strToInt('$' + intToStr(i));
end;

//
function DecToBin(i: integer): string;
begin
    while i <> 0 do
    begin
        result := Format('%d' + result, [i mod 2]);
        i := i div 2
    end
end;

//
function BinToDec(Value: string): Integer;
var
    str: string;
    Int: Integer;
    i: integer;
begin
    str := UpperCase(Value);
    Int := 0;
    for i := 1 to Length(str) do
        Int := Int * 2 + ORD(str[i]) - 48;
    Result := Int;
end;

//
function IntToBin(int: Integer; Size: Integer): string;
var
    i: Integer;
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


//十六进制转换为二进制
function HexToInt(const aHex: string): Integer;
var
    I, L, K: Integer;
begin
    Result := 0;
    if aHex = '' then
        Exit;

    K := 0;
    L := Length(aHex);
    for I := 1 to L do
    begin
        if (not (aHex[I] in ['A'..'F'])) and (not (aHex[I] in ['a'..'f'])) then
            K := K + Trunc(StrToInt(aHex[I]) * Power(16, L - I))
        else
            case aHex[I] of
                'a', 'A':
                    K := K + Trunc(10 * Power(16, L - I));
                'b', 'B':
                    K := K + Trunc(11 * Power(16, L - I));
                'c', 'C':
                    K := K + Trunc(12 * Power(16, L - I));
                'd', 'D':
                    K := K + Trunc(13 * Power(16, L - I));
                'e', 'E':
                    K := K + Trunc(14 * Power(16, L - I));
                'f', 'F':
                    K := K + Trunc(15 * Power(16, L - I));
            end;
    end;

    Result := K;
end;

//
function BinToInt(bin: string): Integer;
var
    i, Size: Integer;
begin
    Result := 0;
    Size := Length(bin);
    for i := Size downto 1 do
    begin
        if Copy(bin, i, 1) = '1' then
            Result := Result + (1 shl (Size - i));
    end;
end;


// 将字符转化为ascll码的Hex(和HexStrToStr互相转换)   （字符转化为ascll用Ord函数，得到的是十进制的数字，然后再将十进制的数字转化为16进制的Hex字符）
function StrToHexStr(const S: string): string;
var
    i: Integer;
begin
    for i := 1 to Length(S) do
    begin
        if i = 1 then
            Result := IntToHex(Ord(S[1]), 2)
        else
            Result := Result + IntToHex(Ord(S[i]), 2);
    end;
end;

// 将16进制的字符转化用ascll码标识的字符  则两个方法（StrToHexStr）互相转换
function HexStrToStr(const S: string): string;
var
    t: Integer;
    ts: string;
    M, Code: Integer;
begin
    t := 1;
    Result := '';
    while t <= Length(S) do
    begin   //xlh 2006.10.21
        while (t <= Length(S)) and (not (S[t] in ['0'..'9', 'A'..'F', 'a'..'f'])) do
            inc(t);
        if (t + 1 > Length(S)) or (not (S[t + 1] in ['0'..'9', 'A'..'F', 'a'..'f'])) then
            ts := '$' + S[t]
        else
            ts := '$' + S[t] + S[t + 1];
        Val(ts, M, Code);
        if Code = 0 then
            Result := Result + Chr(M);
        inc(t, 2);
    end;
end;



//
procedure CopyBytes(buffer: array of Byte; iStart, iLength: Integer; var SubBuffer: array of Byte);
var
    i: Integer;
begin
    if (Length(SubBuffer) > iLength) or (Length(buffer) - iStart < iLength) then
        raise Exception.Create('êy×é3¤?èòì3￡!');
    for i := 0 to iLength - 1 do
    begin
        SubBuffer[i] := buffer[iStart + i];
    end;
end;

//BCD码 倒置
function tzstrx(bb: string): string;
var
    lenn, i: integer;
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

//BCD码 倒置   1位倒置
function tzstrx1(bb: string): string;
var
    lenn, i: integer;
    aa: string;
begin
    lenn := length(bb);
    aa := '';
    i := lenn;
    while i > 0 do
    begin
        aa := aa + copy(bb, i, 1);
        lenn := lenn - 1;
        i := lenn;
    end;
    tzstrx1 := aa;
end;

// 倒置方法
function InvertedData(s: string): string;
var
    i, len: integer;
begin
    result := '';
    len := length(s);
    if (len mod 2) > 0 then
        raise Exception.Create('参数长度错误，不是有效的HEX字符串');
    len := len div 2;
    for i := 1 to len do
        result := result + MidStr(s, 2 * len - 2 * i + 1, 2);
end;

//
function GetJy(Str: string): string;
var
    i, j: integer;
    sTest: string;
begin
    j := 0;
    for i := 1 to (length(Str) div 2) do
    begin
        sTest := copy(Str, 2 * i - 1, 2);

        j := j + HexToDec(sTest);
    end;

    result := PadLStr(RightStr(IntToHex(j, 1), 2), 2, '0');
end;

//
function GetJy2(Str: string): string;
var
    i, j: integer;
    sTest: string;
begin
    j := 0;
    for i := 1 to (length(Str) div 2) do
    begin
        sTest := copy(Str, 2 * i - 1, 2);

        j := j + HexToDec(sTest);
    end;

    result := PadLStr(RightStr(IntToHex(j, 1), 4), 4, '0');
end;

function GetJy4(Str: string): string;
var
    i, j: integer;
    sTest: string;
begin
    j := 0;
    for i := 1 to (length(Str) div 2) do
    begin
        sTest := copy(Str, 2 * i - 1, 2);

        j := j + HexToDec(sTest);
    end;

    result := PadLStr(RightStr(IntToHex(j, 1), 8), 8, '0');
end;

procedure SetComponentEnable(m_c: TComponent; bEnable: Boolean);
var
    i: Integer;
begin
    for i := 0 to m_c.ComponentCount - 1 do
    begin
        if (m_c.Components[i] is TEdit) then
        begin
            (m_c.Components[i] as TEdit).Enabled := bEnable;
        end
        else if (m_c.Components[i] is TRadioButton) then
        begin
            (m_c.Components[i] as TRadioButton).Enabled := bEnable;
        end
        else if (m_c.Components[i] is TComboBox) then
        begin
            (m_c.Components[i] as TComboBox).Enabled := bEnable;
        end
        else if (m_c.Components[i] is TcxDateEdit) then
        begin
            (m_c.Components[i] as TcxDateEdit).Enabled := bEnable;
        end
        else if (m_c.Components[i] is TCheckBox) then
        begin
            (m_c.Components[i] as TCheckBox).Enabled := bEnable;
        end
        else if (m_c.Components[i] is TGroupBox) then
        begin
            SetComponentEnable(m_c.Components[i] as TGroupBox, bEnable);
        end
        else if (m_c.Components[i] is TPanel) then
        begin
            SetComponentEnable(m_c.Components[i] as TPanel, bEnable);
        end;
    end;
end;

procedure SetGroupboxControlsEnable(m_c: TGroupBox; bEnable: Boolean);
var
    i: Integer;
begin
    for i := 0 to m_c.ControlCount - 1 do
    begin
        if (m_c.Controls[i] is TEdit) then
        begin
            (m_c.Controls[i] as TEdit).Enabled := bEnable;
        end
        else if (m_c.Controls[i] is TComboBox) then
        begin
            (m_c.Controls[i] as TComboBox).Enabled := bEnable;
        end
        else if (m_c.Controls[i] is TcxDateEdit) then
        begin
            (m_c.Controls[i] as TcxDateEdit).Enabled := bEnable;
        end
        else if (m_c.Controls[i] is TCheckBox) then
        begin
            (m_c.Controls[i] as TCheckBox).Enabled := bEnable;
        end
        else if (m_c.Controls[i] is TGroupBox) then
        begin
            SetComponentEnable(m_c.Controls[i] as TGroupBox, bEnable);
        end
        else if (m_c.Controls[i] is TPanel) then
        begin
            SetComponentEnable(m_c.Controls[i] as TPanel, bEnable);
        end;
    end;
end;

procedure SetPanelControlsEnable(m_c: Tpanel; bEnable: Boolean);
var
    i: Integer;
begin
    for i := 0 to m_c.ControlCount - 1 do
    begin
        if (m_c.Controls[i] is TEdit) then
        begin
            (m_c.Controls[i] as TEdit).Enabled := bEnable;
        end
        else if (m_c.Controls[i] is TComboBox) then
        begin
            (m_c.Controls[i] as TComboBox).Enabled := bEnable;
        end
        else if (m_c.Controls[i] is TcxDateEdit) then
        begin
            (m_c.Controls[i] as TcxDateEdit).Enabled := bEnable;
        end
        else if (m_c.Controls[i] is TCheckBox) then
        begin
            (m_c.Controls[i] as TCheckBox).Enabled := bEnable;
        end
        else if (m_c.Controls[i] is TGroupBox) then
        begin
            SetComponentEnable(m_c.Controls[i] as TGroupBox, bEnable);
        end
        else if (m_c.Controls[i] is TPanel) then
        begin
            SetComponentEnable(m_c.Controls[i] as TPanel, bEnable);
        end;
    end;
end;

procedure ConfigData2Component(m_c: TComponent; sPath: string);
var
    i: Integer;
    myfile: TIniFile;
begin
    myfile := TIniFile.Create(sPath);
    for i := 0 to m_c.ComponentCount - 1 do
    begin
        if (m_c.Components[i] is TEdit) then
        begin
            (m_c.Components[i] as TEdit).Text := myfile.ReadString('TEdit', (m_c.Components[i] as TEdit).Name, '');
        end
        else if (m_c.Components[i] is TRadioButton) then
        begin
            (m_c.Components[i] as TRadioButton).Checked := myfile.ReadBool('TRadioButton', (m_c.Components[i] as TRadioButton).Name, False);
        end
        else if (m_c.Components[i] is TRzEdit) then
        begin
            (m_c.Components[i] as TRzEdit).Text := myfile.ReadString('TRzEdit', (m_c.Components[i] as TRzEdit).Name, '');
        end
        else if (m_c.Components[i] is TComboBox) then
        begin
            (m_c.Components[i] as TComboBox).ItemIndex := myfile.ReadInteger('TComboBox', (m_c.Components[i] as TComboBox).Name, -1);
        end
        else if (m_c.Components[i] is TcxComboBox) then
        begin
            (m_c.Components[i] as TcxComboBox).ItemIndex := myfile.ReadInteger('TcxComboBox', (m_c.Components[i] as TcxComboBox).Name, -1);
        end
        else if (m_c.Components[i] is TCheckBox) then
        begin
            (m_c.Components[i] as TCheckBox).Checked := myfile.ReadBool('TCheckBox', (m_c.Components[i] as TCheckBox).Name, False);
        end
        else if (m_c.Components[i] is TcxCheckBox) then
        begin
            (m_c.Components[i] as TcxCheckBox).Checked := myfile.ReadBool('TcxCheckBox', (m_c.Components[i] as TcxCheckBox).Name, False);
        end
        else if (m_c.Components[i] is TcxDateEdit) then
        begin
            (m_c.Components[i] as TcxDateEdit).Date := myfile.ReadDateTime('TcxDateEdit', (m_c.Components[i] as TcxDateEdit).Name, Now);
        end
        else if (m_c.Components[i] is TRzGroupBox) then
        begin
            ConfigData2Component(m_c.Components[i] as TRzGroupBox, sPath);
        end
        else if (m_c.Components[i] is TGroupBox) then
        begin
            ConfigData2Component(m_c.Components[i] as TGroupBox, sPath);
        end
        else if (m_c.Components[i] is TPanel) then
        begin
            ConfigData2Component(m_c.Components[i] as TPanel, sPath);
        end;
    end;
    FreeAndNil(myfile);
end;

procedure ComponentData2Config(m_c: TComponent; sPath: string);
var
    i: Integer;
    myfile: TIniFile;
begin
    myfile := TIniFile.Create(sPath);

    for i := 0 to m_c.ComponentCount - 1 do
    begin
        if (m_c.Components[i] is TEdit) then
        begin
            myfile.WriteString('TEdit', (m_c.Components[i] as TEdit).Name, (m_c.Components[i] as TEdit).Text);
        end
        else if (m_c.Components[i] is TRadioButton) then
        begin
            myfile.WriteBool('TRadioButton', (m_c.Components[i] as TRadioButton).Name, (m_c.Components[i] as TRadioButton).Checked);
        end
        else if (m_c.Components[i] is TRzEdit) then
        begin
            myfile.WriteString('TRzEdit', (m_c.Components[i] as TRzEdit).Name, (m_c.Components[i] as TRzEdit).Text);
        end
        else if (m_c.Components[i] is TComboBox) then
        begin
            myfile.WriteInteger('TComboBox', (m_c.Components[i] as TComboBox).Name, (m_c.Components[i] as TComboBox).ItemIndex);
        end
        else if (m_c.Components[i] is TcxComboBox) then
        begin
            myfile.WriteInteger('TcxComboBox', (m_c.Components[i] as TcxComboBox).Name, (m_c.Components[i] as TcxComboBox).ItemIndex);
        end
        else if (m_c.Components[i] is TCheckBox) then
        begin
            myfile.WriteBool('TCheckBox', (m_c.Components[i] as TCheckBox).Name, (m_c.Components[i] as TCheckBox).Checked);
        end
        else if (m_c.Components[i] is TcxCheckBox) then
        begin
            myfile.WriteBool('TcxCheckBox', (m_c.Components[i] as TcxCheckBox).Name, (m_c.Components[i] as TcxCheckBox).Checked);
        end
        else if (m_c.Components[i] is TcxDateEdit) then
        begin
            myfile.WriteDateTime('TcxDateEdit', (m_c.Components[i] as TcxDateEdit).Name, (m_c.Components[i] as TcxDateEdit).Date);
        end
        else if (m_c.Components[i] is TRzGroupBox) then
        begin
            ComponentData2Config(m_c.Components[i] as TRzGroupBox, sPath);
        end
        else if (m_c.Components[i] is TPageControl) then
        begin
            ComponentData2Config(m_c.Components[i] as TPageControl, sPath);
        end
        else if (m_c.Components[i] is TTabSheet) then
        begin
            ComponentData2Config(m_c.Components[i] as TTabSheet, sPath);
        end
        else if (m_c.Components[i] is TScrollBox) then
        begin
            ComponentData2Config(m_c.Components[i] as TScrollBox, sPath);
        end
        else if (m_c.Components[i] is TGroupBox) then
        begin
            ComponentData2Config(m_c.Components[i] as TGroupBox, sPath);
        end
        else if (m_c.Components[i] is TPanel) then
        begin
            ComponentData2Config(m_c.Components[i] as TPanel, sPath);
        end;


    end;
    FreeAndNil(myfile);
end;


{其他方法}

function FormatDW(sStr, sType: string; iFlag: Integer): string;
var
    rTemp: Real;
    sTemp, sDW: string;
begin

    if (sType = '02') or (sType = '14') or (sType = '01') or (sType = '32') then
        rTemp := StrToFloat(sStr) * 0.001
    else if (sType = '08') or (sType = '1A') or (sType = '0E') then
        rTemp := StrToFloat(sStr) * 1000
    else if (sType = '11') or (sType = '0A') then
        rTemp := StrToFloat(sStr) * 100000
    else if (sType = '13') then
        rTemp := StrToFloat(sStr) * 100000000
    else
        rTemp := StrToFloat(sStr);

    if (sType = '01') or (sType = '0B') or (sType = '0E') or (sType = '11') or (sType = '13') then
        rTemp := rTemp / 3600;

    if iFlag = 1 then
    begin
        try
            sTemp := FormatFloat('0.00', rTemp);
        except
            sTemp := sStr;
        end
    end
    else if iFlag = 2 then
    begin
        try
            sTemp := Copy(sStr, 1, 4) + '-' + Copy(sStr, 5, 2) + '-' + Copy(sStr, 7, 2) + ' ' + Copy(sStr, 9, 2) + ':' + Copy(sStr, 11, 2) + ':' + Copy(sStr, 13, 2);
        except
            sTemp := sStr;
        end;
    end;

    if sType = '02' then
        sDW := '05'
    else if sType = '14' then
        sDW := '05'
    else if sType = '01' then
        sDW := '05'
    else if sType = '29' then
        sDW := '29'
    else if sType = '2C' then
        sDW := '2C'
    else if sType = '08' then
        sDW := '05'
    else if sType = '1A' then
        sDW := '05'
    else if sType = '0E' then
        sDW := '05'
    else if sType = '11' then
        sDW := '05'
    else if sType = '13' then
        sDW := '05'
    else if sType = '0A' then
        sDW := '05'
    else if sType = '0B' then
        sDW := '05'
    else if sType = '05' then
        sDW := '05'
    else if sType = '17' then
        sDW := '05'
    else if sType = '32' then
        sDW := '35'
    else if sType = '35' then
        sDW := '35';

    Result := sTemp + ' ' + GetDW(sDW);
end;

function GetDW(iNo: string): string;
begin
    if iNo = '02' then
        Result := '【Wh】'
    else if iNo = '05' then
        Result := '【kWh】'
    else if iNo = '08' then
        Result := '【mWh】'
    else if iNo = '0A' then
        Result := '【mWh*100】'
    else if iNo = '01' then
        Result := '【J】'
    else if iNo = '0B' then
        Result := '【KJ】'
    else if iNo = '0E' then
        Result := '【MJ】'
    else if iNo = '11' then
        Result := '【GJ】'
    else if iNo = '13' then
        Result := '【GJ*100】'
    else if iNo = '14' then
        Result := '【W】'
    else if iNo = '17' then
        Result := '【kW】'
    else if iNo = '1A' then
        Result := '【MW】'
    else if iNo = '29' then
        Result := '【L】'
    else if iNo = '2C' then
        Result := '【立方米】'
    else if iNo = '32' then
        Result := '【L/h】'
    else if iNo = '35' then
        Result := '【立方米/h】';

end;

//
function HextoBin1(str: string): string;
var
    str1: string;
    i, m: Integer;
begin
    str1 := '';
    m := length(str) - 1;
    for i := 0 to m do
    begin
        str1 := chartohex(copy(str, length(str) - i, 1)) + str1;
    end;
    HextoBin1 := str1;
end;

procedure BinToHex1(Buffer: PAnsiChar; Text: PAnsiChar; BufSize: Integer);
const
    Convert: array[0..15] of AnsiChar = AnsiString('0123456789ABCDEF');
var
    I: Integer;
begin
    for I := 0 to BufSize - 1 do
    begin
        Text[0] := Convert[Byte(Buffer[I]) shr 4];
        Text[1] := Convert[Byte(Buffer[I]) and $F];
        Inc(Text, 2);
    end;
end;

function floatToHex(Value: single): string;
var 
    l, i: integer;
    HexText,tempHexText,temp: String;
begin 
    SetLength(HexText, 2 * SizeOf(Value));
    BinToHex1(pchar(@Value), pchar(@HexText[1]), SizeOf(Value));
    l := length(HexText);
    for i := (l div 2) downto 1 do
    begin
        temp:=copy(HexText,(2*i-1),2);
        tempHexText := tempHexText + temp;
    end;
    result := tempHexText;
end;

function HexToFloat(Value: string): Real;
var b,temp : string;
  e : integer;
  f : real;

      {
        子方法
      }
      //十六进制 to 二进制
      function HextoBinary(Hex:string):string;
      const
        BOX: array [0..15] of string =
        ('0000','0001','0010','0011',
        '0100','0101','0110','0111',
        '1000','1001','1010','1011',
        '1100','1101','1110','1111');
      var
        i:integer;
      begin
        for i:=Length(Hex) downto 1 do
        Result:=BOX[StrToInt('$'+Hex[i])]+Result;
      end;

      function floatBintoInt(Value: String): real;
      var i,Size: Integer;
      begin
        Result:=0;
        Size:=Length(Value);
        for i:=Size downto 1 do
        begin
          if Copy(Value,i,1)='1' then
            Result:=Result+1/(1 shl i);
        end;
      end;

        //二进制 to 十进制

      function BintoInt(Value: String): LongInt;
      var i,Size: Integer;
      begin
        Result:=0;
        Size:=Length(Value);
        for i:=Size downto 1 do
        begin
          if Copy(Value,i,1)='1' then
            Result:=Result+(1 shl (Size-i));
        end;
      end;

      //十进制 to 二进制
      function IntToBin(Value: LongInt;Size: Integer): String;
      var
       i: Integer;
      begin
         Result:='';
         for i:=Size-1 downto 0 do
         begin
           if Value and (1 shl i)<>0 then
           begin
             Result:=Result+'1';
           end
           else
           begin
             Result:=Result+'0';
           end;
         end;
      end;

begin
  b := HextoBinary(Value);
  temp := copy(b, 2, 8);
  e := BintoInt(temp) - 127;
  temp := copy(b, 10, 23);
  f := 1 + floatBintoInt(temp);
  if(copy(b, 1, 1) = '0')then
    result := power(2, e) * f
  else
    result := -power(2, e) * f;
end;

function chartohex(str: string): string;
begin
    if str = '0' then
        str := '0000';
    if str = '1' then
        str := '0001';
    if str = '2' then
        str := '0010';
    if str = '3' then
        str := '0011';
    if str = '4' then
        str := '0100';
    if str = '5' then
        str := '0101';
    if str = '6' then
        str := '0110';
    if str = '7' then
        str := '0111';
    if str = '8' then
        str := '1000';
    if str = '9' then
        str := '1001';
    if (str = 'A') or (str = 'a') then
        str := '1010';
    if (str = 'B') or (str = 'b') then
        str := '1011';
    if (str = 'C') or (str = 'c') then
        str := '1100';
    if (str = 'D') or (str = 'd') then
        str := '1101';
    if (str = 'E') or (str = 'e') then
        str := '1110';
    if (str = 'F') or (str = 'f') then
        str := '1111';
    chartohex := str;
end;

// 大口径水表数据解析
function bigWaterDataAnalysis(str: string): string;
var
    showMessage, s, meterNO, ctrlStr, len, dataIdentification, serialNumber, currentInstantaneousFlow, accumulationSum, accumulationSumOfDay, accumulationSumOfMonth, dayLimit, dayLimit1, timeStr, status: string;
begin
        // 当前瞬时流量  currentInstantaneousFlow
        // 累计净累积量 accumulationSum
        // 日累计累积量 accumulationSumOfDay
        // 月累计累积量 accumulationSumOfMonth
        // 当前所设置的日下限值 dayLimit
        // 当前所设置的日上限值 dayLimit1
        // 时间  timeStr
        // 当前状态 status
        // 先删除前四个
    meterNO := cutOutStr(str, 1, 4);
        // 表号
    meterNO := tzstrx(cutOutStr(str, 1, 14));
        // 控制码
    ctrlStr := cutOutStr(str, 1, 2);
        // 数据长度
    len := cutOutStr(str, 1, 2);
        // 数据标识
    dataIdentification := tzstrx(cutOutStr(str, 1, 4));
        // 序列号
    serialNumber := cutOutStr(str, 1, 2);
        // 有两种情况，全A读取和单独表号读取回来的数据长度不一致
    if (len = '2A') then
    begin
            // 当前瞬时流量
        currentInstantaneousFlow := tzstrx(cutOutStr(str, 1, 10));
        currentInstantaneousFlow := IntToStr(StrToInt(Copy(currentInstantaneousFlow, 3, 4))) + '.' + Copy(currentInstantaneousFlow, 7, 4);
            // 累计净累积量
        accumulationSum := tzstrx(cutOutStr(str, 1, 10));
        accumulationSum := IntToStr(StrToInt(Copy(accumulationSum, 3, 6))) + '.' + Copy(accumulationSum, 9, 2);
            // 日累计累积量
        accumulationSumOfDay := tzstrx(cutOutStr(str, 1, 10));
        accumulationSumOfDay := IntToStr(StrToInt(Copy(accumulationSumOfDay, 3, 6))) + '.' + Copy(accumulationSumOfDay, 9, 2);
            // 月累计累积量
        accumulationSumOfMonth := tzstrx(cutOutStr(str, 1, 10));
        accumulationSumOfMonth := IntToStr(StrToInt(Copy(accumulationSumOfMonth, 3, 6))) + '.' + Copy(accumulationSumOfMonth, 9, 2);
            // 当前所设置的日下限值
        dayLimit := tzstrx(cutOutStr(str, 1, 10));
        dayLimit := IntToStr(StrToInt(Copy(dayLimit, 3, 4))) + '.' + Copy(dayLimit, 7, 4);
            // 当前所设置的日上限值
        dayLimit1 := tzstrx(cutOutStr(str, 1, 10));
        dayLimit1 := IntToStr(StrToInt(Copy(dayLimit1, 3, 4))) + '.' + Copy(dayLimit1, 7, 4);
            // 时间
        timeStr := tzstrx(cutOutStr(str, 1, 14));
            // 当前状态
        status := cutOutStr(str, 1, 4);

        showMessage := '     表号：' + meterNO + #13#10 + '     控制码： ' + ctrlStr + #13#10 + '     数据标识： ' + dataIdentification + #13#10 + '     序列号： ' + serialNumber + #13#10 + '     当前瞬时流量：  ' + currentInstantaneousFlow + ' 每小时立方米' + #13#10 + '     累计净累积量：  ' + accumulationSum + ' 立方米' + #13#10 + '     日累计累积量：  ' + accumulationSumOfDay + ' 立方米' + #13#10 + '     月累计累积量：  ' + accumulationSumOfMonth + ' 立方米' + #13#10 + '     当前所设置的日下限值：  ' + dayLimit + ' 立方米' + #13#10 + '     当前所设置的日上限值：  ' + dayLimit1 + ' 立方米' + #13#10 + '     时间：  ' + formatDate(timeStr) + #13#10 + '     当前状态：  ' + status + #13#10;
    end
    else if (len = '16') then
    begin
            // 累计净累积量
        accumulationSum := tzstrx(cutOutStr(str, 1, 10));
        accumulationSum := IntToStr(StrToInt(Copy(accumulationSum, 3, 6))) + '.' + Copy(accumulationSum, 9, 2);
            // 月累计累积量
        accumulationSumOfMonth := tzstrx(cutOutStr(str, 1, 10));
        accumulationSumOfMonth := IntToStr(StrToInt(Copy(accumulationSumOfMonth, 3, 6))) + '.' + Copy(accumulationSumOfMonth, 9, 2);
            // 时间
        timeStr := tzstrx(cutOutStr(str, 1, 14));
            // 当前状态
        status := cutOutStr(str, 1, 4);

        showMessage := '     表号：' + meterNO + #13#10 + '     控制码： ' + ctrlStr + #13#10 + '     数据标识： ' + dataIdentification + #13#10 + '     序列号： ' + serialNumber + #13#10 + '     累计净累积量：  ' + accumulationSum + ' 立方米' + #13#10 + '     月累计累积量：  ' + accumulationSumOfMonth + ' 立方米' + #13#10 + '     时间：  ' + formatDate(timeStr) + #13#10 + '     当前状态：  ' + status + #13#10;
    end;

    Result := showMessage;
end;

// MBUS阀控水表数据解析
function MBUSWaterDataAnalysis(str: string): string;
var
    sTemp, sTemp1, sTemp2, sTemp3, sTempN: string;
    iLen: Integer;
begin
    iLen := HexToInt(Copy(str, 21, 2)) * 2;
    sTemp := Copy(str, 23, iLen);

    if (sTemp <> '') then
    begin
        sTemp3 := '      数据标识：' + tzstrx(Copy(sTemp, 1, 4)) + #13#10 +
                  '          表号：' + tzstrx(Copy(str, 5, 10)) + #13#10 +
                  '  当前累计流量：' + FormatDW(Copy(Copy(tzstrx(PChar(Copy(sTemp, 7, 10))), 3, 8), 1, 6) + '.' + Copy(Copy(tzstrx(PChar(Copy(sTemp, 7, 10))), 3, 8), 7, 2), Copy(Copy(sTemp, 7, 10), 9, 2), 1) + #13#10 + '结算日累计流量：' + FormatDW(Copy(Copy(tzstrx(PChar(Copy(sTemp, 17, 10))), 3, 8), 1, 6) + '.' + Copy(Copy(tzstrx(PChar(Copy(sTemp, 17, 10))), 3, 8), 7, 2), Copy(Copy(sTemp, 17, 10), 9, 2), 1) + #13#10 + '      实时时间：' + FormatDW(tzstrx(PChar(Copy(sTemp, 27, 14))), 'NO', 2) + #13#10;
    end;
    sTemp1 := Copy(sTemp, 41, 2);
    sTemp1 := PadLStr(hextoBin1(sTemp1), 8, '0');

    if Copy(sTemp1, 7, 2) = '00' then
        sTemp2 := '阀门：开'
    else if Copy(sTemp1, 7, 2) = '11' then
        sTemp2 := '阀门：异常'
    else
        sTemp2 := '阀门：关';

    if Copy(sTemp1, 6, 1) = '0' then
        sTemp2 := sTemp2 + ' 电池电压：正常'
    else if Copy(sTemp1, 6, 1) = '1' then
        sTemp2 := sTemp2 + ' 电池电压：欠压';

    if Copy(sTemp1, 5, 1) = '0' then
        sTemp2 := sTemp2 + ' 时钟状态：正常'
    else if Copy(sTemp1, 5, 1) = '1' then
        sTemp2 := sTemp2 + ' 时钟状态：错误';
    if Copy(sTemp1, 4, 1) = '0' then
        sTemp2 := sTemp2 + ' 透支情况：正常'
    else if Copy(sTemp1, 4, 1) = '1' then
        sTemp2 := sTemp2 + ' 透支情况：透支';
    if Copy(sTemp1, 3, 1) = '0' then
        sTemp2 := sTemp2 + ' 检漏异常：正常'
    else if Copy(sTemp1, 3, 1) = '1' then
        sTemp2 := sTemp2 + ' 检漏异常：阀门漏水';
    if Copy(sTemp1, 2, 1) = '0' then
        sTemp2 := sTemp2 + ' 强磁报警：正常'
    else if Copy(sTemp1, 2, 1) = '1' then
        sTemp2 := sTemp2 + ' 强磁报警：强磁故障';
    if Copy(sTemp1, 1, 1) = '0' then
        sTemp2 := sTemp2 + ' 单采样错误：正常'
    else if Copy(sTemp1, 1, 1) = '1' then
        sTemp2 := sTemp2 + ' 单采样错误：单采样故障' + #13#10;

    sTempN := Copy(sTemp, 43, 2);
    sTempN := PadLStr(hextoBin1(sTempN), 8, '0');

    if Copy(sTempN, 8, 1) = '0' then
        sTemp2 := sTemp2 + ' 外部EEP错误：正常'
    else if Copy(sTempN, 8, 1) = '1' then
        sTemp2 := sTemp2 + ' 外部EEP错误：错误';
    if Copy(sTempN, 7, 1) = '0' then
        sTemp2 := sTemp2 + ' 远程开关阀：远程开阀'
    else if Copy(sTempN, 7, 1) = '1' then
        sTemp2 := sTemp2 + ' 远程开关阀：远程关阀';
    if Copy(sTempN, 5, 1) = '0' then
        sTemp2 := sTemp2 + ' 付费方式：预付费'
    else if Copy(sTempN, 5, 1) = '1' then
        sTemp2 := sTemp2 + ' 付费方式：后付费';
    if Copy(sTempN, 4, 1) = '0' then
        sTemp2 := sTemp2 + ' 费控量控：费控'
    else if Copy(sTempN, 4, 1) = '1' then
        sTemp2 := sTemp2 + ' 费控量控：量控';
    if Copy(sTempN, 3, 1) = '0' then
        sTemp2 := sTemp2 + ' 出厂：未出厂'
    else if Copy(sTempN, 3, 1) = '1' then
        sTemp2 := sTemp2 + ' 出厂：已出厂';
    if Copy(sTempN, 2, 1) = '0' then
        sTemp2 := sTemp2 + ' 设置：未设置'
    else if Copy(sTempN, 2, 1) = '1' then
        sTemp2 := sTemp2 + ' 设置：已设置';
    if Copy(sTempN, 1, 1) = '0' then
        sTemp2 := sTemp2 + ' 开户：未开户'
    else if Copy(sTempN, 1, 1) = '1' then
        sTemp2 := sTemp2 + ' 开户：已开户';

    sTemp3 := sTemp3 + '          状态：' + sTemp2;
    Result := sTemp3;
end;

// MBUS阀控水表数据解析 83
function MBUSWaterDataAnalysisBy83(str: string): string;
var
    sTemp, sTemp1, sTemp2, sTemp3, sTempN: string;
    iLen: Integer;
    s1,s2,s3:string;
begin
    iLen := HexToInt(Copy(str, 21, 2)) * 2;
    sTemp := Copy(str, 23, iLen);

    if (sTemp <> '') then
    begin
        s1:=FormatDW(Copy(Copy(tzstrx(PChar(Copy(sTemp, 9, 10))), 3, 8), 1, 6) + '.' + Copy(Copy(tzstrx(PChar(Copy(sTemp, 9, 10))), 3, 8), 7, 2), Copy(Copy(sTemp, 9, 10), 9, 2), 1) ;
        s2:=FormatDW(Copy(Copy(tzstrx(PChar(Copy(sTemp, 19, 10))), 3, 8), 1, 6) + '.' + Copy(Copy(tzstrx(PChar(Copy(sTemp, 19, 10))), 3, 8), 7, 2), Copy(Copy(sTemp, 19, 10), 9, 2), 1);
        s3:=FormatDW(tzstrx(PChar(Copy(sTemp, 27, 14))), 'NO', 2);
        sTemp3 := '数据标识：' + tzstrx(Copy(sTemp, 1, 4)) + #13#10
                + '表号：' + tzstrx(Copy(str, 5, 14)) + #13#10
                + '当前累计流量：' + s1 + #13#10
                + '结算日累计流量：' + s2 + #13#10
                + '实时时间：' + s3 + #13#10;
 end;
    sTemp1 := Copy(sTemp, 41, 2);
    sTemp1 := PadLStr(hextoBin1(sTemp1), 8, '0');

    if Copy(sTemp1, 7, 2) = '00' then
        sTemp2 := '阀门：开'
    else if Copy(sTemp1, 7, 2) = '11' then
        sTemp2 := '阀门：异常'
    else
        sTemp2 := '阀门：关';

    sTemp2:=sTemp2+ #13#10;

    if Copy(sTemp1, 6, 1) = '0' then
        sTemp2 := sTemp2 + ' 电池电压：正常'
    else if Copy(sTemp1, 6, 1) = '1' then
        sTemp2 := sTemp2 + ' 电池电压：欠压';

    sTemp2:=sTemp2+ #13#10;

    if Copy(sTemp1, 5, 1) = '0' then
        sTemp2 := sTemp2 + ' 时钟状态：正常'
    else if Copy(sTemp1, 5, 1) = '1' then
        sTemp2 := sTemp2 + ' 时钟状态：错误';
    if Copy(sTemp1, 4, 1) = '0' then
        sTemp2 := sTemp2 + ' 透支情况：正常'
    else if Copy(sTemp1, 4, 1) = '1' then
        sTemp2 := sTemp2 + ' 透支情况：透支';
    if Copy(sTemp1, 3, 1) = '0' then
        sTemp2 := sTemp2 + ' 检漏异常：正常'
    else if Copy(sTemp1, 3, 1) = '1' then
        sTemp2 := sTemp2 + ' 检漏异常：阀门漏水';
    if Copy(sTemp1, 2, 1) = '0' then
        sTemp2 := sTemp2 + ' 强磁报警：正常'
    else if Copy(sTemp1, 2, 1) = '1' then
        sTemp2 := sTemp2 + ' 强磁报警：强磁故障';
    if Copy(sTemp1, 1, 1) = '0' then
        sTemp2 := sTemp2 + ' 单采样错误：正常'
    else if Copy(sTemp1, 1, 1) = '1' then
        sTemp2 := sTemp2 + ' 单采样错误：单采样故障' + #13#10;

    sTempN := Copy(sTemp, 43, 2);
    sTempN := PadLStr(hextoBin1(sTempN), 8, '0');

    if Copy(sTempN, 8, 1) = '0' then
        sTemp2 := sTemp2 + ' 外部EEP错误：正常'
    else if Copy(sTempN, 8, 1) = '1' then
        sTemp2 := sTemp2 + ' 外部EEP错误：错误';
    if Copy(sTempN, 7, 1) = '0' then
        sTemp2 := sTemp2 + ' 远程开关阀：远程开阀'
    else if Copy(sTempN, 7, 1) = '1' then
        sTemp2 := sTemp2 + ' 远程开关阀：远程关阀';
    if Copy(sTempN, 5, 1) = '0' then
        sTemp2 := sTemp2 + ' 付费方式：预付费'
    else if Copy(sTempN, 5, 1) = '1' then
        sTemp2 := sTemp2 + ' 付费方式：后付费';

        sTemp2:=sTemp2+ #13#10;

    if Copy(sTempN, 4, 1) = '0' then
        sTemp2 := sTemp2 + ' 费控量控：费控'
    else if Copy(sTempN, 4, 1) = '1' then
        sTemp2 := sTemp2 + ' 费控量控：量控';
    if Copy(sTempN, 3, 1) = '0' then
        sTemp2 := sTemp2 + ' 出厂：未出厂'
    else if Copy(sTempN, 3, 1) = '1' then
        sTemp2 := sTemp2 + ' 出厂：已出厂';
    if Copy(sTempN, 2, 1) = '0' then
        sTemp2 := sTemp2 + ' 设置：未设置'
    else if Copy(sTempN, 2, 1) = '1' then
        sTemp2 := sTemp2 + ' 设置：已设置';
    if Copy(sTempN, 1, 1) = '0' then
        sTemp2 := sTemp2 + ' 开户：未开户'
    else if Copy(sTempN, 1, 1) = '1' then
        sTemp2 := sTemp2 + ' 开户：已开户';

    sTemp3 := sTemp3 + '          状态：' + sTemp2;
    Result := sTemp3;
end;


//获取版本号
function GetBuildInfo: string; overload; //获取版本号
begin
    Result := GetBuildInfo(ParamStr(0));
end;

//获取版本号
function GetBuildInfo(sFile: string): string; //获取版本号
var
    verinfosize: DWORD;
    verinfo: pointer;
    vervaluesize: dword;
    vervalue: pvsfixedfileinfo;
    dummy: dword;
    v1, v2, v3, v4: word;
begin
//    verinfosize := getfileversioninfosize(pchar(paramstr(0)),dummy);
    verinfosize := getfileversioninfosize(pchar(sFile), dummy);
    if verinfosize = 0 then
    begin
        dummy := getlasterror;
        result := '0.0.0.0';
    end;

    getmem(verinfo, verinfosize);
//    getfileversioninfo(pchar(paramstr(0)),0,verinfosize,verinfo);
    getfileversioninfo(pchar(sFile), 0, verinfosize, verinfo);
    verqueryvalue(verinfo, '\', pointer(vervalue), vervaluesize);
    with vervalue^ do
    begin
        v1 := dwfileversionms shr 16;
        v2 := dwfileversionms and $ffff;
        v3 := dwfileversionls shr 16;
        v4 := dwfileversionls and $ffff;
    end;

    result := inttostr(v1) + '.' + inttostr(v2) + '.' + inttostr(v3) + '.' + inttostr(v4);
    freemem(verinfo, verinfosize);
end;



// 转换文件的时间格式
function CovFileDate(Fd: _FileTime): TDateTime;
{ 转换文件的时间格式 }
var
    Tct: _SystemTime;
    Temp: _FileTime;
begin
    FileTimeToLocalFileTime(Fd, Temp);
    FileTimeToSystemTime(Temp, Tct);
    CovFileDate := SystemTimeToDateTime(Tct);
end;

// 获取文件时间，Tf表示目标文件路径和名称
procedure GetFileTime(const Tf: string; var t1, t2, t3: string);
const
    Model = 'yyyy-MM-DD HH:mm:ss';   {   设定时间格式   }
var
    Tp: TSearchRec;   {   申明Tp为一个查找记录   }

begin
  {   查找目标文件   }
    FindFirst(Tf, faAnyFile, Tp);
  {   返回文件的创建时间   }
    t1 := FormatDateTime(Model, CovFileDate(Tp.FindData.ftCreationTime));
  {   返回文件的修改时间   }
    t2 := FormatDateTime(Model, CovFileDate(Tp.FindData.ftLastWriteTime));
  {   返回文件的当前访问时间   }
    t3 := FormatDateTime(Model, Now);
    FindClose(Tp);
end;

// 加33 方法
function add33(str: string): string;
var
    i, sum1: Integer;
    returnStr, tempStr, hexStr: string;
begin
    returnStr := '';
    for i := 1 to (length(str) div 2) do
    begin
        tempStr := copy(str, 2 * i - 1, 2);

        sum1 := HexToInt(tempStr) + $33;
        hexStr := IntToHex(sum1, 2);
        hexStr := RightStr(hexStr, 2);
        returnStr := returnStr + hexStr;
    end;
    Result := returnStr;
end;

function getBinStr(sourceStr : string;DelimiterStr : Char ;len: Integer): string;
var selectedList : TStringList;
    myIndex, i : Integer;
    mStr : string;
begin
   selectedList := TStringList.Create;
   mStr := PadLStr('', len, '0');
   selectedList.Delimiter := DelimiterStr;
   selectedList.DelimitedText := sourceStr;

   for i:=0 to selectedList.Count -1 do
   begin
       myIndex := StrToInt(selectedList.Strings[i]);
       if (myIndex = 1) then
       begin
           mStr := '1' + Copy(mStr, 2, Length(mStr)-1);
       end
       else if (myIndex = len) then
       begin
          mStr := Copy(mStr, 1, len-1) + '1';
       end
       else
       begin
           mStr := Copy(mStr, 1, myIndex-1) + '1' +  Copy(mStr, myIndex+1, Length(mStr)-myIndex);
       end;
   end;
   Result := ReverseString(mStr);
end;

// 减33 方法
function Less33(str: string): string;
var
    i, sum2: Integer;
    returnStr, tempStr, hexStr: string;
begin
    returnStr := '';
    for i := 1 to (length(str) div 2) do
    begin
        tempStr := copy(str, 2 * i - 1, 2);

        sum2 := HexToInt(tempStr) - $33;
        if (sum2 < 0) then
        begin
            sum2 := 256 + sum2;
        end;
        hexStr := IntToHex(sum2, 2);
        returnStr := returnStr + hexStr;
    end;
    Result := returnStr;
end;

function mapOperationRule(op : string): string;
var msg : string;
begin
  if (op <> '') then
  begin
    if (op = '0B') then msg := '明文 + SM2签名(0B)'
    else if (op = '08') then msg := '明文 + SM4的MAC(08)'
    else if (op = '88') then msg := '密文 + SM4的MAC(88)'
    else if (op = '8B') then msg := '密文 + SM2签名(8B)'
    else msg := op;
  end
  else
    msg := '数据异常';
  Result := msg;
end;


function mapreportCode(reportCode : string): string;
var msg : string;
begin
  if (reportCode <> '') then
  begin
    if (reportCode = '80010006') then msg := '电源电压欠压值 1(80010006)';
    if (reportCode = '80010007') then msg := '电源供电(80010007)';
    if (reportCode = '80010009') then msg := '阀门故障(80010009)';
    if (reportCode = '80010010') then msg := '时钟电池欠压(80010010)';
    if (reportCode = '80010011') then msg := '磁干扰(80010011)';
    if (reportCode = '80010012') then msg := '异常流量超大流量(80010012)';
    if (reportCode = '80010013') then msg := '异常流量超小流量(80010013)';
    if (reportCode = '00000000') then msg := '定时自动上报(00000000)';
    if (reportCode = '00000001') then msg := '长按键上报(00000001)';
    if (reportCode = '00000002') then msg := '连续不用气触发上报(00000002)';
    if (reportCode = '00000003') then msg := '红外触发(00000003)';
  end
  else
    msg := '数据异常';
  Result := msg;
end;

function mapFCW(fcw : string): string;
var msg : string;
begin
  if (fcw <> '') then
  begin
    if (fcw = 'C1') then msg := '注册请求上行报文，携带燃气表数据(C1)';
    if (fcw = '51') then msg := '普通上行报文，携带燃气表数据(51)';
    if (fcw = '01') then msg := '下行给燃气表数据对象(01)';
    if (fcw = '02') then msg := '写入安全芯片指定的燃气信息文件(02)';
    if (fcw = '03') then msg := '读安全芯片指定的燃气信息文件(03)';
    if (fcw = '04') then msg := '扩展读安全芯片指定的燃气信息文件(04)';
    if (fcw = '0A') then msg := '普通下行，密钥更新(0A)';
    if (fcw = '0F') then msg := '普通下行，生命周期设置(0F)';
    if (fcw = '80') then msg := '下行注册应答，不携带附加报文(80)';
    if (fcw = '81') then msg := '注册下行，带附加报文。下行给燃气表数据对象(81)';
    if (fcw = '82') then msg := '注册下行，带附加报文。写入安全芯片指定的燃气信息文件(82)';
    if (fcw = '83') then msg := '注册下行，带附加报文。读安全芯片指定的燃气信息文件(83)';
    if (fcw = '84') then msg := '注册下行，带附加报文。扩展读安全芯片指定的燃气信息文件(84)';
    if (fcw = '40') then msg := '应答，不携带附加报文(40)';
    if (fcw = '41') then msg := '应答，下行给燃气表数据对象(41)';
    if (fcw = '42') then msg := '应答，写入安全芯片指定的燃气信息文件(42)';
    if (fcw = '43') then msg := '应答，读安全芯片指定的燃气信息文件(43)';
    if (fcw = '44') then msg := '应答，扩展读安全芯片指定的燃气信息文件(44)';
    if (fcw = '4A') then msg := '应答，普通下行，密钥更新(4A)';
    if (fcw = '4F') then msg := '应答，普通下行，生命周期设置(4F)';
  end
  else
    msg := '数据异常';
  Result := msg;
end;

function mapEvent(eventCode : string): string;
var msg : string;
begin
  if (eventCode <> '') then
  begin
    if (eventCode = '11') then msg := '开阀';
    if (eventCode = '12') then msg := '关阀';
    if (eventCode = '15') then msg := '阀门故障';
    if (eventCode = '16') then msg := '电源供电';
    if (eventCode = '17') then msg := '欠压值 1';
    if (eventCode = '18') then msg := '欠压值 2';
    if (eventCode = '1A') then msg := '磁干扰';
    if (eventCode = '1B') then msg := '短按键启动显示屏显示';
    if (eventCode = '1D') then msg := '无线信道尝试连接达到最大次数';
    if (eventCode = '1E') then msg := '电源断电';
    if (eventCode = '1F') then msg := '正确校时';
    if (eventCode = '20') then msg := '无线信道启动';
    if (eventCode = '21') then msg := '无线信道挂断';
    if (eventCode = '22') then msg := '无线信道搜信号失败';
    if (eventCode = '23') then msg := '无线信道连接数据采集系统失败';
    if (eventCode = '24') then msg := '有线信道或无线信道报文校验错';
    if (eventCode = '25') then msg := '有线信道或无线信道报文格式错';
    if (eventCode = '26') then msg := '信道收到过滤命令';
    if (eventCode = '27') then msg := '生产状态信道执行测试指令';
    if (eventCode = '28') then msg := '多天不用气';
    if (eventCode = '2E') then msg := '异常流量';
    if (eventCode = '2F') then msg := '计量处理单元异常';
  end
  else
    msg := '数据异常';
  Result := msg;
end;

// 访问昆仑接口
function getKunLunInterface(requestType, frameStr, a10_KEY: string): string;
var
  i, j, iPos: Integer;
  sResponse: string;
  IdHTTP1: TIdHTTP;
  jo, nobj: ISuperObject;
  sServerAddress, iVarType: string;
  sStrMsg: string;
  hostAddress, paramType : string;
  strFlag, returnStr, jsonStr, a10_KEYStr, meterNum, opt: string;
  jsonToSend : TStringStream;
begin
  a10_KEYStr := '';
  
  hostAddress := 'http://111.203.165.13:19091';
  if (requestType = 'Login') then  paramType := '/a10service/pda/login';
  if (requestType = 'Meter') then  paramType := '/a10service/pda/meter';
  if (requestType = 'Reqopt') then  paramType := '/a10service/pda/reqopt';

  
  sServerAddress := hostAddress + paramType;

  IdHTTP1 := TIdHTTP.Create(nil);

  IdHTTP1.Request.ContentLength := -1;
  IdHTTP1.Request.ContentRangeEnd := 0;
  IdHTTP1.Request.ContentRangeStart := 0;

  IdHTTP1.Request.Accept := 'application/json';
  IdHTTP1.Request.ContentType := 'application/json';

  if (requestType <> 'Login') then
  begin
     IdHTTP1.Request.CustomHeaders.Values['A10_KEY'] := a10_KEY;
  end;

  IdHTTP1.Request.AcceptCharSet := 'UTF-8';
  IdHTTP1.Request.AcceptLanguage := 'zh-cn';
  IdHTTP1.Request.AcceptEncoding := 'gzip, deflate';

  IdHTTP1.Request.BasicAuthentication := False;
  IdHTTP1.HandleRedirects := true;

  if (requestType = 'Login') then
  begin
    jsonStr := '{"payload":"'+ frameStr +'"}';
  end
  else if (requestType = 'Meter') then
  begin
    meterNum := '';
    jsonStr := '{"meterId":"'+ meterNum +'","payload":"'+ frameStr +'"}';
  end
  else if (requestType = 'Reqopt') then
  begin
    meterNum := '';
    opt := 'LOCK';
    jsonStr := '{"meterId":"'+ meterNum +'","opt":"'+ opt +'"}';
  end;


  jsonToSend := TStringStream.Create(jsonStr);//创建一个包含JSON数据的变量
  jsonToSend.Position := 0;                                  //将流位置置为0

  try
    sResponse := IdHTTP1.Post(sServerAddress,jsonToSend);

    sStrMsg := utf8decode(sResponse);
    jo := SO(sStrMsg);
    if jo <> nil then
    begin
      strFlag := jo.S['msg'];  // 1 成功
      if (strFlag = 'Success') then
      begin
        nobj := SO(jo.S['result']);
        if (requestType = 'Login') then
        begin
           // 缓存key
           a10_KEYStr := nobj.S['a10_KEY'];
        end;
        returnStr := nobj.S['payload'];
        Result := a10_KEYStr + '|' + returnStr;
        if (requestType <> 'Login') then
        begin
           Result := returnStr;
        end;
      end
      else
      begin
        if (requestType = 'Login') then
        begin
           // 缓存key
           a10_KEYStr := '';
        end;
        Result := '';
      end;
    end;
  except
    on E: Exception do
    begin
      sStrMsg := 'WebService请求时发生错误：' + E.Message;
      Result := '';
    end;
  end;
  IdHTTP1.Free;
  jsonToSend.free;
end;

function AnalysisKunLunFrame(cmdName, receiveFrame, modeType, a10_KEY, pass : string; memo: TRichEdit): TStringList;
var  dataArea, totalLen : string;
i, whileNum : Integer;
sl : TStringList;
DIstr, controlWord, operationRule, fcw, dataLen, counter, randomNum, meterAddr, MAC, subFrame, appendFrame : string;
tiemStr, companyCode, mfv, RSRP, SINA, ECL, CellId, REAL_NEARFCN, IMEI : string;
ctrl, objNum, objId, reportCode, meterTimeStr, runningStatus, totalAmount, tempDataStr, Voltage, dateStr, dayDataStr, dayIncStr : string;
ipos, zeroLen, len1, len2 : Integer;
s1, s2, s3, s4, s5, s6, s7, s8, s9, sj1, sj2, sj3, sj4, sj5, sj6, sj7, sj8, sj9 : string;
f1, f2, f3, f4, f5, f6, f7, f8, f9 :Real;
zdxhbm, zdgjbb, tokenStr, sBH, keyStr, key1, key2, resultStr, eType, statusWord :string;
protocolCode , protocolVersion, kunlunSendFrame, newCRC, newLenStr, receiveData: string;
key, tg: PByteArray;
begin
//   receiveFrame := '68008701011632004000002105825AF4D1DFEA51851007A8797D55AD0516597C';
//   receiveFrame := receiveFrame + 'F9811FB70280D8647485AB97D669262D3A4A612A2F213BD11DC998584FCE410A6F0E8E7BD79998BF8C778F518A9C84B814A9ED8FE9800AF8DD7005B4DDC65C319735BB8DF485738D225F9B35263CED035CB5DA960F8C25B712D06DB4A0957EBFD30AEFFB28842216';

   
   if (receiveFrame = '') then Exit;
   // 返回字符数组列表
   sl := TStringList.Create;
   // 帧总长度
   totalLen := IntToStr(HexToDec(Copy(receiveFrame, 3, 4)));
   // 协议代码
   protocolCode := Copy(receiveFrame, 7, 2);
   // 协议版本
   protocolVersion := Copy(receiveFrame, 9, 2);
   // 表号
   sBH := Copy(receiveFrame, 11, 16);
   // 控制字
   controlWord := Copy(receiveFrame, 27, 2);
   dataArea := Copy(receiveFrame, 29, (StrToInt(totalLen)-8-8) * 2);
   subFrame := dataArea;
   // A5 异或  解密
   subFrame := DecryptStr(subFrame, 'A5');
   memo.lines.add('           数据域接收【A5异或后明文】:' + subFrame);
   if (modeType = 'Test') then
   begin
     eType := '20160417';
     // AES128解密，注册上行（81）、快捷读取（86）不需要解密
     if (controlWord <> '81') and (controlWord <> '86')  then
     begin
         // 密钥
         keyStr := RightStr(subFrame, 8) + Copy(sBH, 6, 8) + pass; // '20160417' 3230313630343137
         // 功能控制字
         fcw := Copy(subFrame, 3, 2);
         if (fcw = 'FF') or ((fcw = 'FE')) then  // FF 为读取宁光密钥   FE为 注册下行回复帧
         begin
            keyStr := Copy(sBH, 2, 12) + '00nxlgg123';
            eType := '00nxlgg123';
         end; 
         // AES128 解密
         subFrame := AES128Decrypt(subFrame, keyStr, eType);
     end;
   end;

   memo.lines.add('           数据域接收【明文】:' + subFrame);
   if (controlWord = '81') then // 注册上行  控制字
   begin
     // 厂外密文模式 发送HTTP请求
     if (modeType = 'Cipher') then
     begin
        // 新长度去除8字节的表号
        newLenStr := IntToHex(StrToInt(totalLen) - 8, 4);   
        newCRC := newLenStr + protocolCode + protocolVersion + controlWord + subFrame;
        newCRC := CRC16(newCRC);
        // 新组织的报文
        kunlunSendFrame := '68' + newLenStr + protocolCode + protocolVersion + controlWord + subFrame + newCRC + '16';


        receiveData := getKunLunInterface('Meter', kunlunSendFrame, a10_KEY);
        sl.Add('getSendInfo:' + receiveData);
     end
     else
     begin
         // 厂外明文以及 厂内调试模式

         // 运算规则
         operationRule := Copy(subFrame, 1, 2);
         cutOutStr(subFrame, 1, 2);
         // 功能控制字
         fcw := Copy(subFrame, 1, 2);
         cutOutStr(subFrame, 1, 2);
         // 数据长度
         dataLen := IntToStr(HexToDec(Copy(subFrame, 1, 2)));
         cutOutStr(subFrame, 1, 2);
         // 计数器
         counter := Copy(subFrame, 1, 2);
         cutOutStr(subFrame, 1, 2);
         // 随机数
         randomNum := Copy(subFrame, 1, 6);
         cutOutStr(subFrame, 1, 6);
         // 燃气表号
         meterAddr := Copy(subFrame, 1, 16);
         cutOutStr(subFrame, 1, 16);

         cutOutStr(subFrame, 1, 62);
         // 附加报文
         appendFrame := Copy(subFrame, 1, Length(subFrame)-8);
         // MAC地址
         MAC := RightStr(subFrame, 8);

         // 表端时钟
         tiemStr := Copy(appendFrame, 1, 12);
         cutOutStr(appendFrame, 1, 12);
         // 终端型号编码
         zdxhbm := Copy(appendFrame, 1, 4);
         cutOutStr(appendFrame, 1, 4);
         // 终端固件版本
         zdgjbb := Copy(appendFrame, 1, 2);
         cutOutStr(appendFrame, 1, 2);
         // tokenStr
         tokenStr := Copy(appendFrame, 1, 16);
         cutOutStr(appendFrame, 1, 16);

         try
           sl.Add('运算规则:' + mapOperationRule(operationRule));
           sl.Add('功能控制字:' + mapFCW(fcw));
           sl.Add('数据长度:' + dataLen);
           sl.Add('计数器:' + counter);
           sl.Add('随机数:' + randomNum);
           sl.Add('燃气表号:' + meterAddr);
           sl.Add('MAC地址:' + MAC);
    //       sl.Add('MAC地址:' + DecryptStr(MAC, 'A5'));
           sl.Add('表端时钟:' + tiemStr);
           sl.Add('终端型号编码:' + zdxhbm);
           sl.Add('终端固件版本:' + zdgjbb);
           sl.Add('TOKEN:' + tokenStr);
         except
       
         end;
     end; 
   end
   else if (controlWord = '86') then  // 86: 快捷读取  解析  
   begin
      // 厂内调试模式
     if (modeType = 'Test') then
     begin
        // 功能控制字
        fcw := Copy(subFrame, 1, 2);
        sl.Add('功能控制字:' + mapFCW(fcw));
        // 状态字
        statusWord := Copy(subFrame, 3, 4);
        // 数据长度
        len1 := HexToInt(RightStr(statusWord, 2));
        // 数据
        appendFrame := Copy(subFrame, 7, len1*2);
        // 数据解析
        if (cmdName = '读取出厂编码') then
        begin
           sl.Add('出厂编码:' + appendFrame);
        end
        else if (cmdName = '读取气表参数') then
        begin
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          sl.Add('密钥索引:' + s1);
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          sl.Add('密钥版本:' + s1);
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          sl.Add('报文传输密钥信息:' + s1);
          s1 := Copy(appendFrame, 1, 4);
          cutOutStr(appendFrame, 1, 4);
          sl.Add('MAC 密钥信息:' + s1);
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          sl.Add('服务器公钥信息:' + s1);
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          sl.Add('IP 地址版本:' + s1);
          s1 := Copy(appendFrame, 1, 8);
          cutOutStr(appendFrame, 1, 8);
          sl.Add('IPv4 地址:' + IntToStr(HexToDec(Copy(s1, 1, 2))) + '.' + IntToStr(HexToDec(Copy(s1, 3, 2))) + '.' + IntToStr(HexToDec(Copy(s1, 5, 2))) + '.' + IntToStr(HexToDec(Copy(s1, 7, 2))));
          s1 := Copy(appendFrame, 1, 32);
          cutOutStr(appendFrame, 1, 32);
          sl.Add('IPv6 地址:' + s1);
          s1 := Copy(appendFrame, 1, 4);
          cutOutStr(appendFrame, 1, 4);
          sl.Add('端口号:' + IntToStr(HexToDec(s1)));
          s1 := Copy(appendFrame, 1, 60);
          cutOutStr(appendFrame, 1, 60);
          sl.Add('APN:' + HexStrToStr(s1));
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          if (s1 = '00') then sl.Add('定时上传周期类型:' + '起始周期从每月1 日开始') else sl.Add('定时上传周期类型:' + '起始周期从每年1 月开始');

          s2 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          if (s1 = '00') then sl.Add('定时上传周期值:' + '上传周期为' + IntToStr(HexToDec(s2)) +  '天') else sl.Add('定时上传周期值:' + '上传周期为每月的' + IntToStr(HexToDec(s2)) + '号');          
          s1 := Copy(appendFrame, 1, 4);
          cutOutStr(appendFrame, 1, 4);
          sl.Add('定时上传时间点:' + Copy(s1, 1, 2) + '时' + Copy(s1, 3, 2) + '分');
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          if (s1 = '00') then sl.Add('一级多天不用气关阀门限:' + '禁用') else sl.Add('一级多天不用气关阀门限:' + '启用(' + IntToStr(hexToInt(s1)) + ')');
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          if (s1 = '00') then sl.Add('二级多天不用气关阀门限:' + '禁用') else sl.Add('二级多天不用气关阀门限:' + '启用(' + IntToStr(hexToInt(s1)) + ')');
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          if (s1 = '00') then sl.Add('多天不通信关阀参数:' + '禁用') else sl.Add('多天不通信关阀参数:' + '启用(' + s1 + ')');
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          if (s1 = '00') then sl.Add('过流报警关阀使能:' + '禁用') else sl.Add('过流报警关阀使能:' + '启用');
          s1 := Copy(appendFrame, 1, 4);
          cutOutStr(appendFrame, 1, 4);
          sl.Add('过流门限:' + FloatToStr(HexToDec(s1) / 10) + ' m3/h');
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          sl.Add('错峰系数 1:' + IntToStr(HexToDec(s1)) + '秒');
          s1 := Copy(appendFrame, 1, 2);
          cutOutStr(appendFrame, 1, 2);
          if (s1 = '00') then sl.Add('微小流报警使能:' + '禁用') else sl.Add('微小流报警使能:' + '启用');
          s1 := Copy(appendFrame, 1, 4);
          cutOutStr(appendFrame, 1, 4);
          sl.Add('最大预留量:' + FloatToStr(HexToDec(s1) / 100));
          s1 := Copy(appendFrame, 1, 254);
          cutOutStr(appendFrame, 1, 254);
          sl.Add('备用:' + s1);
        end
        else if (cmdName = '读取事件记录信息') then
        begin
          while (length(appendFrame) <> 0) do
          begin
              sl.Add('-------------------------------------');
              s1 := Copy(appendFrame, 1, 12);
              cutOutStr(appendFrame, 1, 12);
              s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日' + Copy(s1, 7, 2) + '时' + Copy(s1, 9, 2) + '分' + Copy(s1, 11, 2) + '秒';
              sl.Add('报警时间:' + s1);
              s1 := Copy(appendFrame, 1, 2);
              cutOutStr(appendFrame, 1, 2);
              sl.Add('事件码:' + mapEvent(s1));
              s1 := Copy(appendFrame, 1, 2);
              cutOutStr(appendFrame, 1, 2);
              sl.Add('累计次数:' + IntToStr(HexToDec(s1)));
              s1 := Copy(appendFrame, 1, 2);
              cutOutStr(appendFrame, 1, 2);
              sl.Add('事件扩展信息:' + s1);
          end;
        end
        else if (cmdName = '读取小时用气信息') then
        begin
          while (length(appendFrame) <> 0) do
          begin
            sl.Add('-------------------------------------');
            s1 := Copy(appendFrame, 1, 6);
            cutOutStr(appendFrame, 1, 6);
            s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日';
            sl.Add('日期:' + s1);

            s1 := appendFrame;
            for i:=23 downto 0 do
            begin
               s1 := Copy(appendFrame, 1, 4);
//                   sl.Add(IntToStr(i) + '点增量数据:' + FloatToStr(HexToFloat(Copy(s1, i * 4 + 1, 4)) / 100));
               sl.Add(IntToStr(i) + '点增量数据:' + FloatToStr(HexToDec(s1) / 100));
               cutOutStr(appendFrame, 1, 4);
            end;
          end;
        end
        else if (cmdName = '读取日累计最近用气信息') then
        begin
          while (length(appendFrame) <> 0) do
          begin
            sl.Add('-------------------------------------');
            s1 := Copy(appendFrame, 1, 6);
            cutOutStr(appendFrame, 1, 6);
            s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日';
            sl.Add('日期:' + s1);
            s1 := Copy(appendFrame, 1, 8);
            cutOutStr(appendFrame, 1, 8);
            sl.Add('累计用气量:' + FloatToStr(HexToDec(s1) / 10));
          end;
        end
        else if (cmdName = '读取日累计历史用气信息') then
        begin
          while (length(appendFrame) <> 0) do
          begin
            sl.Add('-------------------------------------');
            s1 := Copy(appendFrame, 1, 4);
            cutOutStr(appendFrame, 1, 4);
            s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月';
            sl.Add('日期:' + s1);

            s1 := appendFrame;
            for i:=30 downto 0 do
            begin
               s1 := Copy(appendFrame, 1, 8);
               sl.Add('第' + intToStr(i+1) + '日累计用气量：' + FloatToStr(HexToDec(s1) / 10));
               cutOutStr(appendFrame, 1, 8);
            end;
          end;
        end
        else if (cmdName = '读取月累计用气信息') then
        begin
          while (length(appendFrame) <> 0) do
          begin
            sl.Add('-------------------------------------');
            s1 := Copy(appendFrame, 1, 4);
            cutOutStr(appendFrame, 1, 4);
            s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月';
            sl.Add('日期:' + s1);
            s1 := Copy(appendFrame, 1, 8);
            cutOutStr(appendFrame, 1, 8);
            if (s1 = 'FFFFFFFF') then
            begin
              sl.Add('累计用气量:' + '0');
            end
            else
              sl.Add('累计用气量:' + FloatToStr(HexToDec(s1) / 100));
          end;
        end
        else if (cmdName = '读取清零明细') then
        begin
          while (length(appendFrame) <> 0) do
          begin
            sl.Add('-------------------------------------');
            s1 := Copy(appendFrame, 1, 12);
            cutOutStr(appendFrame, 1, 12);
            s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日' + Copy(s1, 7, 2) + '时' + Copy(s1, 9, 2) + '分' + Copy(s1, 11, 2) + '秒';
            sl.Add('报警时间:' + s1);
            s1 := Copy(appendFrame, 1, 8);
            cutOutStr(appendFrame, 1, 8);
            sl.Add('清零前的累积量:' + FloatToStr(HexToDec(s1) / 100));
          end;
        end;
     end;
   end
   else
   if (controlWord = '82') or (controlWord = '83') or (controlWord = 'FE') or (controlWord = 'FF') then // 82: 数据对象推送（上行） 控制字 [表全貌上报]    83: 数据对象访问应答（上行） 控制字    FE: 厂内调试模式下上报表全貌 为FE   FF: 读取宁光密钥 为FF
   begin
     // 厂外密文 模式
     if (modeType = 'Cipher') then
     begin
        // 新长度去除8字节的表号
        newLenStr := IntToHex(StrToInt(totalLen) - 8, 4);   
        newCRC := newLenStr + protocolCode + protocolVersion + controlWord + subFrame;
        newCRC := CRC16(newCRC);
        // 新组织的报文
        kunlunSendFrame := '68' + newLenStr + protocolCode + protocolVersion + controlWord + subFrame + newCRC + '16';

        receiveData := getKunLunInterface('Meter', kunlunSendFrame, a10_KEY);
        sl.Add('getSendInfo:' + receiveData);
     end
     else  // 厂内调试模式
     begin

       // 运算规则
       operationRule := Copy(subFrame, 1, 2);
       cutOutStr(subFrame, 1, 2);
       // 功能控制字
       fcw := Copy(subFrame, 1, 2);
       cutOutStr(subFrame, 1, 2);
       // 数据长度
       dataLen := IntToStr(HexToDec(Copy(subFrame, 1, 2)));
       cutOutStr(subFrame, 1, 2);
       // 计数器
       counter := Copy(subFrame, 1, 2);
       cutOutStr(subFrame, 1, 2);
       // 报文随机数
       randomNum := Copy(subFrame, 1, 6);
       cutOutStr(subFrame, 1, 6);
       // 附加报文
       appendFrame := Copy(subFrame, 1, Length(subFrame)-8);
       // 厂内调试状态，去除多余补的0
       if (operationRule = 'FF') then
       begin
          // 补零的长度
          len1 := StrToInt(dataLen);
          len2 := HexToInt(Copy(randomNum, 1, 2));
          zeroLen := (len1 - len2) * 2;
          // 附加报文
          appendFrame := Copy(subFrame, 1, Length(subFrame) - 8 - zeroLen);
       end;
       // MAC地址
       MAC := RightStr(subFrame, 8);

       // 控制码
       ctrl := Copy(appendFrame, 1, 2);
       cutOutStr(appendFrame, 1, 2);
       // 对象个数
       objNum := Copy(appendFrame, 1, 2);
       cutOutStr(appendFrame, 1, 2);


       sl.Add('计数器:' + counter);
       sl.Add('随机数:' + randomNum);
       sl.Add('MAC地址:' + DecryptStr(MAC, 'A5'));
       if (ctrl = '00') or (ctrl = '03') then  // 00 表示读命令的返回   03 是上报表全貌
       begin
           sl.Add('运算规则:' + mapOperationRule(operationRule));
           sl.Add('功能控制字:' + mapFCW(fcw));
           sl.Add('数据长度:' + dataLen);

           sl.Add('控制码:' + ctrl);
           sl.Add('对象个数:' + objNum);
       end;
     
       // 读解析  02:写回读  03 : 上报的表全貌  00 ： 读命令
       if (ctrl = '00') or (ctrl = '02') or (ctrl = '03') then  // 对于上报的表全貌信息也解析
       begin
           // 循环计数 防止返回错误报文后，死循环
           whileNum := 0;

           while (appendFrame <> '') do
           begin
                // 最多支持解析15个对象id
                if (whileNum >= 15) then break;
                Inc(whileNum);
              
                // 对象Id
                objId := Copy(appendFrame, 1, 4);
                sl.Add('对象Id:' + objId);

               // 删除两字节数据标识
               DIstr := cutOutStr(appendFrame, 1, 4);

               // 写回读     若为写回读，则数据标识后，有一个字节的成功和失败标志。
               if (ctrl = '02') then
               begin
                  // 写回读成功失败标志
                  s1 := cutOutStr(appendFrame, 1, 2); // 删除写回读的标志，剩余数据全部为解析数据
                  if (s1 <> '00') then
                  begin
                     sl.Add('通讯结果:' + '失败');
                     Result := sl;
                     Exit;
                  end;
               end;

               // 读取存储器ESAM读写次数
               if (DIstr = 'E10A') then
               begin
                  appendFrame := Copy(appendFrame, 1, 48); // 24 字节
                  // 存储器读次数
                  s1 := cutOutStr(appendFrame, 1, 8);
                  sl.Add('存储器读次数:' + IntToStr(HexToDec(s1)));
                  // 存储器写次数
                  s1 := cutOutStr(appendFrame, 1, 8);
                  sl.Add('存储器写次数:' + IntToStr(HexToDec(s1)));
                  // ESAM读次数
                  s1 := cutOutStr(appendFrame, 1, 8);
                  sl.Add('ESAM读次数:' + IntToStr(HexToDec(s1)));
                  // ESAM写次数
                  s1 := cutOutStr(appendFrame, 1, 8);
                  sl.Add('ESAM写次数:' + IntToStr(HexToDec(s1)));
                  // FLASH读次数
                  s1 := cutOutStr(appendFrame, 1, 8);
                  sl.Add('FLASH读次数:' + IntToStr(HexToDec(s1)));
                  // FLASH写次数
                  s1 := cutOutStr(appendFrame, 1, 8);
                  sl.Add('FLASH写次数:' + IntToStr(HexToDec(s1)));
               end;

               // 读取ESAM信息文件
               if (DIstr = 'E109') then
               begin
                  appendFrame := Copy(appendFrame, 1, 70); // 35 字节
                  // 燃气表号
                  s1 := cutOutStr(appendFrame, 1, 16);
                  sl.Add('燃气表编号:' + s1);
                  // 安全芯片 ID
                  s1 := cutOutStr(appendFrame, 1, 16);
                  sl.Add('安全芯片ID:' + s1);
                  // 规范版本号
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('规范版本号:' + s1);
                  // 厂商代码
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('厂商代码:' + s1);
                  // COS 版本号
                  s1 := cutOutStr(appendFrame, 1, 4);
                  sl.Add('COS 版本号:' + s1);
                  // 生命周期
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('生命周期:' + s1);
                  // 加密密钥 ID
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('加密密钥ID:' + s1);
                  // 加密密钥 Ver
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('加密密钥Ver:' + s1);
                  // MAC 密钥 ID
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('MAC 密钥ID:' + s1);
                  // MAC 密钥 ver
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('MAC 密钥ver:' + s1);
                  // 服务器公钥 ID
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('服务器公钥ID:' + s1);
                  // 服务器公钥 Ver
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('服务器公钥Ver:' + s1);
                  // 保留字节
                  s1 := cutOutStr(appendFrame, 1, 16);
                  sl.Add('保留字节:' + s1);
               end;

               // 读取异常事件记录
               if (DIstr = 'E300') then
               begin

                  appendFrame := Copy(appendFrame, 1, 54); // 27 字节
                  // 存储次数
                  s1 := IntToStr(HexToDec(cutOutStr(appendFrame, 1, 2)));
                  s1 := '上【' + s1 + '】次';
                  sl.Add('存储次数:' + s1);
                  // 异常事件发生时间
                  s1 := cutOutStr(appendFrame, 1, 10);
                  s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日' + Copy(s1, 7, 2) + ':' +Copy(s1, 9, 2);
                  sl.Add('异常事件发生时间:' + s1);
                  // 异常事件发生时累计用气量 两位小数 单位 m3
                  s1 := cutOutStr(appendFrame, 1, 8);
                  s1 := FloatToStr(HexToDec(s1) / 100);
                  sl.Add('异常事件发生时累计用气量:' + s1 + ' m3');
                  // 异常事件发生时剩余金额，两位小数 单位 元
                  s1 := cutOutStr(appendFrame, 1, 8);
                  s1 := FloatToStr(HexToDec(s1) / 100);
                  sl.Add('异常事件发生时剩余金额:' + s1 + ' 元');
                  // 异常事件结束时间
                  s1 := cutOutStr(appendFrame, 1, 10);
                  s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日' + Copy(s1, 7, 2) + ':' +Copy(s1, 9, 2);
                  sl.Add('异常事件结束时间:' + s1);
                  // 异常事件结束时累计用气量，两位小数 单位 m3
                  s1 := cutOutStr(appendFrame, 1, 8);
                  s1 := FloatToStr(HexToDec(s1) / 100);
                  sl.Add('异常事件结束时累计用气量:' + s1 + ' m3');
                  // 异常事件结束时剩余金额，两位小数 单位 元
                  s1 := cutOutStr(appendFrame, 1, 8);
                  s1 := FloatToStr(HexToDec(s1) / 100);
                  sl.Add('异常事件结束时剩余金额:' + s1 + ' 元');
                  
               end;
               // 读取NB参数
               if (DIstr = 'E104') then
               begin

                  appendFrame := Copy(appendFrame, 1, 144); // 72  字节

                  // 终端的生产厂商
                  s1 := cutOutStr(appendFrame, 1, 4);
                  sl.Add('生产厂商:' + s1);
                  // 模组固件版本 字符串，不足 20 字节后面补 0
                  s1 := cutOutStr(appendFrame, 1, 40);
                  s1 := HexStrToStr(s1);
                  s1 := Trim(s1);
                  sl.Add('模组固件版本:' + s1);
                  // RSRP NB 网络信号强度。有符号整数。
                  s1 := cutOutStr(appendFrame, 1, 4);
                  s2 := hextoBin1(s1);
                  if (Copy(s2, 1, 1) = '1') then
                    s2 := '-' + FloatToStr((HexToDec('FFFF') - HexToDec(s1) + 1) / 10)
                  else
                    s2 := FloatToStr(HexToDec(s1) / 10);
                    
                  sl.Add('NB网络信号强度:' + s2);
                  // SINA 信噪比。有符号整数。
                  s1 := cutOutStr(appendFrame, 1, 4);
                  s2 := hextoBin1(s1);
                  if (Copy(s2, 1, 1) = '1') then
                    s2 := '-' + FloatToStr((HexToDec('FFFF') - HexToDec(s1) + 1) / 10)
                  else
                    s2 := FloatToStr(HexToDec(s1) / 10);
                  sl.Add('信噪比:' + s2);
                  // ECL ECL 覆盖等级。有符号整数
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('ECL覆盖等级:' + s1);
                  // Cellid 取 BCD 高 12 位，不足高位补 0
                  s1 := cutOutStr(appendFrame, 1, 12);
                  sl.Add('Cellid:' + s1);
                  // REAL_NEARFCN 频点。为本次通信实际使用的频点。
                  s1 := cutOutStr(appendFrame, 1, 4);
                  sl.Add('REAL_NEARFCN频点:' + IntToStr(HexToDec(s1)));
                  // IMEI BCD 码，15 位 BCD 码，最高为补 0，模组号
                  s1 := cutOutStr(appendFrame, 1, 16);
                  sl.Add('IMEI:' + s1);
                  // IMSI
                  s1 := cutOutStr(appendFrame, 1, 16);
                  sl.Add('IMSI:' + s1);
                  // 终端固件的版本号，BCD 码，0~99
                  s1 := cutOutStr(appendFrame, 1, 2);
                  sl.Add('终端固件版本号:' + s1);
                  // NCCID BCD 码 SIM 卡号
                  s1 := cutOutStr(appendFrame, 1, 40);
                  s1 := HexStrToStr(s1);
                  s1 := Trim(s1);
                  sl.Add('SIM卡号:' + s1);
               end;

               // 读取燃气表运行以及事件状态字
               if (DIstr = 'E105') then
               begin

                  appendFrame := Copy(appendFrame, 1, 16); // 4+4 =8  字节
                  // 运行状态字
                  s1 :=  cutOutStr(appendFrame, 1, 8);
                  sl.Add('运行状态字:' + s1);

                  s1 := hextoBin1(s1);
                  sl.Add('   阀开/关：' + Copy(s1, 32, 1));  // bit0
                  sl.Add('   阀异常：' + Copy(s1, 31, 1));
                  sl.Add('   电压低：' + Copy(s1, 30, 1));
                  sl.Add('   干簧管坏：' + Copy(s1, 29, 1));
                  sl.Add('   强磁干扰：' + Copy(s1, 28, 1));
                  sl.Add('   EEPROM异常：' + Copy(s1, 27, 1));
                  sl.Add('   ESAM异常：' + Copy(s1, 26, 1));
                  sl.Add('   余额不足：' + Copy(s1, 25, 1));
                  sl.Add('   RTC异常：' + Copy(s1, 24, 1));
                  sl.Add('   已开户：' + Copy(s1, 23, 1));
                  sl.Add('   剩余金额小于最小扣费金额：' + Copy(s1, 22, 1));
                  sl.Add('   卡充钱包剩余为0：' + Copy(s1, 21, 1));
                  sl.Add('   网充钱包剩余为0：' + Copy(s1, 20, 1));
                  if (Copy(s1, 19, 1) = '0') then
                     sl.Add('   捡漏：无')
                  else
                     sl.Add('   捡漏：有');

                  if (Copy(s1, 18, 1) = '0') then
                     sl.Add('   低频时钟：外部低频时钟')
                  else
                  begin
                    sl.Add('   低频时钟：内部低频时钟');
                  end;
                  if (Copy(s1, 17, 1) = '0') then
                  begin
                     sl.Add('   付费膜式：预付费膜式') ;
                  end
                  else
                     sl.Add('   付费膜式：后付费');

                  sl.Add('   高温状态：' + Copy(s1, 16, 1));
                  sl.Add('   拆表状态：' + Copy(s1, 15, 1));

                  // 事件状态字
                  s1 :=  cutOutStr(appendFrame, 1, 8);
                  sl.Add('事件状态字:' + s1);

                  s1 := hextoBin1(s1);
                  s1 := ReverseString(s1);
                  sl.Add('  发生事件:');
                  if (Copy(s1, 1, 1) = '1') then
                    sl.Add('     开阀事件');
                  if (Copy(s1, 2, 1) = '1') then
                    sl.Add('     关阀事件');
                  if (Copy(s1, 3, 1) = '1') then
                    sl.Add('     阀异常事件');
                  if (Copy(s1, 4, 1) = '1') then
                    sl.Add('     大流量事件');
                  if (Copy(s1, 5, 1) = '1') then
                    sl.Add('     小流量事件');
                  if (Copy(s1, 6, 1) = '1') then
                    sl.Add('     强磁事件');
                  if (Copy(s1, 7, 1) = '1') then
                    sl.Add('     报警2');
                  if (Copy(s1, 8, 1) = '1') then
                    sl.Add('     报警1');
                  if (Copy(s1, 9, 1) = '1') then
                    sl.Add('     调价事件');
                  if (Copy(s1, 10, 1) = '1') then
                    sl.Add('    时钟错');
                  if (Copy(s1, 11, 1) = '1') then
                    sl.Add('    电池电压低');
                  if (Copy(s1, 12, 1) = '1') then
                    sl.Add('    控制回路错');
                  if (Copy(s1, 13, 1) = '1') then
                    sl.Add('    通讯异常');
                  if (Copy(s1, 14, 1) = '1') then
                    sl.Add('    数据冻结成功');
                  if (Copy(s1, 15, 1) = '1') then
                    sl.Add('    干电池上电');
                  if (Copy(s1, 16, 1) = '1') then
                    sl.Add('    看门狗复位');
                  if (Copy(s1, 17, 1) = '1') then
                    sl.Add('    高温报警');
                  if (Copy(s1, 18, 1) = '1') then
                    sl.Add('    拆表报警');
               end;

               // 读取宁光参数信息
               if (DIstr = 'E001') then
               begin

                  appendFrame := Copy(appendFrame, 1, 192); // 96  字节
                  // 缓存数据域数据
                  s9 := appendFrame;

                  // MCU 电池电压检测间隔
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('MCU 电池电压检测间隔:' + s1 + 'S');
                  // MCU 电池电压报警阀值 1
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := FloatToStr(HexToInt(s1) / 100);
                  sl.Add('MCU 电池电压报警阀值 1:' + s1 + 'V');
                  // MCU 电池电压报警阀值 2
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := FloatToStr(HexToInt(s1) / 100);
                  sl.Add('MCU 电池电压报警阀值 2:' + s1 + 'V');
                  // 时钟电池电压检测间隔
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('时钟电池电压检测间隔:' + s1 + '天');

                  // 时钟电池电压报警阀值 1
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := FloatToStr(HexToInt(s1) / 100);
                  sl.Add('时钟电池电压报警阀值 1:' + s1 + 'V');
                  // 时钟电池电压报警阀值 2
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := FloatToStr(HexToInt(s1) / 100);
                  sl.Add('时钟电池电压报警阀值 2:' + s1 + 'V');
                  // IP  PORT
                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  s1 := IntToStr(HexToInt(Copy(s1, 1, 2))) + '.' + IntToStr(HexToInt(Copy(s1, 3, 2))) + '.' + IntToStr(HexToInt(Copy(s1, 5, 2))) + '.' + IntToStr(HexToInt(Copy(s1, 7, 2)));
                  sl.Add('备用IP:' + s1);
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('备用Port:' + s1);
                  // 双干簧管吸和时间
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('双干簧管吸和时间:' + s1 + '秒');
                  // 单采样次数
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('单采样次数:' + s1 + '次');
                  // 欠费报警 1
                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  s1 := FloatToStr((HexToInt(s1) / 100));
                  sl.Add('欠费报警 1:' + s1 + '元');
                  // 欠费报警 2
                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  s1 := FloatToStr((HexToInt(s1) / 100));
                  sl.Add('欠费报警 2:' + s1 + '元');
                  // 充值限额
                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  s1 := FloatToStr((HexToInt(s1) / 100));
                  sl.Add('充值限额:' + s1 + '元');
                  // 超大流量阀值
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('超大流量阀值:' + s1 + 'S');
                  // 超大流量判断次数
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('超大流量判断次数:' + s1 + '脉冲数');
                  // 超小流量阀值
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('超小流量阀值:' + s1 + '小时');
                  // 超小流量判断次数
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('超小流量判断次数:' + s1 + '脉冲数');
                  // 定时上报周期
                  s1 := Copy(appendFrame, 1, 12);
                  cutOutStr(appendFrame, 1, 12);
                  sj1 := Copy(s1, 3, 2);
                  if (sj1 = 'A1') then
                  begin
                    sj1 := '每月的' + Copy(s1, 7, 2) + '日' + Copy(s1, 9, 2) + '时' + Copy(s1, 11, 2) + '分' + '00秒上报';
                    sl.Add('定时上报周期:' + sj1);
                  end
                  else if (sj1 = 'A2') then
                  begin
                    sj1 := '每周的周' + Copy(s1, 5, 2) + ',' + Copy(s1, 9, 2) + '时' + Copy(s1, 11, 2) + '分' + '00秒上报';
                    sl.Add('定时上报周期:' + sj1);
                  end
                  else if (sj1 = 'A3') then
                  begin
                    sj1 := '每' + Copy(s1, 7, 2) + '日的' + Copy(s1, 9, 2) + '时' + Copy(s1, 11, 2) + '分' + '00秒上报';
                    sl.Add('定时上报周期:' + sj1);
                  end
                  else if (sj1 = 'A4') then
                  begin
                    sj1 := '以每' + Copy(s1, 9, 2) + '小时为一个周期，从' + Copy(s1, 11, 2) + '分' + '00秒上报';
                    sl.Add('定时上报周期:' + sj1);
                  end;
                  // 工作模式
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  if (s1 = '00') then s1 := ' 关断模式' else if (s1 = '03') then s1 := ' PSM 模式';
                  sl.Add('工作模式:' + s1);
                  // 在线时间
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('在线时间:' + s1 + 'S');
                  // 上报平台
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  if (s1 = '00') then s1 := ' 运营商平台' else if (s1 = '01') then s1 := ' 宁光平台';
                  sl.Add('上报平台:' + s1);
                  // 事件上报模式字
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  sl.Add('事件上报模式字:' + IntToStr(HexToInt(s1)));
                  // 按键上报次数及锁定时间
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('按键上报次数:' + s1);
                  // 按键上报次数及锁定时间
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('按键上报锁定时间:' + s1);
                  // NB重发等待时间 
                  s1 := cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('NB重发等待时间:' + s1 + ' 秒');
                  // 温度阈值
                  s1 := cutOutStr(appendFrame, 1, 4);
                  s1 := FloatToStr(HexToInt(s1) / 100);
                  sl.Add('温度阈值:' + s1 + ' 摄氏度');
                  // NB上报驻网次数
                  s1 := cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('NB上报驻网次数:' + s1 + ' 次');
                  // MCU 电池电压检测次数
                  s1 := cutOutStr(appendFrame, 1, 2);
                  s1 := IntToStr(HexToInt(s1));
                  sl.Add('MCU 电池电压检测次数:' + s1 + ' 次');

                  sl.Add('E001-dataArea:' + s9);
               end;
               // 读取宁光密钥
               if (DIstr = 'E002') then
               begin

                  // 获取密钥的密文数据
                  appendFrame := Copy(appendFrame, 1, 32);

                  key1 := Copy(sBH, 2, 12);
                  key2 := '00nxlgg123';

                  getmem(key, 128);
                  getmem(tg, 128);

                  // 密钥处理
                  for i := 0 to 5 do
                  begin
                    key[i] := strtoInt('$' + Copy(key1, 2 * i + 1, 2));
                  end;
                  for i := 1 to 10 do
                  begin
                    key[i + 5] := ord(key2[i]);
                  end;
                  // 数据
                  for i:=0 to 15 do
                  begin
                    tg[i] := StrToInt('$' + Copy(appendFrame, 2 * i + 1, 2));
                  end;
                  resultStr := '';
                  // 解密
                  aes128_data_decrypt1(key, tg);
                  for i :=0 to 15 do
                  begin
                    resultStr := resultStr + Format('%.02x', [tg[i]]);
                  end;

                  freemem(key, 128);
                  freemem(tg, 128);

                  // 先判断数据的校验和是否正确
                  if (GetJy(Copy(resultStr, 1, 30)) <> Copy(resultStr, 31, 2)) then
                  begin
                     appendFrame := '';
                     sl.Add('宁光密钥:' + '数据校验和异常！！！');
                  end
                  else
                  begin

                      s1 := Copy(resultStr, 1, 16);
                      s1 := HexStrToStr(s1);
                      s1 := Trim(s1);
                      sl.Add('宁光密钥:' + s1);


                      // 将 appendFrame 清空
                      cutOutStr(appendFrame, 1, 32);
                  end;
               end;
               // 读取宁光进出厂
               if (DIstr = 'E003') then
               begin

                  s1 := Copy(appendFrame, 1, 4);
                  if (s1 = 'A019') or (s1 = '19A0') then s1 := '出厂(' + s1 + ')'
                  else s1 := '进厂(' + s1 + ')';
                  cutOutStr(appendFrame, 1, 4);
                  sl.Add('进出厂状态:' + s1);
               end;
               // 读取厂内版本号
               if (DIstr = 'E100') then
               begin

                  s1 := Copy(appendFrame, 1, 38);
                  s1 := HexStrToStr(s1);
                  s1 := Trim(s1);
                  cutOutStr(appendFrame, 1, 38);
                  sl.Add('厂内版本号:' + s1);
               end;
               // 读取单片机校验
               if (DIstr = 'E101') then
               begin

                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  sl.Add('单片机校验:' + s1);
               end;
               // 读取MCU复位状态字
               if (DIstr = 'E102') then
               begin

                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  sl.Add('MCU复位状态字:' + s1);
               end;
               // 读取时钟电池电压
               if (DIstr = 'E103') then
               begin

                  s1 := Copy(appendFrame, 1, 4);
                  s1 := FloatToStr(HexToInt(s1) / 1000);
                  cutOutStr(appendFrame, 1, 4);
                  sl.Add('时钟电池电压:' + s1);
               end;
               // 读取MCURAM区数据
               if (DIstr = 'E106') then
               begin

                  s1 := cutOutStr(appendFrame, 1, 200);
                  sl.Add('MCURAM区数据:' + s1);
               end;
               // 读取MCUROM区数据
               if (DIstr = 'E107') then
               begin

                  s1 := cutOutStr(appendFrame, 1, 200);
                  sl.Add('MCUROM区数据:' + s1);
               end;
               // 读取表内温度
               if (DIstr = 'E108') then
               begin
                  s1 := cutOutStr(appendFrame, 1, 4);
                  if (Copy(s1, 1, 1) = 'F') then  // 取补码
                  begin
                    s1 := ComplementFun(s1, 4);
                    s1 := '-' + FloatToStr(HexToDec(s1)/ 100);
                  end
                  else
                  begin
                    s1 := FloatToStr(HexToDec(s1)/ 100);
                  end;

                  sl.Add('表内温度:' + s1);
               end;
               // 读取升级初始化
               if (DIstr = 'E204') then
               begin

                  s1 := cutOutStr(appendFrame, 1, 8);
                  sl.Add('代码起始地址:' + s1);
                  s1 := cutOutStr(appendFrame, 1, 8);
                  sl.Add('传输包大小:' + s1);
                  s1 := cutOutStr(appendFrame, 1, 8);
                  sl.Add('传输包校验码:' + s1);
                  s1 := cutOutStr(appendFrame, 1, 4);
                  sl.Add('传输包总包数:' + IntToStr(HexToDec(s1)));
                  s1 := cutOutStr(appendFrame, 1, 38);
                  sl.Add('传输的版本号:' + s1);
               end;
               if (DIstr = 'EF07') then   // 读取小时用气信息
               begin
                  
                  s1 := IntToStr(HexToDec(Copy(appendFrame, 1, 2)));
                  cutOutStr(appendFrame, 1, 2);
                  s1 := '上【' + s1 + '】次';
                  sl.Add('存储次数:' + s1);
                  s1 := Copy(appendFrame, 1, 6);
                  cutOutStr(appendFrame, 1, 6);
                  s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日';
                  sl.Add('日期:' + s1);

                  s1 := appendFrame;
                  for i:=23 downto 0 do
                  begin
                     s1 := Copy(appendFrame, 1, 4);
  //                   sl.Add(IntToStr(i) + '点增量数据:' + FloatToStr(HexToFloat(Copy(s1, i * 4 + 1, 4)) / 100));
                     sl.Add(IntToStr(i) + '点增量数据:' + FloatToStr(HexToDec(s1) / 100));
                     cutOutStr(appendFrame, 1, 4);
                  end;
  //                cutOutStr(appendFrame, 1, 96);
               end;
               if (DIstr = '0002') then  // 表全貌解析
               begin

                   // 触发事件上报代码
                   reportCode := Copy(appendFrame, 1, 8);
                   cutOutStr(appendFrame, 1, 8);
                   // 表内时钟
                   meterTimeStr := Copy(appendFrame, 1, 12);
                   cutOutStr(appendFrame, 1, 12);
                   // 运行状态
                   runningStatus := Copy(appendFrame, 1, 4);
                   cutOutStr(appendFrame, 1, 4);
                   // 累计气量
                   totalAmount := Copy(appendFrame, 1, 8);
                   totalAmount := FloatToStr(HexToDec(totalAmount) / 10);
                   cutOutStr(appendFrame, 1, 8);
                   // 主电电压
      //             Voltage := Copy(appendFrame, 1, 4);
      //             Voltage := FloatToStr(HexToDec(Voltage) / 1000);
      //             cutOutStr(appendFrame, 1, 4);

                    sl.Add('触发事件上报代码:' + mapreportCode(reportCode));
                    sl.Add('表内时钟:' + meterTimeStr);
                    sl.Add('运行状态:' + runningStatus);

                    s1 := HextoBin1(runningStatus); // 两字节
                    sl.Add('运行状态二进制码:' + s1);
                    if (Copy(s1, 3, 1) = '1') then
                       sl.Add('开户状态:' + '已开户（1）')
                    else
                       sl.Add('开户状态:' + '未开户（0）');

                    if (Copy(s1, 4, 1) = '1') then
                       sl.Add('多天不通信告警:' + '告警（1）')
                    else
                       sl.Add('多天不通信告警:' + '正常（0）');

                    if (Copy(s1, 5, 2) = '00') then
                       sl.Add('多天不用天气状态:' + '多天不用气状态正常（00）')
                    else if (Copy(s1, 5, 2) = '01') then
                       sl.Add('多天不用天气状态:' + '一级多天不用气状态（01）')
                    else if (Copy(s1, 5, 2) = '10') then
                       sl.Add('多天不用天气状态:' + '二级多天不用气状态（02）')
                    else
                       sl.Add('多天不用天气状态:' + Copy(s1, 5, 2)); 

                    if (Copy(s1, 7, 1) = '1') then
                       sl.Add('外部报警:' + '有报警（1）')
                    else
                       sl.Add('外部报警:' + '无报警（0）');

                    if (Copy(s1, 8, 1) = '1') then
                       sl.Add('异常微小流量状态:' + '有异常（1）')
                    else
                       sl.Add('异常微小流量状态:' + '无异常（0）');

                    if (Copy(s1, 9, 1) = '1') then
                       sl.Add('异常大流量状态:' + '有异常（1）')
                    else
                       sl.Add('异常大流量状态:' + '无异常（0）');

                    if (Copy(s1, 10, 1) = '1') then
                       sl.Add('计量异常（1）');

                    if (Copy(s1, 11, 1) = '1') then
                       sl.Add('远传表被强制命令关阀（阀门处于锁定状态）:' + '1');

                    if (Copy(s1, 12, 1) = '1') then
                       sl.Add('阀门状态:' + '阀门关(1)')
                    else
                       sl.Add('阀门状态:' + '阀门开(0)');

                    if (Copy(s1, 13, 2) = '00') then
                       sl.Add('备电状态:' + '电量正常(00)')
                    else if (Copy(s1, 13, 2) = '01') then
                       sl.Add('备电状态:' + '电量不足(01)')
                    else if (Copy(s1, 13, 2) = '10') then
                       sl.Add('备电状态:' + '电量低(02)')
                    else if (Copy(s1, 13, 2) = '11') then
                       sl.Add('备电状态:' + '掉电(03)');
               
                    if (Copy(s1, 15, 2) = '00') then
                       sl.Add('主电量状态:' + '电量正常(00)')
                    else if (Copy(s1, 15, 2) = '01') then
                       sl.Add('主电量状态:' + '电量低（碱电版本低于欠压值1）(01)')
                    else if (Copy(s1, 15, 2) = '10') then
                       sl.Add('主电量状态:' + '电量不足（碱电版本低于欠压值2）(02)');



                   sl.Add('累计气量:' + totalAmount);
      //             sl.Add('主电电压:' + Voltage);
                   {
                   // 最近 5 条日汇总气量记录
                   tempDataStr := Copy(appendFrame, 1, 70);
                   cutOutStr(appendFrame, 1, 70);
                   for i:=0 to 4 do
                   begin
                      // 日期
                      dateStr := Copy(tempDataStr, 1, 6);
                      // 日冻结数据
                      dayDataStr := Copy(tempDataStr, 7, 8);
                      dayDataStr := FloatToStr(StrToInt(dayDataStr) / 10);
                      cutOutStr(tempDataStr, 1, 14);
                      sl.Add('上' + IntToStr(i+1)+'日汇总气量记录:' + '日期：' + dateStr + '  日冻结数据：' + dayDataStr);
                   end;
     
                   // 最近一条每日用气明细记录
                   tempDataStr := Copy(appendFrame, 1, 102);
                   cutOutStr(appendFrame, 1, 102);
                   // 日期
                   dateStr := Copy(tempDataStr, 1, 6);
                   cutOutStr(tempDataStr, 1, 6);
                   for i:=0 to 23 do
                   begin
                      // 每小时用气增量
                      dayIncStr := Copy(tempDataStr, 1, 4);
                      dayIncStr := FloatToStr(StrToInt(dayIncStr) / 10);
                      cutOutStr(tempDataStr, 1, 4);
                      sl.Add('最近一条' + dateStr + IntToStr(i)+'时用气明细:' + '每小时用气增量：' + dayIncStr);
                   end;
                   }
               end;


               if (DIstr = '1001') then  // 运行状态
               begin

                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                
                  s1 := HextoBin1(s1); // 两字节
                  sl.Add('运行状态:' + s1);
                  if (Copy(s1, 3, 1) = '1') then
                     sl.Add('开户状态:' + '已开户（1）')
                  else
                     sl.Add('开户状态:' + '未开户（0）');

                  if (Copy(s1, 4, 1) = '1') then
                     sl.Add('多天不通信告警:' + '告警（1）')
                  else
                     sl.Add('多天不通信告警:' + '正常（0）');

                  if (Copy(s1, 5, 2) = '00') then
                     sl.Add('多天不用天气状态:' + '多天不用气状态正常（00）')
                  else if (Copy(s1, 5, 2) = '01') then
                     sl.Add('多天不用天气状态:' + '一级多天不用气状态（01）')
                  else if (Copy(s1, 5, 2) = '10') then
                     sl.Add('多天不用天气状态:' + '二级多天不用气状态（02）')
                  else
                     sl.Add('多天不用天气状态:' + Copy(s1, 5, 2)); 

                  if (Copy(s1, 7, 1) = '1') then
                     sl.Add('外部报警:' + '有报警（1）')
                  else
                     sl.Add('外部报警:' + '无报警（0）');

                  if (Copy(s1, 8, 1) = '1') then
                     sl.Add('异常微小流量状态:' + '有异常（1）')
                  else
                     sl.Add('异常微小流量状态:' + '无异常（0）');

                  if (Copy(s1, 9, 1) = '1') then
                     sl.Add('异常大流量状态:' + '有异常（1）')
                  else
                     sl.Add('异常大流量状态:' + '无异常（0）');

                  if (Copy(s1, 10, 1) = '1') then
                     sl.Add('计量异常（1）');

                  if (Copy(s1, 11, 1) = '1') then
                     sl.Add('远传表被强制命令关阀（阀门处于锁定状态）:' + '1');

                  if (Copy(s1, 12, 1) = '1') then
                     sl.Add('阀门状态:' + '阀门关(1)')
                  else
                     sl.Add('阀门状态:' + '阀门开(0)');

                  if (Copy(s1, 13, 2) = '00') then
                     sl.Add('备电状态:' + '电量正常(00)')
                  else if (Copy(s1, 13, 2) = '01') then
                     sl.Add('备电状态:' + '电量不足(01)')
                  else if (Copy(s1, 13, 2) = '10') then
                     sl.Add('备电状态:' + '电量低(02)')
                  else if (Copy(s1, 13, 2) = '11') then
                     sl.Add('备电状态:' + '掉电(03)');
               
                  if (Copy(s1, 15, 2) = '00') then
                     sl.Add('主电量状态:' + '电量正常(00)')
                  else if (Copy(s1, 15, 2) = '01') then
                     sl.Add('主电量状态:' + '电量低（碱电版本低于欠压值1）(01)')
                  else if (Copy(s1, 15, 2) = '10') then
                     sl.Add('主电量状态:' + '电量不足（碱电版本低于欠压值2）(02)');
               end;
               if (DIstr = '1002') then  // 结算状态
               begin

                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  s1 := HextoBin1(s1);
                  if (Copy(s1, 7, 1) = '1') then
                     sl.Add('剩余量状态:' + '剩余量用完1')
                  else
                     sl.Add('剩余量状态:' + '剩余量未用完0');

                  if (Copy(s1, 8, 1) = '1') then
                     sl.Add('透支状态:' + '透支1')
                  else
                     sl.Add('透支状态:' + '未透支0');
               end;
               if (DIstr = '2001') then  // 主电电压
               begin

                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := FloatToStr(HexToDec(s1) / 1000);
                  sl.Add('主电电压:' + s1);
               end;
               if (DIstr = '2003') then  // 表内时钟
               begin
                 // 缓存数据域
                 s9 := appendFrame;
                 sl.Add('2003-dataArea:' + s9);  
                  {
                  // 写回读
                  if (ctrl = '02') then
                  begin
                     s1 := cutOutStr(appendFrame, 1, 2);
                     if (s1 = '00') then
                     begin
                       sl.Add('设置结果:' + '成功！');
                     end
                     else
                       sl.Add('设置结果:' + '失败！(' + s1 + ')');
                  end;
                  }

                  s1 := Copy(appendFrame, 1, 12);
                  cutOutStr(appendFrame, 1, 12);
                  s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日' + Copy(s1, 7, 2) + '时' + Copy(s1, 9, 2) + '分' + Copy(s1, 11, 2) + '秒';
                  sl.Add('表内时钟:' + s1);
               end;
               if (DIstr = '2005') then    // 累计气量
               begin

                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  s1 := FloatToStr(HexToDec(s1) / 10);
                  sl.Add('累计气量:' + s1);
               end;
               if (DIstr = 'EF03') then   // 读取出厂编码
               begin
                  {
                  // 写回读
                  if (ctrl = '02') then
                  begin
                     s1 := cutOutStr(appendFrame, 1, 2);
                     if (s1 = '00') then
                     begin
                       sl.Add('设置结果:' + '成功！');
                     end
                     else
                       sl.Add('设置结果:' + '失败！(' + s1 + ')');
                  end;

                  }

                  s1 := Copy(appendFrame, 1, 16);
                  cutOutStr(appendFrame, 1, 16);
                  sl.Add('出厂编码:' + s1);
               end;
               if (DIstr = 'EF04') then   // 读取气表参数
               begin
                  // 缓存数据域数据
                  s9 := appendFrame;

                  {
                  // 写回读
                  if (ctrl = '02') then
                  begin
                     s1 := cutOutStr(appendFrame, 1, 2);
                     if (s1 = '00') then
                     begin
                       sl.Add('设置结果:' + '成功！');
                     end
                     else
                       sl.Add('设置结果:' + '失败！(' + s1 + ')');
                  end;
                  }

                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  sl.Add('密钥索引:' + s1);
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  sl.Add('密钥版本:' + s1);
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  sl.Add('报文传输密钥信息:' + s1);
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  sl.Add('MAC 密钥信息:' + s1);
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  sl.Add('服务器公钥信息:' + s1);
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  sl.Add('IP 地址版本:' + s1);
                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  sl.Add('IPv4 地址:' + IntToStr(HexToDec(Copy(s1, 1, 2))) + '.' + IntToStr(HexToDec(Copy(s1, 3, 2))) + '.' + IntToStr(HexToDec(Copy(s1, 5, 2))) + '.' + IntToStr(HexToDec(Copy(s1, 7, 2))));
                  s1 := Copy(appendFrame, 1, 32);
                  cutOutStr(appendFrame, 1, 32);
                  sl.Add('IPv6 地址:' + s1);
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  sl.Add('端口号:' + IntToStr(HexToDec(s1)));
                  s1 := Copy(appendFrame, 1, 60);
                  cutOutStr(appendFrame, 1, 60);
                  sl.Add('APN:' + HexStrToStr(s1));
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  if (s1 = '00') then sl.Add('定时上传周期类型:' + '起始周期从每月1 日开始') else sl.Add('定时上传周期类型:' + '起始周期从每年1 月开始');

                  s2 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  if (s1 = '00') then sl.Add('定时上传周期值:' + '上传周期为' + IntToStr(HexToDec(s2)) +  '天') else sl.Add('定时上传周期值:' + '上传周期为每月的' + IntToStr(HexToDec(s2)) + '号');          
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  sl.Add('定时上传时间点:' + Copy(s1, 1, 2) + '时' + Copy(s1, 3, 2) + '分');
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  if (s1 = '00') then sl.Add('一级多天不用气关阀门限:' + '禁用') else sl.Add('一级多天不用气关阀门限:' + '启用(' + IntToStr(HexToInt(s1)) + ')');
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  if (s1 = '00') then sl.Add('二级多天不用气关阀门限:' + '禁用') else sl.Add('二级多天不用气关阀门限:' + '启用(' + IntToStr(HexToInt(s1)) + ')');
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  if (s1 = '00') then sl.Add('多天不通信关阀参数:' + '禁用') else sl.Add('多天不通信关阀参数:' + '启用(' + s1 + ')');
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  if (s1 = '00') then sl.Add('过流报警关阀使能:' + '禁用') else sl.Add('过流报警关阀使能:' + '启用');
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  sl.Add('过流门限:' + FloatToStr(HexToDec(s1) / 10) + ' m3/h');
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  sl.Add('错峰系数 1:' + IntToStr(HexToDec(s1)) + '秒');
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  if (s1 = '00') then sl.Add('微小流报警使能:' + '禁用') else sl.Add('微小流报警使能:' + '启用');
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  sl.Add('最大预留量:' + FloatToStr(HexToDec(s1) / 100) + '方');
                  s1 := Copy(appendFrame, 1, 254);
                  cutOutStr(appendFrame, 1, 254);
                  sl.Add('备用:' + s1);

                  sl.Add('EF04-dataArea:' + s9);

               end;
               if (DIstr = 'EF06') then  // 读取事件记录信息
               begin
                  
                  s1 := IntToStr(HexToDec(Copy(appendFrame, 1, 2)));   
                  cutOutStr(appendFrame, 1, 2);
                  s1 := '上【' + s1 + '】次';
                  sl.Add('存储次数:' + s1);
                  s1 := Copy(appendFrame, 1, 12);
                  cutOutStr(appendFrame, 1, 12);
                  s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日' + Copy(s1, 7, 2) + '时' + Copy(s1, 9, 2) + '分' + Copy(s1, 11, 2) + '秒';
                  sl.Add('报警时间:' + s1);
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  sl.Add('事件码:' + mapEvent(s1));
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  sl.Add('累计次数:' + IntToStr(HexToDec(s1)));
                  s1 := Copy(appendFrame, 1, 2);
                  cutOutStr(appendFrame, 1, 2);
                  sl.Add('事件扩展信息:' + s1);
               end;
               if (DIstr = 'EF08') then  // 读取日累计最近用气信息
               begin

                  s1 := IntToStr(HexToDec(Copy(appendFrame, 1, 2)));   
                  cutOutStr(appendFrame, 1, 2);
                  s1 := '上【' + s1 + '】次';
                  sl.Add('存储次数:' + s1);
                  s1 := Copy(appendFrame, 1, 6);
                  cutOutStr(appendFrame, 1, 6);
                  s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日';
                  sl.Add('日期:' + s1);
                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  sl.Add('累计用气量:' + FloatToStr(HexToDec(s1) / 10));
               end;
               if (DIstr = 'EF09') then  // 读取日累计历史用气信息
               begin
                  
                  s1 := IntToStr(HexToDec(Copy(appendFrame, 1, 2)));
                  cutOutStr(appendFrame, 1, 2);
                  s1 := '上【' + s1 + '】次';
                  sl.Add('存储次数:' + s1);
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月';
                  sl.Add('日期:' + s1);

                  {
                  s1 := Copy(appendFrame, 1, 248);
                  cutOutStr(appendFrame, 1, 248);
                  }
                  s1 := appendFrame;
                  for i:=30 downto 0 do
                  begin
                     s1 := Copy(appendFrame, 1, 8);
                     sl.Add('第' + intToStr(i+1) + '日累计用气量：' + FloatToStr(HexToDec(s1) / 10));
                     cutOutStr(appendFrame, 1, 8);
                  end;
               end;
               if (DIstr = 'EF0A') then // 读取月累计用气信息
               begin
                  
                  s1 := IntToStr(HexToDec(Copy(appendFrame, 1, 2)));   
                  cutOutStr(appendFrame, 1, 2);
                  s1 := '上【' + s1 + '】次';
                  sl.Add('存储次数:' + s1);
                  s1 := Copy(appendFrame, 1, 4);
                  cutOutStr(appendFrame, 1, 4);
                  s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月';
                  sl.Add('日期:' + s1);
                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  if (s1 = 'FFFFFFFF') then
                  begin
                    sl.Add('累计用气量:' + '0');
                  end
                  else
                    sl.Add('累计用气量:' + FloatToStr(HexToDec(s1) / 100));
               end;
               if (DIstr = 'EF0B') then   // 读取用气量信息
               begin

                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  sl.Add('累计用气量:' + FloatToStr(HexToDec(s1) / 100));
               end;
               if (DIstr = 'EF0C') then  // 读取清零明细
               begin
                  
                  s1 := IntToStr(HexToDec(Copy(appendFrame, 1, 2)));   
                  cutOutStr(appendFrame, 1, 2);
                  s1 := '上【' + s1 + '】次';
                  sl.Add('存储次数:' + s1);
                  s1 := Copy(appendFrame, 1, 12);
                  cutOutStr(appendFrame, 1, 12);
                  s1 := Copy(s1, 1, 2) + '年' + Copy(s1, 3, 2) + '月' + Copy(s1, 5, 2) + '日' + Copy(s1, 7, 2) + '时' + Copy(s1, 9, 2) + '分' + Copy(s1, 11, 2) + '秒';
                  sl.Add('报警时间:' + s1);
                  s1 := Copy(appendFrame, 1, 8);
                  cutOutStr(appendFrame, 1, 8);
                  sl.Add('清零前的累积量:' + FloatToStr(HexToDec(s1) / 100));
               end;
           end;
       end
       else
       // 写解析
       if (ctrl = '01') then
       begin
          // 删除两字节数据标识
          DIstr := cutOutStr(appendFrame, 1, 4);
          if (appendFrame = '00') then
          begin
            sl.Add('通讯结果:' + '成功');

            if (DIstr = 'EF03') then
            begin
                // 设置表号
                sl.Add('新表号:' + '更换成功');
            end;
          end
          else
           sl.Add('通讯结果:' + '失败');
       end;
     end;
   end;
   try
      Result := sl;
   finally
//      sl.Free;
   end;
end;

// 延时处理
procedure delay(MSecs:LongInt);
var
  FirstTickCount,Now:LongInt;
begin
  FirstTickCount:=GetTickCount();
  repeat
    Application.ProcessMessages;
    Now:=GetTickCount();
  until (Now - FirstTickCount >=MSecs)or(Now<FirstTickCount);
end;

// 组织昆仑燃气 发送报文
function creatKunLunFrame(cmdName, gasMeterAddr, controlWord, ctrlStr : string; cmd, dataStr, cp : array of string; memo:TRichEdit): string;
var startFrame, endFrame, totalLen, protocolCode, protocolVersion, dataArea, crc, fullFrameStr : string;
    subFrame, appendFrame, keyStr, sysRandomNum : string;
    statusStr, timeStr, rr, dateLenStr, keepStr, cd, rcr : string;
    operationRule, fcw, dataLen, realLen, counter, randomNum, MAC, baseDataStr, eType: string;
    i, DILen: Integer;
    key, tg: PByteArray;
begin
   keyStr := '';
   if (cp[4] = 'Test') then
   begin
     // 系统生成随机数
     sysRandomNum := getRandom(4);
     
     // 生成密钥
     keyStr := sysRandomNum + Copy(gasMeterAddr, 6, 8) + cp[5];// '20160417';    //3230313630343137
     // 加解密类型
     eType := '20160417';
     
     if (cmdName = '注册回复帧(FE)') or (cmdName = '读取宁光密钥') then
     begin
        keyStr := Copy(gasMeterAddr, 2, 12) + '00nxlgg123';
        eType := '00nxlgg123';
     end;
   end;
   
   // 起始符
   startFrame := '68';
   // 结束符
   endFrame := '16';
   // 协议代码
   protocolCode := '01';
   // 协议版本
   protocolVersion := '01';

   // 按照控制码进行分类判断
   if (controlWord = '06') then  // 通信激活  通信结束   读取远传表对象   读取安全芯片数据
   begin
      if (cmd[0] = '01') or (cmd[0] = '02') then    // 01 通讯激活  02 结束通讯   04 快捷读取
      begin
          // 【2】子报文
          subFrame :=  cmd[0] + dataStr[0];
      end
      else if (cmd[0] = '04') then  // 数据快捷读取
      begin
          // 【2】子报文
          subFrame := cmd[0] + dataStr[0]; // 1字节 访问控制字 + 10字节APDU
      end
      else if (cmd[0] = '03') then  // 远传表本地通信读
      begin
         // 【2】子报文
         subFrame :='';
      end;
   end
   else
   if (controlWord = '01') then // AES加密  // 注册下行帧 （注册回复帧）
   begin
      // 状态
      statusStr := dataStr[1]; //'00'; // 默认成功
      // 系统时钟
      timeStr := dataStr[2]; // FormatDateTime('YYMMDDhhmmss', Now);
      // 登录确认数据 
      cd := dataStr[0];
      // 【1】附加报文
      appendFrame := statusStr + timeStr + cd;


      // 运算规则
      if (cp[4] = 'Test') then
        operationRule := 'FF'
      else operationRule := '8B'; 

      // 功能控制字
      fcw := '81';
      // 当点击 按钮  读取宁光密钥，则功能控制字 定为 FF
      if (cmdName = '注册回复帧(FE)') then
      begin
         fcw := 'FE';
      end;
      // 数据长度
      dateLenStr := '';
      // 计数器
      counter := cp[0]; // 00
      // 报文随机数
      randomNum := cp[1]; // 000000
      // 应答运算规则
      rcr := cp[2]; // 00
      // 保留
      keepStr := PadLStr('0', 12, '0');
      // 注册结果
      rr := '00';//dataStr[1];//'00'; // 默认成功
      // MAC地址
      MAC := cp[3]; //'00000000';

      // 基础数据
      baseDataStr := counter + randomNum + rcr + keepStr + rr + appendFrame;
      // 厂内测试模式下，在报文随机数的第一个字节存放真实的数据长度
      if (cp[4] = 'Test') then
      begin
        realLen := IntToHex(((Length(baseDataStr) div 2) + 4), 2);
        randomNum := realLen + '0000';
        // 重新将新的 randomNum 组织到报文中
        baseDataStr := counter + randomNum + rcr + keepStr + rr + appendFrame;
      end;
      
      memo.lines.add('           密钥:' + keyStr);
      memo.lines.add('           数据域发送【明文】:' + baseDataStr);
      // 厂内调试模式
      if (cp[4] = 'Test') then
      begin
         // AES128加密
         baseDataStr := AES128Encryption(baseDataStr, keyStr, eType);

         // 系统生成随机数
         MAC := sysRandomNum;
      end;


      // 数据长度
      dateLenStr := IntToHex((Length(baseDataStr + MAC) div 2), 2);
      // 【2】子报文
      subFrame := operationRule + fcw + dateLenStr + baseDataStr + MAC;
   end
   else
   if (controlWord = '03') or (controlWord = '05') then // AES加密   // 03: 数据对象访问请求（下行） [读、写、写回读]   05:结束通信（下行）指令
   begin
      // 运算规则
      if (cp[4] = 'Test') then
        operationRule := 'FF'
      else
        operationRule := '88';
      // 功能控制字
      fcw := '01';
      if (cmdName = '读取宁光密钥') then
      begin
         fcw := 'FF';
      end;
      // 数据长度
      dateLenStr := '';
      // 计数器
      counter := cp[0];// 00
      // 报文随机数
      randomNum := cp[1];//'000000';
      // 应答运算规则
      rcr := cp[2];
      // MAC地址
      MAC := cp[3];//'00000000';



     DILen := 0;
     for i:=0 to Length(cmd)-1 do
     begin
       if (cmd[i] <> '') then
       begin
          Inc(DILen);
       end;
     end;
     // 【1】附加报文
     appendFrame := ctrlStr + IntToHex(DILen, 2);  // 对象数据个数

     // 对  控制字 进行判断
     if (ctrlStr = '00') then  // 读操作
     begin
        for i:=0 to Length(cmd)-1 do
        begin
           // 这些属于扩展命令，需要循环读取或者需要带数据读取，所以在数据标识后又增加了  数据
           if (cmd[i] = 'EF06') or (cmd[i] = 'EF07')
           or (cmd[i] = 'EF08') or (cmd[i] = 'EF09')
           or (cmd[i] = 'EF0A') or (cmd[i] = 'EF0C')
           or (cmd[i] = 'E300') or (cmd[i] = 'E106')
           or (cmd[i] = 'E107')
           then
           begin
              appendFrame := appendFrame + cmd[i] + dataStr[i];
           end
           else
            appendFrame := appendFrame + cmd[i];
        end;
     end
     else
     if (ctrlStr = '01') or (ctrlStr = '02')  then  // 写操作 、 写回读操作
     begin
        for i:=0 to Length(cmd)-1 do
        begin
           appendFrame := appendFrame + cmd[i] + dataStr[i];
        end;
     end;
     // 基础数据
     baseDataStr := counter + randomNum + rcr + appendFrame;
     
     // 厂内测试模式下，在报文随机数的第一个字节存放真实的数据长度
     if (cp[4] = 'Test') then
     begin
       realLen := IntToHex(((Length(baseDataStr) div 2) + 4), 2);
       randomNum := realLen + '0000';
       // 重新将新的 randomNum 组织到报文中
       baseDataStr := counter + randomNum + rcr + keepStr + rr + appendFrame;
     end;

     memo.lines.add('           数据域发送【明文】:' + baseDataStr);

     // 厂内调试模式
     if (cp[4] = 'Test') then
     begin
        // AES128加密
        baseDataStr := AES128Encryption(baseDataStr, keyStr, eType);

        // 系统生成随机数
        MAC := sysRandomNum;
     end;


     // 数据长度
     dateLenStr := IntToHex((Length(baseDataStr + MAC) div 2), 2);
     // 【2】子报文
     subFrame := operationRule + fcw + dateLenStr + baseDataStr + MAC;
   end;


   memo.lines.add('           数据域发送【A5异或前明文】:' + subFrame);
   // 对数据域的所有数据进行异或运算加密
   subFrame := EncryptStr(subFrame, 'A5');

   // 报文总长度
   totalLen := IntToHex((Length(subFrame) div 2) + 8 + 8, 4);
   // CRC校验
   crc := totalLen + protocolCode + protocolVersion + gasMeterAddr + controlWord + subFrame;
   crc := CRC16(crc);

   // 【3】完整报文
   fullFrameStr := startFrame + totalLen + protocolCode + protocolVersion + gasMeterAddr + controlWord + subFrame + crc + endFrame;
   Result := fullFrameStr;
end;



procedure autoAnalysis(protocolType, cmdName, DI, tableName1, tableName2, dataArea : string; query: TADOQuery; Memo : TRichEdit);
var ssql, cmdId, tempDataArea, dataItem, valStr, parserItems, showItems, itemName, itemSelect, itemVal1, itemVal2  : string;
    parserName, encodingType, maskType, unitStr, invert : string;
    byteCount, sortNum, ipos, jpos, i : Integer;
    sl : TStringList;
begin
  // 缓存数据域报文
  tempDataArea :=  dataArea;

	ssql := 'select * from ' + tableName1 + 
			' where protocolType = ' + quotedStr(protocolType) + 
			' and commandName = ' + quotedStr(cmdName) + 
			' and DI = ' + quotedStr(DI);
	try
		query.close;
		query.SQL.clear;
		query.SQL.add(ssql);
		query.Open;
		if (query.RecordCount > 0) then
		begin
       cmdId := query.fieldByName('id').AsString;
       parserItems := query.fieldByName('parserItems').AsString;
       if (parserItems = '有') then
       begin
         ssql := 'select * from ' + tableName2 +' where cmdId = ' + QuotedStr(cmdId) + ' order by sortNum';
         query.close;
         query.SQL.clear;
         query.SQL.add(ssql);
         query.Open;

         query.First;
         if (query.RecordCount > 0) then
         begin
            while (not query.Eof) do
            begin

              parserName := query.fieldByName('parserName').AsString;
              byteCount := query.fieldByName('byteCount').AsInteger;
              encodingType := query.fieldByName('encodingType').AsString;
              invert := query.fieldByName('invert').AsString;
              maskType := query.fieldByName('maskType').AsString;
              unitStr := query.fieldByName('unitStr').AsString;
              showItems := query.fieldByName('showItems').AsString;

              // 对单位进行特殊处理  T188协议中 动态单位
              

              // 需要解析的每一项原始数据
              dataItem := Copy(tempDataArea, 1, byteCount * 2);
              delete(tempDataArea, 1, byteCount * 2);
              // 判断是否倒置
              if (invert = '1') then dataItem := tzstrx(dataItem);
              // 判断编码类型
              if (encodingType = 'HEX') then
              begin
                 dataItem := IntToStr(HexToDec(dataItem));
                 dataItem := PadLStr(dataItem, byteCount * 2, '0');
              end;
              if (encodingType = 'Float') then
              begin
                 dataItem := FloatToStr(HexToFloat(dataItem)); 
              end;

              // 判断是否是小数，几位小数
              ipos := Pos('.', maskType);
              if (ipos > 0) then
              begin
                // XXXX.XX
                valStr := Copy(dataItem, 1, ipos-1) + '.' + Copy(dataItem, ipos, Length(maskType)-ipos);
              end
              else
              // 处理日期
              if (maskType = 'yyyy-MM-DD HH:mm:ss') then
              begin
                 valStr := Copy(dataItem, 1, 4) + '年' + Copy(dataItem, 5, 2) + '月' + Copy(dataItem, 7, 2) + '日' +  Copy(dataItem, 9, 2) + '时' + Copy(dataItem, 11, 2) + '分' + Copy(dataItem, 13, 2) + '秒';
              end
              else
              if (maskType = 'yyyy-MM-DD ww HH:mm:ss') then
              begin
                 valStr := Copy(dataItem, 1, 4) + '年' + Copy(dataItem, 5, 2) + '月' + Copy(dataItem, 7, 2) + '日' +  Copy(dataItem, 11, 2) + '时' + Copy(dataItem, 13, 2) + '分' + Copy(dataItem, 15, 2) + '秒  星期' + Copy(dataItem, 9, 2);
              end
              else
              if (maskType = 'yy-MM-DD HH:mm:ss') then
              begin
                 valStr := Copy(dataItem, 1, 2) + '年' + Copy(dataItem, 3, 2) + '月' + Copy(dataItem, 5, 2) + '日' +  Copy(dataItem, 7, 2) + '时' + Copy(dataItem, 9, 2) + '分' + Copy(dataItem, 11, 2) + '秒';
              end
              else
              if (maskType = 'yy-MM-DD HH:mm') then
              begin
                 valStr := Copy(dataItem, 1, 2) + '年' + Copy(dataItem, 3, 2) + '月' + Copy(dataItem, 5, 2) + '日' +  Copy(dataItem, 7, 2) + '时' + Copy(dataItem, 9, 2) + '分';
              end
              else
              if (maskType = 'yy-MM-DD ww HH:mm:ss') then
              begin
                 valStr := Copy(dataItem, 1, 2) + '年' + Copy(dataItem, 3, 2) + '月' + Copy(dataItem, 5, 2) + '日' +  Copy(dataItem, 9, 2) + '时' + Copy(dataItem, 11, 2) + '分' + Copy(dataItem, 13, 2) + '秒  星期' + Copy(dataItem, 7, 2);
              end
              else
              if (maskType = 'yyyy-MM-DD HH:mm') then
              begin
                valStr := Copy(dataItem, 1, 4) + '年' + Copy(dataItem, 5, 2) + '月' + Copy(dataItem, 7, 2) + '日' +  Copy(dataItem, 9, 2) + '时' + Copy(dataItem, 11, 2) + '分';            
              end
              else
              if (maskType = 'yyyy-MM-DD') then
              begin
                 valStr := Copy(dataItem, 1, 4) + '年' + Copy(dataItem, 5, 2) + '月' + Copy(dataItem, 7, 2) + '日';
              end
              else
              if (maskType = 'yy-MM-DD') then
              begin
                 valStr := Copy(dataItem, 1, 2) + '年' + Copy(dataItem, 3, 2) + '月' + Copy(dataItem, 5, 2) + '日';
              end
              else
              if (maskType = 'ascToStr') then
              begin
                  valStr := HexStrToStr(dataItem);
                  valStr := Trim(valStr);
              end
              else
              begin
                // 原样输出
                valStr := dataItem;
              end;

              if (showItems <> '') then
              begin
                 // 处理二进制解析， 例如:  [Bit1]阀门状态：开[1]-关[0]|[Bit2]强磁状态：正常[1]-异常[0]
                 if (maskType = 'strToBin') then
                 begin
                   Memo.Lines.Add('    【'+ parserName +'】 : ' + dataItem);
                   dataItem := HextoBin1(dataItem);
                   // 每一个bit位倒置
                   dataItem := tzstrx1(dataItem);
                   try
                     sl := TStringList.Create;
                     sl.Delimiter := '|';
                     sl.DelimitedText := showItems;
                     for i:=0 to sl.Count-1 do
                     begin
                       // 每一项 [Bit1]阀门状态：开[1]-关[0]
                       ipos := Pos(':', sl[i]);
                       if (ipos > 0) then
                       begin
                          itemName := Copy(sl[i], 1, ipos-1); // [Bit1]阀门状态 
                          
                          itemSelect := Copy(sl[i], ipos+1, Length(sl[i])-ipos); // 开[1]-关[0]
                          jpos := Pos('-', itemSelect);
                          if (jpos > 0) then
                          begin
                             itemVal1 := Copy(itemSelect, 1, jpos-1);  // 开[1]
                             itemVal2 := Copy(itemSelect, jpos+1, Length(itemSelect)-jpos); // 关[0]
                             if (Pos(dataItem[i+1], itemVal1) > 0) then
                                valStr := itemVal1
                             else
                             if (Pos(dataItem[i+1], itemVal2) > 0) then
                                valStr := itemVal2
                             else
                                valStr := dataItem[i+1];

                             // 输出每个Bit位信息
                             Memo.Lines.Add('                ' + itemName + ' : ' + valStr);   
                          end;
                       end;
                     end;
                   finally
                     sl.Free; 
                   end;
                 end
                 else
                 begin
                     // 最后处理显示项，例如：开阀[00]|关阀[01]
                     try
                       sl := TStringList.Create;
                       sl.Delimiter := '|';
                       sl.DelimitedText := showItems;
                       for i:=0 to sl.Count-1 do
                       begin
                         if (Pos(valStr, sl[i]) > 0) then
                         begin
                            valStr := sl[i];
                            break;
                         end;
                       end;
                     finally
                       sl.Free; 
                     end;
                 end;
              end;
              if (maskType <> 'strToBin') then
                Memo.Lines.Add('    【'+ parserName +'】 : ' + valStr + ' ' + unitStr);
              query.Next;
            end;
         end;
       end;
    end;
	except
	end;
end;


// 流量表质量追溯系统  动态组织发送帧的方法
function getSendFrameForFMQTS() : string;
begin

end;

// 昆仑表号校验算法   （信通院）    ISO7064,MOD 11，10 校验系统校验码计算算法
function getMod11MeterNum(meterNum: string): string;
var
  newMeterNum, oneNum, checkNum: string;
  sum, modNum: Integer;
  Mplus1, M, S, P, n, i, temp: Integer;
begin
  M := 10;
  Mplus1 := M + 1;
  S := 0;
  P := M;
  n := Length(meterNum) + 1;

  for i := n downto 2 do
  begin
    S := P + StrToInt(meterNum[n - i + 1]);
    temp := S mod M;
    if (temp = 0) then
      P := (M * 2) mod Mplus1
    else
      P := ((S mod M) * 2) mod Mplus1;
  end;
  temp := (M + 1 - (P mod M)) mod M;
  checkNum := intToStr(temp);

  newMeterNum := meterNum + checkNum;
  Result := newMeterNum;
end;


// 昆仑燃气CRC16 校验算法
function CRC16(data: string): string;
var
  i, res: Integer;
  Datas: array of Byte;
  v_str: string;
begin
  SetLength(Datas, Length(data) div 2);
  for i := 1 to Length(data) div 2 do
  begin
    v_str := '$' + copy(data, 2 * i - 1, 2);
    Datas[i - 1] := StrToInt(v_str); //取出字符并转换为16进制数
  end;
  res := CalCRC16(Datas, Low(Datas), Length(data) div 2 - 1);
  Result := IntToHex(res, 4);
end;

function CalCRC16(AData: array of Byte; AStart, AEnd: Integer): Word;
const
  GENP = $1021;  //多项式公式X16+X15+X2+1（1100 0000 0000 0101）
var
  crc: Word;
  i: Integer;
  tmp: Byte;

  procedure CalOneByte(AByte: Byte);  //计算1个字节的校验码
  var
    j: Integer;
  begin
    crc := crc xor (AByte shl 8);
    for j := 0 to 7 do
      if (crc and $8000) <> 0 then // 只测试最高位
        crc := (crc shl 1) xor GENP // 最高位为1，移位和异或处理
      else
        crc := crc shl 1;           // 否则只移位（乘2）
  end;

begin
  crc := $0000;             //将余数设定为0000
  for i := AStart to AEnd do   //对每一个字节进行校验
    CalOneByte(AData[i]);
  Result := crc;
end;



// CRC16 校验算法
function crcjy(bufAddr: string): string;
const
    CRC_TABLE_H: array[0..255] of Byte =        //High
($00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0,
    $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41,
    $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40, $00, $C1, $81, $40, $01, $C0, $80, $41, $00, $C1, $81, $40, $01, $C0, $80, $41, $01, $C0, $80, $41, $00, $C1, $81, $40);
    CRC_TABLE_L: array[0..255] of Byte =        //Low
($00, $C0, $C1, $01, $C3, $03, $02, $C2, $C6, $06, $07, $C7, $05, $C5, $C4, $04, $CC, $0C, $0D, $CD, $0F, $CF, $CE, $0E, $0A, $CA, $CB, $0B, $C9, $09, $08, $C8, $D8, $18, $19, $D9, $1B, $DB, $DA, $1A, $1E, $DE, $DF, $1F, $DD, $1D, $1C, $DC, $14, $D4, $D5, $15, $D7, $17, $16, $D6, $D2, $12, $13, $D3, $11, $D1, $D0, $10, $F0, $30, $31, $F1, $33, $F3, $F2, $32, $36, $F6, $F7, $37, $F5, $35, $34, $F4, $3C, $FC, $FD, $3D, $FF, $3F, $3E, $FE, $FA, $3A, $3B, $FB, $39, $F9, $F8, $38, $28, $E8, $E9, $29, $EB, $2B,
    $2A, $EA, $EE, $2E, $2F, $EF, $2D, $ED, $EC, $2C, $E4, $24, $25, $E5, $27, $E7, $E6, $26, $22, $E2, $E3, $23, $E1, $21, $20, $E0, $A0, $60, $61, $A1, $63, $A3, $A2, $62, $66, $A6, $A7, $67, $A5, $65, $64, $A4, $6C, $AC, $AD, $6D, $AF, $6F, $6E, $AE, $AA, $6A, $6B, $AB, $69, $A9, $A8, $68, $78, $B8, $B9, $79, $BB, $7B, $7A, $BA, $BE, $7E, $7F, $BF, $7D, $BD, $BC, $7C, $B4, $74, $75, $B5, $77, $B7, $B6, $76, $72, $B2, $B3, $73, $B1, $71, $70, $B0, $50, $90, $91, $51, $93, $53, $52, $92, $96, $56, $57, $97,
    $55, $95, $94, $54, $9C, $5C, $5D, $9D, $5F, $9F, $9E, $5E, $5A, $9A, $9B, $5B, $99, $59, $58, $98, $88, $48, $49, $89, $4B, $8B, $8A, $4A, $4E, $8E, $8F, $4F, $8D, $4D, $4C, $8C, $44, $84, $85, $45, $87, $47, $46, $86, $82, $42, $43, $83, $41, $81, $80, $40);
var
    temp, R0, R1: integer;
    i: integer;
    len: integer;
    returnStr: string;
begin
    // Result := 0;
    Result := '';
    R0 := $ff;
    R1 := $ff;
    len := length(bufAddr) div 2;
    i := 1;
    while (len > 0) do
    begin
        Dec(len);
        temp := strtoint('$' + copy(bufAddr, i, 2)) xor R1;
        R1 := R0 xor CRC_TABLE_H[temp];
        R0 := CRC_TABLE_L[temp];
        i := i + 2;
    end;
    returnStr := RightStr(inttohex(R1, 2), 2) + RightStr(inttohex(R0, 2), 2);

    // StrLCopy(returnS,PChar(returnStr),Length(returnStr));
    Result := returnStr;
end;

{
  昆仑燃气异或运算加解密 配套函数
}
function myStrToHex(s:string):string; //字串转16进制
var  
  TmpStr:string;  
  i:integer;  
begin  
  TmpStr:='';  
  for i:=1 to Length(s)do  
    TmpStr:=TmpStr+IntToHex(ord(s[i]),2);  
  Result:=TmpStr;  
end;  
{
  昆仑燃气异或运算加解密 配套函数
}  
function myHexToStr(S:string):string; //16进制转字串   
var  
  HexS,TmpStr:string;  
  i:Integer;  
  a:Byte;  
begin  
  HexS:=s;  
  if Length(HexS) mod 2=1 then  
    HexS:=HexS+'0';  
  TmpStr:='';  
  for i:=1 to(Length(HexS)div 2)do  
  begin  
    a:=StrToInt('$'+HexS[2*i-1]+HexS[2*i]);  
    TmpStr:=TmpStr+Chr(a);  
  end;  
  Result:=TmpStr;  
end;
{两个函数的参数相同，s为要加密、解密的字串；sKey为密匙}  
function EncryptStr(const s:string;sKey:string):string; //加密   
var  
  i,j:Integer;  
  HexS,HexsKey,MidS,TmpStr:string;  
  a,b,c:byte;  
begin  
//  HexS:=myStrToHex(s);  
//  HexsKey:=myStrToHex(sKey);
  HexS:=s;  
  HexsKey:=sKey;

  MidS:=HexS;
  for i:=1 to(Length(HexsKey)div 2)do  
  begin  
    if i<>1 then MidS:=TmpStr;  
    TmpStr:=''; //下面要用到TmpStr，所以要清空   
    for j:=1 to (Length(MidS)div 2)do  
    begin  
      a:=StrToInt('$'+midS[2*j-1]+midS[2*j]);  
      b:=StrToInt('$'+HexsKey[2*i-1]+HexsKey[2*i]);  
      c:=a xor b;  
      tmpstr:=TmpStr+myStrToHex(Chr(c));

    end;  
  end;  
  Result:=TmpStr;  
end;

{
  字节对应异或加密
}
function EncryptStrDuiYing(const s:string;sKey:string):string; //加密
var
  i,j:Integer;  
  HexS,HexsKey,MidS,TmpStr:string;
  a,b,c:byte;  
begin
  TmpStr := ''; //下面要用到TmpStr，所以要清空
  for i:=1 to(Length(s)div 2)do
  begin
      a:=StrToInt('$'+s[2*i-1]+s[2*i]);
      b:=StrToInt('$'+sKey[2*i-1]+sKey[2*i]);
      c:=a xor b;
      TmpStr := TmpStr + myStrToHex(Chr(c));
  end;
  Result := TmpStr;
end;
  
function DecryptStr(const s:string;sKey:string):string; //解密   
var  
  i,j:Integer;  
  HexS,HexsKey,MidS,TmpStr:string;  
  a,b,c:Byte;  
begin  
  HexS:=s;  
  if Length(HexS)mod 2=1 then //检查是否为字符串   
  begin  
    ShowMessage('密文错误！');  
    Exit;  
  end;  
//  HexsKey:=myStrToHex(sKey);
  HexsKey:= sKey;
  TmpStr:=HexS;  
  MidS:=HexS;  
  for i:=(length(HexsKey) div 2) downto 1 do  
  begin  
    if i<>(length(HexsKey) div 2)then  
      MidS:=TmpStr;  
    TmpStr:=''; //下面要用到TmpStr，所以要清空   
    for j:=1 to(length(MidS) div 2)do  
    begin  
      a:=StrToInt('$'+MidS[2*j-1]+MidS[2*j]);  
      b:=StrToInt('$'+HexsKey[2*i-1]+HexsKey[2*i]);  
      c:=a xor b;  
      TmpStr := TmpStr+myStrToHex(Chr(c));  
    end;  
  end;  
//    Result:=myHexToStr(TmpStr);
    Result:=TmpStr;
end;

// AES128 加密
function AES128Encryption(baseDataStr, keyStr, eType : string) : string;
var key, tg: PByteArray;
    i, j, baseLen, baseModLen, addLen, multiple16 : Integer;
    resultStr, key1, key2 : string;
begin
    getmem(key, 128);
    getmem(tg, 128);

    if (eType = '20160417') then
    begin
        // 密钥处理
        key1 := Copy(keyStr, 1, 16);
        key2 := Copy(keyStr, 17, 8);

        for i := 0 to 7 do   
        begin
           key[i] := StrToInt('$' + Copy(key1, i*2+1, 2));
        end;
        for i := 1 to 8 do
        begin
           key[i+7] := ord(key2[i]);
        end;
    end
    else if (eType = '00nxlgg123') then
    begin
        // 密钥处理
        key1 := Copy(keyStr, 1, 12);
        key2 := RightStr(keyStr, 10);
        
        for i := 0 to 5 do
        begin
          key[i] := StrToInt('$' + Copy(key1, 2 * i + 1, 2));
        end;
        for i := 1 to 10 do
        begin
          key[i + 5] := ord(key2[i]);
        end;
    end;

    // 密钥
    {
    for i := 1 to 16 do
    begin
       key[i-1] := ord(keyStr[i]);
    end;
    }
    baseLen := 0;
    // 字节数
    baseLen := Length(baseDataStr) div 2;

    baseModLen := baseLen mod 16;
    if (baseModLen <> 0) then
    begin
      // 将 baseDataStr 补成16字节的整数倍
      addLen := (16-baseModLen) * 2;
      baseDataStr := baseDataStr + PadRStr('', addLen, '0');
      baseLen := Length(baseDataStr) div 2;
    end
    else
    begin
      baseLen := Length(baseDataStr) div 2;
    end;

    resultStr := '';

    multiple16 := baseLen div 16;
    for j:=0 to multiple16-1 do
    begin
      for i:=0 to 15 do
      begin
        tg[i] := StrToInt('$' + Copy(baseDataStr, 2 * i + 1, 2));
      end;
      aes128_data_encrypt1(key, tg);
      for i :=0 to 15 do
      begin
        resultStr := resultStr + Format('%.02x', [tg[i]]);
      end;
      Delete(baseDataStr, 1, 32);
    end;

    baseDataStr := resultStr;

    freemem(key, 128);
    freemem(tg, 128);

    Result := baseDataStr;
end;

// AES128 解密
function AES128Decrypt(subFrame, keyStr, eType : string) : string;
var key, tg: PByteArray;
i, j, allLen, dataLen, baseLen, multiple16 : Integer;
tempStr, baseDataStr, Mac, resultStr : string;
key1, key2 : string;
begin
   getmem(key, 128);
   getmem(tg, 128);

   if (eType = '20160417') then
   begin
        // 密钥处理
       key1 := Copy(keyStr, 1, 16);
       key2 := Copy(keyStr, 17, 8);

       for i := 0 to 7 do
       begin
          key[i] := StrToInt('$' + Copy(key1, i*2+1, 2));
       end;
       for i := 1 to 8 do
       begin
          key[i+7] := ord(key2[i]);
       end;
   end
   else if (eType = '00nxlgg123') then
   begin
      // 密钥处理
      key1 := Copy(keyStr, 1, 12);
      key2 := RightStr(keyStr, 10);
        
      for i := 0 to 5 do
      begin
        key[i] := StrToInt('$' + Copy(key1, 2 * i + 1, 2));
      end;
      for i := 1 to 10 do
      begin
        key[i + 5] := ord(key2[i]);
      end;
   end;

  {
   // 密钥
   for i := 1 to 16 do
   begin
     key[i-1] := ord(keyStr[i]);
   end;

   }

   // AES128 解密
   tempStr := Copy(subFrame, 1, 6);
   // 获取长度
   allLen := HexToInt(Copy(subFrame, 5, 2));
   cutOutStr(subFrame, 1, 6);

   // 基础数据   去除4字节的MAC
   baseDataStr := Copy(subFrame, 1, (allLen-4)*2);
   // MAC(随机数)
   Mac := RightStr(subFrame, 8);
   // 数据域字节数（包含4字节MAC）
   dataLen := allLen-4;

   baseLen := dataLen;
   resultStr := '';

   multiple16 := baseLen div 16;
   for j:=0 to multiple16-1 do
   begin
     for i:=0 to 15 do
     begin
       tg[i] := StrToInt('$' + Copy(baseDataStr, 2 * i + 1, 2));
     end;
     aes128_data_decrypt1(key, tg);
     for i :=0 to 15 do
     begin
       resultStr := resultStr + Format('%.02x', [tg[i]]);
     end;
     Delete(baseDataStr, 1, 32);
   end;
   freemem(key, 128);
   freemem(tg, 128);

   baseDataStr := resultStr;
   Result := tempStr + baseDataStr + Mac;
end;



// 698测试系统中计算 CRC校验的方法
function Hdl_State_calculateChecksum(BytePtr: string): string;
var
  r0: integer;
  r1: integer;
  fcs, m, NumberOfBytes: integer;
  temp: integer;
  ls: string;
  const
    fcstab: array[0..255] of integer = ($0000, $1189, $2312, $329b, $4624, $57ad, $6536, $74bf, $8c48, $9dc1, $af5a, $bed3, $ca6c, $dbe5, $e97e, $f8f7, $1081, $0108, $3393, $221a, $56a5, $472c, $75b7, $643e, $9cc9, $8d40, $bfdb, $ae52, $daed, $cb64, $f9ff, $e876, $2102, $308b, $0210, $1399, $6726, $76af, $4434, $55bd, $ad4a, $bcc3, $8e58, $9fd1, $eb6e, $fae7, $c87c, $d9f5, $3183, $200a, $1291, $0318, $77a7, $662e, $54b5, $453c, $bdcb, $ac42, $9ed9, $8f50, $fbef, $ea66, $d8fd, $c974, $4204, $538d, $6116,
        $709f, $0420, $15a9, $2732, $36bb, $ce4c, $dfc5, $ed5e, $fcd7, $8868, $99e1, $ab7a, $baf3, $5285, $430c, $7197, $601e, $14a1, $0528, $37b3, $263a, $decd, $cf44, $fddf, $ec56, $98e9, $8960, $bbfb, $aa72, $6306, $728f, $4014, $519d, $2522, $34ab, $0630, $17b9, $ef4e, $fec7, $cc5c, $ddd5, $a96a, $b8e3, $8a78, $9bf1, $7387, $620e, $5095, $411c, $35a3, $242a, $16b1, $0738, $ffcf, $ee46, $dcdd, $cd54, $b9eb, $a862, $9af9, $8b70, $8408, $9581, $a71a, $b693, $c22c, $d3a5, $e13e, $f0b7, $0840, $19c9, $2b52,
        $3adb, $4e64, $5fed, $6d76, $7cff, $9489, $8500, $b79b, $a612, $d2ad, $c324, $f1bf, $e036, $18c1, $0948, $3bd3, $2a5a, $5ee5, $4f6c, $7df7, $6c7e, $a50a, $b483, $8618, $9791, $e32e, $f2a7, $c03c, $d1b5, $2942, $38cb, $0a50, $1bd9, $6f66, $7eef, $4c74, $5dfd, $b58b, $a402, $9699, $8710, $f3af, $e226, $d0bd, $c134, $39c3, $284a, $1ad1, $0b58, $7fe7, $6e6e, $5cf5, $4d7c, $c60c, $d785, $e51e, $f497, $8028, $91a1, $a33a, $b2b3, $4a44, $5bcd, $6956, $78df, $0c60, $1de9, $2f72, $3efb, $d68d, $c704, $f59f,
        $e416, $90a9, $8120, $b3bb, $a232, $5ac5, $4b4c, $79d7, $685e, $1ce1, $0d68, $3ff3, $2e7a, $e70e, $f687, $c41c, $d595, $a12a, $b0a3, $8238, $93b1, $6b46, $7acf, $4854, $59dd, $2d62, $3ceb, $0e70, $1ff9, $f78f, $e606, $d49d, $c514, $b1ab, $a022, $92b9, $8330, $7bc7, $6a4e, $58d5, $495c, $3de3, $2c6a, $1ef1, $0f78);
begin
  try
    fcs := $FFFF;
    m := 1;
    //BytePtr:=tzstrx(BytePtr);
    NumberOfBytes := length(BytePtr) div 2;
    BytePtr := StringReplace(BytePtr, ' ', '', [rfReplaceAll]);
    m := 1;
    while (NumberOfBytes > 0) do
    begin
      ls := copy(BytePtr, m, 2);
      fcs := (fcs shr 8) xor fcstab[(fcs xor hextoint(ls)) and $FF];
      m := m + 2;
      NumberOfBytes := NumberOfBytes - 1;
    end; // for Index
    fcs := fcs xor $FFFF;
    ls := inttohex(fcs, 4);
    Hdl_State_calculateChecksum := ls;
  except
  end;
end;


// 给字符串中每个字节之间增加空格
function AddTab(sStr: string): string;
var
    i: Integer;
    sTemp: string;
begin
    sTemp := '';
    for i := 1 to (length(sStr) div 2) do
    begin
        sTemp := sTemp + ' ' + Copy(sStr, 2 * i - 1, 2);
    end;

    Result := sTemp;
end;

// 接收数据进行校验方法
function legalityCheck(receiveStr: string): string;
//var startF, endF, Checksum, meterNo, successFlag, command : string;
begin
  {
  校验步骤：
  1.起始结束符校验
  2.表号验证
  3.发送命令验证
  4.校验码验证
  5.成功失败标志验证
  }
    //
//    if (Copy(receiveStr,1,2) = '31') or ((Copy(receiveStr,1,2) = '68'))then
//    begin
//       cxMemo1.Lines.Add('?óê?μ?é?±¨êy?Y￡o');
//       cxMemo1.Lines.Add('é?±¨êy?Y￡o' + receiveStr);
//       Result := '0';
//    end
//    else
//    begin
       // 起始结束符校验
//        startF := Copy(receiveStr, 1, 2);
//        endF := RightStr(receiveStr, 2);
//        if (startF = '69') and (endF = '16') then
//        begin
//            Result := '1';
//        end
//        else
//        begin
//          cxMemo1.Lines.Add('?eê??áê?·?′í?ó￡?');
//          Result := '0';
//          Exit;
//        end;
        // 表号验证
//        if (jzqNO.Text <> 'AAAAAAAA') then
//        begin
//            meterNo := tzstrx(Copy(receiveStr, 7, 8));
//            if (jzqNO.Text <> meterNo) then
//            begin
//               cxMemo1.Lines.Add('?ˉ?D?÷±ào?2?ò???￡?');
//               cxMemo1.Lines.Add(meterNo + ' ?ù' + jzqNO.Text);
//               Result := '0';
//               Exit;
//            end
//            else
//            begin
//               Result := '1';
//            end;
//        end;
        // 校验码验证
      //    Checksum := GetJy(Copy(receiveStr, 1, Length(receiveStr)-4));
      //    if (Checksum = LeftStr(RightStr(receiveStr, 4), 2)) then
      //    begin
      //       Result := '1';
      //    end
      //    else
      //    begin
      //       cxMemo1.Lines.Add('??' + commandList.Strings[next] + '??D￡?éoí2?ò???￡?');
      //       cxMemo1.Lines.Add(Checksum + ' ?ù' + LeftStr(RightStr(receiveStr, 4), 2));
      //       Result := '0';
      //       Exit;
      //    end;
        // 成功失败标志验证
//        successFlag := Copy(receiveStr, 5, 2);
//        if (IntToStr(StrToInt(ctrl) + 80) = successFlag) then
//        begin
//           Result := '1';
//        end
//        else
//        begin
//           cxMemo1.Lines.Add('·μ??êy?Yê§°ü￡?3é1|ê§°ü±ê??2??yè·￡?');
//           cxMemo1.Lines.Add('·￠?í??????￡o' + ctrl + '?￡ ?óê???????￡o ' + successFlag);
//           Result := '0';
//           Exit;
//        end;
        // 发送命令验证
//        command := Copy(receiveStr, 15, 4);
//        if (Copy(sendCommand, 15, 4) = command) then
//        begin
//           Result := '1';
//        end
//        else
//        begin
//           cxMemo1.Lines.Add('·￠?í?üá?oí·μ???üá?2?ò???￡?');
//           cxMemo1.Lines.Add('·￠?í?üá?￡o' + tzstrx(Copy(sendCommand, 15, 4)) + '?￡ ?óê??üá?￡o ' + tzstrx(command));
//           Result := '0';
//           Exit;
//        end;
//    end;
end;




// 打开串口方法
{
  com：串口名称
  iBand：波特率
  iStopBits： 停止位
  iParity：校验位
  iByteSize：传送字节数
  sErrInfo ： 错误信息
  MyCom：通讯句柄（设置为全局变量）
  示例：
  声明全局变量：
  hCom := THandle;
  声明局部变量
  errorInfo := '';
  调用方法：
    procedure TForm1.Button5Click(Sender: TObject);
    var
        errorInfo: string;
        openFlag: Boolean;
        dwErrorFlags: DWORD;
        ComStat: TComStat;
    begin

        openFlag := utils.OpenCom('COM4', 115200, 0, 2, 8, errorInfo, hCom);
        if (openFlag) then
            redt1.Lines.Add('串口打开成功！')
        else
            redt1.Lines.Add('串口打开失败！');
    end;
}
function OpenCom(com: string; iBand: cardinal; iStopBits, iParity, iByteSize: Byte; var sErrInfo: string; var MyCom: THandle): Boolean;
var
    tmpdcb: DCB;
    ct: COMMTIMEOUTS;
begin

    Result := false;
    if Length(com) > 4 then
        com := '\\.\' + com;
    if (MyCom = 0) then
    begin
        MyCom := CreateFile(pchar(com), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_EXISTING, 0, 0);
        if (MyCom = INVALID_HANDLE_VALUE) then
        begin
            sErrInfo := com + '打开失败！';
            exit;
        end;
        GetCommState(MyCom, tmpdcb);
        tmpdcb.BaudRate := iBand;
        tmpdcb.StopBits := iStopBits;
        tmpdcb.Parity := iParity;
        tmpdcb.ByteSize := iByteSize;
        tmpdcb.Flags := tmpdcb.Flags or 2;
        tmpdcb.Flags := tmpdcb.Flags and (not $40);
        tmpdcb.Flags := tmpdcb.Flags and (not $3030);
        if not SetCommState(MyCom, tmpdcb) then
        begin
            closeCom(MyCom);
            sErrInfo := '设置DCB失败！';
            exit;
        end;
        if not SetupComm(MyCom, 2048, 2048) then
        begin
            closeCom(MyCom);
            sErrInfo := '设置缓冲区失败！';
            exit;
        end;
        if not GetCommTimeouts(MyCom, ct) then
        begin
            closeCom(MyCom);
            sErrInfo := '查询超时配置失败！';
            exit;
        end;

        // 设置超时
        ct.ReadIntervalTimeout := 1000;
        ct.ReadTotalTimeoutMultiplier := 500;
        ct.ReadTotalTimeoutConstant := 500;
        // 设定写超时
        ct.WriteTotalTimeoutMultiplier := 500;
        ct.WriteTotalTimeoutConstant := 1000;

        if not SetCommTimeouts(MyCom, ct) then
        begin
            closeCom(MyCom);
            sErrInfo := '设置超时出错！';
            exit;
        end;
        Result := true;
    end
    else if (MyCom > 0) then
    begin
        sErrInfo := '串口已打开！';
        Result := true;
    end;

end;

// 关闭串口方法
{
    调用示例：
    utils.closeCom(hCom);
    hCom := 0;// 必须要这样写！！！
    redt1.Lines.Add('关闭串口成功！');
}
function closeCom(hcom: THandle): Boolean;
begin
    if hcom <> INVALID_HANDLE_VALUE then
        CloseHandle(hcom);
    Result := True;
end;

// 串口通讯方法 （发送，接收命令）
{
  hCom : 通信句柄
  sendMessage: 发送命令报文
  receiveMessage： 接收命令报文
  msg : 返回消息
  myTimer： timer控件
  myProgressBar ：进度条控件

  调用示例：
    procedure TForm1.Button4Click(Sender: TObject);
    var
        i: Integer;
        receiveCMD, msg: string;
        returnFlag: Boolean;
    begin

        for i := 1 to 10 do
        begin
            redt1.Lines.Add('发送数据:' + edt1.Text);
            returnFlag := utils.serialCommunication(hCom, edt1.Text, receiveCMD, msg, tmr2, nil);

            if (returnFlag) then
            begin
                edt2.Text := receiveCMD;
                redt1.Lines.Add('接收数据:' + receiveCMD);
            end
            else
            begin
                redt1.Lines.Add('失败原因:' + msg);
            end;
            Sleep(500);// 不加延迟，就会成功一条，失败一条。
        end;
        redt1.SelAttributes.Color := clBlue;
        redt1.Lines.Add('结束');

    end;
}
function serialCommunication(hCom: THandle; sendMessage: string; var receiveMessage, msg: string; myTimer: TTimer; myProgressBar: TProgressBar): Boolean;
var
    writeFlag, reveiveFlag, returnFlag: Boolean;
    buf: array[1..10240] of byte;
    len, returnlen: cardinal;
    dwErrorFlags: DWORD;
    ComStat: TComStat;
    i, readLen: Integer;
begin

    ClearCommError(hCom, dwErrorFlags, @ComStat);
    returnFlag := false;
    msg := '';
    // 发送命令
    len := length(sendMessage);
    len := len div 2;
    for i := 1 to len do
    begin
        buf[i] := StrToInt('$' + leftstr(sendMessage, 2));
        delete(sendMessage, 1, 2);
    end;
    try
        writeFlag := WriteFile(hCom, buf[1], len, returnlen, nil);
        if (writeFlag) then
            msg := msg + '&发送成功！'
        else
            msg := msg + '&发送失败！';
        sendMessage := '';
        for i := 1 to len do
            sendMessage := sendMessage + Format('%.2x', [buf[i]]);
        //清除串口接收缓存
        PurgeComm(hCom, PURGE_RXABORT + PURGE_RXCLEAR);
        // 开始等待接收数据
        myTimer.Interval := 1000;
        myTimer.Tag := 0;
        myTimer.Enabled := true;
        while myTimer.Enabled do
        begin
            if not ClearCommError(hCom, dwErrorFlags, @ComStat) then
            begin
                msg := msg + '&查询串口状态出错！';
                exit;
            end;
            // 接收数据
            readLen := Min(2048, ComStat.cbInQue);
            if (readLen > 0) then
            begin
                reveiveFlag := ReadFile(hCom, buf, readLen, len, nil);
                if (reveiveFlag) then
                begin
                    msg := msg + '&接收数据成功！'
                end
                else
                begin
                    msg := msg + '&接收数据失败！';
                    exit;
                end;
                receiveMessage := '';
                for i := 1 to len do
                    receiveMessage := receiveMessage + Format('%.2x', [buf[i]]);

                if (receiveMessage <> '') then
                begin
                    // 设置返回标志
                    returnFlag := true;
                    myTimer.Enabled := false;
                end;
            end;

            if (myProgressBar <> nil) then
            begin
                myProgressBar.Position := myProgressBar.Position + myProgressBar.Step;
            end;

            application.ProcessMessages;
        end;
    finally
         Result := returnFlag;
    end;
end;

end.

