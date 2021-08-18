unit u_version;

interface
uses
  Windows,  SysUtils;

  function GetBuildInfo: string; overload; //��ȡ�汾��
  function GetBuildInfo(sFile:string): string;overload; //��ȡ�汾��
  procedure GetFileTime(const Tf:string; var t1,t2,t3:string);

implementation
function GetBuildInfo: string; overload; //��ȡ�汾��
begin
    Result := GetBuildInfo(ParamStr(0));
end;
function GetBuildInfo(sFile:string): string; //��ȡ�汾��
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
{ ת���ļ���ʱ���ʽ }
var
Tct:_SystemTime;
Temp:_FileTime;
begin
    FileTimeToLocalFileTime(Fd,Temp);
    FileTimeToSystemTime(Temp,Tct);
    CovFileDate:=SystemTimeToDateTime(Tct);
end;

procedure GetFileTime(const Tf:string; var t1,t2,t3:string);
  {   ��ȡ�ļ�ʱ�䣬Tf��ʾĿ���ļ�·��������   }
const
  Model='yyyy/mm/dd hh:mm:ss';   {   �趨ʱ���ʽ   }
var
  Tp:TSearchRec;   {   ����TpΪһ�����Ҽ�¼   }

begin
  FindFirst(Tf,faAnyFile,Tp);   {   ����Ŀ���ļ�   }
  T1:=FormatDateTime(Model, CovFileDate(Tp.FindData.ftCreationTime));
  {   �����ļ��Ĵ���ʱ��   }
  T2:=FormatDateTime(Model, CovFileDate(Tp.FindData.ftLastWriteTime));
  {   �����ļ����޸�ʱ��   }
  T3:=FormatDateTime(Model,Now);
  {   �����ļ��ĵ�ǰ����ʱ��   }
  FindClose(Tp);
end;


end.
