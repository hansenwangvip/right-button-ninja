
;********************* Initial Notification **************************

TrayTip, RBN is running, press "ALT+WIN+H" for usage tips，press "ALT+Win+P" to pause or resume it。
SetTimer, HideStartTrayTip, -3500

HideStartTrayTip() {  ; NOTE: For Windows 10, replace this function with the one defined above.
    TrayTip
}



;********************* Help **************************
!#H::MsgBox
||Welcome to RBN! `n`n
||****************** How to use ********************`n
|| hold your right mouse button and swipe up, then release the right mouse button, you can see task view.`n
|| `n`n`n

||****************** Usage ********************`n
|| 1. Switch：ALT + Win + P`n
|| 2. Help：ALT + Win + H `n
|| 3. Swipe left or right：swap virtual desktop`n
|| 4. Swipe up：Task View`n
|| 5. Swipe down：Show Desktop`n


;********************* Switch **************************
!#P::
Suspend, permit
if (State = 0) {
	State := 1
	TrayTip RBN is running, You can press ALT+Win+H for help, press ALT+Win+P to resume the app.
	SetTimer, HideOpenTrayTip, -3000
	HideOpenTrayTip() {
			if SubStr(A_OSVersion,1,3) = "10." {
					Menu Tray, NoIcon
					Sleep 200  ; It may be necessary to adjust this sleep.
					Menu Tray, Icon
			}
			TrayTip
	}
}
else {
	State := 0
	TrayTip RBN has paused, You can press ALT+Win+H for help, press ALT+Win+P to resume the app.
	SetTimer, HideCloseTrayTip, -3000
	HideCloseTrayTip() {
			if SubStr(A_OSVersion,1,3) = "10." {
					Menu Tray, NoIcon
					Sleep 200  ; It may be necessary to adjust this sleep.
					Menu Tray, Icon
			}
			TrayTip
	}
}
Suspend, toggle
return

;********************* Main **************************
rbutton::
mousegetpos xpos1,ypos1
settimer,gtrack,1
return

rbutton up::
settimer,gtrack,off
if (gtrack = ""){
	Click, Right
}
else if (gtrack = "r" || gtrack = "ru" || gtrack = "rd"){
	send {LWin Down}{Ctrl Down}{Left}{Ctrl Up}{LWin Up}
}
else if (gtrack = "l" || gtrack = "lu" || gtrack = "ld"){
	send {LWin Down}{Ctrl Down}{Right}{Ctrl Up}{LWin Up}
}
else if (gtrack = "u"){
	send #{tab}
}
else if (gtrack = "d"){
	send #{d}
}
gtrack=
return

gtrack:
mousegetpos xpos2,ypos2
track:=(abs(ypos1-ypos2)>abs(xpos1-xpos2)) ? (ypos1>ypos2 ? "u" : "d") : (xpos1>xpos2 ? "l" : "r")
if (track<>SubStr(gtrack, 0)) and (abs(ypos1-ypos2)>40 or abs(xpos1-xpos2)>40)
   gtrack.=track
xpos1:=xpos2,ypos1:=ypos2
return
