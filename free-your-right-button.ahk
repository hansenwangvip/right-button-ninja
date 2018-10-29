MsgBox
|| Hello! 欢迎使用 解放右键助手(free-your-right-button) for Windows 10！`n`n
|| 你有没有发现你的鼠标右键很少用得到？来，给你一个神器解放你的右键！`n
|| 堪比Macbook触摸板的手势切换虚拟桌面功能，丝滑体验，效率倍增！`n`n
||****************** 使用说明 ********************`n
|| 首先：新建虚拟桌面，按下 Ctrl + Win + D 即可新建一个虚拟桌面！`n
|| 1. 查看帮助说明：ALT + F1`n
|| 2. 按住鼠标右键同时左右滑动：切换虚拟桌面。`n
|| 3. 按住鼠标右键同时向上滑：切换显示任务视图。`n
|| 4. 按住鼠标右键同时向下滑：切换显示桌面。`n
|| 5. 脚本总开关（注意看任务栏图标变化）：ALT + F2`n`n

|| 兼容性：本脚本只兼容Windows 10操作系统。`n
|| 源码：https://github.com/hansenwangvip/free-your-right-button`n
|| 本软件由AutoHotKey编写，代码开源，保证无毒，放心享用。`n
|| 版本：1.0



;*********************关于**************************

!F1::MsgBox
|| Hello! 欢迎使用 解放右键助手(free-your-right-button) for Windows 10！`n`n
|| 你有没有发现你的鼠标右键很少用得到？来，给你一个神器解放你的右键！`n
|| 堪比Macbook触摸板的手势切换虚拟桌面功能，丝滑体验，效率倍增！`n`n
||****************** 使用说明 ********************`n
|| 首先：新建虚拟桌面，按下 Ctrl + Win + D 即可新建一个虚拟桌面！`n
|| 1. 查看帮助说明：ALT + F1`n
|| 2. 按住鼠标右键同时左右滑动：切换虚拟桌面。`n
|| 3. 按住鼠标右键同时向上滑：切换显示任务视图。`n
|| 4. 按住鼠标右键同时向下滑：切换显示桌面。`n
|| 5. 脚本总开关（注意看任务栏图标变化）：ALT + F2`n`n

|| 兼容性：本脚本只兼容Windows 10操作系统。`n
|| 源码：https://github.com/hansenwangvip/free-your-right-button`n
|| 本软件由AutoHotKey编写，代码开源，保证无毒，放心享用。`n
|| 版本：1.0

;*********************END 关于**************************

;开关按钮
!F2::Suspend, Toggle

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






