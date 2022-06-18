#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;SetWorkingDir, C:\AHK\2nd-keyboard\ ;Or you could put the directory here. Whatevs.
Menu, Tray, Icon, shell32.dll, 283 ;changes the taskbar icon to something
;SetKeyDelay, 0 ;IDK exactly what this does.

;;EXACT LOCATION FOR WHERE TO PUT THIS SCRIPT:
; C:\AHK\2nd-keyboard\Intercept

;;Location for where to put a shortcut to the script, such that it will start when Windows starts:
;;  Here for just yourself:
;;  C:\Users\YOUR_USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
;;  Or here for all users:
;;  C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp





#NoEnv
SendMode Input
#InstallKeybdHook
;#InstallMouseHook ;<--You'll want to use this if you have scripts that use the mouse.
#UseHook On
#SingleInstance force ;only one instance of this script may run at a time!
#MaxHotkeysPerInterval 2000

;;The lines below are optional. Delete them if you need to.
#HotkeyModifierTimeout 60 ; https://autohotkey.com/docs/commands/_HotkeyModifierTimeout.htm
#KeyHistory 200 ; https://autohotkey.com/docs/commands/_KeyHistory.htm ; useful for debugging.
#MenuMaskKey vk07 ;https://autohotkey.com/boards/viewtopic.php?f=76&t=57683
#WinActivateForce ;https://autohotkey.com/docs/commands/_WinActivateForce.htm ;prevent taskbar flashing.
;;The lines above are optional. Delete them if you need to.

;________________________________________________________________________________________
;                                                                                        
;		    2ND KEYBOARD USING INTERCEPTION AND INTERCEPT.exe (Logitech K120)            
;________________________________________________________________________________________

; Please watch https://www.youtube.com/watch?v=y3e_ri-vOIo for a comprehensive tutorial. 
;________________________________________________________________________________________

; DANGER: Installing interception may cause your USB devices to stop working sometimes, because it is limited to supporting only 10 of each device class. You have to uninstall it to fix that. Here is a follow up video with new information: https://www.youtube.com/watch?v=Hn18vv--sFY

; For this reason, I now use the Hasu USB to USB keyboard converter. It's sweet.
; https://www.1upkeyboards.com/shop/controllers/usb-to-usb-converter/

;;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||;;
;;||||||||||||| BEGIN SECOND KEYBOARD INTERCEPTION F23 ASSIGNMENTS ||||||||||||;;
;;|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||;;

;; You should DEFINITELY not be trying to add a 2nd keyboard unless you're already
;; familiar with how AutoHotkey works. I recommend that you at least take this tutorial:
;; https://autohotkey.com/docs/Tutorial.htm

;; You should probably use something better than Notepad for your scripting. (Do NOT use Word.)
;; I use Notepad++. "Real" programmers recoil from it, but it's fine for my purposes.
;; https://notepad-plus-plus.org/
;; You'll probably want the syntax highlighting:  https://stackoverflow.com/questions/45466733/autohotkey-syntax-highlighting-in-notepad


;;;WARNING - THIS IS KINDA UNTESTED SINCE I STOPPED USING IT. LET ME KNOW IF YOU HAVE ANY ISSUES, BY LEAVING A GITHUB... ISSUE.  https://github.com/TaranVH/2nd-keyboard/issues


#if (getKeyState("F23", "P")) ;<--Everything after this line will only happen on the secondary keyboard that uses F23.
F23::return ;this line is mandatory for proper functionality

escape::tooltip, [F23] You might wish to not give a command to escape. Could cause problems. IDK.
;escape::return ;<--to disable a key, just use a "return," like so.

#if (getKeyState("F23", "P"))
;Script to force shutdown the PC
F1::
MsgBox, 260,, Would you like to Shutdown the computer? (press Yes or No)
IfMsgBox Yes
    Shutdown, 1 ;I put 1 here cuz in ahk it is 1 is to shutdown
else
    Return

;Script for making folders for a new project
#IfWinActive ahk_class CabinetWClassAss
#if (getKeyState("F23", "P"))
F2::
CreateFolder("Assets")
CreateFolder("Videos")
CreateFolder("Documents")
CreateFolder("Project files")
CreateFolder("Music")Assets


CreateFolder(FolderName) {
    send, ^+n
    send, %FolderName%
    Send, {Enter}
    sleep 300
}
Return

#if (getKeyState("F23", "P")) and WinActive("ahk_exe Adobe Premiere Pro.exe")
F3::
#IfWinActive ahk_exe Adobe Premiere Pro.exe
;Ripple delete clip at playhead!! This was the first AHK script I ever wrote, I think!
F1::
Send ^!s ;ctrl alt s  is assigned to [select clip at playhead]
sleep 1
Send ^+!d ;ctrl alt shift d  is [ripple delete]
sleep 1
Return

#if (getKeyState("F23", "P")) and WinActive("ahk_exe Adobe Premiere Pro.exe")
F4::
Return

#if (getKeyState("F23", "P")) and WinActive("ahk_exe Adobe Premiere Pro.exe")
F5::
Return

#if (getKeyState("F23", "P"))
r::
Return

#if (getKeyState("F23", "P"))
F6::
Return

F7::
Return

F9::
Return

F8::
Return

F10::
Return

F11::
Return

F12::
Return

;;Note that the assignment on the above line will apply to ALL prior lines ending in "::"
;;...which you should know from the AHK tutorial I linked you to.

;;------------------------NEXT ROW--------------------------;;

`::
1::
2::
3::
4::
5::
6::
7::
8::
9::
0::
-::
=::
backspace::tooltip, [F23]  %A_thishotKey%

;;------------------------NEXT ROW--------------------------;;

tab::
msgbox, Im Tab
return
q::
w::
;;DELETE SINGLE CLIP AT CURSOR
e::
;Script for instantly opening My Student Portal

t::
Run, http://portal.thebenchmark.com.pk/portal-web/welcome ;Portal Website
sleep 2000 ;Wait for 4 Seconds
send, 1363 ;My GR#
send, {Enter} ;Press Enetr on the keyboard
sleep 2000 ;wait for 2 sec
send, {tab} ;Press "Tab" kay because the password will be written automatically as it is saved in the browser
send, {Enter} ;Press Enetr on the keyboard
return

y::
u::
i::
o::
p::
[::
]::
\::tooltip, [F23]  %A_thisHotKey%
;;capslock::tooltip, [F23] capslock - this should have been remapped to F20. Don't use this line.

;;------------------------NEXT ROW--------------------------;;

a::
send, sarimhasanplace123
return
s::
d::
f::
g::
h::
j::
K::
l::
`;::
;for the above line, (semicolon) note that the ` is necessary as an escape character -- and that the syntax highlighting might get it wrong.
'::
enter::tooltip, [F23]  %A_thisHotKey%

;;------------------------NEXT ROW--------------------------;;

z::
x::
c::
v::
b::
n::
m::
,::
.::
/::tooltip, [F23]  %A_thishotKey%

space::
tooltip, [F23] SPACEBAR. This will now clear remaining tooltips.
sleep 500
tooltip,
return
;;And THAT^^ is how you do multi-line instructions in AutoHotkey.
;;Notice that the very first line, "space::" cannot have anything else on it.
;;Again, these are fundamentals that you should have learned from the tutorial.


;;===================== MODIFIERS =========================;;

;;Keep these commented out, as they are!
;Lshift::tooltip, do not use
;Lctrl::tooltip, do not use
;Lwin::tooltip, do not use
;Lalt::tooltip, do not use

;Ralt::tooltip, do not use
;Rwin::tooltip, do not use
;appskey::tooltip, This is not a modifier, but I replaced it with INTERNATIONAL4 (SC079) anyway, because it was able to misbehave.
;Rctrl::tooltip, do not use
;Rshift::tooltip, do not use


;;If you leave the modifier keys alone, it allows for lines like the ones below:
;+z::tooltip, you pressed SHIFT Z on the F23 keyboard.
;^z::tooltip, you pressed CTRL Z on the F23 keyboard.
;!z::tooltip, you pressed ALT Z on the F23 keyboard. I don't recommend this... ALT is dangerous because of menu acceleration, even if you try to disable it like I have
;^!z::tooltip, you pressed CTRL SHIFT Z on the F23 keyboard.
;;Etc.
;;However, I use few to no modifiers on my secondary keyboards... I prefer tap dance instead. The decision is up to you.


;;================= MODIFIERS REMAPPED ======================;;

;; When you replace these with your own functions, I recommend that you do NOT delete the tooltips. Just comment them out. That way, you always know what was changed to what. It gets very confusing very quickly otherwise.
;; Here is the full list of scan code substitutions that I made:
;; https://docs.google.com/spreadsheets/d/1GSj0gKDxyWAecB3SIyEZ2ssPETZkkxn67gdIwL1zFUs/edit#gid=824607963

SC070::tooltip, [F23] Lshift -to-> SC070-International 2
SC071::tooltip, [F23] LCtrl -to-> SC071-Language 2
SC072::tooltip, [F23] LWin -to-> SC072-Language 1
SC073::tooltip, [F23] LAlt -to-> SC073-International 1

SC077::tooltip, [F23] RAlt -to-> SC077-Language 4
SC078::tooltip, [F23] RWin -to-> SC078-Language 3
SC079::tooltip, [F23] AppsKey -to-> SC079-International 4
SC07B::tooltip, [F23] RCtrl -to-> SC07B-International 5
SC07D::tooltip, [F23] RShift -to-> SC07D-International 3

;;================= LOCKING KEYS ======================;;

F20::tooltip, [F23] CapsLock -to-> SC06B-F20
SC05C::tooltip, [F23] NumLock -to-> SC05C-International 6
;Numlock is an AWFUL key. I prefer to leave it permanently on.
;It's been changed to International 6, so you can use it with no fear that it'll mess up your numpad.
SC061::tooltip, [F23] ScrollLock -to-> SC061 %A_thishotKey%

;;================= NEXT SECTION ======================;;

PrintScreen::tooltip, [F23] %A_thishotKey%
;;ScrollLock::do not use
SC07E::tooltip, [F23] Pause -to-> SC07E-Brazillian comma

;;Don't use the 3 keys below for your 2nd keyboard!
;Pause::msgbox, The Pause/Break key is a huge PITA. That's why I remapped it to SC07E
;Break::msgbox, Or is it THIS key? WHO KNOWS!
;CtrlBreak::msgbox, I have no idea what Ctrlbreak is. But it shows up sometimes.
;;Don't use the 3 keys above for your 2nd keyboard! Just don't!!



;Script for opening Project folders directly
#if (getKeyState("F23", "P"))
AllOff:
    Hotkey, Delete, Off
    Hotkey, Home, Off
    Hotkey, End, Off
    Hotkey, PgUp, Off
    Hotkey, PgDn, Off
Return



insert::
Inputbox, DirectoryName, Set Active Project Folder, Enter Active Project Folder:,, 300, 130,,,,, %DirectoryName%
if (ErrorLevel = 1) {
    Return
}
else if FileExist(DirectoryName) {
    MsgBox,, Active Folder Set, Active Folder: %DirectoryName%, 1
    Hotkey, IfWinActive, Delete, On
    Hotkey, IfWinActive, Home, On
    Hotkey, IfWinActive, End, On
    Hotkey, IfWinActive, PgUp, On
    Hotkey, IfWinActive, PgDn, On
    Return
}
else if (DirectoryName = "") {
    MsgBox,, Hotkeys Off, Entry field blank, 2
    Gosub, AllOff
    Return
}
else {
    MsgBox,, Hotkeys Off, Entry field not valid, 2
    Gosub, AllOff
    Return
}

delete::
if FileExist(DirectoryName "/Assets")
    Run, %DirectoryName%/Assets
    Return

home::

if FileExist(DirectoryName "/Videos")
    Run, %DirectoryName%/Videos
    Return

end::
if FileExist(DirectoryName "/Documents")
    Run, %DirectoryName%/Documents
    Return

pgup::

if FileExist(DirectoryName "/Project files")
    Run, %DirectoryName%/Project files
    Return

pgdn::

if FileExist(DirectoryName "/Music")
    Run, %DirectoryName%/Music
    Return
;;================= NEXT SECTION ======================;;
#if (getKeyState("F23", "P"))
up::
down::
left::
right::tooltip,[F23] %A_thishotKey%
Return
;;================== THE NUMPAD ======================;;

;script for opening and quickly activating Adobe Premiere Pro
#if (getKeyState("F23", "P"))
numpad0::
IfWinNotExist, ahk_class Premiere Pro
	Run, Adobe Premiere Pro.exe
WinActivate ahk_class Premiere Pro
return


;Script for opening chrome and quickly jumping to the next tab
#if (getKeyState("F23", "P"))
numpad1::
IfWinNotExist, ahk_class Chrome_WidgetWin_1
	Run, chrome.exe
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^{tab}
else
	WinActivate ahk_class Chrome_WidgetWin_1
return


;script for opening windows Explorer and quickly jumping from one page to another
#if (getKeyState("F23", "P"))
numpad2::
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, sarimexplorers, ahk_class CabinetWClass
if WinActive("ahk_class CabinetWClass")
	GroupActivate, sarimexplorers,r
else
	WinActivate ahk_class CabinetWClass
return

;Script for opening word and quickly jumping to it
#if (getKeyState("F23", "P"))
numpad3::
process, Exist, WINWORD.EXE
	If errorLevel =  0
		Run, WINWORD.EXE
	else
	{
	GroupAdd, sarimwords, ahk_class OpusApp
	if WinActive("ahk_class OpusApp")
		GroupActivate, sarimwords, r
	else
		WinActivate ahk_class OpusApp
	}
return


;Script for opening Visual Studio and quickly jumping to it
#if (getKeyState("F23", "P"))
numpad4::
IfWinNotExist, ahk_class Chrome_WidgetWin_1
	Run, "C:\Users\Sarim Hasan\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk"
WinActivate ahk_class Chrome_WidgetWin_1
return


;Script for opening blender and instantly switching to it
#if (getKeyState("F23", "P"))
numpad5::
IfWinNotExist, ahk_class GHOST_WindowClass
	Run, "D:\Installs\Blender\blender.exe"
WinActivate ahk_class GHOST_WindowClass
return


;
#if (getKeyState("F23", "P"))
numpad6::


;Script for opening Adobe Illustrator and quickly making it active
#if (getKeyState("F23", "P"))
numpad7::
IfWinNotExist, ahk_class illustrator
	Run, Illustrator.exe
WinActivate ahk_class illustrator
return


;Script for opening Everything finder app and quickly making it active
#if (getKeyState("F23", "P"))
numpad8::
#if (getKeyState("F23", "P"))
IfWinNotExist, ahk_class EVERYTHING
	Run, "C:\Program Files (x86)\Everything\Everything.exe"
WinActivate ahk_class EVERYTHING
return


;Script for opening adobe After effects and quickly making it active
#if (getKeyState("F23", "P"))
numpad9::
#if (getKeyState("F23", "P"))
IfWinNotExist, ahk_class AE_CApplication_22.0
	Run, AfterFX.exe
WinActivate ahk_class AE_CApplication_22.0
return


;;NumLock::tooltip, DO NOT USE THIS IN YOUR 2ND KEYBOARD!


; Script for opening free Download Manager
#if (getKeyState("F23", "P"))
numpadDiv::
IfWinNotExist, ahk_class Qt5QWindowOwnDCIcon
	Run,  "D:\Installs\Free Download Manager\fdm.exe"
WinActivate ahk_class Qt5QWindowOwnDCIcon
return


#if (getKeyState("F23", "P"))
; Script for opening the Downloads Folder
numpadMult::
Run, "C:\Users\Sarim Hasan\Downloads"
return


; Script for opening OBS Studio app
#if (getKeyState("F23", "P"))
numpadSub::
IfWinNotExist, ahk_class Qt5152QWindowIcon
	Run, "D:\Installs\obs-studio\bin\64bit\obs64.exe"
WinActivate ahk_class Qt5152QWindowIcon
return


; Script for opening Plex Media Server
#if (getKeyState("F23", "P"))
numpadAdd::
IfWinNotExist, ahk_class Plex
	Run, "D:\Installs\Plex\Plex.exe"
WinActivate ahk_class Plex
return


; Script for opening Tlauncher
#if (getKeyState("F23", "P"))
numpadEnter::
IfWinNotExist, ahk_class SunAwtFrame
	Run, "C:\ProgramData\M  icrosoft\Windows\Start Menu\Programs\TLauncher\TLauncher.lnk"
WinActivate ahk_class SunAwtFrame
return


; Script for opening Davinci resolve
#if (getKeyState("F23", "P"))
numpadDot::
IfWinNotExist, ahk_class Qt5152QWindowIcon
	Run, "C:\Users\Sarim Hasan\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Blackmagic Design\DaVinci Resolve\DaVinci Resolve.lnk"
WinActivate ahk_class Qt5152QWindowIcon
return


#if ;this line will end the F23 secondary keyboard assignments.

;;;--------------------IMPORTANT: HOW TO USE #IF THINGIES----------------------

;;You can use more than one #if thingy at a time, but it must be done like so:
#if (getKeyState("F23", "P")) and if WinActive("ahk_exe Adobe Premiere Pro.exe")
F1::msgbox, You pressed F1 on your secondary keyboard while inside of Premiere Pro

;; HOWEVER, You still would still need to block F1 using #if (getKeyState("F23", "P"))
;; If you don't, it'll pass through normally, any time Premiere is NOT active.
;; Does that make sense? I sure hope so.

;; Alternatively, you can use the following: (Comment it in, and comment out other instances of F1::)
; #if (getKeyState("F23", "P"))
; F1::
; if WinActive("ahk_exe Adobe Premiere Pro.exe")
; {
	; msgbox, You pressed F1 on your secondary keyboard while inside of Premiere Pro
	; msgbox, And you did it by using if WinActive()
; }
; else
	; msgbox, You pressed F1 on your secondary keyboard while NOT inside of Premiere Pro
;;This is easier to understand, but it's not as clean of a solution.

;; #if (getKeyState("F23", "P")) && (uselayer = 0) ;;you can also use a varibable like so, but I don't.

;; Here is a discussion about all this:
;; https://github.com/TaranVH/2nd-keyboard/issues/65

;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;+|||||||||+ END OF INTERCEPTION SECOND KEYBOARD F23 ASSIGNMENTS +|||||||||||||+
;;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

;;Note that this whole script was written for North American keyboard layouts.
;;IDK what you foreign language peoples are gonna have to do!
;;At the very least, you'll have some duplicate keys.


#if

;;*******************************************************************************
;;~~~~~~~~~~~~~DEFINE YOUR NORMAL KEY ASSIGNMENTS BELOW THIS LINE~~~~~~~~~~~~~~~~
;;*******************************************************************************

;;If you assign them BEFORE the second keyboard, they'll overrule it. You don't want that.
#ifwinactive ahk_exe ahk_exe Adobe Premiere Pro.exe
F2::msgbox, You pressed F2 on your normal keyboard while inside of Premiere Pro. `nThis is an autohotkey script by the way - in case you forgot.`nCheck your taskbar to find it.
;; You can of course delete the above line.
#ifwinactive

;;~~~~~~~~~~~~~~~~~DEFINE YOUR FUNCTIONS BELOW THIS LINE~~~~~~~~~~~~~~~~~~~~~~~~~


coolFunction(stuff)
{
msgbox, You called a function with the following parameter:`n`n%stuff%`n`nCongrats!
msgbox, You can put whatever you like in here. `nI've provided links to the functions I use.
; https://github.com/TaranVH/2nd-keyboard/blob/master/Almost_All_Premiere_Functions.ahk
; https://github.com/TaranVH/2nd-keyboard/blob/master/Almost_All_Windows_Functions.ahk
; NOTE that I use #include, rather than writing them out in the same .ahk file.
; https://autohotkey.com/docs/commands/_Include.htm
; This allows me to do fancy stuff, like direct launching scripts from my Stream Deck.
; But you don't need to do that at all. Just write out your functions in the same script.
}

anotherFunction(yeah)
{
msgbox, yup %yeah%
;Just delete this function, lol
}
