unit Unit12;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Objects, FMX.Layouts,
  FMX.TabControl, FMX.ListBox;

type
  TForm12 = class(TForm)
    GroupBox2: TGroupBox;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    GroupBox3: TGroupBox;
    TabItem3: TTabItem;
    edt_Msg: TEdit;
    ClearEditButton1: TClearEditButton;
    cbo_Tipo: TComboBox;
    Button1: TButton;
    cbo_Align: TComboBox;
    edt_Msg_Toast2: TEdit;
    ClearEditButton2: TClearEditButton;
    cbo_Align_Toast2: TComboBox;
    cbo_Tp_Toast2: TComboBox;
    Button2: TButton;
    GroupBox1: TGroupBox;
    edt_Msg_sweet: TEdit;
    ClearEditButton3: TClearEditButton;
    Cbo_Tp_Sweet: TComboBox;
    Button3: TButton;
    edt_CpfOrCnpj: TEdit;
    ClearEditButton4: TClearEditButton;
    Swit_CpfOrCnpj: TSwitch;
    Label1: TLabel;
    Label2: TLabel;
    Layout1: TLayout;
    edt_Celular: TEdit;
    ClearEditButton5: TClearEditButton;
    edt_Valor: TEdit;
    ClearEditButton6: TClearEditButton;
    edt_Data: TEdit;
    ClearEditButton7: TClearEditButton;
    edt_Peso: TEdit;
    ClearEditButton8: TClearEditButton;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edt_PesoTyping(Sender: TObject);
    procedure edt_DataTyping(Sender: TObject);
    procedure edt_ValorTyping(Sender: TObject);
    procedure edt_CelularTyping(Sender: TObject);
    procedure edt_CpfOrCnpjTyping(Sender: TObject);
    procedure Swit_CpfOrCnpjSwitch(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12 :TForm12;
  vAlign :TAlignLayout;
  vColor_Fundo, vColor_Font :Cardinal;

implementation

{$R *.fmx}

uses uFunc_FMX_Mobile;

procedure TForm12.Button1Click(Sender: TObject);
begin
  if cbo_Align.ItemIndex = 0 then
    vAlign         := TAlignLayout.Top
  Else
    vAlign         := TAlignLayout.Bottom;

  if cbo_Tipo.ItemIndex = 0 then
    begin
      vColor_Fundo := TColorFundo.PRIMARY;
      vColor_Font  := TColorFont.LIGHT;
    end
  Else if cbo_Tipo.ItemIndex = 1 then
    begin
      vColor_Fundo := TColorFundo.SUCCESS;
      vColor_Font  := TColorFont.LIGHT;
    end
  Else if cbo_Tipo.ItemIndex = 2 then
    begin
      vColor_Fundo := TColorFundo.ERROR;
      vColor_Font  := TColorFont.LIGHT;
    end
  Else if cbo_Tipo.ItemIndex = 3 then
    begin
      vColor_Fundo := TColorFundo.WARNING;
      vColor_Font  := TColorFont.DARK;
    end
  Else if cbo_Tipo.ItemIndex = 4 then
    begin
      vColor_Fundo := TColorFundo.INFORMATION;
      vColor_Font  := TColorFont.LIGHT;
    end
  Else if cbo_Tipo.ItemIndex = 5 then
    begin
      vColor_Fundo := TColorFundo.SECUNDARY;
      vColor_Font  := TColorFont.LIGHT;
    end
  Else if cbo_Tipo.ItemIndex = 6 then
    begin
      vColor_Fundo := TColorFundo.LIGHT;
      vColor_Font  := TColorFont.DARK;
    end
  Else if cbo_Tipo.ItemIndex = 7 then
    begin
      vColor_Fundo := TColorFundo.DARK;
      vColor_Font  := TColorFont.LIGHT;
    end;

  TFuncoes.Toast(Self, edt_Msg.Text, vAlign, vColor_Fundo, vColor_Font, 3);
end;

procedure TForm12.Button2Click(Sender: TObject);
begin
  if cbo_Align_Toast2.ItemIndex = 0 then
    vAlign := TAlignLayout.Top
  Else
    vAlign := TAlignLayout.Bottom;

  if cbo_Tp_Toast2.ItemIndex = 0 then
    TFuncoes.Toast2(Self, edt_Msg_Toast2.Text, vAlign, TTipoMSG.SUCCESS, 3)
  Else if cbo_Tp_Toast2.ItemIndex = 1 then
    TFuncoes.Toast2(Self, edt_Msg_Toast2.Text, vAlign, TTipoMSG.ERROR, 3)
  Else if cbo_Tp_Toast2.ItemIndex = 2 then
    TFuncoes.Toast2(Self, edt_Msg_Toast2.Text, vAlign, TTipoMSG.INFO, 3)
  Else if cbo_Tp_Toast2.ItemIndex = 3 then
    TFuncoes.Toast2(Self, edt_Msg_Toast2.Text, vAlign, TTipoMSG.WARNING, 3);
end;

procedure TForm12.Button3Click(Sender: TObject);
begin
  if Cbo_Tp_Sweet.ItemIndex = 0 then
    TFuncoes.SweetAlert(Self, edt_Msg_sweet.Text, TTipoMSG.SUCCESS, 'ok', '')
  Else if Cbo_Tp_Sweet.ItemIndex = 1 then
    TFuncoes.SweetAlert(Self, edt_Msg_sweet.Text, TTipoMSG.ERROR, 'ok', '')
  Else if Cbo_Tp_Sweet.ItemIndex = 2 then
    TFuncoes.SweetAlert(Self, edt_Msg_sweet.Text, TTipoMSG.WARNING, 'ok', '')
  Else if Cbo_Tp_Sweet.ItemIndex = 3 then
    TFuncoes.SweetAlert(Self, edt_Msg_sweet.Text, TTipoMSG.INFO, 'ok', '')
  Else if Cbo_Tp_Sweet.ItemIndex = 4 then
    TFuncoes.SweetAlert(Self, edt_Msg_sweet.Text, TTipoMSG.QUESTION, 'Sim', 'Não', TColorFundo.PRIMARY, TColorFundo.ERROR);
end;

procedure TForm12.edt_CelularTyping(Sender: TObject);
begin
  Formatar(edt_Celular, TFormato.Celular);
end;

procedure TForm12.edt_CpfOrCnpjTyping(Sender: TObject);
begin
  if Swit_CpfOrCnpj.IsChecked = True then
    Formatar(edt_CpfOrCnpj, TFormato.CPF)
  Else
    Formatar(edt_CpfOrCnpj, TFormato.CNPJ);
end;

procedure TForm12.edt_DataTyping(Sender: TObject);
begin
  Formatar(edt_Data, TFormato.Dt);
end;

procedure TForm12.edt_PesoTyping(Sender: TObject);
begin
  Formatar(edt_Peso, TFormato.Peso);
end;

procedure TForm12.edt_ValorTyping(Sender: TObject);
begin
  Formatar(edt_Valor, TFormato.Valor);
end;

procedure TForm12.Swit_CpfOrCnpjSwitch(Sender: TObject);
begin
  edt_CpfOrCnpj.Text := '';

  if Swit_CpfOrCnpj.IsChecked = True then
    edt_CpfOrCnpj.TextPrompt := 'CPF'
  Else
    edt_CpfOrCnpj.TextPrompt := 'CNPJ';
end;

end.
