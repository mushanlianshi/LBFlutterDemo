

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:retrofit/http.dart';


typedef ActionSheetCallBack = void Function(int index);

class LBAlertPage extends StatelessWidget{

  /// 测试此widget的context消失了，
  /// 我们用外面随便一个widget的context给静态持有住，来弹框，避免context消失了，弹框弹不出来报错的
  /// 类似SmartDialog原理
  BuildContext? superContext;

  LBAlertPage({Key? key, }): super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 获取Get路由过来的参数
    if(Get.arguments != null && Get.arguments is Map<String, dynamic>){
        if (Get.arguments["context"] is BuildContext){
          superContext = Get.arguments["context"];
          print("LBLog superContext ${superContext}");
        }
    }
      return BltScaffold(title: "弹框", child: Column(
          children: [
               TextButton(
                   onPressed: (){
                      Future.delayed(Duration(seconds: 2),(){
                        _showAlert(context);
                      });
                   },
                   child: Text("弹框", style: TextStyle(fontSize: 16)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
               ),
              TextButton(
              onPressed: (){
                Future.delayed(Duration(seconds: 2), (){
                  _showActionSheet(context, (index){
                    print("LBLog index is ${index}");
                    Get.back();
                  });
                });
              },
              child: Text("actionSheet", style: TextStyle(fontSize: 16)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
            TextButton(
              onPressed: (){
                  showTimerPicker(context);
              },
              child: Text("datePicker", style: TextStyle(fontSize: 16)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
            ),
          ],
      ));
  }

    _showAlert(BuildContext context){
      SmartDialog.showToast("LBLog alert page alert");
      return;
        showCupertinoDialog(
            context: superContext ?? context,
            builder: (context){
              print("LBLog superContext ------- ${superContext}");
                return CupertinoAlertDialog(
                      title: const Text("Cupertino iOS风格弹框"),
                      content: const Text("cupertino content"),
                      actions: <CupertinoDialogAction>[
                          CupertinoDialogAction(
                              child: const Text("Yes"),
                            onPressed: (){
                                Get.back();
                            },
                          ),
                        CupertinoDialogAction(
                          child: const Text("Cancle"),
                          isDestructiveAction: true,
                          onPressed: (){
                              debugPrint("LBLog cancel=========");
                          },
                        )
                      ],
                );
            }
        );
    }


  _showActionSheet(BuildContext context, ActionSheetCallBack callBack){
    EasyLoading.showToast("LBlog EasyLoading ----");
    return;
    // Future.delayed(duration)
    // showCupertinoModalPopup(context: context, builder: builder)
    showCupertinoModalPopup(
        context: context,
        builder: (context){
          return CupertinoActionSheet(
              title: const Text("Cupertino ios actionsheet"),
              actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                      onPressed: (){
                        debugPrint("LBLog item 1=========");
                        Get.back();
                        callBack(1);
                      },
                      child: Text("item 1"),
                  ),
                CupertinoActionSheetAction(
                  onPressed: (){
                    debugPrint("LBLog item 2=========");
                    Get.back();
                    callBack(2);
                  },
                  child: Text("item 2"),
                ),
                CupertinoActionSheetAction(
                  onPressed: (){
                      Get.back();
                  },
                  child: Text("cancel"),
                )
              ],
          );
        }
    );
  }


  showTimerPicker(BuildContext context){
    showCupertinoModalPopup(context: context, builder: (_){
          return CupertinoDatePicker(
              use24hFormat: true,
              backgroundColor: CupertinoColors.white,
              initialDateTime: DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (dateTime){

              }
          );
      });
  }



}