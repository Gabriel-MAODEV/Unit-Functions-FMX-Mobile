{################################################################################

    Unit Funções Gabriel
    Criação: (Gabriel Macedo Ferreira - macedogabriel753@gmail.com)
    Versão: 1

#################################################################################}


unit uFunc_FMX_Mobile;

interface

uses System.SysUtils, FMX.Edit, Classes, System.MaskUtils, System.UITypes, FMX.Types, FMX.Controls, FMX.StdCtrls,
     FMX.Objects, FMX.Effects, FMX.Layouts, FMX.Forms, FMX.Graphics, FMX.Ani, FMX.VirtualKeyboard, FMX.Platform,
     IdIOHandler, IdSMTP, IdMessage, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdHTTP, System.Json,
     System.Threading, System.Types, IdBaseComponent, IdComponent,
     IdTCPConnection, IdTCPClient;

type
  //Evento no OnTyping    Formatar(edit1, TFormato.TelefoneFixo);
  TFormato  = (CNPJ, CPF, InscricaoEstadual, CNPJorCPF, TelefoneFixo, Celular, Personalizado,
               Valor, Money, CEP, Dt, Peso);

  TColorFundo = record
    Const
      PRIMARY     : Cardinal = $FF007BFF;
      SUCCESS     : Cardinal = $FF28A745;
      ERROR       : Cardinal = $FFDC3545;
      WARNING     : Cardinal = $FFFFC107;
      INFORMATION : Cardinal = $FF17A2B8;
      SECUNDARY   : Cardinal = $FF6C757D;
      LIGHT       : Cardinal = $FFF8F9FA;
      DARK        : Cardinal = $FF343A40;
  end;

  TColorFont = record
    Const
      PRIMARY     : Cardinal = $FF007BFF;
      SUCCESS     : Cardinal = $FF28A745;
      ERROR       : Cardinal = $FFDC3545;
      WARNING     : Cardinal = $FFFFC107;
      INFORMATION : Cardinal = $FF17A2B8;
      SECUNDARY   : Cardinal = $FF6C757D;
      LIGHT       : Cardinal = $FFF8F9FA;
      DARK        : Cardinal = $FF343A40;
  end;

  TTipoMSG = record
    Const
      SUCCESS     : integer = 1;
      ERROR       : integer = 2;
      INFO        : integer = 3;
      WARNING     : integer = 4;
      QUESTION    : integer = 5;
  end;

  TLoading = class
    private
          class var Layout : TLayout;
          class var Fundo : TRectangle;
          class var Arco : TArc;
          class var Mensagem : TLabel;
          class var Animacao : TFloatAnimation;
    public
          class procedure Show(const Frm : Tform; const msg : string);
          class procedure ChangeLoad(const msg : string);
          class procedure Hide;
  end;

  TFuncoes = class

    private
      class var ArcQuest      : TArc;
      class var TxtBtn0       : TText;
      class var TxtBtn1       : TText;
      class var RecBtn0       : TRectangle;
      class var RecBtn1       : TRectangle;
      class var LayBottom     : TLayout;
      class var LayCaixa      : TLayout;
      class var Layout        : TLayout;
      class var LayCircle     : TLayout;
      class var Lay1linha     : TLayout;
      class var Txt           : TText;
      class var Lay2linha     : TLayout;
      class var Fundo         : TRectangle;
      class var Rec1Linha     : TRectangle;
      class var Rec2Linha     : TRectangle;
      class var RecFundo      : TRectangle;
      class var RecAviso      : TRectangle;
      class var Arco          : TArc;
      class var Mensagem      : TLabel;
      class var Animacao      : TFloatAnimation;
      class var AniCircle     : TFloatAnimation;
      class var Ani1Linha     : TFloatAnimation;
      class var Ani2Linha     : TFloatAnimation;
      class var AniArcQuest   : TFloatAnimation;
      class var AniFim        : TFloatAnimation;
      class var ArcCircle     : TArc;
      class var LayoutToast   : TLayout;
      class var FundoToast    : TRectangle;
      class var AnimacaoToast : TFloatAnimation;
      class var MensagemToast : TLabel;
      class var Lay_Geral     : TLayout;
      class var Rec_Fundo     : TRectangle;
      class var Rec_Progress_1: TRectangle;
      class var Rec_Progress_2: TRectangle;
      class var Ani_Progress_2: TFloatAnimation;
      class var Ani_Fundo_2   : TFloatAnimation;

      class procedure OnClick_Btn1(Sender: TObject);
      class procedure OnClick_Btn0_2(Sender: TObject);
      class procedure onFinish_ArcQuest(Sender: TObject);
      class procedure onFinish_Rec1Linha(Sender: TObject);
      class procedure onFinish_AniFim(Sender: TObject);
      class procedure onFinish_ArcCircle(Sender: TObject);
      class procedure onFinish_ArcCircle2(Sender: TObject);
      class procedure DeleteToast(Sender: TObject);
      class procedure OnClick_Btn0(Sender: TObject);
      class procedure OnFinishAniFundo(Sender: TObject);
      class procedure OnFinishAniProgress_2(Sender: TObject);
      class procedure OnFinishAniFundo2(Sender: TObject);
    public
      class procedure Teclado_Show(AComponent :TControl);
      class procedure Teclado_Hide;
      class procedure Envia_Email(pAssunto, pDestinatario, pTitMsg, pMsg, pNome, pHash,
                                  pURL_Logotipo, pAssinatura, pURL_Instagram, pURL_Twitter, pURL_Facebook,
                                  pHost, pUserName, pPassWord : String);
      class procedure Toast(Frm : Tform; msg: string;
                            alinhamento: TAlignLayout = TAlignLayout.Bottom;
                            cor_fundo: Cardinal = $FF007BFF;
                            cor_fonte: Cardinal = $FF007BFF;
                            duracao: integer = 4);
      class procedure Toast2(Frm : Tform; msg: string;
                             alinhamento: TAlignLayout = TAlignLayout.Bottom;
                             Tipo :integer = 1;
                             duracao :integer = 4);
      class Procedure SweetAlert(Form :TForm; msg :string; Tipo :integer;
                                 btn0 :string = 'Ok';
                                 btn1 :string = '';
                                 cor_btn0 :Cardinal = $FF007BFF;
                                 cor_btn1 :Cardinal = $FFF8F9FA;
                                 FontCor_btn0 :Cardinal = $FFF8F9FA;
                                 FontCor_btn1 :Cardinal = $FFF8F9FA);
      class Function Teste_Conexao_Server(Host, Porta :string) :string;

      Const vIcon_Success : String = 'M8,1 C11.8999996185303,1 15,4.09999990463257 15,8 C15,11.8999996185303 11.8999996185303,15 8,15 C4.10000038146973,15 1,11.8999996185303 1,8 C1,4.10000038146973 4.09999990463257,1 8,1 Z ' +
                                     'M8,0 C3.59999990463257,0 0,3.59999990463257 0,8 C0,12.3999996185303 3.59999990463257,16 8,16 C12.3999996185303,16 16,12.3999996185303 16,8 C16,3.60000038146973 12.3999996185303,0 8,0 L8,0 Z ' +
                                     'M7.09999990463257,11.6999998092651 L2.90000009536743,7.59999990463257 L4.30000019073486,6.19999980926514 L7.10000038146973,8.89999961853027 L12,3.99999952316284 L13.3999996185303,5.39999961853027 Z';
      Const vIcon_Error   : String = 'M256,0C114.508,0,0,114.497,0,256c0,141.493,114.497,256,256,256c141.492,0,256-114.497,256-256 ' +
                                     'C512,114.507,397.503,0,256,0z M256,472c-119.384,0-216-96.607-216-216c0-119.385,96.607-216,216-216 ' +
                                     'c119.384,0,216,96.607,216,216C472,375.385,375.393,472,256,472z ' +
                                     'M343.586,315.302L284.284,256l59.302-59.302c7.81-7.81,7.811-20.473,0.001-28.284c-7.812-7.811-20.475-7.81-28.284,0 ' +
                                     'L256,227.716l-59.303-59.302c-7.809-7.811-20.474-7.811-28.284,0c-7.81,7.811-7.81,20.474,0.001,28.284L227.716,256 ' +
                                     'l-59.302,59.302c-7.811,7.811-7.812,20.474-0.001,28.284c7.813,7.812,20.476,7.809,28.284,0L256,284.284l59.303,59.302 ' +
                                     'c7.808,7.81,20.473,7.811,28.284,0C351.398,335.775,351.397,323.112,343.586,315.302z';
      Const vIcon_Info    : String = 'M165,0C74.019,0,0,74.02,0,165.001C0,255.982,74.019,330,165,330s165-74.018,165-164.999C330,74.02,255.981,0,165,0z ' +
                                     'M165,300c-74.44,0-135-60.56-135-134.999C30,90.562,90.56,30,165,30s135,60.562,135,135.001C300,239.44,239.439,300,165,300z ' +
                                     'M164.998,70c-11.026,0-19.996,8.976-19.996,20.009c0,11.023,8.97,19.991,19.996,19.991 c11.026,0,19.996-8.968,19.996-19.991C184.994,78.976,176.024,70,164.998,70z ' +
              	                     'M165,140c-8.284,0-15,6.716-15,15v90c0,8.284,6.716,15,15,15c8.284,0,15-6.716,15-15v-90C180,146.716,173.284,140,165,140z';
      Const vIcon_Warning : String = 'M243.225,333.382c-13.6,0-25,11.4-25,25s11.4,25,25,25c13.1,0,25-11.4,24.4-24.4 C268.225,344.682,256.925,333.382,243.225,333.382z ' +
                                     'M474.625,421.982c15.7-27.1,15.8-59.4,0.2-86.4l-156.6-271.2c-15.5-27.3-43.5-43.5-74.9-43.5s-59.4,16.3-74.9,43.4 l-156.8,271.5c-15.6,27.3-15.5,59.8,0.3,86.9c15.6,26.8,43.5,42.9,74.7,42.9h312.8 ' +
                                     'C430.725,465.582,458.825,449.282,474.625,421.982z M440.625,402.382c-8.7,15-24.1,23.9-41.3,23.9h-312.8 c-17,0-32.3-8.7-40.8-23.4c-8.6-14.9-8.7-32.7-0.1-47.7l156.8-271.4c8.5-14.9,23.7-23.7,40.9-23.7c17.1,0,32.4,8.9,40.9,23.8 ' +
                                     'l156.7,271.4C449.325,369.882,449.225,387.482,440.625,402.382z ' +
                                     'M237.025,157.882c-11.9,3.4-19.3,14.2-19.3,27.3c0.6,7.9,1.1,15.9,1.7,23.8c1.7,30.1,3.4,59.6,5.1,89.7 ' +
                                     'c0.6,10.2,8.5,17.6,18.7,17.6c10.2,0,18.2-7.9,18.7-18.2c0-6.2,0-11.9,0.6-18.2c1.1-19.3,2.3-38.6,3.4-57.9 ' +
                                     'c0.6-12.5,1.7-25,2.3-37.5c0-4.5-0.6-8.5-2.3-12.5C260.825,160.782,248.925,155.082,237.025,157.882z';

      Const vEmail_Padrao : String =
      ' <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//PT> ' +
      ' <html xmlns="https://www.mailee.me/pt"> ' +
      ' <head> ' +
      ' <title>@titulo</title> ' +
      ' <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> ' +
      ' <meta name="viewport" content="width=device-width, initial-scale=1.0" /> ' +
      '         <style> ' +
      '          @import url(https://fonts.googleapis.com/css?family=Roboto:300); /*Calling our web font*/ ' +
      '         /* Some resets and issue fixes */ ' +
      '         #outlook a { padding:0; } ' +
      '         body{ width:100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; } ' +
      '         .ReadMsgBody { width: 100%; } ' +
      '         .ExternalClass {width:100%;} ' +
      '         .backgroundTable {margin:0 auto; padding:0; width:100%;!important;} ' +
      '         table td {border-collapse: collapse;} ' +
      '         .ExternalClass * {line-height: 115%;} ' +
      '         /* End reset */ ' +
      '         /* These are our tablet/medium screen media queries */ ' +
      '         @media screen and (max-width: 630px){ ' +
      '             /* Display block allows us to stack elements */ ' +
      '              *[class="mobile-column"] {display: block;} ' +
      '             /* Some more stacking elements */ ' +
      '             *[class="mob-column"] {float: none !important;width: 100% !important;} ' +
      '             /* Hide stuff */ ' +
      '             *[class="hide"] {display:none !important;} ' +
      '              /* This sets elements to 100% width and fixes the height issues too, a god send */ ' +
      '             *[class="100p"] {width:100% !important; height:auto !important;} ' +
      '             /* For the 2x2 stack */ ' +
      '             *[class="condensed"] {padding-bottom:40px !important; display: block;} ' +
      '             /* Centers content on mobile */ ' +
      '             *[class="center"] {text-align:center !important; width:100% !important; height:auto !important;} ' +
      '             /* 100percent width section with 20px padding */ ' +
      '             *[class="100pad"] {width:100% !important; padding:20px;} ' +
      '             /* 100percent width section with 20px padding left & right */ ' +
      '             *[class="100padleftright"] {width:100% !important; padding:0 20px 0 20px;} ' +
      '              /* 100percent width section with 20px padding top & bottom */ ' +
      '             *[class="100padtopbottom"] {width:100% !important; padding:20px 0px 20px 0px;} ' +
      '         } ' +
      '     </style> ' +
      ' <style type="text/css"> ' +
      ' </style> ' +
      ' <style type="text/css"> ' +
      ' </style> ' +
      ' </head> ' +
      ' <div style="background:#ffffff;"> ' +
      ' </div><body style="padding:0; margin:0" bgcolor="#ffffff"> ' +
      ' <table border="0" cellpadding="0" cellspacing="0" style="margin: 0; padding: 0" width="100%"> ' +
      '     <tr> ' +
      '         <td align="center" valign="top"> ' +
      '             <table width="640" border="0" cellspacing="0" cellpadding="0" class="hide"> ' +
      '                 <tr> ' +
      '                     <td height="20"></td> ' +
      '                 </tr> ' +
      '             </table> ' +
      '             <table width="640" cellspacing="0" cellpadding="0" bgcolor="#" class="100p"> ' +
      '                 <tr> ' +
      '                     <td bgcolor="#ffffff" width="640" valign="top" class="100p"> ' +
      '                                 <div> ' +
      '                                     <table width="640" border="0" cellspacing="0" cellpadding="20" class="100p"> ' +
      '                                         <tr> ' +
      '                                             <td valign="top"> ' +
      '                                                 <table border="0" cellspacing="0" cellpadding="0" width="600" class="100p"> ' +
      '                                                     <tr> ' +
      ' <td align="left" width="50%" class="100p"><img src="@URL_Logotipo" width="200" height="96" /> ' +
      '                                                     </td></tr> ' +
      '                                                 </table> ' +
      '                                                 <table border="0" cellspacing="0" cellpadding="0" width="600" class="100p"> ' +
      '                                                     <tr> ' +
      '                                                         <td height="35"></td> ' +
      '                                                     </tr> ' +
      '                                                     <tr> ' +
      '                                                         <td align="center" style="color:#000000; font-size:24px;"> ' +
      '                                                             <font face="''Roboto'', Arial, sans-serif"> ' +
      '                                                                 <span style="font-size:44px;">@tit_msg</span><br /> ' +
      '                                                                 <br /> ' +
      '                                                                 <span style="font-size:24px;">Ola @nome, <br /> ' +
      '                                                                 @corpo_email</span> ' +
      '                                                                 <br /><br /> ' +
      '                                                         </td> ' +
      '                                                     </tr> ' +
      '                                                     <tr> ' +
      '                                                         <td height="35"></td> ' +
      '                                                     </tr> ' +
      '                                                 </table> ' +
      '                                             </td> ' +
      '                                         </tr> ' +
      '                                     </table> ' +
      '                                 </div> ' +
      '                     </td> ' +
      '                 </tr> ' +
      '             </table> ' +
      '             <table width="640" border="0" cellspacing="0" cellpadding="20" bgcolor="#52658d" class="100p"> ' +
      '                 <tr> ' +
      '                     <td align="center" style="font-size:24px; color:#FFFFFF;"><font face="''Roboto'', Arial, sans-serif">@Assinatura</font></td> ' +
      '                 </tr> ' +
      '             </table> ' +
      '             <table width="640" border="0" cellspacing="0" cellpadding="20" bgcolor="#ffffff" class="100p"> ' +
      '                 <tr> ' +
      '                     <td align="right" width="50%" style="font-size:14px; color:#848484;"> ' +
      ' 						<div align="center"> ' +
      ' 							<img src="@URL_Instagram" width="30" height="30" /> ' +
      ' 							<img src="@URL_Twitter" width="30" height="30" /> ' +
      ' 							<img src="@URL_Facebook" width="30" height="30" /> ' +
      ' 						</div> ' +
      ' 					</td> ' +
      ' 				</tr> ' +
      '             </table> ' +
      '             <table width="640" class="100p" border="0" cellspacing="0" cellpadding="0"> ' +
      '                 <tr> ' +
      '                     <td height="50"> ' +
      '                     </td> ' +
      '                 </tr> ' +
      '             </table> ' +
      '         </td> ' +
      '     </tr> ' +
      ' </table> ' +
      ' </body> ' +
      ' </html>';

    end;


procedure Formatar(Obj: TObject; Formato : TFormato; Extra : string = '');

var
  vSweetbtn :integer = 0;

implementation

function SomenteNumero(str : string) : string;
var
  x : integer;
begin
  Result := '';

  for x := 0 to Length(str) - 1 do
    begin
      if (str.Chars[x] In ['0'..'9']) then
        Result := Result + str.Chars[x];
    end;
end;

function FormataValor(str : string) : string;
begin
  if Str = '' then
    Str := '0';

  try
    Result := FormatFloat('#,##0.00', strtofloat(str) / 100);
  except
    Result := FormatFloat('#,##0.00', 0);
  end;
end;

function FormataPeso(str : string) : string;
begin
  if Str.IsEmpty then
    Str := '0';

  try
    Result := FormatFloat('#,##0.000', strtofloat(str) / 1000);
  except
    Result := FormatFloat('#,##0.000', 0);
  end;
end;

function Mask(Mascara, Str : string) : string;
var
  x, p : integer;
begin
  p      := 0;
  Result := '';

  if Str.IsEmpty then
    exit;

  for x := 0 to Length(Mascara) - 1 do
    begin
      if Mascara.Chars[x] = '#' then
        begin
          Result := Result + Str.Chars[p];
          inc(p);
        end
      Else
        Result := Result + Mascara.Chars[x];

      if p = Length(Str) then
        break;
    end;
end;

function FormataIE(Num, UF: string): string;
var
  Mascara : string;
begin
  Mascara := '';

  IF UF = 'AC' Then Mascara := '##.###.###/###-##';
  IF UF = 'AL' Then Mascara := '#########';
  IF UF = 'AP' Then Mascara := '#########';
  IF UF = 'AM' Then Mascara := '##.###.###-#';
  IF UF = 'BA' Then Mascara := '######-##';
  IF UF = 'CE' Then Mascara := '########-#';
  IF UF = 'DF' Then Mascara := '###########-##';
  IF UF = 'ES' Then Mascara := '#########';
  IF UF = 'GO' Then Mascara := '##.###.###-#';
  IF UF = 'MA' Then Mascara := '#########';
  IF UF = 'MT' Then Mascara := '##########-#';
  IF UF = 'MS' Then Mascara := '#########';
  IF UF = 'MG' Then Mascara := '###.###.###/####';
  IF UF = 'PA' Then Mascara := '##-######-#';
  IF UF = 'PB' Then Mascara := '########-#';
  IF UF = 'PR' Then Mascara := '########-##';
  IF UF = 'PE' Then Mascara := '##.#.###.#######-#';
  IF UF = 'PI' Then Mascara := '#########';
  IF UF = 'RJ' Then Mascara := '##.###.##-#';
  IF UF = 'RN' Then Mascara := '##.###.###-#';
  IF UF = 'RS' Then Mascara := '###/#######';
  IF UF = 'RO' Then Mascara := '###.#####-#';
  IF UF = 'RR' Then Mascara := '########-#';
  IF UF = 'SC' Then Mascara := '###.###.###';
  IF UF = 'SP' Then Mascara := '###.###.###.###';
  IF UF = 'SE' Then Mascara := '#########-#';
  IF UF = 'TO' Then Mascara := '###########';

  Result := Mask(mascara, Num);
end;

function FormataData(str : string): string;
begin
  str := Copy(str, 1, 8);

  if Length(str) < 8 then
    Result := Mask('##/##/####', str)
  Else
    begin
      try
        str := Mask('##/##/####', str);
        strtodate(str);
        Result := str;
      except
        Result := '';
      end;
    end;
end;

procedure Formatar(Obj: TObject; Formato : TFormato; Extra : string = '');
var
  texto : string;
begin
  TThread.Queue(Nil, procedure
  begin
    if obj is TEdit then
      texto := TEdit(obj).Text;

    // Telefone Fixo...
    if formato = TelefoneFixo then
      texto := Mask('(##) ####-####', SomenteNumero(texto));

    // Celular...
    if formato = Celular then
      texto := Mask('(##) #####-####', SomenteNumero(texto));

    // CNPJ...
    if formato = CNPJ then
      texto := Mask('##.###.###/####-##', SomenteNumero(texto));

    // CPF...
    if formato = CPF then
      texto := Mask('###.###.###-##', SomenteNumero(texto));

    // Inscricao Estadual (IE)...
    if formato = InscricaoEstadual then
      texto := FormataIE(SomenteNumero(texto), Extra);

    // CNPJ ou CPF...
    if formato = CNPJorCPF then
      begin
        if Length(SomenteNumero(texto)) <= 11 then
          texto := Mask('###.###.###-##', SomenteNumero(texto))
        Else
          texto := Mask('##.###.###/####-##', SomenteNumero(texto));
      end;

    // Personalizado...
    if formato = Personalizado then
      texto := Mask(Extra, SomenteNumero(texto));

    // Valor...
    if Formato = Valor then
      texto := FormataValor(SomenteNumero(texto));

    // Money (com simbolo da moeda)...
    if Formato = Money then
      begin
        if Extra = '' then
          Extra := 'R$';

        texto := Extra + ' ' + FormataValor(SomenteNumero(texto));
      end;

    // CEP...
    if Formato = CEP then
      texto := Mask('##.###-###', SomenteNumero(texto));

    // Data...
    if formato = Dt then
      texto := FormataData(SomenteNumero(texto));

    // Peso...
    if Formato = Peso then
      texto := FormataPeso(SomenteNumero(texto));

    if obj is TEdit then
      begin
        TEdit(obj).Text := texto;
        TEdit(obj).CaretPosition := TEdit(obj).Text.Length;
      end;
  end);
end;

class procedure TLoading.Hide;
begin
  if Assigned(Layout) then
    begin
      try
        if Assigned(Mensagem) then
          Mensagem.DisposeOf;

        if Assigned(Animacao) then
          Animacao.DisposeOf;

        if Assigned(Arco) then
          Arco.DisposeOf;

        if Assigned(Fundo) then
          Fundo.DisposeOf;

        if Assigned(Layout) then
          Layout.DisposeOf;

      except
      end;
    end;

  Mensagem := nil;
  Animacao := nil;
  Arco := nil;
  Layout := nil;
  Fundo := nil;
end;

class procedure TLoading.Show(const Frm : Tform; const msg: string);
var
  FService: IFMXVirtualKeyboardService;
begin
  // Panel de fundo opaco...
  Fundo := TRectangle.Create(Frm);
  Fundo.Opacity := 0;
  Fundo.Parent := Frm;
  Fundo.Visible := true;
  Fundo.Align := TAlignLayout.Contents;
  Fundo.Fill.Color := TAlphaColorRec.Black;
  Fundo.Fill.Kind := TBrushKind.Solid;
  Fundo.Stroke.Kind := TBrushKind.None;
  Fundo.Visible := true;


  // Layout contendo o texto e o arco...
  Layout := TLayout.Create(Frm);
  Layout.Opacity := 0;
  Layout.Parent := Frm;
  Layout.Visible := true;
  Layout.Align := TAlignLayout.Contents;
  Layout.Width := 250;
  Layout.Height := 78;
  Layout.Visible := true;

  // Arco da animacao...
  Arco := TArc.Create(Frm);
  Arco.Visible := true;
  Arco.Parent := Layout;
  Arco.Align := TAlignLayout.Center;
  Arco.Margins.Bottom := 55;
  Arco.Width := 25;
  Arco.Height := 25;
  Arco.EndAngle := 280;
  Arco.Stroke.Color := $FFFEFFFF;
  Arco.Stroke.Thickness := 2;
  Arco.Position.X := trunc((Layout.Width - Arco.Width) / 2);
  Arco.Position.Y := 0;

  // Animacao...
  Animacao := TFloatAnimation.Create(Frm);
  Animacao.Parent := Arco;
  Animacao.StartValue := 0;
  Animacao.StopValue := 360;
  Animacao.Duration := 0.8;
  Animacao.Loop := true;
  Animacao.PropertyName := 'RotationAngle';
  Animacao.AnimationType := TAnimationType.InOut;
  Animacao.Interpolation := TInterpolationType.Linear;
  Animacao.Start;

  // Label do texto...
  Mensagem := TLabel.Create(Frm);
  Mensagem.Parent := Layout;
  Mensagem.Align := TAlignLayout.Center;
  Mensagem.Margins.Top := 60;
  Mensagem.Font.Size := 13;
  Mensagem.Height := 70;
  Mensagem.Width := Frm.Width - 100;
  Mensagem.FontColor := $FFFEFFFF;
  Mensagem.TextSettings.HorzAlign := TTextAlign.Center;
  Mensagem.TextSettings.VertAlign := TTextAlign.Leading;
  Mensagem.StyledSettings := [TStyledSetting.Family, TStyledSetting.Style];
  Mensagem.Text := msg;
  Mensagem.VertTextAlign := TTextAlign.Leading;
  Mensagem.Trimming := TTextTrimming.None;
  Mensagem.TabStop := false;
  Mensagem.SetFocus;

  // Exibe os controles...
  Fundo.AnimateFloat('Opacity', 0.7);
  Layout.AnimateFloat('Opacity', 1);
  Layout.BringToFront;

  // Esconde o teclado virtual...
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
                                                    IInterface(FService));
  if (FService <> nil) then
    FService.HideVirtualKeyboard;

  FService := nil;
end;

class procedure TFuncoes.Teclado_Show(AComponent :TControl);
var
  FService: IFMXVirtualKeyboardService;
begin
  // Esconde o teclado virtual...
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
                                                    IInterface(FService));
  if FService <> nil then
    begin
      FService.ShowVirtualKeyboard(AComponent);

      if (AComponent <> nil) and (AComponent.CanFocus) then
        AComponent.SetFocus;
    end;

  FService := nil;
end;

class procedure TFuncoes.Teclado_Hide;
var
  FService: IFMXVirtualKeyboardService;
begin
  // Esconde o teclado virtual...
  TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
                                                    IInterface(FService));
  if (FService <> nil) then
    FService.HideVirtualKeyboard;

  FService := nil;
end;

class procedure TFuncoes.Envia_Email(pAssunto, pDestinatario, pTitMsg, pMsg, pNome, pHash,
                                     pURL_Logotipo, pAssinatura, pURL_Instagram, pURL_Twitter, pURL_Facebook,
                                     pHost, pUserName, pPassWord : String);
var
   vTask : ITask;
begin
  vTask := TTask.Create(procedure
  begin
    TThread.Synchronize(nil, procedure
     var
       vIdSSLIOHandlerSocketOpenSSL : TIdSSLIOHandlerSocketOpenSSL;
       vIdSMTP : TIdSMTP;
       vIdMessage : TIdMessage;
       vEmail_Custom : String;
     begin
       vIdSSLIOHandlerSocketOpenSSL := TIdSSLIOHandlerSocketOpenSSL.Create();
       vIdSMTP                      := TIdSMTP.Create();
       vIdMessage                   := TIdMessage.Create();

        try
          vIdSSLIOHandlerSocketOpenSSL.Host := pHost;
          vIdSSLIOHandlerSocketOpenSSL.Port := 587;
          vIdSSLIOHandlerSocketOpenSSL.SSLOptions.Mode := TIdSSLMode.sslmClient;

          vIdSMTP.IOHandler := vIdSSLIOHandlerSocketOpenSSL;
          vIdSMTP.Host      := pHost;
          vIdSMTP.Username  := pUserName;
          vIdSMTP.Password  := pPassWord;

          vIdMessage.ContentType := 'text/html';
          vIdMessage.CharSet     := 'UTF-8';

          vEmail_Custom := vEmail_Padrao;
          vEmail_Custom := StringReplace(vEmail_Custom, '@titulo', pAssunto, [rfReplaceAll]);
          vEmail_Custom := StringReplace(vEmail_Custom, '@tit_msg', pTitMsg, [rfReplaceAll]);
          vEmail_Custom := StringReplace(vEmail_Custom, '@nome', pNome, [rfReplaceAll]);
          vEmail_Custom := StringReplace(vEmail_Custom, '@URL_Logotipo', pURL_Logotipo, [rfReplaceAll]);
          vEmail_Custom := StringReplace(vEmail_Custom, '@Assinatura', pAssinatura, [rfReplaceAll]);
          vEmail_Custom := StringReplace(vEmail_Custom, '@URL_Instagram', pURL_Instagram, [rfReplaceAll]);
          vEmail_Custom := StringReplace(vEmail_Custom, '@URL_Twitter', pURL_Twitter, [rfReplaceAll]);
          vEmail_Custom := StringReplace(vEmail_Custom, '@URL_Facebook', pURL_Facebook, [rfReplaceAll]);

          if pHash <> '' then
            vEmail_Custom := StringReplace(vEmail_Custom, '@corpo_email', pMsg +
                                           '<br /><br /> <span style="font-size:44px;">' + pHash + '.</span><br />', [rfReplaceAll])
          Else
            vEmail_Custom := StringReplace(vEmail_Custom, '@corpo_email', pMsg, [rfReplaceAll]);

          vIdMessage.From.Address           := pUserName;
          vIdMessage.From.Name              := pTitMsg;
          vIdMessage.ReplyTo.EMailAddresses := vIdMessage.From.Address;
          vIdMessage.Recipients.Add.Text    := pDestinatario;
          vIdMessage.Subject                := pAssunto;
          vIdMessage.Encoding               := meMIME;
          vIdMessage.Body.Clear;
          vIdMessage.Body.Add(vEmail_Custom);

          try
            vIdSMTP.Connect;
            vIdSMTP.Authenticate;
          except on E:Exception do
            Exit;
          end;

          try
            vIdSMTP.Send(vIdMessage);
          except On E:Exception do
          end;

          vIdSMTP.Disconnect;
        finally
          vIdSSLIOHandlerSocketOpenSSL.Free;
          vIdSMTP.Free;
          vIdMessage.Free;
        end;
     end);
  end);

  vTask.Start;
end;

class procedure TLoading.ChangeLoad(const msg : string);
begin
  if Mensagem <> nil then
    Mensagem.Text := msg;
end;

class procedure TFuncoes.Toast(Frm : Tform; msg: string;
                               alinhamento: TAlignLayout = TAlignLayout.Bottom;
                               cor_fundo: Cardinal = $FF007BFF;
                               cor_fonte: Cardinal = $FF007BFF;
                               duracao: integer = 4);
begin
  // Layout invisivel de fundo (nao clicavel)...
  LayoutToast := TLayout.Create(Frm);
  LayoutToast.Opacity := 1;
  LayoutToast.Parent := Frm;
  LayoutToast.Visible := true;
  LayoutToast.Align := TAlignLayout.Contents;
  LayoutToast.Visible := true;
  LayoutToast.HitTest := false;
  LayoutToast.BringToFront;


  // Fundo da mensagem...
  FundoToast := TRectangle.Create(Frm);
  FundoToast.Opacity := 0;
  FundoToast.Parent := LayoutToast;
  FundoToast.Height := 40;
  FundoToast.Align := alinhamento;
  FundoToast.Margins.Left := 20;
  FundoToast.Margins.Right := 20;
  FundoToast.Margins.Bottom := 20;
  FundoToast.Margins.Top := 20;
  FundoToast.Fill.Color := cor_fundo;
  FundoToast.Fill.Kind := TBrushKind.Solid;
  FundoToast.Stroke.Kind := TBrushKind.None;
  FundoToast.XRadius := 12;
  FundoToast.YRadius := 12;
  FundoToast.Visible := true;

  // Animacao...
  AnimacaoToast := TFloatAnimation.Create(Frm);
  AnimacaoToast.Parent        := FundoToast;
  AnimacaoToast.StartValue    := 0;
  AnimacaoToast.StopValue     := 3;
  AnimacaoToast.Duration      := duracao / 2;
  AnimacaoToast.Delay         := 0;
  AnimacaoToast.AutoReverse   := true;
  AnimacaoToast.PropertyName  := 'Opacity';
  AnimacaoToast.AnimationType := TAnimationType.&In;
  AnimacaoToast.Interpolation := TInterpolationType.Linear;
  AnimacaoToast.OnFinish      := TFuncoes.DeleteToast;

  // Label do texto...
  MensagemToast := TLabel.Create(Frm);
  MensagemToast.Parent := FundoToast;
  MensagemToast.Align := TAlignLayout.Client;
  MensagemToast.Font.Size := 13;
  MensagemToast.FontColor := cor_fonte;
  MensagemToast.TextSettings.HorzAlign := TTextAlign.Center;
  MensagemToast.TextSettings.VertAlign := TTextAlign.Center;
  MensagemToast.StyledSettings := [TStyledSetting.Family, TStyledSetting.Style];
  MensagemToast.Text := msg;
  MensagemToast.VertTextAlign := TTextAlign.Center;
  MensagemToast.Trimming := TTextTrimming.None;
  MensagemToast.TabStop := false;
  MensagemToast.Margins.Left   := 5;
  MensagemToast.Margins.Right  := 5;
  MensagemToast.Margins.Top    := 3;
  MensagemToast.Margins.Bottom := 3;

  // Exibe os controles...
  AnimacaoToast.Enabled := true;
end;

class procedure TFuncoes.DeleteToast(Sender: TObject);
begin
  if Assigned(FundoToast) then
    begin
      FundoToast.Visible := false;

      try
        if Assigned(MensagemToast) then
          MensagemToast.DisposeOf;

        if Assigned(AnimacaoToast) then
          AnimacaoToast.DisposeOf;

        if Assigned(FundoToast) then
          FundoToast.DisposeOf;

        if Assigned(LayoutToast) then
          LayoutToast.DisposeOf;
      except
      end;
    end;

  MensagemToast := nil;
  AnimacaoToast := nil;
  FundoToast    := nil;
  LayoutToast   := nil;
end;

class Procedure TFuncoes.SweetAlert(Form :TForm; msg :string; Tipo :integer;
                                    btn0 :string = 'Ok';
                                    btn1 :string = '';
                                    cor_btn0 :Cardinal = $FF007BFF;
                                    cor_btn1 :Cardinal = $FFF8F9FA;
                                    FontCor_btn0 :Cardinal = $FFF8F9FA;
                                    FontCor_btn1 :Cardinal = $FFF8F9FA);
begin
  //Fundo
  RecFundo              := TRectangle.Create(Form);
  RecFundo.fill.color   := TAlphaColorRec.Black;
  RecFundo.Align        := TAlignLayout.Contents;
  RecFundo.Stroke.Color := RecFundo.fill.color;
  RecFundo.Opacity      := 0.4;
  RecFundo.Parent       := Form;

  LayCaixa              := TLayout.Create(Form);
  LayCaixa.Align        := TAlignLayout.Contents;
  LayCaixa.Parent       := Form;

  //Caixa msg
  RecAviso              := TRectangle.Create(LayCaixa);
  RecAviso.fill.color   := TAlphaColorRec.White;
  RecAviso.Align        := TAlignLayout.Center;
  RecAviso.Width        := 250;
  RecAviso.XRadius      := 6;
  RecAviso.YRadius      := 6;
  RecAviso.Height       := 180;
  RecAviso.Stroke.Color := RecAviso.fill.color;
  RecAviso.Parent       := LayCaixa;

  if Tipo = 1 then
    begin

      {$region 'SUCCESS'}

      //Circle Animate
      LayCircle             := TLayout.Create(RecAviso);
      LayCircle.Align       := TAlignLayout.Top;
      LayCircle.Height      := 100;
      LayCircle.Parent      := RecAviso;

      ArcCircle             := TArc.Create(LayCircle);
      ArcCircle.Align       := TAlignLayout.Center;
      ArcCircle.Width       := 50;
      ArcCircle.Height      := 50;
      ArcCircle.Stroke.Color        := $FF28A745;
      ArcCircle.Stroke.Thickness    := 5;
      ArcCircle.StartAngle  := 200;
      ArcCircle.EndAngle    := 0;
      ArcCircle.Parent      := LayCircle;

      //Animação Circulo
      AniCircle               := TFloatAnimation.Create(ArcCircle);
      AniCircle.Duration      := 0.5;
      AniCircle.Interpolation := TInterpolationType.Exponential;
      AniCircle.OnFinish      := TFuncoes.onFinish_ArcCircle;
      AniCircle.PropertyName  := 'EndAngle';
      AniCircle.StartValue    := 0;
      AniCircle.StopValue     := 360;
      AniCircle.Parent        := ArcCircle;
      AniCircle.Start;

      //Linha 1
      Lay1linha               := TLayout.Create(ArcCircle);
      Lay1linha.Position.X    := 8;
      Lay1linha.Position.Y    := 27;
      Lay1linha.RotationAngle := 45;
      Lay1linha.Width         := 15;
      Lay1linha.Height        := 7;
      Lay1linha.Parent        := ArcCircle;

      Rec1Linha               := TRectangle.Create(Lay1linha);
      Rec1Linha.Fill.Color    := $FF28A745;
      Rec1Linha.Width         := 0;
      Rec1Linha.Height        := 6;
      Rec1Linha.Stroke.Color  := $FF28A745;
      Rec1Linha.XRadius       := 3;
      Rec1Linha.YRadius       := 3;
      Rec1Linha.Parent        := Lay1linha;

      Ani1Linha               := TFloatAnimation.Create(Rec1Linha);
      Ani1Linha.Duration      := 0.2;
      Ani1Linha.Interpolation := TInterpolationType.Exponential;
      Ani1Linha.OnFinish      := TFuncoes.onFinish_Rec1Linha;
      Ani1Linha.PropertyName  := 'Width';
      Ani1Linha.StartValue    := 0;
      Ani1Linha.StopValue     := Lay1linha.Width;
      Ani1Linha.Parent        := Rec1Linha;

      //Linha 2
      Lay2linha             := TLayout.Create(ArcCircle);
      Lay2linha.Position.X  := 15;
      Lay2linha.Position.Y  := 24;
      Lay2linha.RotationAngle := -45;
      Lay2linha.Width       := 28;
      Lay2linha.Height      := 7;
      Lay2linha.Parent      := ArcCircle;

      Rec2Linha            := TRectangle.Create(Lay2linha);
      Rec2Linha.Fill.Color := $FF28A745;
      Rec2Linha.Width      := 0;
      Rec2Linha.Height     := 6;
      Rec2Linha.Stroke.Color := $FF28A745;
      Rec2Linha.XRadius    := 3;
      Rec2Linha.YRadius    := 3;
      Rec2Linha.Parent     := Lay2linha;

      Ani2Linha               := TFloatAnimation.Create(Rec2Linha);
      Ani2Linha.Duration      := 0.1;
      Ani2Linha.Interpolation := TInterpolationType.Sinusoidal;
      Ani2Linha.PropertyName  := 'Width';
      Ani2Linha.StartValue    := 0;
      Ani2Linha.StopValue     := Lay2linha.Width;
      Ani2Linha.Parent        := Rec2Linha;

      //Texto
      Txt              := TText.Create(RecAviso);
      Txt.Align        := TAlignLayout.Client;
      Txt.VertTextAlign:= TTextAlign.Leading;
      Txt.TextSettings.Font.Size := 14;
      Txt.TextSettings.FontColor := TAlphaColorRec.Black;
      Txt.Font.Style   := [];
      Txt.Margins.Left := 5;
      Txt.Margins.Right:= 5;
      Txt.Text         := msg;
      Txt.WordWrap     := True;
      Txt.parent       := RecAviso;

      LayBottom         := TLayout.Create(RecAviso);
      LayBottom.Height  := 40;
      LayBottom.Align   := TAlignLayout.Bottom;
      LayBottom.Parent  := RecAviso;

      RecBtn0            := TRectangle.Create(LayBottom);
      RecBtn0.Align      := TAlignLayout.Center;
      RecBtn0.Fill.Color := cor_btn0;
      RecBtn0.Width      := 100;
      RecBtn0.Height     := 29;
      RecBtn0.Stroke.Color := cor_btn0;
      RecBtn0.XRadius    := 6;
      RecBtn0.YRadius    := 6;
      RecBtn0.Visible    := True;
      RecBtn0.OnClick    := OnClick_Btn0;
      RecBtn0.Parent     := LayBottom;

      {$endregion}

    end
  Else if Tipo = 2 then
    begin

      {$region 'ERROR'}

      //Circle Animate
      LayCircle             := TLayout.Create(RecAviso);
      LayCircle.Align       := TAlignLayout.Top;
      LayCircle.Height      := 100;
      LayCircle.Parent      := RecAviso;

      ArcCircle             := TArc.Create(LayCircle);
      ArcCircle.Align       := TAlignLayout.Center;
      ArcCircle.Width       := 50;
      ArcCircle.Height      := 50;
      ArcCircle.Stroke.Color        := $FFDC3545;
      ArcCircle.Stroke.Thickness    := 5;
      ArcCircle.StartAngle  := 200;
      ArcCircle.EndAngle    := 0;
      ArcCircle.Parent      := LayCircle;

      //Animação Circulo
      AniCircle               := TFloatAnimation.Create(ArcCircle);
      AniCircle.Duration      := 0.5;
      AniCircle.Interpolation := TInterpolationType.Exponential;
      AniCircle.OnFinish      := TFuncoes.onFinish_ArcCircle;
      AniCircle.PropertyName  := 'EndAngle';
      AniCircle.StartValue    := 0;
      AniCircle.StopValue     := 360;
      AniCircle.Parent        := ArcCircle;
      AniCircle.Start;

      //Linha 1
      Lay1linha               := TLayout.Create(ArcCircle);
      Lay1linha.Position.X    := 21;
      Lay1linha.Position.Y    := 13;
      Lay1linha.RotationAngle := -40;
      Lay1linha.Width         := 7;
      Lay1linha.Height        := 25;
      Lay1linha.Parent        := ArcCircle;

      Rec1Linha               := TRectangle.Create(Lay1linha);
      Rec1Linha.Fill.Color    := $FFDC3545;
      Rec1Linha.Width         := 7;
      Rec1Linha.Height        := 0;
      Rec1Linha.Stroke.Color  := $FFDC3545;
      Rec1Linha.XRadius       := 3;
      Rec1Linha.YRadius       := 3;
      Rec1Linha.Parent        := Lay1linha;

      Ani1Linha               := TFloatAnimation.Create(Rec1Linha);
      Ani1Linha.Duration      := 0.2;
      Ani1Linha.Interpolation := TInterpolationType.Sinusoidal;
      Ani1Linha.OnFinish      := TFuncoes.onFinish_Rec1Linha;
      Ani1Linha.PropertyName  := 'Height';
      Ani1Linha.StartValue    := 0;
      Ani1Linha.StopValue     := Lay1linha.Height;
      Ani1Linha.Parent        := Rec1Linha;

      //Linha 2
      Lay2linha             := TLayout.Create(ArcCircle);
      Lay2linha.Position.X  := 21;
      Lay2linha.Position.Y  := 13;
      Lay2linha.RotationAngle := 40;
      Lay2linha.Width       := 7;
      Lay2linha.Height      := 25;
      Lay2linha.Parent      := ArcCircle;

      Rec2Linha            := TRectangle.Create(Lay2linha);
      Rec2Linha.Fill.Color := $FFDC3545;
      Rec2Linha.Width      := 7;
      Rec2Linha.Height     := 0;
      Rec2Linha.Stroke.Color := $FFDC3545;
      Rec2Linha.XRadius    := 3;
      Rec2Linha.YRadius    := 3;
      Rec2Linha.Parent     := Lay2linha;

      Ani2Linha               := TFloatAnimation.Create(Rec2Linha);
      Ani2Linha.Duration      := 0.1;
      Ani2Linha.Interpolation := TInterpolationType.Sinusoidal;
      Ani2Linha.PropertyName  := 'Height';
      Ani2Linha.StartValue    := 0;
      Ani2Linha.StopValue     := Lay2linha.Height;
      Ani2Linha.Parent        := Rec2Linha;

      //Texto
      Txt              := TText.Create(RecAviso);
      Txt.Align        := TAlignLayout.Client;
      Txt.VertTextAlign:= TTextAlign.Leading;
      Txt.TextSettings.Font.Size := 14;
      Txt.TextSettings.FontColor := TAlphaColorRec.Black;
      Txt.Font.Style   := [];
      Txt.Margins.Left := 5;
      Txt.Margins.Right:= 5;
      Txt.Text         := msg;
      Txt.WordWrap     := True;
      Txt.parent       := RecAviso;


      LayBottom         := TLayout.Create(RecAviso);
      LayBottom.Height  := 40;
      LayBottom.Align   := TAlignLayout.Bottom;
      LayBottom.Parent  := RecAviso;

      RecBtn0            := TRectangle.Create(LayBottom);
      RecBtn0.Align      := TAlignLayout.Center;
      RecBtn0.Fill.Color := cor_btn0;
      RecBtn0.Width      := 100;
      RecBtn0.Height     := 29;
      RecBtn0.Stroke.Color := cor_btn0;
      RecBtn0.XRadius    := 6;
      RecBtn0.YRadius    := 6;
      RecBtn0.Visible    := True;
      RecBtn0.OnClick    := OnClick_Btn0;
      RecBtn0.Parent     := LayBottom;

      {$endregion}

    end
  Else if Tipo = 3 then
    begin

      {$region 'INFO'}

      //Circle Animate
      LayCircle             := TLayout.Create(RecAviso);
      LayCircle.Align       := TAlignLayout.Top;
      LayCircle.Height      := 100;
      LayCircle.Parent      := RecAviso;

      ArcCircle             := TArc.Create(LayCircle);
      ArcCircle.Align       := TAlignLayout.Center;
      ArcCircle.Width       := 50;
      ArcCircle.Height      := 50;
      ArcCircle.Stroke.Color     := $FF17A2B8;
      ArcCircle.Stroke.Thickness := 5;
      ArcCircle.StartAngle  := 200;
      ArcCircle.EndAngle    := 0;
      ArcCircle.Parent      := LayCircle;

      //Animação Circulo
      AniCircle               := TFloatAnimation.Create(ArcCircle);
      AniCircle.Duration      := 0.5;
      AniCircle.Interpolation := TInterpolationType.Exponential;
      AniCircle.OnFinish      := TFuncoes.onFinish_ArcCircle;
      AniCircle.PropertyName  := 'EndAngle';
      AniCircle.StartValue    := 0;
      AniCircle.StopValue     := 360;
      AniCircle.Parent        := ArcCircle;
      AniCircle.Start;

      //Linha 1
      Lay1linha               := TLayout.Create(ArcCircle);
      Lay1linha.Position.X    := 21;
      Lay1linha.Position.Y    := 11;
      Lay1linha.RotationAngle := 0;
      Lay1linha.Width         := 7;
      Lay1linha.Height        := 20;
      Lay1linha.Parent        := ArcCircle;

      Rec1Linha               := TRectangle.Create(Lay1linha);
      Rec1Linha.Fill.Color    := $FF17A2B8;
      Rec1Linha.Width         := 7;
      Rec1Linha.Height        := 0;
      Rec1Linha.Stroke.Color  := $FF17A2B8;
      Rec1Linha.XRadius       := 3;
      Rec1Linha.YRadius       := 3;
      Rec1Linha.Parent        := Lay1linha;

      Ani1Linha               := TFloatAnimation.Create(Rec1Linha);
      Ani1Linha.Duration      := 0.2;
      Ani1Linha.Interpolation := TInterpolationType.Sinusoidal;
      Ani1Linha.OnFinish      := TFuncoes.onFinish_Rec1Linha;
      Ani1Linha.PropertyName  := 'Height';
      Ani1Linha.StartValue    := 0;
      Ani1Linha.StopValue     := Lay1linha.Height;
      Ani1Linha.Parent        := Rec1Linha;

      //Linha 2
      Lay2linha              := TLayout.Create(ArcCircle);
      Lay2linha.Position.X   := 21;
      Lay2linha.Position.Y   := 34;
      Lay2linha.RotationAngle:= 0;
      Lay2linha.Width        := 7;
      Lay2linha.Height       := 5;
      Lay2linha.Parent       := ArcCircle;

      Rec2Linha             := TRectangle.Create(Lay2linha);
      Rec2Linha.Fill.Color  := $FF17A2B8;
      Rec2Linha.Width       := 7;
      Rec2Linha.Height      := 5;
      Rec2Linha.Opacity     := 0;
      Rec2Linha.Stroke.Color:= $FF17A2B8;
      Rec2Linha.XRadius     := 3;
      Rec2Linha.YRadius     := 3;
      Rec2Linha.Parent      := Lay2linha;

      Ani2Linha               := TFloatAnimation.Create(Rec2Linha);
      Ani2Linha.Duration      := 0.1;
      Ani2Linha.Interpolation := TInterpolationType.Sinusoidal;
      Ani2Linha.PropertyName  := 'Opacity';
      Ani2Linha.StartValue    := 0;
      Ani2Linha.StopValue     := 1;
      Ani2Linha.Parent        := Rec2Linha;

      //Texto
      Txt              := TText.Create(RecAviso);
      Txt.Align        := TAlignLayout.Client;
      Txt.VertTextAlign:= TTextAlign.Leading;
      Txt.TextSettings.Font.Size := 14;
      Txt.TextSettings.FontColor := TAlphaColorRec.Black;
      Txt.Font.Style   := [];
      Txt.Margins.Left := 5;
      Txt.Margins.Right:= 5;
      Txt.Text         := msg;
      Txt.WordWrap     := True;
      Txt.parent       := RecAviso;

      LayBottom          := TLayout.Create(RecAviso);
      LayBottom.Height   := 40;
      LayBottom.Align    := TAlignLayout.Bottom;
      LayBottom.Parent   := RecAviso;

      RecBtn0            := TRectangle.Create(LayBottom);
      RecBtn0.Align      := TAlignLayout.Center;
      RecBtn0.Fill.Color := cor_btn0;
      RecBtn0.Width      := 100;
      RecBtn0.Height     := 29;
      RecBtn0.Stroke.Color := cor_btn0;
      RecBtn0.XRadius    := 6;
      RecBtn0.YRadius    := 6;
      RecBtn0.Visible    := True;
      RecBtn0.OnClick    := OnClick_Btn0;
      RecBtn0.Parent     := LayBottom;

      {$endregion}

    end
  Else if Tipo = 4 then
    begin

      {$region 'WARNING'}

      //Circle Animate
      LayCircle             := TLayout.Create(RecAviso);
      LayCircle.Align       := TAlignLayout.Top;
      LayCircle.Height      := 100;
      LayCircle.Parent      := RecAviso;

      ArcCircle             := TArc.Create(LayCircle);
      ArcCircle.Align       := TAlignLayout.Center;
      ArcCircle.Width       := 50;
      ArcCircle.Height      := 50;
      ArcCircle.Stroke.Color     := $FFFFC107;
      ArcCircle.Stroke.Thickness := 5;
      ArcCircle.StartAngle  := 200;
      ArcCircle.EndAngle    := 0;
      ArcCircle.Parent      := LayCircle;

      //Animação Circulo
      AniCircle               := TFloatAnimation.Create(ArcCircle);
      AniCircle.Duration      := 0.5;
      AniCircle.Interpolation := TInterpolationType.Exponential;
      AniCircle.OnFinish      := TFuncoes.onFinish_ArcCircle;
      AniCircle.PropertyName  := 'EndAngle';
      AniCircle.StartValue    := 0;
      AniCircle.StopValue     := 360;
      AniCircle.Parent        := ArcCircle;
      AniCircle.Start;

      //Linha 1
      Lay1linha               := TLayout.Create(ArcCircle);
      Lay1linha.Position.X    := 21;
      Lay1linha.Position.Y    := 11;
      Lay1linha.RotationAngle := 0;
      Lay1linha.Width         := 7;
      Lay1linha.Height        := 20;
      Lay1linha.Parent        := ArcCircle;

      Rec1Linha               := TRectangle.Create(Lay1linha);
      Rec1Linha.Fill.Color    := $FFFFC107;
      Rec1Linha.Width         := 7;
      Rec1Linha.Height        := 0;
      Rec1Linha.Stroke.Color  := $FFFFC107;
      Rec1Linha.XRadius       := 3;
      Rec1Linha.YRadius       := 3;
      Rec1Linha.Parent        := Lay1linha;

      Ani1Linha               := TFloatAnimation.Create(Rec1Linha);
      Ani1Linha.Duration      := 0.2;
      Ani1Linha.Interpolation := TInterpolationType.Sinusoidal;
      Ani1Linha.OnFinish      := TFuncoes.onFinish_Rec1Linha;
      Ani1Linha.PropertyName  := 'Height';
      Ani1Linha.StartValue    := 0;
      Ani1Linha.StopValue     := Lay1linha.Height;
      Ani1Linha.Parent        := Rec1Linha;

      //Linha 2
      Lay2linha              := TLayout.Create(ArcCircle);
      Lay2linha.Position.X   := 21;
      Lay2linha.Position.Y   := 34;
      Lay2linha.RotationAngle:= 0;
      Lay2linha.Width        := 7;
      Lay2linha.Height       := 5;
      Lay2linha.Parent       := ArcCircle;

      Rec2Linha             := TRectangle.Create(Lay2linha);
      Rec2Linha.Fill.Color  := $FFFFC107;
      Rec2Linha.Width       := 7;
      Rec2Linha.Height      := 5;
      Rec2Linha.Opacity     := 0;
      Rec2Linha.Stroke.Color:= $FFFFC107;
      Rec2Linha.XRadius     := 3;
      Rec2Linha.YRadius     := 3;
      Rec2Linha.Parent      := Lay2linha;

      Ani2Linha               := TFloatAnimation.Create(Rec2Linha);
      Ani2Linha.Duration      := 0.1;
      Ani2Linha.Interpolation := TInterpolationType.Sinusoidal;
      Ani2Linha.PropertyName  := 'Opacity';
      Ani2Linha.StartValue    := 0;
      Ani2Linha.StopValue     := 1;
      Ani2Linha.Parent        := Rec2Linha;

      //Texto
      Txt              := TText.Create(RecAviso);
      Txt.Align        := TAlignLayout.Client;
      Txt.VertTextAlign:= TTextAlign.Leading;
      Txt.TextSettings.Font.Size := 14;
      Txt.TextSettings.FontColor := TAlphaColorRec.Black;
      Txt.Font.Style   := [];
      Txt.Margins.Left := 5;
      Txt.Margins.Right:= 5;
      Txt.Text         := msg;
      Txt.WordWrap     := True;
      Txt.parent       := RecAviso;


      LayBottom          := TLayout.Create(RecAviso);
      LayBottom.Height   := 40;
      LayBottom.Align    := TAlignLayout.Bottom;
      LayBottom.Parent   := RecAviso;

      RecBtn0            := TRectangle.Create(LayBottom);
      RecBtn0.Align      := TAlignLayout.Center;
      RecBtn0.Fill.Color := cor_btn0;
      RecBtn0.Width      := 100;
      RecBtn0.Height     := 29;
      RecBtn0.Stroke.Color := cor_btn0;
      RecBtn0.XRadius    := 6;
      RecBtn0.YRadius    := 6;
      RecBtn0.Visible    := True;
      RecBtn0.OnClick    := OnClick_Btn0;
      RecBtn0.Parent     := LayBottom;

      {$endregion}

    end
  Else if Tipo = 5 then
    begin

      {$region 'QUESTION'}

      //Circle Animate
      LayCircle             := TLayout.Create(RecAviso);
      LayCircle.Align       := TAlignLayout.Top;
      LayCircle.Height      := 100;
      LayCircle.Parent      := RecAviso;

      ArcCircle             := TArc.Create(LayCircle);
      ArcCircle.Align       := TAlignLayout.Center;
      ArcCircle.Width       := 50;
      ArcCircle.Height      := 50;
      ArcCircle.Stroke.Color     := $FF6C757D;
      ArcCircle.Stroke.Thickness := 5;
      ArcCircle.StartAngle  := 200;
      ArcCircle.EndAngle    := 0;
      ArcCircle.Parent      := LayCircle;

      //Animação Circulo
      AniCircle               := TFloatAnimation.Create(ArcCircle);
      AniCircle.Duration      := 0.5;
      AniCircle.Interpolation := TInterpolationType.Exponential;
      AniCircle.OnFinish      := TFuncoes.onFinish_ArcCircle2;
      AniCircle.PropertyName  := 'EndAngle';
      AniCircle.StartValue    := 0;
      AniCircle.StopValue     := 360;
      AniCircle.Parent        := ArcCircle;
      AniCircle.Start;

      //Linha 0
      ArcQuest             := TArc.Create(ArcCircle);
      ArcQuest.Align       := TAlignLayout.None;
      ArcQuest.Width       := 20;
      ArcQuest.Height      := 20;
      ArcQuest.Stroke.Color     := $FF6C757D;
      ArcQuest.Stroke.Thickness := 6;
      ArcQuest.StartAngle  := 50;
      ArcQuest.EndAngle    := 0;
      ArcQuest.Position.X  := 14;
      ArcQuest.Position.Y  := 9;
      ArcQuest.Parent      := ArcCircle;

      //Animação Circulo
      AniArcQuest               := TFloatAnimation.Create(ArcQuest);
      AniArcQuest.Duration      := 0.4;
      AniArcQuest.Interpolation := TInterpolationType.Sinusoidal;
      AniArcQuest.OnFinish      := TFuncoes.onFinish_ArcQuest;
      AniArcQuest.PropertyName  := 'EndAngle';
      AniArcQuest.StartValue    := 0;
      AniArcQuest.StopValue     := -200;
      AniArcQuest.Parent        := ArcQuest;

      //Linha 1
      Lay1linha               := TLayout.Create(ArcCircle);
      Lay1linha.Position.X    := 21;
      Lay1linha.Position.Y    := 24;
      Lay1linha.RotationAngle := 0;
      Lay1linha.Width         := 7;
      Lay1linha.Height        := 10;
      Lay1linha.Parent        := ArcCircle;

      Rec1Linha               := TRectangle.Create(Lay1linha);
      Rec1Linha.Fill.Color    := $FF6C757D;
      Rec1Linha.Width         := 7;
      Rec1Linha.Height        := 0;
      Rec1Linha.Stroke.Color  := $FF6C757D;
      Rec1Linha.XRadius       := 3;
      Rec1Linha.YRadius       := 3;
      Rec1Linha.Parent        := Lay1linha;

      Ani1Linha               := TFloatAnimation.Create(Rec1Linha);
      Ani1Linha.Duration      := 0.2;
      Ani1Linha.Interpolation := TInterpolationType.Sinusoidal;
      Ani1Linha.OnFinish      := TFuncoes.onFinish_Rec1Linha;
      Ani1Linha.PropertyName  := 'Height';
      Ani1Linha.StartValue    := 0;
      Ani1Linha.StopValue     := Lay1linha.Height;
      Ani1Linha.Parent        := Rec1Linha;

      //Linha 2
      Lay2linha              := TLayout.Create(ArcCircle);
      Lay2linha.Position.X   := 21;
      Lay2linha.Position.Y   := 36;
      Lay2linha.RotationAngle:= 0;
      Lay2linha.Width        := 7;
      Lay2linha.Height       := 5;
      Lay2linha.Parent       := ArcCircle;

      Rec2Linha             := TRectangle.Create(Lay2linha);
      Rec2Linha.Fill.Color  := $FF6C757D;
      Rec2Linha.Width       := 7;
      Rec2Linha.Height      := 5;
      Rec2Linha.Opacity     := 0;
      Rec2Linha.Stroke.Color:= $FF6C757D;
      Rec2Linha.XRadius     := 3;
      Rec2Linha.YRadius     := 3;
      Rec2Linha.Parent      := Lay2linha;

      Ani2Linha               := TFloatAnimation.Create(Rec2Linha);
      Ani2Linha.Duration      := 0.1;
      Ani2Linha.Interpolation := TInterpolationType.Sinusoidal;
      Ani2Linha.PropertyName  := 'Opacity';
      Ani2Linha.StartValue    := 0;
      Ani2Linha.StopValue     := 1;
      Ani2Linha.Parent        := Rec2Linha;

      //Texto
      Txt              := TText.Create(RecAviso);
      Txt.Align        := TAlignLayout.Client;
      Txt.VertTextAlign:= TTextAlign.Leading;
      Txt.TextSettings.Font.Size := 14;
      Txt.TextSettings.FontColor := TAlphaColorRec.Black;
      Txt.Font.Style   := [];
      Txt.Margins.Left := 5;
      Txt.Margins.Right:= 5;
      Txt.Text         := msg;
      Txt.WordWrap     := True;
      Txt.parent       := RecAviso;

      LayBottom          := TLayout.Create(RecAviso);
      LayBottom.Height   := 40;
      LayBottom.Align    := TAlignLayout.Bottom;
      LayBottom.Parent   := RecAviso;

      RecBtn0            := TRectangle.Create(LayBottom);
      RecBtn0.Align      := TAlignLayout.Right;
      RecBtn0.Fill.Color := cor_btn0;
      RecBtn0.Width      := 100;
      RecBtn0.Height     := 35;
      RecBtn0.Stroke.Color := cor_btn0;
      RecBtn0.XRadius    := 6;
      RecBtn0.YRadius    := 6;
      RecBtn0.Visible    := True;
      RecBtn0.OnClick    := OnClick_Btn0_2;
      RecBtn0.Margins.Right := 5;
      RecBtn0.Margins.Top   := 3;
      RecBtn0.Margins.Bottom:= 3;
      RecBtn0.Parent     := LayBottom;

      RecBtn1            := TRectangle.Create(LayBottom);
      RecBtn1.Align      := TAlignLayout.Left;
      RecBtn1.Fill.Color := cor_btn1;
      RecBtn1.Width      := 100;
      RecBtn1.Height     := 35;
      RecBtn1.Stroke.Color := cor_btn1;
      RecBtn1.XRadius    := 6;
      RecBtn1.YRadius    := 6;
      RecBtn1.Visible    := True;
      RecBtn1.OnClick    := OnClick_Btn1;
      RecBtn1.Margins.Left  := 5;
      RecBtn1.Margins.Top   := 3;
      RecBtn1.Margins.Bottom:= 3;
      RecBtn1.Parent     := LayBottom;

      //Texto
      TxtBtn1 := TText.Create(RecBtn1);
      TxtBtn1.Align := TAlignLayout.Client;
      TxtBtn1.TextSettings.Font.Size := 14;
      TxtBtn1.TextSettings.FontColor := FontCor_btn1;
      TxtBtn1.HitTest    := False;
      TxtBtn1.Font.Style := [TFontStyle.fsBold];
      TxtBtn1.Text       := btn1;
      TxtBtn1.parent     := RecBtn1;

      {$endregion}

    end;

  //Texto
  TxtBtn0 := TText.Create(RecBtn0);
  TxtBtn0.Align := TAlignLayout.Client;
  TxtBtn0.TextSettings.Font.Size := 14;
  TxtBtn0.TextSettings.FontColor := FontCor_btn0;
  TxtBtn0.HitTest    := False;
  TxtBtn0.Font.Style := [TFontStyle.fsBold];
  TxtBtn0.Text       := btn0;
  TxtBtn0.parent     := RecBtn0;

  AniFim               := TFloatAnimation.Create(RecAviso);
  AniFim.Duration      := 0.2;
  AniFim.Interpolation := TInterpolationType.Exponential;
  AniFim.OnFinish      := TFuncoes.onFinish_AniFim;
  AniFim.PropertyName  := 'Opacity';
  AniFim.StartValue    := 1;
  AniFim.StopValue     := 0;
  AniFim.Parent        := RecAviso;
end;

class procedure TFuncoes.onFinish_ArcCircle(Sender: TObject);
begin
  Ani1Linha.Start;
end;

class procedure TFuncoes.onFinish_ArcCircle2(Sender: TObject);
begin
  AniArcQuest.Start;
end;

class procedure TFuncoes.onFinish_ArcQuest(Sender: TObject);
begin
  Ani1Linha.Start;
end;

class procedure TFuncoes.onFinish_Rec1Linha(Sender: TObject);
begin
  Ani2Linha.Start;
end;

class procedure TFuncoes.onFinish_AniFim(Sender: TObject);
begin
  RecAviso.DisposeOf;
  RecFundo.DisposeOf;
end;

class procedure TFuncoes.OnClick_Btn0(Sender: TObject);
begin
  AniFim.Start;
end;

class procedure TFuncoes.OnClick_Btn0_2(Sender: TObject);
begin
  vSweetbtn := 0;
  AniFim.Start;
end;

class procedure TFuncoes.OnClick_Btn1(Sender: TObject);
begin
  vSweetbtn := 1;
  AniFim.Start;
end;

class Function TFuncoes.Teste_Conexao_Server(Host, Porta :string) :string;
var
  ConID : TIdTCPClient;
begin
  Result := 'N';

  Try
    ConID      := TIdTCPClient.Create(nil);
    ConID.Host := Host;
    ConID.Port := StrToInt(Porta);
    ConID.ConnectTimeout := 3000;

    Try
      ConID.Connect;

      Result := 'S';
    Except
    End;
  Finally
    ConID.DisposeOf;
  End;
end;

class procedure TFuncoes.Toast2(Frm : Tform; msg: string;
                                alinhamento: TAlignLayout = TAlignLayout.Bottom;
                                Tipo :integer = 1;
                                duracao :integer = 4);
var
   Ani_Fundo        :TFloatAnimation;
   Lay_Ico, Lay_Msg :TLayout;
   Ico_Path         :TPath;

begin
  Lay_Geral              := TLayout.Create(Frm);
  Lay_Geral.Align        := TAlignLayout.None;
  Lay_Geral.Position.X   := 0;

  if alinhamento = TAlignLayout.Top then
    Lay_Geral.Position.Y := 0
  Else if alinhamento = TAlignLayout.Bottom then
    Lay_Geral.Position.Y := Frm.Height - 50;

  Lay_Geral.Height       := 50;
  Lay_Geral.Width        := Frm.Width;
  Lay_Geral.Parent       := Frm;

  Rec_Fundo              := TRectangle.Create(Lay_Geral);
  Rec_Fundo.Align        := TAlignLayout.None;
  Rec_Fundo.Height       := 50;

  if Tipo = 1 then
    begin
      Rec_Fundo.Fill.Color    := TColorFundo.SUCCESS;
      Rec_Fundo.Stroke.Color  := TColorFundo.SUCCESS;
    end
  Else if Tipo = 2 then
    begin
      Rec_Fundo.Fill.Color    := TColorFundo.ERROR;
      Rec_Fundo.Stroke.Color  := TColorFundo.ERROR;
    end
  Else if Tipo = 3 then
    begin
      Rec_Fundo.Fill.Color    := TColorFundo.INFORMATION;
      Rec_Fundo.Stroke.Color  := TColorFundo.INFORMATION;
    end
  Else if Tipo = 4 then
    begin
      Rec_Fundo.Fill.Color    := TColorFundo.WARNING;
      Rec_Fundo.Stroke.Color  := TColorFundo.WARNING;
    end;

  if alinhamento = TAlignLayout.Top then
    Rec_Fundo.Position.Y  := -60
  Else if alinhamento = TAlignLayout.Bottom then
    Rec_Fundo.Position.Y  := 0;

  Rec_Fundo.Width         := Lay_Geral.Width;
  Rec_Fundo.Position.X    := 0;
  Rec_Fundo.Parent        := Lay_Geral;

  Ani_Fundo               := TFloatAnimation.Create(Rec_Fundo);
  Ani_Fundo.Duration      := 0.6;
  Ani_Fundo.Interpolation := TInterpolationType.Sinusoidal;
  Ani_Fundo.OnFinish      := OnFinishAniFundo;
  Ani_Fundo.PropertyName  := 'Position.Y';
  Ani_Fundo.StopValue     := 0;

  if alinhamento = TAlignLayout.Top then
    Ani_Fundo.StartValue       := -60
  Else if alinhamento = TAlignLayout.Bottom then
    Ani_Fundo.StartValue       := 60;

  Ani_Fundo.Parent             := Rec_Fundo;
  Ani_Fundo.Start;

  Rec_Progress_1               := TRectangle.Create(Rec_Fundo);

  if alinhamento = TAlignLayout.Top then
    Rec_Progress_1.Align       := TAlignLayout.Bottom
  Else if alinhamento = TAlignLayout.Bottom then
    Rec_Progress_1.Align       := TAlignLayout.Top;

  Rec_Progress_1.Height        := 5;

  if Tipo = 1 then
    begin
      Rec_Progress_1.Fill.Color   := $FF1B662C;
      Rec_Progress_1.Stroke.Color := $FF1B662C;
    end
  Else if Tipo = 2 then
    begin
      Rec_Progress_1.Fill.Color   := $FFC22232;
      Rec_Progress_1.Stroke.Color := $FFC22232;
    end
  Else if Tipo = 3 then
    begin
      Rec_Progress_1.Fill.Color   := $FF127E8F;
      Rec_Progress_1.Stroke.Color := $FF127E8F;
    end
  Else if Tipo = 4 then
    begin
      Rec_Progress_1.Fill.Color   := $FFCC9901;
      Rec_Progress_1.Stroke.Color := $FFCC9901;
    end;

  Rec_Progress_1.Parent           := Rec_Fundo;

  Rec_Progress_2                  := TRectangle.Create(Rec_Progress_1);
  Rec_Progress_2.Align            := TAlignLayout.Left;
  Rec_Progress_2.Width            := 0;

  if Tipo = 1 then
    begin
      Rec_Progress_2.Fill.Color   := $FF22943C;
      Rec_Progress_2.Stroke.Color := $FF22943C;
    end
  Else if Tipo = 2 then
    begin
      Rec_Progress_2.Fill.Color   := $FFDB2F40;
      Rec_Progress_2.Stroke.Color := $FFDB2F40;
    end
  Else if Tipo = 3 then
    begin
      Rec_Progress_2.Fill.Color   := $FF17A5BC;
      Rec_Progress_2.Stroke.Color := $FF17A5BC;
    end
  Else if Tipo = 4 then
    begin
      Rec_Progress_2.Fill.Color   := $FFFEBE01;
      Rec_Progress_2.Stroke.Color := $FFFEBE01;
    end;

  Rec_Progress_2.Parent        := Rec_Progress_1;

  Ani_Progress_2               := TFloatAnimation.Create(Rec_Progress_2);
  Ani_Progress_2.Duration      := duracao;
  Ani_Progress_2.Interpolation := TInterpolationType.Sinusoidal;
  Ani_Progress_2.OnFinish      := OnFinishAniProgress_2;
  Ani_Progress_2.PropertyName  := 'Width';
  Ani_Progress_2.StartValue    := 0;
  Ani_Progress_2.StopValue     := Lay_Geral.Width;
  Ani_Progress_2.Parent        := Rec_Progress_2;

  Lay_Ico                      := TLayout.Create(Rec_Fundo);
  Lay_Ico.Align                := TAlignLayout.Left;
  Lay_Ico.Width                := 45;
  Lay_Ico.Margins.Left         := 5;
  Lay_Ico.Margins.Top          := 5;
  Lay_Ico.Margins.Bottom       := 5;
  Lay_Ico.Margins.Right        := 5;
  Lay_Ico.Parent               := Rec_Fundo;

  Ico_Path                     := TPath.Create(Lay_Ico);
  Ico_Path.Align               := TAlignLayout.Client;
  Ico_Path.Fill.Color          := TAlphaColorRec.White;
  Ico_Path.Stroke.Color        := TAlphaColorRec.White;
  Ico_Path.Stroke.Thickness    := 0;

  if Tipo = 1 then
    Ico_Path.Data.Data         := vIcon_Success
  Else if Tipo = 2 then
    Ico_Path.Data.Data         := vIcon_Error
  Else if Tipo = 3 then
    Ico_Path.Data.Data         := vIcon_Info
  Else if Tipo = 4 then
    Ico_Path.Data.Data         := vIcon_Warning;

  Ico_Path.Margins.Left        := 5;
  Ico_Path.Margins.Top         := 5;
  Ico_Path.Margins.Right       := 5;
  Ico_Path.Margins.Bottom      := 5;
  Ico_Path.Visible             := True;
  Ico_Path.Parent              := Lay_Ico;

  Lay_Msg                      := TLayout.Create(Rec_Fundo);
  Lay_Msg.Align                := TAlignLayout.Client;
  Lay_Msg.Margins.Left         := 0;
  Lay_Msg.Margins.Top          := 5;
  Lay_Msg.Margins.Bottom       := 5;
  Lay_Msg.Margins.Right        := 5;
  Lay_Msg.Parent               := Rec_Fundo;

  Txt              := TText.Create(Lay_Msg);
  Txt.Align        := TAlignLayout.Client;
  Txt.VertTextAlign:= TTextAlign.Center;
  Txt.HorzTextAlign:= TTextAlign.Leading;
  Txt.TextSettings.Font.Size := 14;
  Txt.TextSettings.FontColor := TAlphaColorRec.White;
  Txt.Font.Style   := [];
  Txt.Text         := msg;
  Txt.WordWrap     := True;
  Txt.parent       := Lay_Msg;
end;

class procedure TFuncoes.OnFinishAniFundo(Sender: TObject);
begin
  Ani_Progress_2.Start;
end;

class procedure TFuncoes.OnFinishAniProgress_2(Sender: TObject);
begin
  Ani_Fundo_2               := TFloatAnimation.Create(Rec_Fundo);
  Ani_Fundo_2.Duration      := 0.6;
  Ani_Fundo_2.Interpolation := TInterpolationType.Sinusoidal;
  Ani_Fundo_2.OnFinish      := OnFinishAniFundo2;
  Ani_Fundo_2.PropertyName  := 'Position.Y';
  Ani_Fundo_2.StartValue    := 0;

  if Lay_Geral.Position.Y = 0 then
    Ani_Fundo_2.StopValue     := -60
  Else if Lay_Geral.Position.Y > 0 then
    Ani_Fundo_2.StopValue     := 60;

  Ani_Fundo_2.Parent        := Rec_Fundo;
  Ani_Fundo_2.Start;
end;

class procedure TFuncoes.OnFinishAniFundo2(Sender: TObject);
begin
  Lay_Geral.DisposeOf;
end;

end.
