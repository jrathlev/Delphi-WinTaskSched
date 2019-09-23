(* Resource strings for WinTask

   © Dr. J. Rathlev, D-24222 Schwentinental (kontakt(a)rathlev-home.de)

   The contents of this file may be used under the terms of the
   Mozilla Public License ("MPL") or
   GNU Lesser General Public License Version 2 or later (the "LGPL")

   Software distributed under this License is distributed on an "AS IS" basis,
   WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
   the specific language governing rights and limitations under the License.

   Vers. 1.0 - Oct. 2017
   last modified: Vers. 1.3 - Jan. 2018
   *)

unit WinTaskConsts;

interface

resourcestring
  rsFormatError  = 'Format error: ';

  rsTrgUnknown    = 'Unknown';  // Unbekannt
  rsTrgReady      = 'Ready';    // Bereit
  rsTrgQueued     = 'Queued';   // In Warteschlange
  rsTrgRunning    = 'Running';  // Wird ausgeführt
  rsTrgDisabled   = 'Disabled'; // Deaktiviert

  rsTrgActionExec    = 'Start a program';      // Programm starten
  rsTragActionCom    = 'File handler';
  rsTragActionMail   = 'Send an email';        // E-Mail senden
  rsTragActionMsg    = 'Display a message';    // Meldung anzeigen

  rsTrgTypeEvent      = 'On an event';         // Bei einem Ereignis
  rsTrgTypeTime       = 'One time';            // Einmal
  rsTrgTypeDaily      = 'Daily';               // Täglich
  rsTrgTypeWeekly     = 'Weekly';              // Wöchentlich
  rsTrgTypeMonthly    = 'Monthly';             // Monatlich
  rsTrgTypeIdle       = 'On idle';             // Im Leerlauf
  rsTrgTypeRegister   = 'On task creation/modification'; // Bei Aufgabenerstellung/-änderung
  rsTrgTypeStartup    = 'At startup';          // Beim Start
  rsTrgTypeLogon      = 'At log on';           // Bei Anmeldung
  rsTrgTypeStateChg   = 'On session state change';
  rsTrgTypeCustom     = 'Custom trigger';

  rsTrgFirst      = 'First';      // Ersten
  rsTrgSecond     = 'Second';     // Zweiten
  rsTrgThird      = 'Third';      // Dritten
  rsTrgFourth     = 'Fourth';     // Vierten
  rsTrgFifth      = 'Fifth';      // Fünften
  rsTrgLast       = 'Last';       // Letzten

  rsTrgSec = 'second';                   // Sekunde
  rsTrgSecs = 'seconds';                 // Sekunden
  rsTrgEverySec = 'every second';        // jede Sekunde
  rsTrgEverySecs = 'every %u seconds';   // alle %u Sekunden
  rsTrgMin = 'minute';                   // Minute
  rsTrgMins = 'minutes';                 // Minuten
  rsTrgEveryMin = 'every minute';        // jede Minute
  rsTrgEveryMins = 'every %u minutes';   // alle %u Minuten
  rsTrgHour = 'hour';                    // Stunde
  rsTrgHours = 'hours';                  // Stunden
  rsTrgEveryHour = 'every hour';         // jede Stunde
  rsTrgEveryHours = 'every %u hours';    // alle %u Stunden
  rsTrgDay = 'day';                      // Tag
  rsTrgDays = '%u days';                 // Tage
  rsTrgEveryDay = 'every day';           // jeden Tag
  rsTrgEveryDays = 'every %u days';      // alle %u Tage
  rsTrgOnce = 'At %0:s on %1:s';         // Um %0:s am %1:s

  rsTrgDailyAt = 'At %s every day';      // Jeden Tag um %s
  rsTrgRDailyAt = 'At %0:s every %1:u days';  // Um %0:s alle %1:u Tage
  rsTrgWeekly = 'At %0:s every %1:s of every week, starting %2:s';  // Wöchentlich um %0:s jeden %1:s, beginnend mit dem %2:s
  rsTrgRWeekly = 'At %0:s every %1:s of every %2:u weeks, starting %3:s';  // Um %0:s jeden %1:s alle %2:u Wochen, beginnend mit dem %3:s
  rsTrgMonthly = 'At %0:s on %1:s of %2:s, starting %3:s';  // Um %0:s am %1:s %2:s, beginnend mit dem %3:s
  rsTrgDMonthly = 'Runs on the %0:s %1:s, each %2:s starting %3:s';  // Wird am %0:s %1:s jeden %2:s beginnend mit dem %3:s ausgeführt
  rsTrgAnyLogon = 'At logon of any user';
  rsTrgLogon = 'At logon of %s';          // Bei Anmeldung eines Benutzers
  rsTrgStartup = 'At system startup';     // Beim Systemstart
  rsTrgIdle = 'When computer is idle';    // Wenn der Computer inaktiv ist
  rsTrgEvent = 'On an event';             // Bei einem Ereignis
  rsTrgEventTime = ', starting at %0:s on %1:s';

  rsTrgRegistration = 'When task is created or modified';  // Bei Aufgabenerstellung oder -änderung

  rsTrgRepeat = ' - After triggered, repeat every %0:s for a duration of %1:s'; // Nach Auslösung alle %0:s für die Dauer von %1:s wiederholen

  rsCompAT = 'deprecated';
  rsXP = 'Windows XP';
  rsVista = 'Windows Vista';
  rsWin7 = 'Windows 7';
  rsWin10 = 'Windows 10';

implementation
  
end.
  
