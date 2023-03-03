(* ComboBox and Groupbox with checkboxes
   =====================================
  derived from ATCheckedComboBox.pas (unknown author)

  © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

  The contents of this file may be used under the terms of the
  GNU Lesser General Public License Version 2 or later (the "LGPL")

  Software distributed under this License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
  the specific language governing rights and limitations under the License.

  Vers. 1 - Apr. 2015
        2 - Jan. 2016
        2.1 - December 2021 : procedure Init added to initialize the procedure pointers
                              from calling unit
   last modified: September 2022
*)

unit CheckBoxes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.StdCtrls;

type
  TSelected = set of byte;

  TCheckComboBox = class(TCustomComboBox)
  private
    { Private declarations }
    FListInstance: Pointer;
    FDefListProc: Pointer;
    FListHandle: HWnd;
    FColorFocus, FColorNotFocus: TColor;
    FCheckWidth,FCheckHeight,
    FDefaultIndex,
    FCheckedCount: integer;
    FOnCheckClick: TNotifyEvent;
    FFixedText,FHintPrefix : String;
    procedure CMShowingChanged(var Message: TMessage); message CM_SHOWINGCHANGED;
    procedure CNDrawItem(var Message : TWMDrawItem); message CN_DRAWITEM;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure ComboListWndProc(var Message : TMessage);
    procedure SetColorFocus(value : TColor);
    procedure SetColorNotFocus(value : TColor);
    procedure SetFixedText(Value : String);
    procedure SetHintPrefix(Value : String);
    procedure SetDefaultIndex(Value : integer);
    function GetShortString(AIndex : integer): string;
    function GetSelectedIndexes : TSelected;
    procedure SetSelectedIndexes(Value : TSelected);
    function GetSelected : cardinal;
    procedure SetSelected (Value : cardinal);
  protected
    { Protected declarations }
    sHint : string;
    bCalcText : boolean;
    procedure WndProc(var Message: TMessage); override;
    procedure RecalcText;
    function GetCheckedCount: integer;
    procedure ChangeScale(M, D: Integer); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Init;
    procedure SetChecked(nIndex: integer; checked: boolean);
    function GetLongString(AIndex : integer): string;
    function AddChecked(value: string; checked: boolean): integer;
    function IsChecked(nIndex: integer): boolean;
    procedure CheckAll(checked: boolean);
    property CheckedCount: integer read GetCheckedCount;
    property SelectedIndexes : TSelected read GetSelectedIndexes write SetSelectedIndexes;
    property Selected : cardinal read GetSelected write SetSelected;
  published
    { Published declarations }
    property Anchors;
    property BiDiMode;
    property Color;
    property ColorNotFocus: TColor read FColorNotFocus write SetColorNotFocus;
    property ColorFocus: TColor read FColorFocus write SetColorFocus;
    property Constraints;
    property Ctl3D;
    property DefaultIndex : integer read FDefaultIndex write SetDefaultIndex;
    property DragCursor;
    property DragKind;
    property DragMode;
    property DropDownCount;
    property Enabled;
    property Caption : string read FFixedText write SetFixedText;
    property Font;
    property Hint stored false;
    property HintPrefix : string read FHintPrefix write SetHintPrefix;
    property ImeMode;
    property ImeName;
    property ItemHeight;
    property Items;
    property MaxLength;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnCheckClick: TNotifyEvent read FOnCheckClick write FOnCheckClick;
    property OnClick;
    property OnCloseUp;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDropDown;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDock;
    property OnStartDrag;
  end;

  TCheckGroupBox = class(TCustomGroupBox)
  private
    CheckBox : TCheckBox;
    FOnCheckClick: TNotifyEvent;
    FCheckWidth,FCheckHeight,
    CbIndent  : integer;
    function GetChecked : boolean;
    procedure SetChecked (Value : boolean);
    function GetText : TCaption;
    procedure SetText(const Value: TCaption);
  protected
    procedure Paint; override;
    procedure CheckClick(Sender: TObject);
    procedure AfterConstruction; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Invalidate; override;
  published
    property Align;
    property Anchors;
    property BiDiMode;
    property Caption: TCaption read GetText write SetText;
    property Checked : boolean read GetChecked write SetChecked default false;
    property Color;
    property Constraints;
    property Ctl3D;
    property DockSite;
    property DoubleBuffered;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property Padding;
    property ParentBackground default True;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentDoubleBuffered;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property TabStop;
    property Touch;
    property Visible;
    property StyleElements;
    property OnAlignInsertBefore;
    property OnAlignPosition;
    property OnClick;
    property OnCheckClick: TNotifyEvent read FOnCheckClick write FOnCheckClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDockDrop;
    property OnDockOver;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnGesture;
    property OnGetSiteInfo;
    property OnMouseActivate;
    property OnMouseDown;
    property OnMouseEnter;
    property OnMouseLeave;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;
  end;

procedure Register;

implementation

uses Vcl.Forms, Vcl.Themes;

// Define CompPalPage (see procedure "Register")
{$INCLUDE UserComps.pas }

{ TCheckComboBox }
procedure Register;
begin
  RegisterComponents(CompPalPage,[TCheckComboBox,TCheckGroupBox]);
  end;

constructor TCheckComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FListInstance:=MakeObjectInstance(ComboListWndProc);
  FDefListProc:=nil;
  FListHandle:=0;
  FCheckWidth:=GetSystemMetrics(SM_CXMENUCHECK);
  FCheckHeight:=FCheckWidth;
  ShowHint:=true;
  ParentShowHint:=false;
  FFixedText:=''; FHintPrefix:='';
  FDefaultIndex:=-1;
  Color:=clWindow;
  FColorFocus:=clSkyBlue;
  FColorNotFocus:=clInfoBk;
  Style:=csOwnerDrawVariable;
  bCalcText:=true;
end;

destructor TCheckComboBox.Destroy;
begin
  FreeObjectInstance(FListInstance);
  inherited Destroy;
end;

procedure TCheckComboBox.Init;
begin
  FListInstance:=MakeObjectInstance(ComboListWndProc);
  FListHandle:=0;
  end;

procedure TCheckComboBox.ChangeScale(M, D: Integer);
begin
  inherited ChangeScale(M, D);
  ItemHeight:=MulDiv(ItemHeight,M,D);
  end;

procedure TCheckComboBox.SetFixedText(Value: String);
begin
  if (Value<>FFixedText) then begin
    FFixedText:=Value;
    bCalcText:=true;
    Invalidate;
    end;
  end;

procedure TCheckComboBox.SetHintPrefix(Value : String);
begin
  if (Value<>FHintPrefix) then begin
    FHintPrefix:=Value;
    bCalcText:=true;
    Invalidate;
    end;
  end;

procedure TCheckComboBox.SetDefaultIndex(Value : integer);
begin
  if (Value<>FDefaultIndex) then begin
    Items.Objects[FDefaultIndex]:=TObject(false);
    FDefaultIndex:=Value;
    FCheckedCount:=0; bCalcText:=true;
    Invalidate;
    end;
  end;

procedure TCheckComboBox.SetChecked(nIndex: integer; checked: boolean);
begin
  if (nIndex>=0) and (nIndex<Items.count) then begin
    Items.Objects[nIndex]:=TObject(checked);
    bCalcText:=true;
    Invalidate;
    if Assigned(FOnCheckClick) then OnCheckClick(self)
    end;
  end;

function TCheckComboBox.AddChecked(value: string; checked: boolean): integer;
begin
  Result:=Items.AddObject(value,TObject(checked));
  if Result >= 0 then begin
    bCalcText:=true;
    Invalidate;
    end;
  end;

function TCheckComboBox.IsChecked(nIndex: integer): boolean;
begin
  Result:=false;
  if (nIndex>-1) and (nIndex<Items.count) then Result:=Items.Objects[nIndex] = TObject(true)
  end;

procedure TCheckComboBox.CheckAll(checked: boolean);
var
  i : integer;
begin
  with Items do for i:=0 to Count-1 do Objects[i]:=TObject(checked);
  bCalcText:=true;
  Invalidate;
  end;

function TCheckComboBox.GetCheckedCount: integer;
begin
  RecalcText;
  Result:=FCheckedCount;
  end;

function TCheckComboBox.GetSelectedIndexes : TSelected;
var
  i,n : integer;
begin
  with Items do begin
    if Count>=256 then n:=256 else n:=Count;
    Result:=[];
    for i:=0 to n-1 do if boolean(Objects[i]) then Include(Result,i);
    end;
  end;

procedure TCheckComboBox.SetSelectedIndexes (Value : TSelected);
var
  i,n : integer;
begin
  if Value<>GetSelectedIndexes then with Items do begin
    if Count>=256 then n:=256 else n:=Count;
    for i:=0 to n-1 do Objects[i]:=TObject(i in Value);
    end;
  end;

function TCheckComboBox.GetSelected : cardinal;  // max. 32 elements
var
  i,n : integer;
begin
  with Items do begin
    if count >= 256 then n:=32 else n:=count;
    Result:=0;
    for i:=0 to n-1 do if boolean(Objects[i]) then Result:=Result+(1 shl i);
    end;
  bCalcText:=true;
  Invalidate;
  end;

procedure TCheckComboBox.SetSelected (Value : cardinal);
var
  i,n : integer;
  Check : boolean;
begin
  FCheckedCount:=0;
  with Items do begin
    if count >= 256 then n:=32 else n:=count;
    for i:=0 to n-1 do begin
      Check:=Value and (1 shl i)<>0;
      Objects[i]:=TObject(Check);
      if Check then inc(FCheckedCount);
      end;
    end;
  bCalcText:=true;
  Invalidate;
  end;

procedure TCheckComboBox.RecalcText;
var
  nCount,i : integer;
  strItem,strText,strSeparator : string;
begin
  if bCalcText then begin
    if (FCheckedCount=0) and (FDefaultIndex>=0) and (FDefaultIndex<Items.Count) then
      Items.Objects[FDefaultIndex]:=TObject(true);
    FCheckedCount:=0;
    nCount:=Items.count;
    strSeparator:=',';
    strText:='';
    for i:=0 to nCount-1 do if IsChecked(i) then begin
      inc(FCheckedCount);
      strItem:=GetShortString(i);
      if length(strText)>0 then strText:=strText+strSeparator;
      strText:=strText+strItem;
      end;
    // Set the text
    sHint:=strText;
    strText:='';
    if ShowHint then begin
      for i:=0 to nCount-1 do if IsChecked(i) then begin
        strItem:=GetLongString(i);
        if length(strText)>0 then strText:=strText+strSeparator;
        strText:=strText+strItem;
        end;
      if not ((csDesigning in ComponentState) or (csLoading in ComponentState)) then
        Hint:=FHintPrefix+strText; // else Hint:='';
      end;
    bCalcText:=false;
    end;
  end;

procedure TCheckComboBox.SetColorFocus(value: TColor);
begin
  if FColorFocus<>Value then FColorFocus:=Value;
  Invalidate;
  end;

procedure TCheckComboBox.SetColorNotFocus(value: TColor);
begin
  if FColorNotFocus<>Value then FColorNotFocus:=value;
  Invalidate;
  end;

function TCheckComboBox.GetLongString(AIndex : integer): string;
var
  n : integer;
  s : string;
begin
  s:=Items[AIndex]; n:=pos('|',s);
  if n=0 then Result:=s else Result:=copy(s,1,n-1);
  end;

function TCheckComboBox.GetShortString(AIndex : integer): string;
var
  n : integer;
  s : string;
begin
  s:=Items[AIndex]; n:=pos('|',s);
  if n=0 then Result:=s else Result:=copy(s,n+1,length(s));
  end;

procedure TCheckComboBox.CMShowingChanged(var Message: TMessage);
begin
  inherited;
//  Init;
  end;

procedure TCheckComboBox.CNCommand(var Message: TWMCommand);
begin
  case Message.NotifyCode of
    CBN_CLOSEUP: begin
      if FCheckedCount=0 then begin
        bCalcText:=true; Invalidate;
        end;
      CloseUp;
      end;
    else inherited;
    end;
  end;

procedure TCheckComboBox.CNDrawItem(var Message: TWMDrawItem);
var
  State : TOwnerDrawState;
  rcBitmap,rcText : TRect;
  nState : integer;
  strText : string;
  ItId : integer;
  ncol,fcol,acol : TColor;
begin             // 0 - No check, 1 - Empty check, 2 - Checked
  with Message.DrawItemStruct^ do begin
    State:=TOwnerDrawState(LongRec(itemState).Lo);
    Canvas.Handle:=hDC;
    rcBitmap:=rcItem;
    rcText:=rcItem;
    ItId:=itemID;
    end;
  Canvas.Font:=Font;
  if (StyleServices is TUxThemeStyle) then begin // default style 'Windows'
    ncol:=FColorNotFocus; fcol:=FColorFocus; acol:=Color;
    if (odDisabled in State) then Canvas.Font.Color:=clBtnShadow
    else Canvas.Font.Color:=Font.Color;
    end
  else with StyleServices do begin
    fcol:=GetStyleColor(scHintGradientEnd); ncol:=GetStyleColor(scComboBox);
    acol:=GetStyleColor(scButtonNormal);
    if (odDisabled in State) then Canvas.Font.Color:=GetStyleFontColor(sfComboBoxItemDisabled)
    else Canvas.Font.Color:=GetStyleFontColor(sfComboBoxItemNormal);
    end;
  // Check if we are drawing the static portion of the combobox
  if (ItId<0) or (odComboBoxEdit in State) then begin
    RecalcText;
    if length(FFixedText)>0 then strText:=FFixedText else strText:=sHint;
    with Canvas do begin
      if (odSelected in State) then Brush.Color:=fcol
      else Brush.Color:=ncol;
      FillRect(rcText);
      end
    end
  else begin
    with Canvas do begin
      Brush.Color:=acol;
      FillRect(rcText);
      end;
    strText:=GetLongString(ItId);
    rcBitmap.Left:=2;
    rcBitmap.Top:=rcText.Top+(rcText.Bottom-rcText.Top-FCheckWidth) div 2;
    rcBitmap.Right:=rcBitmap.Left+FCheckWidth;
    rcBitmap.Bottom:=rcBitmap.Top+FCheckHeight;
    rcText.Left:=rcBitmap.Right;
    nState:=DFCS_BUTTONCHECK or DFCS_FLAT;
    if IsChecked(ItId) then nState:=nState or DFCS_CHECKED;
    DrawFrameControl(Canvas.Handle,rcBitmap,DFC_BUTTON,nState);
    end;
  strText:=' '+strText;
  with Canvas do begin
    TextRect(rcText,strText,[]);
    if odFocused in State then DrawFocusRect(rcText);
    Handle:=0;
    end;
  end;

// DefWindowProc
procedure TCheckComboBox.ComboListWndProc(var Message: TMessage);
var
  nItemHeight,nTopIndex,nIndex : integer;
  rcItem,rcClient : TRect;
  pt : TPoint;
begin
  case Message.Msg of
    LB_GETCURSEL: // this is for to not draw the selected in the text area
      begin
        Message.Result:=-1;
        exit;
      end;
    WM_CHAR: // pressing space toggles the checked
      begin
        if (TWMKey(Message).CharCode = VK_SPACE) then begin
          // Get the current selection
          nIndex:=CallWindowProc(FDefListProc,FListHandle,LB_GETCURSEL,
            Message.wParam,Message.lParam);
          SendMessage(FListHandle,LB_GETITEMRECT,nIndex,LongInt(@rcItem));
          InvalidateRect(FListHandle,@rcItem,false);
          SetChecked(nIndex,not IsChecked(nIndex));
          SendMessage(WM_COMMAND,Handle,CBN_SELCHANGE,Handle);
          Message.Result:=0;
          exit;
          end;
        end;
    WM_LBUTTONDOWN:
      begin
        Winapi.Windows.GetClientRect(FListHandle,rcClient);
        pt.x:=TWMMouse(Message).XPos; // LOWORD(Message.lParam);
        pt.y:=TWMMouse(Message).YPos; // HIWORD(Message.lParam);
        if (PtInRect(rcClient,pt)) then begin
          nItemHeight:=SendMessage(FListHandle,LB_GETITEMHEIGHT,0,0);
          nTopIndex:=SendMessage(FListHandle,LB_GETTOPINDEX,0,0);
          // Compute which index to check/uncheck
          nIndex:=trunc(nTopIndex+pt.y / nItemHeight);
          SendMessage(FListHandle,LB_GETITEMRECT,nIndex,LongInt(@rcItem));
          if (PtInRect(rcItem,pt)) then begin
            InvalidateRect(FListHandle,@rcItem,false);
            SetChecked(nIndex,not IsChecked(nIndex));
            SendMessage(WM_COMMAND,Handle,CBN_SELCHANGE,Handle);
          end
        end
      end;
    WM_LBUTTONUP:
      begin
        Message.Result:=0;
        exit;
      end;
  end;
  Message.Result := CallWindowProc(FDefListProc, FListHandle, Message.Msg, Message.wParam, Message.lParam);
//  ComboWndProc(Message,FListHandle,FDefListProc);
end;

procedure TCheckComboBox.WndProc(var Message: TMessage);
var
  lWnd: HWnd;
begin
  if (message.Msg=WM_CTLCOLORLISTBOX) then begin
    // If the listbox hasn't been subclassed yet, do so...
    if (FListHandle = 0) then begin
      lWnd:=message.lParam;
      if (lWnd <> 0) and (lWnd <> FDropHandle) then begin
        // Save the listbox handle
        FListHandle:=lWnd;
        FDefListProc:=Pointer(GetWindowLongPtr(FListHandle,GWL_WNDPROC));
        SetWindowLongPtr(FListHandle,GWL_WNDPROC,LongInt(FListInstance));
        end;
      end;
    end;
  inherited WndProc(Message);
  end;

{ ------------------------------------------------------------------- }
constructor TCheckGroupBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCheckWidth:=GetSystemMetrics(SM_CXMENUCHECK);
  FCheckHeight:=FCheckWidth;
  CbIndent:=MulDiv(FCheckWidth,35,20); //MulDiv(27,PixelsPerInchOnDesign,GetParentForm(TControl(AOwner)).Monitor.PixelsPerInch);
  CheckBox:=TCheckBox.Create(self);
  CheckBox.Parent:=self;
  with CheckBox do begin
    Left:=FCheckWidth div 3; Top:=0; Width:=FCheckWidth; Caption:='';
    OnClick:=CheckClick;
    end;
  Text:=' ';
  end;

destructor TCheckGroupBox.Destroy;
begin
  CheckBox.Free;
  inherited Destroy;
  end;

procedure TCheckGroupBox.AfterConstruction;
begin
  inherited AfterConstruction;
  Checked:=CheckBox.Checked;
  end;

function TCheckGroupBox.GetText : TCaption;
begin
  Result:=CheckBox.Caption;
  end;

procedure TCheckGroupBox.SetText(const Value: TCaption);
begin
  with CheckBox do if Caption<>Value then Caption:=Value;
  end;

function TCheckGroupBox.GetChecked : boolean;
begin
  Result:=CheckBox.Checked;
  end;

procedure TCheckGroupBox.SetChecked (Value : boolean);
begin
  CheckBox.Checked:=Value;
  Invalidate;
  end;

procedure TCheckGroupBox.CheckClick(Sender: TObject);
begin
  Checked:=CheckBox.Checked;
  if Assigned(FOnCheckClick) then OnCheckClick(self);
  end;

procedure TCheckGroupBox.Invalidate;
var
  i : integer;
begin
  for i:=0 to ControlCount-1 do
    if (Controls[i].Name<>CheckBox.Name) then Controls[i].Enabled:=CheckBox.Checked;
  CheckBox.Hint:=Hint;
  inherited Invalidate;
  end;

procedure TCheckGroupBox.Paint;
var
  H: Integer;
  Flags: Longint;
  CaptionRect,
  OuterRect: TRect;
  Size : TSize;
  n    : integer;
  Box  : TThemedButton;
  Details: TThemedElementDetails;

  function FillSpace (len : integer) : string;
  var
    i : integer;
  begin
    Result:='';
    for i:=1 to len do Result:=Result+' ';
    end;

begin
  with Canvas do begin
    Font := Self.Font;
    with CheckBox do begin
      Width:=MulDiv(FCheckWidth+TextWidth(Caption),120,100);
      n:=Length(Caption);
      Size:=TextExtent(Caption);
      end;
    if ThemeControl(Self) then begin
      CaptionRect := Rect(0, 0, Size.cx, Size.cy);
      if not UseRightToLeftAlignment then OffsetRect(CaptionRect, CbIndent, 0)
      else OffsetRect(CaptionRect, Width - CbIndent - CaptionRect.Right, 0);

      OuterRect := ClientRect;
      OuterRect.Top := (CaptionRect.Bottom - CaptionRect.Top) div 2;
      with CaptionRect do ExcludeClipRect(Handle, Left, Top, Right, Bottom);
      if Enabled then Box := tbGroupBoxNormal
      else Box := tbGroupBoxDisabled;
      Details := StyleServices.GetElementDetails(Box);
      StyleServices.DrawElement(Handle, Details, OuterRect);

      SelectClipRgn(Handle, 0);
      Brush.Style := bsClear;
      if IsRightToLeft then begin
        Flags := DrawTextBiDiModeFlags(DT_SINGLELINE);
        StyleServices.DrawText(Handle, Details, FillSpace(n), CaptionRect, Flags, 0);
        end
      else StyleServices.DrawText(Handle, Details, FillSpace(n), CaptionRect, [tfLeft]);
      end
    else begin
      H := TextHeight('0');
      CaptionRect := Rect(0, H div 2 - 1, Width, Height);
      if Ctl3D then begin
        Inc(CaptionRect.Left);
        Inc(CaptionRect.Top);
        Brush.Color := clBtnHighlight;
        FrameRect(CaptionRect);
        OffsetRect(CaptionRect, -1, -1);
        Brush.Color := clBtnShadow;
        end
      else Brush.Color := clWindowFrame;
      FrameRect(CaptionRect);
      end;
    end;
  end;

end.
