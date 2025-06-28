unit Forms.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Menus, ActnList, StdActns, myclocale, LCLTranslator, DefaultTranslator;

type
{ TfrmMain }
  TfrmMain = class(TForm)
    actLocaleShow: TAction;
    actLocaleChangeLanguage: TAction;
    actLocaleDateTime: TAction;
    actLocaleNumbers: TAction;
    ActionList: TActionList;
    btnLocaleNumbers: TButton;
    btnLocaleDateTime: TButton;
    btnFileExit: TButton;
    btnLocaleShow: TButton;
    cbxLanguages: TComboBox;
    actFileExit: TFileExit;
    MainMenu: TMainMenu;
    memLog: TMemo;
    mnuLocaleShow: TMenuItem;
    mnuFile: TMenuItem;
    mnuFileExit: TMenuItem;
    mnuLocale: TMenuItem;
    mnuLocaleNumbers: TMenuItem;
    mnuLocaleDateTime: TMenuItem;
    panButtons: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure actLocaleChangeLanguageExecute(Sender: TObject);
    procedure actLocaleDateTimeExecute(Sender: TObject);
    procedure actLocaleNumbersExecute(Sender: TObject);
    procedure actLocaleShowExecute(Sender: TObject);
  private
    procedure InitShortCuts;
    procedure InitComponents;
  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

uses
  LCLType
;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  InitShortCuts;
  InitComponents;
end;

procedure TfrmMain.InitShortCuts;
begin
{$IFDEF UNIX}
  actFileExit.ShortCut := KeyToShortCut(VK_Q, [ssCtrl]);
{$ENDIF}
{$IFDEF WINDOWS}
  actFileExit.ShortCut := KeyToShortCut(VK_X, [ssAlt]);
{$ENDIF}
end;

procedure TfrmMain.InitComponents;
begin
  cbxLanguages.ItemIndex:= 0;
end;

procedure TfrmMain.actLocaleChangeLanguageExecute(Sender: TObject);
begin
  memLog.Append(Format('Changing to: %s', [cbxLanguages.Text]));
  try
    case cbxLanguages.ItemIndex of
      0: begin
        memLog.Append(Format('LCL: %s', [SetDefaultLang('en')]));
        GetFormatSettings('en_GB.UTF8', DefaultFormatSettings);
        memLog.Append(Format('LC_ALL: %s', [LatestLocale]));
      end;
      1: begin
        memLog.Append(Format('LCL: %s', [SetDefaultLang('pt')]));
        GetFormatSettings('pt_PT.UTF8', DefaultFormatSettings);
        memLog.Append(Format('LC_ALL: %s', [LatestLocale]));
      end;
      2: begin
        memLog.Append(Format('LCL: %s', [SetDefaultLang('fr')]));
        GetFormatSettings('fr_FR.UTF8', DefaultFormatSettings);
        memLog.Append(Format('LC_ALL: %s', [LatestLocale]));
      end;
      3: begin
        memLog.Append(Format('LCL: %s', [SetDefaultLang('de')]));
        GetFormatSettings('de_DE.UTF8', DefaultFormatSettings);
        memLog.Append(Format('LC_ALL: %s', [LatestLocale]));
      end;
      otherwise
        memLog.Append(Format('LCL: %s', [SetDefaultLang('en')]));
        GetFormatSettings('en_US.UTF8', DefaultFormatSettings);
        memLog.Append(Format('LC_ALL: %s', [LatestLocale]));
    end;
  except
    on E:Exception do
    begin
      memLog.Append('ERROR: ' + E.Message);
    end;
  end;
end;

procedure TfrmMain.actLocaleNumbersExecute(Sender: TObject);
begin
  memLog.Append(Format('%d: %s', [10000, FormatFloat('#,#', 10000)]));
end;

procedure TfrmMain.actLocaleDateTimeExecute(Sender: TObject);
begin
  memLog.Append(Format('Now: %s', [DateTimeToSTr(Now)]));
end;

procedure TfrmMain.actLocaleShowExecute(Sender: TObject);
begin
  memLog.Append(Format('Locale: %s', [LatestLocale]));
end;

end.

