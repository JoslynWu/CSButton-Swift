# CSButton-Swift

### Custom the position of the ImageView relative to the titleLabel in UIButton.

一个UIButon的派生类，可以调整图片与文字相对位置，图片和文字间距，指定文字宽度，以及图片显示大小。这是个Swift版本。

### OC版本入口：[CSButton-OC](https://github.com/JoslynWu/CSButton)

## 什么效果

![](/resource/CSButton.gif)

## 怎么使用

直接将下面文件（CSButton文件夹下）添加（拖入）到项目中

```
CSButton.swift
```

## 什么功能

1、 调整图片与文字相对位置

配置`imagePositionMode`属性即可。

```
var imagePositionMode: CSButtonImagePositionStyle
```

该属性为枚举类型：

```
enum CSButtonImagePositionStyle: Int {
    case left
    case right
    case top
    case bottom
}
```

2、 调整图片与文字间的距离

配置`distance`属性即可。

```
var distance: CGFloat
```

3、 调整图片展示大小

配置`imageSize`属性即可。

```
var imageSize: CGSize
```

## 有什么说明么

1. 文字和图片都遵循水平竖直居中。
2. 默认关闭了点击时图片高亮效果。如果需要开启则设置`adjustsImageWhenHighlighted`为`true`。

