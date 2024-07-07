(* Delphi-Unit
   Edit dialog for multilien text
   ==============================

   © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

   The contents of this file may be used under the terms of the
   Mozilla Public License ("MPL") or
   GNU Lesser General Public License Version 2 or later (the "LGPL")

   Software distributed under this License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.

   Vers. 1 - Mrz. 2008
   last modified: July 2024
   *)

unit MemoDlg;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TMemoDialog = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Memo: TMemo;
    paBottom: TPanel;
    paTop: TPanel;
    Descriptor: TStaticText;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    function Execute(const Titel,Desc : string;
                     var AText  : string;
                     UseCommaText : boolean = false) : boolean;
  end;

var
  MemoDialog: TMemoDialog;

implementation

{$R *.dfm}

uses System.Math;

function TMemoDialog.Execute(const Titel,Desc : string;
                             var AText  : string;
                             UseCommaText : boolean) : boolean;
var
  w,mw : integer;

function GetMaxTextWidth(sl : TStrings; AFont : TFont) : integer;
var
  i : integer;
  bm  : TBitmap;
begin
  Result:=0;
  bm:=TBitmap.Create;                      // prepare temp. canvas
  bm.Canvas.Font.Assign(AFont);
  with sl do for i:=0 to Count-1 do begin
    Result:=Max(Result,bm.Canvas.TextWidth(Strings[i]));
    end;
  bm.Free;
  end;

begin
  Caption:=Titel;
  Descriptor.Caption:=Desc;
  with Memo do begin
    WordWrap:=false;
    if UseCommaText then Lines.CommaText:=AText
    else Text:=AText;
    w:=MulDiv(GetMaxTextWidth(Lines,Memo.Font),110,100);
    Hint:=Desc;
    WordWrap:=true;
    SelStart:=length(AText);
    end;
  if w>ClientWidth then begin
    mw:=Screen.MonitorFromPoint(Point(Left,Top)).WorkareaRect.Width div 2;
    if w>mw then w:=mw;
    ClientWidth:=w;
    end;
  ActiveControl:=Memo;
  if ShowModal=mrOK then begin
    if UseCommaText then AText:=Memo.Lines.CommaText
    else AText:=Memo.Lines.Text;
    Result:=true;
    end
  else Result:=false;
  end;

end.
