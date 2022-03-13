(* Delphi Dialog
   Select a list entry
   ===================
   
   © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

   The contents of this file may be used under the terms of the
   Mozilla Public License ("MPL") or
   GNU Lesser General Public License Version 2 or later (the "LGPL")

   Software distributed under this License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.
    
   Vers. 1 - March 2022
   last modified: March 2022
    *)

unit SelectListItemDlg;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TSelectListItemDialog = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    lbxStringList: TListBox;
    lbDesc: TLabel;
    procedure lbxStringListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  function Execute (const ATitle,ADesc : string;
                    SList : TStrings; AIndex : integer = 0) : integer;
  end;

var
  SelectListItemDialog: TSelectListItemDialog;

implementation

{$R *.DFM}

{------------------------------------------------------------------- }
procedure TSelectListItemDialog.lbxStringListDblClick(Sender: TObject);
begin
  ModalResult:=mrOK;
  end;

{------------------------------------------------------------------- }
function TSelectListItemDialog.Execute (const ATitle,ADesc : string;
                    SList : TStrings; AIndex : integer) : integer;
var
  i : integer;
begin
  Caption:=ATitle;
  lbDesc.Caption:=ADesc;
  lbxStringList.Clear;
  with SList do for i:=0 to Count-1 do lbxStringList.AddItem(Strings[i],Objects[i]);
  lbxStringList.ItemIndex:=AIndex;
  if ShowModal=mrOK then begin
    Result:=lbxStringList.ItemIndex;
    end
  else Result:=-1;
  end;

end.
