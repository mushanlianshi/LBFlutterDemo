

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';


typedef ActionSheetCallBack = void Function(int index);

class LBAlertPage extends StatelessWidget{

  const LBAlertPage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
      return BltScaffold(title: "弹框", child: Column(
          children: [
               TextButton(
                   onPressed: (){
                      showAlert(context);
                   },
                   child: Text("弹框", style: TextStyle(fontSize: 16)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
               ),
              TextButton(
              onPressed: (){
                _showActionSheet(context, (index){
                    print("LBLog index is ${index}");
                    Get.back();
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

    showAlert(BuildContext context){
        showCupertinoDialog(
            context: context,
            builder: (context){
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