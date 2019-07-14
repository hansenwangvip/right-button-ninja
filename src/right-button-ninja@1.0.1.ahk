
;********************* Start 初始弹窗**************************

TrayTip, Win10 右键忍者 已启动, 请按快捷键"ALT+WIN+H"查看说明，按"ALT+Win+P"暂停或恢复运行。
SetTimer, HideStartTrayTip, -3500

HideStartTrayTip() {  ; NOTE: For Windows 10, replace this function with the one defined above.
    TrayTip
}

;********************* End 初始弹窗**************************


;*********************Start 帮助**************************

!#H::MsgBox
||欢迎使用RBN! 一款为Windows 10定制的虚拟桌面鼠标右键手势工具！`n`n
||****************** 开始使用 ********************`n
|| 首先：新建虚拟桌面，按住鼠标右键，快速向上滑动一段距离后，立即松开右键；`n
|| 出现多任务视图后，点击"新建桌面"，即可新建一个虚拟桌面！`n`n`n

||****************** 功能说明 ********************`n
|| 1. 脚本开关：ALT + Win + P`n
|| 2. 查看帮助：ALT + Win + H `n
|| 3. 按住右键左右滑动：切换虚拟桌面。`n
|| 4. 按住右键向上滑：任务视图。`n
|| 5. 按住右键向下滑：显示桌面/恢复窗口。`n
|| 6. 彩蛋：ALT + Win + L`n`n


!#L::MsgBox
|| 版本：1.0.1 `n
|| 兼容性：本工具只兼容Windows 10操作系统。`n
|| 本软件由AutoHotKey编写，代码开源，放心享用。`n
|| 源代码：https://github.com/hansenwangvip/right-button-ninja`n
|| 作者QQ/微信：1197913035

;*********************END 帮助**************************

;*********************START 功能**************************


;开关按钮
!#P::
Suspend, permit
if (State = 0) {
	State := 1
	TrayTip RBN已开启, 您可以按ALT+Win+H查看说明，按ALT+Win+P暂停运行。
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
	TrayTip RBN已暂停, 您可以按ALT+Win+H查看说明，按ALT+Win+P恢复运行。
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

;************START 鼠标手势**************
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

;***********END  鼠标手势**********



;*********************START 功能**************************



