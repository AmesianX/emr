{*******************************************************}
{                                                       }
{         ����HCView�ĵ��Ӳ�������  ���ߣ���ͨ          }
{                                                       }
{ �˴������ѧϰ����ʹ�ã�����������ҵĿ�ģ��ɴ�������  }
{ �����ʹ���߳е�������QQȺ 649023932 ����ȡ����ļ��� }
{ ������                                                }
{                                                       }
{*******************************************************}

unit frm_RecordEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.XPMan,
  System.ImageList, Vcl.ImgList, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ToolWin,
  System.Generics.Collections, EmrView, HCView, HCCustomRichData, HCItem,
  EmrGroupItem, EmrElementItem, HCDrawItem, frm_RecordPop;

type
  TfrmRecordEdit = class(TForm)
    tlbTool: TToolBar;
    btnFile: TToolButton;
    btnSave: TToolButton;
    btnprint: TToolButton;
    btn3: TToolButton;
    cbbZoom: TComboBox;
    btnAnnotation: TToolButton;
    btnSymmetryMargin: TToolButton;
    btn4: TToolButton;
    cbbFont: TComboBox;
    btn1: TToolButton;
    cbbFontSize: TComboBox;
    cbBackColor: TColorBox;
    cbFontColor: TColorBox;
    btnBold: TToolButton;
    btnItalic: TToolButton;
    btnUnderLine: TToolButton;
    btnStrikeOut: TToolButton;
    btnSuperScript: TToolButton;
    btnSubScript: TToolButton;
    btnAlignLeft: TToolButton;
    btnAlignCenter: TToolButton;
    btnAlignRight: TToolButton;
    btnAlignJustify: TToolButton;
    btnAlignScatter: TToolButton;
    btnLineSpace: TToolButton;
    btn9: TToolButton;
    sbStatus: TStatusBar;
    il1: TImageList;
    pmRichEdit: TPopupMenu;
    mniCut: TMenuItem;
    mniCopy: TMenuItem;
    mniPaste: TMenuItem;
    mniTable: TMenuItem;
    mniInsertRowTop: TMenuItem;
    mniInsertRowBottom: TMenuItem;
    mniInsertColLeft: TMenuItem;
    mniInsertColRight: TMenuItem;
    mniDeleteRow: TMenuItem;
    mniDeleteCol: TMenuItem;
    mniN25: TMenuItem;
    mniDisBorder: TMenuItem;
    mniPara: TMenuItem;
    pmLineSpace: TPopupMenu;
    mniLineSpace100: TMenuItem;
    mniLineSpace150: TMenuItem;
    mniLineSpace200: TMenuItem;
    pmFile: TPopupMenu;
    mniOpen: TMenuItem;
    mniSave: TMenuItem;
    mniSaveAs: TMenuItem;
    mniPageSet: TMenuItem;
    mniPrint: TMenuItem;
    mniPrintByLine: TMenuItem;
    btnInsertTable: TToolButton;
    mniN1: TMenuItem;
    mniN2: TMenuItem;
    pmInsert: TPopupMenu;
    mniN3: TMenuItem;
    mniN4: TMenuItem;
    mniN5: TMenuItem;
    mniN6: TMenuItem;
    mniN7: TMenuItem;
    mniN8: TMenuItem;
    mniN9: TMenuItem;
    mniN10: TMenuItem;
    N1: TMenuItem;
    mniGif1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBoldClick(Sender: TObject);
    procedure btnprintClick(Sender: TObject);
    procedure cbbZoomChange(Sender: TObject);
    procedure btnAnnotationClick(Sender: TObject);
    procedure btnSymmetryMarginClick(Sender: TObject);
    procedure cbbFontChange(Sender: TObject);
    procedure cbbFontSizeChange(Sender: TObject);
    procedure cbBackColorChange(Sender: TObject);
    procedure cbFontColorChange(Sender: TObject);
    procedure btnAlignLeftClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure mniLineSpace100Click(Sender: TObject);
    procedure mniOpenClick(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure mniInsertRowTopClick(Sender: TObject);
    procedure mniInsertRowBottomClick(Sender: TObject);
    procedure mniInsertColLeftClick(Sender: TObject);
    procedure mniInsertColRightClick(Sender: TObject);
    procedure mniDeleteRowClick(Sender: TObject);
    procedure mniDeleteColClick(Sender: TObject);
    procedure mniDisBorderClick(Sender: TObject);
    procedure mniCutClick(Sender: TObject);
    procedure mniCopyClick(Sender: TObject);
    procedure mniPasteClick(Sender: TObject);
    procedure mniParaClick(Sender: TObject);
    procedure mniSaveAsClick(Sender: TObject);
    procedure mniPrintByLineClick(Sender: TObject);
    procedure pmRichEditPopup(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure mniN3Click(Sender: TObject);
    procedure mniN5Click(Sender: TObject);
    procedure mniN6Click(Sender: TObject);
    procedure mniN8Click(Sender: TObject);
    procedure mniN9Click(Sender: TObject);
    procedure mniN10Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure mniGif1Click(Sender: TObject);
  private
    { Private declarations }
    FfrmRecordPop: TfrmRecordPop;
    FEmrView: TEmrView;
    FDeGroupStack: TStack<Integer>;

    FOnSave, FOnChangedSwitch, FOnReadOnlySwitch: TNotifyEvent;
    //
    function GetFontSizeStr(AFontSize: Integer): string;
    function GetPaperSizeStr(APaperSize: Integer): string;
    procedure GetPagesAndActive;
    procedure DoCaretChange(Sender: TObject);
    procedure DoChangedSwitch(Sender: TObject);
    procedure DoReadOnlySwitch(Sender: TObject);
    procedure DoVerScroll(Sender: TObject);
    procedure DoActiveItemChange(Sender: TObject);
    procedure CurTextStyleChange(const ANewStyleNo: Integer);
    procedure CurParaStyleChange(const ANewStyleNo: Integer);
    //
    function PopupForm: TfrmRecordPop;
    procedure PopupFormClose;
  protected
    procedure DoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DoItemLoaded(const AItem: THCCustomItem);
    procedure DoSave;
  public
    { Public declarations }
    ObjectData: Pointer;
    procedure HideToolbar;
    property EmrView: TEmrView read FEmrView;
    property OnSave: TNotifyEvent read FOnSave write FOnSave;

    /// <summary> Changed״̬�����л�ʱ���� </summary>
    property OnChangedSwitch: TNotifyEvent read FOnChangedSwitch write FOnChangedSwitch;
    property OnReadOnlySwitch: TNotifyEvent read FOnReadOnlySwitch write FOnReadOnlySwitch;
  end;

implementation

uses
  Vcl.Clipbrd, HCCommon, HCStyle, HCTextStyle, HCParaStyle, HCImageItem, System.DateUtils,
  frm_InsertTable, frm_Paragraph, HCTableItem, HCCheckBoxItem, HCExpressItem,
  HCGifItem;

{$R *.dfm}

procedure TfrmRecordEdit.btnAlignLeftClick(Sender: TObject);
begin
  case (Sender as TToolButton).Tag of
    0: FEmrView.ApplyParaAlignHorz(TParaAlignHorz.pahLeft);
    1: FEmrView.ApplyParaAlignHorz(TParaAlignHorz.pahCenter);
    2: FEmrView.ApplyParaAlignHorz(TParaAlignHorz.pahRight);
    3: FEmrView.ApplyParaAlignHorz(TParaAlignHorz.pahJustify);  // ����
    4: FEmrView.ApplyParaAlignHorz(TParaAlignHorz.pahScatter);  // ��ɢ
  end;
end;

procedure TfrmRecordEdit.btnAnnotationClick(Sender: TObject);
begin
  FEmrView.ShowAnnotation := not FEmrView.ShowAnnotation;
end;

procedure TfrmRecordEdit.btnBoldClick(Sender: TObject);
begin
  case (Sender as TToolButton).Tag of
    0: FEmrView.ApplyTextStyle(TFontStyleEx.tsBold);
    1: FEmrView.ApplyTextStyle(TFontStyleEx.tsItalic);
    2: FEmrView.ApplyTextStyle(TFontStyleEx.tsUnderline);
    3: FEmrView.ApplyTextStyle(TFontStyleEx.tsStrikeOut);
    4: FEmrView.ApplyTextStyle(TFontStyleEx.tsSuperscript);
    5: FEmrView.ApplyTextStyle(TFontStyleEx.tsSubscript);
  end;
end;

procedure TfrmRecordEdit.btnprintClick(Sender: TObject);
begin
  FEmrView.Print('');
end;

procedure TfrmRecordEdit.btnSaveClick(Sender: TObject);
begin
  DoSave;
end;

procedure TfrmRecordEdit.btnSymmetryMarginClick(Sender: TObject);
begin
  FEmrView.SymmetryMargin := not FEmrView.SymmetryMargin;
end;

procedure TfrmRecordEdit.cbbFontChange(Sender: TObject);
begin
  FEmrView.ApplyTextFontName(cbbFont.Text);
  if not FEmrView.Focused then
    FEmrView.SetFocus;
end;

procedure TfrmRecordEdit.cbbFontSizeChange(Sender: TObject);
begin
  FEmrView.ApplyTextFontSize(GetFontSize(cbbFontSize.Text));
  if not FEmrView.Focused then
    FEmrView.SetFocus;
end;

procedure TfrmRecordEdit.cbbZoomChange(Sender: TObject);
begin
  FEmrView.Zoom := (StrToInt(cbbZoom.Text) / 100);
end;

procedure TfrmRecordEdit.cbBackColorChange(Sender: TObject);
begin
  FEmrView.ApplyTextBackColor(cbBackColor.Selected);
  if not FEmrView.Focused then
    FEmrView.SetFocus;
end;

procedure TfrmRecordEdit.cbFontColorChange(Sender: TObject);
begin
  FEmrView.ApplyTextColor(cbFontColor.Selected);
  if not FEmrView.Focused then
    FEmrView.SetFocus;
end;

procedure TfrmRecordEdit.CurParaStyleChange(const ANewStyleNo: Integer);
var
  vAlignHorz: TParaAlignHorz;
begin
  if ANewStyleNo >= 0 then
  begin
    vAlignHorz := FEmrView.Style.ParaStyles[ANewStyleNo].AlignHorz;

    btnAlignLeft.Down := vAlignHorz = TParaAlignHorz.pahLeft;
    btnAlignRight.Down := vAlignHorz = TParaAlignHorz.pahRight;
    btnAlignCenter.Down := vAlignHorz = TParaAlignHorz.pahCenter;
    btnAlignJustify.Down := vAlignHorz = TParaAlignHorz.pahJustify;
    btnAlignScatter.Down := vAlignHorz = TParaAlignHorz.pahScatter;

    case FEmrView.Style.ParaStyles[ANewStyleNo].LineSpace of
      THCStyle.LineSpace100: mniLineSpace100.Checked := True;
      THCStyle.LineSpace150: mniLineSpace150.Checked := True;
      THCStyle.LineSpace200: mniLineSpace200.Checked := True;
    end;
  end;
end;

procedure TfrmRecordEdit.CurTextStyleChange(const ANewStyleNo: Integer);
begin
  if ANewStyleNo >= 0 then
  begin
    cbbFont.ItemIndex := cbbFont.Items.IndexOf(FEmrView.Style.TextStyles[ANewStyleNo].Family);
    cbbFontSize.ItemIndex := cbbFontSize.Items.IndexOf(GetFontSizeStr(FEmrView.Style.TextStyles[ANewStyleNo].Size));
    btnBold.Down := tsBold in FEmrView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnItalic.Down := tsItalic in FEmrView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnUnderline.Down := tsUnderline in FEmrView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnStrikeOut.Down := tsStrikeOut in FEmrView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnSuperscript.Down := tsSuperscript in FEmrView.Style.TextStyles[ANewStyleNo].FontStyle;
    btnSubscript.Down := tsSubscript in FEmrView.Style.TextStyles[ANewStyleNo].FontStyle;
  end
  else
  begin
    btnBold.Down := False;
    btnItalic.Down := False;
    btnUnderline.Down := False;
    btnStrikeOut.Down := False;
    btnSuperscript.Down := False;
    btnSubscript.Down := False;
  end;
end;

procedure TfrmRecordEdit.DoActiveItemChange(Sender: TObject);
begin
  FEmrView.ActiveSection.ReFormatActiveItem;
end;

procedure TfrmRecordEdit.DoCaretChange(Sender: TObject);
begin
  GetPagesAndActive;

  CurTextStyleChange(FEmrView.Style.CurStyleNo);
  CurParaStyleChange(FEmrView.Style.CurParaNo);
end;

procedure TfrmRecordEdit.DoChangedSwitch(Sender: TObject);
begin
  if Assigned(FOnChangedSwitch) then
    FOnChangedSwitch(Self);
end;

procedure TfrmRecordEdit.DoItemLoaded(const AItem: THCCustomItem);
begin
end;

procedure TfrmRecordEdit.DoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  PopupFormClose;
end;

procedure TfrmRecordEdit.DoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  vActiveItem: THCCustomItem;
  vDeItem: TDeItem;
  vDeGroup: TDeGroup;
  vActiveDrawItem: THCCustomDrawItem;
  vPt: TPoint;
  vInfo: string;
begin
  vInfo := '';

  //if FEmrView.ActiveSection.ActiveData = nil then Exit;

  if FEmrView.ActiveSection.ActiveData.ReadOnly then Exit;

  vActiveItem := FEmrView.GetActiveItem;
  if vActiveItem <> nil then
  begin
    if vActiveItem is TDeItem then
    begin
      vDeItem := vActiveItem as TDeItem;
      if vDeItem[TDeProp.Index] = '' then Exit;

      if FEmrView.ActiveSection.ActiveData.ActiveDomain <> nil then
      begin
        vDeGroup := FEmrView.ActiveSection.ActiveData.Items[
          FEmrView.ActiveSection.ActiveData.ActiveDomain.BeginNo] as TDeGroup;
        vInfo := vDeGroup[TDeProp.Name];
      end;
      vActiveDrawItem := FEmrView.GetActiveDrawItem;
      if vDeItem.Active
        and (not vDeItem.IsSelectComplate)
        and (not vDeItem.IsSelectPart)
      then
      begin
        vInfo := vInfo + vDeItem[TDeProp.Name];
        sbStatus.Panels[1].Text := vInfo + '(' + vDeItem[TDeProp.Index] + ')';
        vPt := FEmrView.GetActiveDrawItemCoord;
        vPt.Y := vPt.Y + FEmrView.ZoomIn(vActiveDrawItem.Height);
        vPt.Offset(FEmrView.Left, FEmrView.Top);
        //PopupForm.Left := vPt.X + FEmrView.Left;
        //PopupForm.Top := vPt.Y + FEmrView.Top;
        vPt := ClientToScreen(vPt);

        PopupForm.PopupDeItem(vDeItem, vPt);
      end
      else
        sbStatus.Panels[1].Text := vInfo + '(' + vDeItem[TDeProp.Index] + ')';
    end;
  end;
end;

procedure TfrmRecordEdit.DoReadOnlySwitch(Sender: TObject);
begin
  if Assigned(FOnReadOnlySwitch) then
    FOnReadOnlySwitch(Self);
end;

procedure TfrmRecordEdit.DoSave;
begin
  if Assigned(FOnSave) and (not FEmrView.ReadOnly) then
    FOnSave(Self);
end;

procedure TfrmRecordEdit.DoVerScroll(Sender: TObject);
begin
  GetPagesAndActive;
  PopupFormClose;
end;

procedure TfrmRecordEdit.FormCreate(Sender: TObject);
begin
  cbbFont.Items := Screen.Fonts;
  cbbFont.ItemIndex := cbbFont.Items.IndexOf('����');

  FDeGroupStack := TStack<Integer>.Create;

  FEmrView := TEmrView.Create(Self);
  FEmrView.OnMouseDown := DoMouseDown;
  FEmrView.OnMouseUp := DoMouseUp;
  FEmrView.OnCaretChange := DoCaretChange;
  FEmrView.OnVerScroll := DoVerScroll;
  FEmrView.OnChangedSwitch := DoChangedSwitch;
  FEmrView.OnReadOnlySwitch := DoReadOnlySwitch;
  FEmrView.PopupMenu := pmRichEdit;
  FEmrView.Parent := Self;
  FEmrView.Align := alClient;
end;

procedure TfrmRecordEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(FfrmRecordPop) then
    FreeAndNil(FfrmRecordPop);
  FEmrView.Free;
  FDeGroupStack.Free;
end;

function TfrmRecordEdit.GetFontSizeStr(AFontSize: Integer): string;
begin
  Result := IntToStr(AFontSize);
  if AFontSize = 42 then Result := '����';
  if AFontSize = 36 then Result := 'С��';
  if AFontSize = 26 then Result := 'һ��';
  if AFontSize = 24 then Result := 'Сһ';
  if AFontSize = 22 then Result := '����';
  if AFontSize = 18 then Result := 'С��';
  if AFontSize = 16 then Result := '����';
  if AFontSize = 15 then Result := 'С��';
  if AFontSize = 14 then Result := '�ĺ�';
  if AFontSize = 12 then Result := 'С��';
  if AFontSize = 11 then Result := '���';
  if AFontSize = 9 then Result := 'С��';
  if AFontSize = 7 then Result := '����';
  if AFontSize = 6 then Result := 'С��';
  if AFontSize = 5 then Result := '�ߺ�';
end;

procedure TfrmRecordEdit.GetPagesAndActive;
begin
  sbStatus.Panels[0].Text := 'Ԥ��' + IntToStr(FEmrView.PagePreviewFirst + 1)
    + 'ҳ ���' + IntToStr(FEmrView.ActivePageIndex + 1)
    + 'ҳ ��' + IntToStr(FEmrView.PageCount) + 'ҳ';
end;

function TfrmRecordEdit.GetPaperSizeStr(APaperSize: Integer): string;
begin
  case APaperSize of
    DMPAPER_A3: Result := 'A3';
    DMPAPER_A4: Result := 'A4';
    DMPAPER_A5: Result := 'A5';
    DMPAPER_B5: Result := 'B5';
  else
    Result := '�Զ���';
  end;
end;

procedure TfrmRecordEdit.HideToolbar;
begin
  tlbTool.Visible := False;
end;

procedure TfrmRecordEdit.mniOpenClick(Sender: TObject);
var
  vOpenDlg: TOpenDialog;
begin
  if FEmrView.ReadOnly then Exit;

  vOpenDlg := TOpenDialog.Create(Self);
  try
    vOpenDlg.Filter := '�ļ�|*' + HC_EXT;
    if vOpenDlg.Execute then
    begin
      if vOpenDlg.FileName <> '' then
        FEmrView.LoadFromFile(vOpenDlg.FileName);
    end;
  finally
    FreeAndNil(vOpenDlg);
  end;
end;

procedure TfrmRecordEdit.mniPrintByLineClick(Sender: TObject);
begin
  FEmrView.PrintCurPageByActiveLine(False, False);
end;

procedure TfrmRecordEdit.mniSaveAsClick(Sender: TObject);
var
  vSaveDlg: TSaveDialog;
  vFileName: string;
begin
  vSaveDlg := TSaveDialog.Create(nil);
  try
    vSaveDlg.Filter := '�ļ�|*' + HC_EXT;
    if vSaveDlg.Execute then
    begin
      if vSaveDlg.FileName <> '' then
      begin
        vFileName := vSaveDlg.FileName;
        if ExtractFileExt(vFileName) <> HC_EXT then
          vFileName := vFileName + HC_EXT;

        FEmrView.SaveToFile(vFileName);
      end;
    end;
  finally
    FreeAndNil(vSaveDlg);
  end;
end;

procedure TfrmRecordEdit.N1Click(Sender: TObject);
begin
  FEmrView.InsertSectionBreak;
end;

procedure TfrmRecordEdit.pmRichEditPopup(Sender: TObject);
begin
  if FEmrView.ActiveSection.SelectExists then
  begin
    mniCut.Enabled := not FEmrView.ActiveSection.ActiveData.GetTopLevelData.ReadOnly;
    mniCopy.Enabled := True;
  end
  else
  begin
    mniCut.Enabled := False;
    mniCopy.Enabled := False;
  end;

  mniTable.Enabled := FEmrView.ActiveSection.ActiveData.GetCurItem is THCTableItem;  // ����GetTopLevelData�������ڵ�Ԫ����ʱ�Ҽ����ܲ���������
  mniPaste.Enabled :=
          Clipboard.HasFormat(HC_FILEFORMAT)  // hcf��ʽ
          or Clipboard.HasFormat(CF_TEXT);  // �ı���ʽ
end;

function TfrmRecordEdit.PopupForm: TfrmRecordPop;
begin
  if not Assigned(FfrmRecordPop) then
  begin
    FfrmRecordPop := TfrmRecordPop.Create(nil);
    FfrmRecordPop.OnActiveItemChange := DoActiveItemChange;
    FfrmRecordPop.Parent := Self;
  end;

  Result := FfrmRecordPop;
end;

procedure TfrmRecordEdit.PopupFormClose;
begin
  if PopupForm.Visible then
    PopupForm.Close;
end;

procedure TfrmRecordEdit.mniDeleteColClick(Sender: TObject);
begin
  FEmrView.ActiveTableDeleteCol(1);
end;

procedure TfrmRecordEdit.mniDeleteRowClick(Sender: TObject);
begin
  FEmrView.ActiveTableDeleteRow(1);
end;

procedure TfrmRecordEdit.mniDisBorderClick(Sender: TObject);
var
  vTable: THCTableItem;
begin
  if FEmrView.ActiveSection.ActiveData.GetCurItem is THCTableItem then
  begin
    vTable := FEmrView.ActiveSection.ActiveData.GetCurItem as THCTableItem;
    vTable.BorderVisible := not vTable.BorderVisible;
    FEmrView.UpdateBuffer;
  end;
end;

procedure TfrmRecordEdit.mniGif1Click(Sender: TObject);
var
  vOpenDlg: TOpenDialog;
  vGifItem: THCGifItem;
begin
  vOpenDlg := TOpenDialog.Create(Self);
  try
    vOpenDlg.Filter := 'ͼ���ļ�|*.gif';
    if vOpenDlg.Execute then
    begin
      if vOpenDlg.FileName <> '' then
      begin
        vGifItem := THCGifItem.Create(FEmrView.ActiveSection.ActiveData.GetTopLevelData);
        vGifItem.LoadFromFile(vOpenDlg.FileName);
        Application.ProcessMessages;  // ���˫�����ļ��󣬴����²�ؼ���Mousemove��Mouseup�¼�
        FEmrView.InsertItem(vGifItem);
      end;
    end;
  finally
    FreeAndNil(vOpenDlg);
  end;
end;

procedure TfrmRecordEdit.mniInsertColLeftClick(Sender: TObject);
begin
  FEmrView.ActiveTableInsertColBefor(1);
end;

procedure TfrmRecordEdit.mniInsertColRightClick(Sender: TObject);
begin
  FEmrView.ActiveTableInsertColAfter(1);
end;

procedure TfrmRecordEdit.mniInsertRowBottomClick(Sender: TObject);
begin
  FEmrView.ActiveTableInsertRowAfter(1);
end;

procedure TfrmRecordEdit.mniInsertRowTopClick(Sender: TObject);
begin
  FEmrView.ActiveTableInsertRowBefor(1);
end;

procedure TfrmRecordEdit.mniLineSpace100Click(Sender: TObject);
begin
  if Sender is TMenuItem then
  begin
    case (Sender as TMenuItem).Tag of
      0: FEmrView.ApplyParaLineSpace(THCStyle.LineSpace100);
      1: FEmrView.ApplyParaLineSpace(THCStyle.LineSpace150);
      2: FEmrView.ApplyParaLineSpace(THCStyle.LineSpace200);
    end;
  end;
end;

procedure TfrmRecordEdit.mniN10Click(Sender: TObject);
begin
  FEmrView.InsertPageBreak;
end;

procedure TfrmRecordEdit.mniN1Click(Sender: TObject);
begin
  FEmrView.MergeTableSelectCells;
end;

procedure TfrmRecordEdit.mniN2Click(Sender: TObject);
begin
  FEmrView.ClearData;
end;

procedure TfrmRecordEdit.mniN3Click(Sender: TObject);
var
  vFrmInsertTable: TfrmInsertTable;
begin
  vFrmInsertTable := TfrmInsertTable.Create(Self);
  try
    vFrmInsertTable.ShowModal;
    if vFrmInsertTable.ModalResult = mrOk then
      FEmrView.InsertTable(StrToInt(vFrmInsertTable.edtRows.Text),
        StrToInt(vFrmInsertTable.edtCols.Text));
  finally
    FreeAndNil(vFrmInsertTable);
  end;
end;

procedure TfrmRecordEdit.mniN5Click(Sender: TObject);
var
  vCheckBox: THCCheckBoxItem;
begin
  vCheckBox := THCCheckBoxItem.Create(FEmrView.ActiveSection.ActiveData.GetTopLevelData, '��ѡ��', False);
  FEmrView.InsertItem(vCheckBox);
end;

procedure TfrmRecordEdit.mniN6Click(Sender: TObject);
var
  vOpenDlg: TOpenDialog;
  vImageItem: THCImageItem;
begin
  vOpenDlg := TOpenDialog.Create(Self);
  try
    vOpenDlg.Filter := 'bmp�ļ�|*.bmp';
    if vOpenDlg.Execute then
    begin
      if vOpenDlg.FileName <> '' then
      begin
        vImageItem := THCImageItem.Create(FEmrView.ActiveSection.ActiveData.GetTopLevelData);
        vImageItem.LoadFromBmpFile(vOpenDlg.FileName);
        Application.ProcessMessages;  // ���˫�����ļ��󣬴����²�ؼ���Mousemove��Mouseup�¼�
        FEmrView.InsertItem(vImageItem);
      end;
    end;
  finally
    FreeAndNil(vOpenDlg);
  end;
end;

procedure TfrmRecordEdit.mniN8Click(Sender: TObject);
var
  vExpressItem: THCExperssItem;
begin
  vExpressItem := THCExperssItem.Create(FEmrView.ActiveSection.ActiveData.GetTopLevelData,
    '12', '5-6', FormatDateTime('YYYY-MM-DD', Now), '28-30');
  FEmrView.InsertItem(vExpressItem);
end;

procedure TfrmRecordEdit.mniN9Click(Sender: TObject);
begin
  FEmrView.InsertLine(1);
end;

procedure TfrmRecordEdit.mniParaClick(Sender: TObject);
var
  vFrmParagraph: TfrmParagraph;
begin
  vFrmParagraph := TfrmParagraph.Create(Self);
  try
    vFrmParagraph.edtLineSpace.Text := IntToStr(FEmrView.Style.ParaStyles[FEmrView.Style.CurParaNo].LineSpace);
    vFrmParagraph.cbbAlignHorz.ItemIndex := Ord(FEmrView.Style.ParaStyles[FEmrView.Style.CurParaNo].AlignHorz);
    vFrmParagraph.cbbAlignVert.ItemIndex := Ord(FEmrView.Style.ParaStyles[FEmrView.Style.CurParaNo].AlignVert);
    vFrmParagraph.clrbxBG.Color := FEmrView.Style.ParaStyles[FEmrView.Style.CurParaNo].BackColor;

    vFrmParagraph.ShowModal;
    if vFrmParagraph.ModalResult = mrOk then
    begin
      FEmrView.BeginUpdate;
      try
        FEmrView.ApplyParaLineSpace(StrToIntDef(vFrmParagraph.edtLineSpace.Text, 8));
        FEmrView.ApplyParaAlignHorz(TParaAlignHorz(vFrmParagraph.cbbAlignHorz.ItemIndex));
        FEmrView.ApplyParaAlignVert(TParaAlignVert(vFrmParagraph.cbbAlignVert.ItemIndex));
        FEmrView.ApplyParaBackColor(vFrmParagraph.clrbxBG.Color);
      finally
        FEmrView.EndUpdate;
      end;
    end;
  finally
    FreeAndNil(vFrmParagraph);
  end;
end;

procedure TfrmRecordEdit.mniCopyClick(Sender: TObject);
begin
  FEmrView.Copy;
end;

procedure TfrmRecordEdit.mniCutClick(Sender: TObject);
begin
  FEmrView.Cut;
end;

procedure TfrmRecordEdit.mniPasteClick(Sender: TObject);
begin
  FEmrView.Paste;
end;

end.