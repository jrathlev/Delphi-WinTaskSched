(* Delphi Unit
   resource strings of several units - German

   © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

   The contents of this file may be used under the terms of the
   Mozilla Public License ("MPL") or
   GNU Lesser General Public License Version 2 or later (the "LGPL")

   Software distributed under this License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.

   Vers. 1 - Jan. 2016
   last updated: Feb. 2017
   *)

unit UnitConsts;

interface

resourcestring

{ ------------------------------------------------------------------- }
// Strings from ExtSysUtils
  rsFormatError  = 'Format-Fehler: ';

{ ------------------------------------------------------------------- }
// Strings from NumberUtil
  rsHexError = '%s ist kein gültiger Hexwert';
  rsOctError = '%s ist kein gültiger Oktalwert';
  rsBinError = '%s ist kein gültiger Binärwert';

{ ------------------------------------------------------------------- }
// Strings from LangUtils
  rsSystemDefault = '&System-Standard';
  rsLangRestart = 'Der Wechsel der Sprache erfordert einen Neustart des Programms!';

{ ------------------------------------------------------------------- }
// Strings from TextFilter
  rsIllRegExp = 'Ungültiger regulärer Ausdruck!';
  rsIllmask = 'Ungültiger Maske!';

{ ------------------------------------------------------------------- }
// Strings from WinExecute
  rsExecuteError = 'Fehler beim Ausführen eines Prozesses';
  rsCreatePipeError = 'Erzeugung einer Pipe für StdOut ist fehlgeschlagen';
  rsDupHandleError = 'Die Funktion DuplicateHandle ist fehlgeschlagen';
  rsCloseHandleError = 'Das Schließen eines Handle ist fehlgeschlagen';

{ ------------------------------------------------------------------- }
// Strings from CpDrv
  rsComNoError = 'Keine Fehler bei COM-Verbindung';
  rsComOpenError = 'Fehler beim Öffnen des COM-Ports';
  rsComStateError = 'Fehler beim Setzen des COM-Port-Status';
  rsComFlushError = 'Fehler beim Leeren der COM-Puffer';
  rsComSetupError = 'Fehler beim Initialisieren des COM-Ports';

{ ------------------------------------------------------------------- }
// Strings from WinUtils
  rsUnknownError = 'Unbekannter Systemfehler';
  rsWindowsError = 'Windows-Fehler';
  rsStorageError = 'Storage-Fehler';
  rsRpcError = 'Fehler beim Remote Procedure Call';
  rsInterfaceError = 'Interface-Fehler';
  rsDispatchError = 'Dispatch-Fehler';
  rsPreWin32Error = 'Fehler in SHFileOperation';
  rsShellExec = 'ShellExecute-Fehler';

{ ------------------------------------------------------------------- }
// Strings from SystemInfo
  rsVersionLongStr = '%s%s (Version %d.%d, Build %d, %6:s)';
  rsSPVersionLongStr = '%s%s - Service Pack %5:d (Version %2:d.%3:d, Build %4:d, %6:s)';
  rsVersion10LongStr = '%s%s (Version %d, Build %d, %s)';
  rsVersionShortStr = '%s (%2:s)';
  rsSPVersionShortStr = '%s Service Pack %1:d (%2:s)';
  rsVersion10ShortStr = '%s (Version %d, %s)';
  rsVersion10Str = '%s (Version %d, Build %d, %s)';

  rsProfessionalN = 'Professional';
  rsProfessionalMC = 'Professional mit Media Center';
  rsBusiness = 'Business';
  rsClusterServer = 'Cluster Server';
  rsDataCenterFull = 'Server Datacenter (full)';
  rsDataCenterCode = 'Server Datacenter (core)';
  rsEnterprise = 'Enterprise';
  rsEnterpriseServerF = 'Server Enterprise (full)';
  rsEnterpriseServerC = 'Server Enterprise (core)';
  rsEnterpriseServerIT = 'Server Enterprise für Itanium-basierte Systems';
  rsHomeBasic = 'Home Basic';
  rsHomePremium = 'Home Premium';
  rsHomePremiumS = 'Home Premium Server';
  rsHomeServer = 'Home Server';
  rsHyperV = 'Hyper-V Server';
  rsEssBusinessMan = 'Essential Business Management Server';
  rsEssBusinessSec = 'Essential Business Security Server';
  rsEssBusinessMess = 'Essential Business Messaging Server';
  rsEssServer = 'Essential Server';
  rsEssServerV = 'Essential Server ohne Hyper-V';
  rsServerFound = 'Server Foundation';
  rsSmallBusiness = 'Small Business Server';
  rsSmallBusinessP = 'Small Business Server Premium';
  rsStandardServer = 'Server Standard Edition (full)';
  rsStandardServerC = 'Server Standard Edition (core)';
  rsStarter = 'Starter Edition';
  rsStgEnterprise = 'Storage Server Enterprise';
  rsStgExpress = 'Storage Server Express';
  rsStgStandard = 'Storage Server Standard';
  rsStgWorkgroup = 'Storage Server Workgroup';
  rsUltimate = 'Ultimate Edition';
  rsWebServer = 'Web Server Edition';
  rsWebServerC = 'Web Server Edition (core)';
  rsUnlicensed = 'Nicht lizensiertes Produkt';

{ ------------------------------------------------------------------- }
// Misc.
  rsVersion = 'Vers.';
  rsLongCopyRight = '%s Dr. J. Rathlev'+sLineBreak+' D-24222 Schwentinental';
  rsCopyRight = '%s Dr. J. Rathlev';
  rsNotAvail = 'nicht verfügbar';
  rsConnectTo = 'Verbinden mit ..';
  rsUnknown = '<Unbekannt>';
  rsHashError = 'Keine Hash-Datei gefunden';
  rsMD5Error = 'MD5-Überprüfung fehlgeschlagen';
  rsShaError = 'SHA256-Überprüfung fehlgeschlagen';

implementation

end.
