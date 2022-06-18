#SingleInstance, Force
SendMode Input

;;;;;;;;;====================Important stuff to include in Script if i Migrate;;;;;;;;;====================
#Include, D:\Downloads\2nd Keyboard Files\AHK Scripts\Premiere Functions.ahk
SetWorkingDir, D:\Downloads\2nd Keyboard Files\AHK Scripts\Support Files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;=================================================;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#IfWinActive, ahk_class CabinetWClass
^F9::

CreateFolder("Assets")
CreateFolder("Videos")
CreateFolder("Documents")
CreateFolder("Project files")
CreateFolder("Music")

CreateFolder(FolderName) {
    send, ^+n
    send, %FolderName%
    Send, {Enter}
    sleep 300
}
Return

#IfWinActive
^F8::

MsgBox, 260,, Would you like to continue? (press Yes or No)
IfMsgBox Yes
    Shutdown, 5
else
    Return
Return

;Script for opening Project folders directly
AllOff:
Hotkey, ^Numpad1, Off
Hotkey, ^Numpad2, Off
Hotkey, ^Numpad3, Off
Hotkey, ^Numpad4, Off
Hotkey, ^Numpad5, Off
Return

^Numpad0::
Inputbox, DirectoryName, Set Active Project Folder, Enter Active Project Folder:,, 300, 130,,,,, %DirectoryName%
if (ErrorLevel = 1) {
    Return
}
else if FileExist(DirectoryName) {
    MsgBox,, Active Folder Set, Active Folder: %DirectoryName%, 1
    Hotkey, ^Numpad1, On
    Hotkey, ^Numpad2, On
    Hotkey, ^Numpad3, On
    Hotkey, ^Numpad4, On
    Hotkey, ^Numpad5, On
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

^Numpad1::
if FileExist(DirectoryName "/Assets")
    Run, %DirectoryName%/Assets
    Return

^Numpad2::
if FileExist(DirectoryName "/Videos")
    Run, %DirectoryName%/Videos
    Return

^Numpad3::
if FileExist(DirectoryName "/Documents")
    Run, %DirectoryName%/Documents
    Return

^Numpad4::
if FileExist(DirectoryName "/Project files")
    Run, %DirectoryName%/Project files
    Return

^Numpad5::
if FileExist(DirectoryName "/Music")
    Run, %DirectoryName%/Music
    Return


#IfWinActive ahk_exe Adobe Premiere Pro.exe
;Ripple delete clip at playhead!! This was the first AHK script I ever wrote, I think!
F1::
Send ^!s ;ctrl alt s  is assigned to [select clip at playhead]
sleep 1
Send ^+!d ;ctrl alt shift d  is [ripple delete]
sleep 1
return

#IfWinActive ahk_exe Adobe Premiere Pro.exe
;; instant cut at cursor (UPON KEY RELEASE) -- super useful! even respects snapping!
;note to self, move this to premiere_functions already
;this is NOT suposed to stop the video playing when you use it, but now it does for some reason....
F4::
;keywait, F4
;tooltip, |
send, b ;This is my Premiere shortcut for the RAZOR tool. You can use another shortcut if you like, but you have to use that shortcut here.
send, {shift down} ;makes the blade tool affect all (unlocked) tracks
keywait, F4 ;waits for the key to go UP.
;tooltip, was released
send, {lbutton} ;makes a CUT
send, {shift up}
sleep 10
send, v ;This is my Premiere shortcut for the SELECTION tool. again, you can use whatever shortcut you like.
return


;;DELETE SINGLE CLIP AT CURSOR
F9::
prFocus("timeline") ;This will bring focus to the timeline. ; you can't just send ^+!3 because it'll change the sequence if you alkready have the timeline in focus. You have to go to the effect controls first. That is what this function does.
send, ^!d ;ctrl alt d is my Premiere shortcut for DESELECT. This shortcut only works if the timeline is in focus, which is why we did that on the previous line!! And you need to deselect all the timeline clips becuase otherwise, those clips will also get deleted later. I think.
send, v ;This is my Premiere shortcut for the SELECTION tool.
send, {alt down}
send, {lbutton}
send, {alt up}
send, {delete} ;I have C assigned to "CLEAR" in Premiere's shortcuts panel.
return


F5::preset("my blur 30")