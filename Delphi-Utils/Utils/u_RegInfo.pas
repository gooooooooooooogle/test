unit u_RegInfo;

interface
  uses
   SysUtils, IniFiles, Windows, Forms;
   function CheckRegInfo(ideNum : string):string; overload;
   function CheckRegInfo():Boolean; overload;
   function GetDllPath:string;
   function GetLocalReg(): string;
   function SetLocalReg(sReg : string):Boolean;

implementation
   uses u_HardWare, u_Reg; 

//将注册信息保存到当前目录的config.ini中
function SetLocalReg(sReg : string):Boolean;
var
    f : TIniFile;
begin
    f := TIniFile.Create(getdllpath);
    f.WriteString('SYSTEM', 'SN', sReg);
    Result := true;
end;
//读取本地配置文件config.ini中的注册信息
function GetLocalReg(): string;
var
    f : TIniFile;
begin
     f := TIniFile.Create(getdllpath);
    Result := f.ReadString('SYSTEM', 'SN', '');
end;   
//验证注册信息是否正确
function CheckRegInfo():Boolean;
var
    sn : string;
    freg : TF_Reg;
begin
    sn := GetLocalReg();
    if sn <> CheckRegInfo(HardWareInfo) then
    begin
//        MessageBox(0,'注册信息不正确，请注册', '提示', MB_OK);
//        freg := TF_Reg.Create(Application);
//        if (freg.ShowModal = 1 ) then
//            Result := True
//        else
        Result := False;
    end
    else
        Result := true;
end;
//根据机器码获得注册码
function CheckRegInfo(ideNum : string):string;
var
    i, j : Integer;
    iSum : Longint;
    sStr : string;
    sRoundStr : string;
begin
    iSum := 0;
    for i := 1 to length(ideNum) do
    begin
        iSum := iSum + Ord(ideNum[i]);
    end;
    iSum := (iSum * 2016 * 2 * 1 * 16 * 15) + 201602011615;
    sStr := IntToStr(iSum);
    while length(sStr) < 20 do
    begin
        sStr := '0' + sStr;
    end;
    for j := length(sStr) downto 1 do
    begin
        sRoundStr := sRoundStr + sStr[j];
    end;
    sRoundStr := Copy(sRoundStr, 1, 10);
    Result := sRoundStr;
end;     
//获取DLL所在目录路径
function GetDllPath:string;
begin
    Result := ExtractFileDir(ParamStr(0)) + '//' + 'config.ini';
end;

end.
