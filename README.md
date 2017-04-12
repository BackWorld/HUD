# HUD

A simple HUD kit for showing warning/error/loading tips to user.


![最终效果](http://upload-images.jianshu.io/upload_images/1334681-e92f25db7446cfe2.gif?imageMogr2/auto-orient/strip)

- Platform: iOS8.0+ 
- Language: Swift3.0
- Editor: Xcode8
- Adaptive: 适配横竖屏+所有设备

###原理：
> 1.Xib + 简单逻辑代码
> 2.基于NSObject + KeyWindow，所以可以在任意代码调用显示

###用法：
```
// 类似于qq音乐顶部提示
HUD.bar(style: style, message: "你已经进入了没网的二次元", delay: 2)

// 安卓toast
HUD.toast(message: "登录成功", delay: 2)

// 网络请求loading
HUD.square(style: style, message: "拼命加载中...", delay: 2)

// 取消显示
HUD.dismiss()
```

###源码：
> https://github.com/BackWorld/HUD
> 如果对你有帮助，别忘了点个❤️哦。

