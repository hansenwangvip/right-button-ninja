# 右键忍者 极简的Win10虚拟桌面手势

右键忍者（Right-Button-Ninja）是适配Windows 10平台的一个鼠标手势软件，本软件采用AutoHotKey编写，通过识别四个方向的鼠标手势来实现高度模拟触摸板，帮助用户更加方便快捷的管理桌面。

从此使用虚拟桌面不再需要键盘，只要按住鼠标右键轻轻一划，即可畅快体验。


## 功能演示

**手势用法：从任意位置开始，按住鼠标右键，然后干脆利落地滑动鼠标，立即松开右键。**

1. 上划手势

![上划手势](./imgs/slide-up.gif)

2. 下划手势

![下划手势](./imgs/slide-down.gif)

3. 左划手势

![左划手势](./imgs/slide-left.gif)

4. 右划手势

![右划手势](./imgs/slide-right.gif)



# 快速上手

## 安装

本软件无需安装，无需设置，[点击立即下载版本v1.0.1](https://github.com/hansenwangvip/right-button-ninja/releases/download/v1.0.1/RBN.right-button-ninja@1.0.1.zip)
，运行exe文件即可体验。


## 使用

### 5个关键功能

从任意位置开始，按住鼠标右键，然后干脆利落地滑动鼠标，立即松开右键。

1. 总开关：控制暂停或恢复软件的运行，快捷键`ALT + WIN + P`。
2. 向上划：显示多任务视图。
3. 向下划：显示桌面。
4. 向左划：移动到右边的虚拟桌面。
5. 向右划：移动到左边的虚拟桌面。

### 辅助功能

1. 查看帮助：`ALT + WIN + H`
2. 查看关于：`ALT + WIN + L`


# 进阶技巧

一些常用的进阶技巧：

1. 在多任务视图中，单击鼠标中键即可关闭桌面或者窗口。
2. 上划打开多任务视图，可以任意拖拽窗口到别的桌面。
3. 如何让脚本开机自启动？
	1. 按快捷键：`WIN + R`
	2. 输入`shell:startup`，按回车
	3. 弹出了一个文件夹窗口
	4. 然后将RBN的exe文件复制进去，下次开机即可自启动
	5. 如果要关闭自启动，重复1、2、3步骤，然后将不要开机自启的文件删除即可。
4. windows10的新版本会在任务视图中显示时间线，会降低虚拟桌面的性能。如果您用不到时间线，可以在"设置-隐私-活动历史记录-显示账户活动"中，关闭您的账户时间线，以提高虚拟桌面的流畅度。参考截图：

![关闭时间线](./imgs/turn-off-timeline.png)

# 关于

本软件永久免费，无广告，无捆绑安装，业界良心！

兼容性：本软件只兼容Windows 10操作系统。

本软件由[AutoHotKey](http://ahkcn.sourceforge.net/docs/Tutorial.htm)编写，代码开源，保证无毒，放心享用。

源码：<https://github.com/hansenwangvip/right-button-ninja>

**如果您觉得有用，欢迎Star和宣传，您的鼓励就是我的动力，感谢！**

# 反馈意见

如果您在使用过程中，遇到任何问题，可以提issue，我会尽量在24小时内答复。

# 许可

右键忍者崇尚极简主义，追求简单易用，永久免费，绿色无毒。

您可以像忍者一样，鼠标就是您的利刃，手势就是您的忍术。

Right Button Ninja是根据 MIT 许可获得许可的。

这意味着您可以随意修改和重新分发该程序，但是您必须在版本中包含许可证和此声明。

# 贡献代码

1. 打开解压后**auto-hot-key-runtime.exe**文件，安装AHK环境；
2. 阅读[AHK文档](http://ahkcn.sourceforge.net/docs/Tutorial.htm);
3. 新建分支，编写ahk脚本；
4. 调试：编写ahk脚本时，右键任务栏图标，点击reload即可重载脚本；
5. 开发完成后提交Pull Request。


# 参考链接

> [# Windows 10 中的多个桌面](https://support.microsoft.com/zh-cn/help/4028538/windows-10-multiple-desktops)

> [# 在 Windows 10 中使用多任务处理执行更多操作](https://support.microsoft.com/zh-cn/help/4026282/windows-10-get-more-done-with-multitasking)

> [# Microsoft 官方: 《适用于 Windows 10 的触摸板手势》](https://support.microsoft.com/zh-cn/help/4027871/windows-10-touchpad-gestures)


> [# PC online文章:《一秒变双系统？Win10虚拟桌面详尽教程》](https://www.pconline.com.cn/win8/560/5608916_all.html)
