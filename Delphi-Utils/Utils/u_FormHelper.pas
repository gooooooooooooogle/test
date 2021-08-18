unit u_FormHelper;

interface

uses
    Classes, SysUtils, StdCtrls, ExtCtrls, cxCalendar, IniFiles, RzEdit, cxCheckBox,
    cxDropDownEdit, RzPanel;
    procedure SetComponentEnable(m_c : TComponent; bEnable:Boolean);
    procedure SetGroupboxControlsEnable(m_c : TGroupBox; bEnable:Boolean);
    procedure SetPanelControlsEnable(m_c : Tpanel; bEnable:Boolean);
    procedure ConfigData2Component(m_c:TComponent; sPath:string);
    procedure ComponentData2Config(m_c: TComponent; sPath:string);

implementation

procedure SetComponentEnable(m_c : TComponent; bEnable:Boolean);
var
    i:Integer;
begin
    for i := 0 to m_c.ComponentCount - 1 do
    begin
        if (m_c.Components[i] is TEdit) then
        begin
            (m_c.Components[i] as TEdit).Enabled := bEnable;
        end
        else
        if (m_c.Components[i] is TRadioButton) then
        begin
            (m_c.Components[i] as TRadioButton).Enabled := bEnable;
        end
        else
        if (m_c.Components[i] is TComboBox) then
        begin
            (m_c.Components[i] as TComboBox).Enabled := bEnable;
        end
        else
        if (m_c.Components[i] is TcxDateEdit) then
        begin
            (m_c.Components[i] as TcxDateEdit).Enabled := bEnable;
        end
        else
        if (m_c.Components[i] is TCheckBox) then
        begin
            (m_c.Components[i] as TCheckBox).Enabled := bEnable;
        end
        else
        if (m_c.Components[i] is TGroupBox) then
        begin
            SetComponentEnable(m_c.Components[i] as TGroupBox, bEnable);
        end
        else
        if (m_c.Components[i] is TPanel) then
        begin
            SetComponentEnable(m_c.Components[i] as TPanel, bEnable);
        end;
    end;
end;
procedure SetGroupboxControlsEnable(m_c : TGroupBox; bEnable:Boolean);
var
    i:Integer;
begin
    for i := 0 to m_c.ControlCount - 1 do
    begin
        if (m_c.Controls[i] is TEdit) then
        begin
            (m_c.Controls[i] as TEdit).Enabled := bEnable;
        end
        else
        if (m_c.Controls[i] is TComboBox) then
        begin
            (m_c.Controls[i] as TComboBox).Enabled := bEnable;
        end
        else
        if (m_c.Controls[i] is TcxDateEdit) then
        begin
            (m_c.Controls[i] as TcxDateEdit).Enabled := bEnable;
        end
        else
        if (m_c.Controls[i] is TCheckBox) then
        begin
            (m_c.Controls[i] as TCheckBox).Enabled := bEnable;
        end
        else
        if (m_c.Controls[i] is TGroupBox) then
        begin
            SetComponentEnable(m_c.Controls[i] as TGroupBox, bEnable);
        end
        else
        if (m_c.Controls[i] is TPanel) then
        begin
            SetComponentEnable(m_c.Controls[i] as TPanel, bEnable);
        end;
    end;
end;
procedure SetPanelControlsEnable(m_c : Tpanel; bEnable:Boolean);
var
    i:Integer;
begin
    for i := 0 to m_c.ControlCount - 1 do
    begin
        if (m_c.Controls[i] is TEdit) then
        begin
            (m_c.Controls[i] as TEdit).Enabled := bEnable;
        end
        else
        if (m_c.Controls[i] is TComboBox) then
        begin
            (m_c.Controls[i] as TComboBox).Enabled := bEnable;
        end
        else
        if (m_c.Controls[i] is TcxDateEdit) then
        begin
            (m_c.Controls[i] as TcxDateEdit).Enabled := bEnable;
        end
        else
        if (m_c.Controls[i] is TCheckBox) then
        begin
            (m_c.Controls[i] as TCheckBox).Enabled := bEnable;
        end
        else
        if (m_c.Controls[i] is TGroupBox) then
        begin
            SetComponentEnable(m_c.Controls[i] as TGroupBox, bEnable);
        end
        else
        if (m_c.Controls[i] is TPanel) then
        begin
            SetComponentEnable(m_c.Controls[i] as TPanel, bEnable);
        end;
    end;
end;

procedure ConfigData2Component(m_c:TComponent; sPath:string);
var
    i : Integer;
    myfile : TIniFile;
begin
    myfile := TIniFile.Create(sPath);
    for i := 0 to m_c.ComponentCount - 1 do
    begin
        if (m_c.Components[i] is TEdit) then
        begin
            (m_c.Components[i] as TEdit).Text := myfile.ReadString('TEdit', (m_c.Components[i] as TEdit).Name, '');
        end
        else
        if (m_c.Components[i] is TRadioButton) then
        begin
            (m_c.Components[i] as TRadioButton).Checked := myfile.ReadBool('TRadioButton', (m_c.Components[i] as TRadioButton).Name, False);
        end
        else
        if (m_c.Components[i] is TRzEdit) then
        begin
            (m_c.Components[i] as TRzEdit).Text := myfile.ReadString('TRzEdit', (m_c.Components[i] as TRzEdit).Name, '');
        end
        else
        if (m_c.Components[i] is TComboBox) then
        begin
            (m_c.Components[i] as TComboBox).ItemIndex := myfile.ReadInteger('TComboBox', (m_c.Components[i] as TComboBox).Name, -1);
        end
        else
        if (m_c.Components[i] is TcxComboBox) then
        begin
            (m_c.Components[i] as TcxComboBox).ItemIndex := myfile.ReadInteger('TcxComboBox', (m_c.Components[i] as TcxComboBox).Name, -1);
        end
        else
        if (m_c.Components[i] is TCheckBox) then
        begin
            (m_c.Components[i] as TCheckBox).Checked := myfile.ReadBool('TCheckBox', (m_c.Components[i] as TCheckBox).Name, False);
        end
        else
        if (m_c.Components[i] is TcxCheckBox) then
        begin
            (m_c.Components[i] as TcxCheckBox).Checked := myfile.ReadBool('TcxCheckBox', (m_c.Components[i] as TcxCheckBox).Name, False);
        end
        else
        if (m_c.Components[i] is TcxDateEdit) then
        begin
            (m_c.Components[i] as TcxDateEdit).Date := myfile.ReadDateTime('TcxDateEdit', (m_c.Components[i] as TcxDateEdit).Name, Now);
        end
        else
        if (m_c.Components[i] is TRzGroupBox) then
        begin
            ConfigData2Component(m_c.Components[i] as TRzGroupBox, sPath);
        end
        else
        if (m_c.Components[i] is TGroupBox) then
        begin
            ConfigData2Component(m_c.Components[i] as TGroupBox, sPath);
        end
        else
        if (m_c.Components[i] is TPanel) then
        begin
            ConfigData2Component(m_c.Components[i] as TPanel, sPath);
        end;
    end;
    FreeAndNil(myfile);
end;
procedure ComponentData2Config(m_c: TComponent; sPath:string);
var
    i : Integer;
    myfile : TIniFile;
begin
    myfile := TIniFile.Create(sPath);

    for i := 0 to m_c.ComponentCount - 1 do
    begin
        if (m_c.Components[i] is TEdit) then
        begin
            myfile.WriteString('TEdit', (m_c.Components[i] as TEdit).Name, (m_c.Components[i] as TEdit).Text);
        end
        else
        if (m_c.Components[i] is TRadioButton) then
        begin
            myfile.WriteBool('TRadioButton', (m_c.Components[i] as TRadioButton).Name, (m_c.Components[i] as TRadioButton).Checked);
        end
        else
        if (m_c.Components[i] is TRzEdit) then
        begin
            myfile.WriteString('TRzEdit', (m_c.Components[i] as TRzEdit).Name, (m_c.Components[i] as TRzEdit).Text);
        end
        else
        if (m_c.Components[i] is TComboBox) then
        begin
            myfile.WriteInteger('TComboBox', (m_c.Components[i] as TComboBox).Name, (m_c.Components[i] as TComboBox).ItemIndex);
        end
        else
        if (m_c.Components[i] is TcxComboBox) then
        begin
            myfile.WriteInteger('TcxComboBox', (m_c.Components[i] as TcxComboBox).Name, (m_c.Components[i] as TcxComboBox).ItemIndex);
        end
        else
        if (m_c.Components[i] is TCheckBox) then
        begin
            myfile.WriteBool('TCheckBox', (m_c.Components[i] as TCheckBox).Name, (m_c.Components[i] as TCheckBox).Checked);
        end
        else
        if (m_c.Components[i] is TcxCheckBox) then
        begin
            myfile.WriteBool('TcxCheckBox', (m_c.Components[i] as TcxCheckBox).Name, (m_c.Components[i] as TcxCheckBox).Checked);
        end
        else
        if (m_c.Components[i] is TcxDateEdit) then
        begin
            myfile.WriteDateTime('TcxDateEdit', (m_c.Components[i] as TcxDateEdit).Name, (m_c.Components[i] as TcxDateEdit).Date);
        end
        else
        if (m_c.Components[i] is TRzGroupBox) then
        begin
            ComponentData2Config(m_c.Components[i] as TRzGroupBox, sPath);
        end
        else
        if (m_c.Components[i] is TGroupBox) then
        begin
            ComponentData2Config(m_c.Components[i] as TGroupBox, sPath);
        end
        else
        if (m_c.Components[i] is TPanel) then
        begin
            ComponentData2Config(m_c.Components[i] as TPanel, sPath);
        end;
    end;
    FreeAndNil(myfile);
end;

end.
