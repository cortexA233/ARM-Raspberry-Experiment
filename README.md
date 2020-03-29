# **ARM-Raspberry Experiment Project**
上海大学通信学院17级冬季学期，嵌入式设计基础实验报告，老师复查请进！


## 1.项目文件结构
### 1.1 LOVE目录
该目录下存放的是love2d引擎的文件，附带了一个名为build.bat的编译命令，使用该命令可编译打包好的代码压缩文件。
### 1.2 picture_rotate目录（项目目录）
该目录下存放了本次实验项目——LCD屏幕图片旋转实验的代码。
### 1.3 testgame_tanchishe_DEOT_ver目录（项目目录）
该目录下存放了本次实验自主扩展项目——贪吃蛇小游戏开发的代码。


## 2.项目代码结构
### 2.1 图片旋转（picture_rotate）
只有一个文件即main.lua，代码功能详见代码注释。
### 2.2 贪吃蛇小游戏（testgame_tanchishe_DEOT_ver）
其中class.lua文件负责整个项目面向对象特性的实现，food.lua和play.lua负责食物和玩家的类定义，main.lua为入口和主程序，负责游戏基础逻辑。


## 3.使用方法（两个项目皆可如此编译）
（1)将两个**项目目录**里的**所有文件**压缩为一个zip压缩包（注意！此处请不要直接压缩整个目录，而是打开目录后压缩其中的所有文件，比如不要直接将picture_rotate文件夹打包，而是点开目录，将里面的main.lua和example.jpg一起打包进一个zip压缩包）。
（2）将该压缩包复制到LOVE目录下，并将后缀名.zip改为.love，将该文件拷入设备即可直接运行。<br/>
（3）若需要在windows下测试，将该.love文件拖到LOVE目录下的build.bat编译命令上，等待一两秒钟左右即可编译出.exe可执行文件（注意不要将.exe文件单独拷贝出LOVE目录运行，可执行文件必须和引擎处于同一目录才可运行）。
