unit u_version;

interface
uses
  Windows,  SysUtils;

  function GetBuildInfo: string; overload; //获取版本号
  function GetBuildInfo(sFile:string): string;overload; //获取版本号
  procedure GetFileTime(const Tf:string; var t1,t2,t3:string);

implementation
function GetBuildInfo: string; overload; //获取版本号
begin
    Result := GetBuildInfo(ParamStr(0));
end;
function GetBuildInfo(sFile:string): string; //获取版本号
var
    verinfosize : DWORD;
    verinfo : pointer;
    vervaluesize : dword;
    vervalue : pvsfixedfileinfo;
    dummy : dword;
    v1,v2,v3,v4 : word;
begin
    //verinfosize := getfileversioninfosize(pchar(paramstr(0)),dummy);
    verinfosize := getfileversioninfosize(pchar(sFile),dummy);
    if verinfosize = 0 then
    begin
        dummy := getlasterror;
        result := '0.0.0.0';
    end;

    getmem(verinfo,verinfosize);
    //getfileversioninfo(pchar(paramstr(0)),0,verinfosize,verinfo);
    getfileversioninfo(pchar(sFile),0,verinfosize,verinfo);
    verqueryvalue(verinfo,'\',pointer(vervalue),vervaluesize);
    with vervalue^ do
    begin
        v1 := dwfileversionms shr 16;
        v2 := dwfileversionms and $ffff;
        v3 := dwfileversionls shr 16;
        v4 := dwfileversionls and $ffff;
    end;

    result := inttostr(v1) + '.' + inttostr(v2) + '.' + inttostr(v3) + '.' + inttostr(v4);
    freemem(verinfo,verinfosize);
end;


function CovFileDate(Fd:_FileTime):TDateTime;
{ 转换文件的时间格式 }
var
Tct:_SystemTime;
Temp:_FileTime;
begin
    FileTimeToLocalFileTime(Fd,Temp);
    FileTimeToSystemTime(Temp,Tct);
    CovFileDate:=SystemTimeToDateTime(Tct);
end;

procedure GetFileTime(const Tf:string; var t1,t2,t3:string);
  {   获取文件时间，Tf表示目标文件路径和名称   }
const
  Model='yyyy/mm/dd hh:mm:ss';   {   设定时间格式   }
var
  Tp:TSearchRec;   {   申明Tp为一个查找记录   }

begin
  FindFirst(Tf,faAnyFile,Tp);   {   查找目标文件   }
  T1:=FormatDateTime(Model, CovFileDate(Tp.FindData.ftCreationTime));
  {   返回文件的创建时间   }
  T2:=FormatDateTime(Model, CovFileDate(Tp.FindData.ftLastWriteTime));
  {   返回文件的修改时间   }
  T3:=FormatDateTime(Model,Now);
  {   返回文件的当前访问时间   }
  FindClose(Tp);
end;


end.
