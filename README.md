# xinlimei

心里美Flutter工程

## Getting Started

开发入门文档
[documentation](https://flutter.dev/).

Flutter模块集成
[add-to-app documentation](https://flutter.dev/to/add-to-app).

## Android 端编译

- 1.将android项目克隆到本地名称为“xinlimei-android”
- 2.将flutter项目克隆到“xinlimei-android”同级目录，目录名称为“xinlimei-flutter”
- 3.打开“xinlimei-android” Android工程点击“Sync Project with Gradle Files”
- 4.等待同步完成后可以看到一个“xinlimei-flutter”加载进来
- 5.打开“xinlimei-flutter/pubspec.yaml”文件，点击右上角“pub get”等待拉取flutter依赖库或在
  “xinlimei-flutter”目录下直接执行命令“flutter pub get”
- 6.打开“xinlimei-flutter/lib/main.dart”文件，点击右上角“Enable Dart support”运行项目，点击main函数(
  Run "main.dart")会生成“.android”文件夹
- 7.再次点击“Sync Project with Gradle Files”
- 8.直击启动android工程即可

## iOS 端编译

- 1.将原生iOS项目克隆到本地名称为“xinlimei-iOS”
- 2.将flutter项目克隆到“xinlimei-iOS”同级目录，目录名称为“xinlimei-flutter”
- 3.在flutte项目下执行flutter pub get、 flutter build ios
- 4.等第三部执行完后，切换到原生项目目录下，执行pod install
- 5.打开“xinlimei-flutter/lib/main.dart”文件，点击右上角“Run”运行项目
- 6.直击启动iOS工程即可

## Pigeon 接入

- 1.调整pigeon_runner.dart文件内的参数
- 2.执行命令即可生成对应的文件到项目中

```bash
fvm dart run ./pigeon_runner.dart
```

## 图片/颜色资源/JSON生成命令/API

```bash
fvm dart run build_runner build
```

图片资源会根据机型的2x和3x的机型，去找对应图片，如果image/2.0x或则3.0x下面没有图片，会去image下找图片。
这样如果没设置宽高，就会导致3x的图片在2x的机型上变大，或则放到2x的图片在3x机型上变小。