
;********************* Start 初始弹窗**************************

TrayTip, Win10 右键手势助手已启动, 您可以按ALT+Win+H查看说明，按ALT+Win+P开关此功能.
SetTimer, HideStartTrayTip, -3500

HideStartTrayTip() {  ; NOTE: For Windows 10, replace this function with the one defined above.
    TrayTip
}


;********************* End 初始弹窗**************************


;*********************Start 帮助**************************

!#H::MsgBox
|| 欢迎使用为Windows 10定制的鼠标右键手势工具！`n`n
||****************** 开始使用 ********************`n
|| 首先：新建虚拟桌面，按住鼠标右键，快速向上滑动一段距离后松开右键；`n
|| 出现多任务视图后，点击右下角"新建桌面"，即可新建一个虚拟桌面！`n

||****************** 功能说明 ********************`n
|| 1. 脚本总开关（注意看任务栏图标变化）：ALT + Win + P`n
|| 2. 查看帮助说明：ALT + Win + H `n
|| 3. 按住鼠标右键同时左右滑动：切换虚拟桌面。`n
|| 4. 按住鼠标右键同时向上滑：切换显示任务视图。`n
|| 5. 按住鼠标右键同时向下滑：切换显示桌面。`n`n
|| 关于：ALT + Win + L`n
|| 版本：1.0

!#L::MsgBox

|| 兼容性：本工具只兼容Windows 10操作系统。`n
|| 源代码：https://github.com/hansenwangvip/`n
|| 本软件由AutoHotKey编写，代码开源，保证无毒，放心享用。`n
|| 作者QQ/WeChat：1197913035

;*********************END 帮助**************************

;开关按钮
!#P::
Suspend, permit
if (State = 0) {
	State := 1
	TrayTip 已开启, 您可以按ALT+Win+H查看说明，按ALT+Win+P开关。
	SetTimer, HideOpenTrayTip, -1000
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
	TrayTip 已关闭, 您可以按ALT+Win+H查看说明，按ALT+Win+P开关。
	SetTimer, HideCloseTrayTip, -1000
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

;************************START 鼠标手势切换桌面**************************
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
	send #d
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

;************************END  鼠标手势切换桌面**************************






