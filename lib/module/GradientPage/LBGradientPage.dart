
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lb_flutter_project/Util/xlm_button.dart';
import 'package:lb_flutter_project/common_widget/BLTScaffoldWidget.dart';
import 'package:lb_flutter_project/common_widget/WidgetExtension/BLTWidgetExtensions.dart';

class LBGradientPage extends StatelessWidget{
  var isDisable = false.obs;
  @override
  Widget build(BuildContext context) {
    return BltScaffold(title: "渐变色", child: _widget());
  }

  Widget _widget(){
    return SizedBox.expand(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          XlmButton(text: "渐变色", backgroundColor: Colors.red, onPressed: (){
            isDisable.value = !isDisable.value;
          }),
          SizedBox(height: 20),

          Obx((){
            Color startColor = isDisable.value ? Color(0xFFF29278) : Colors.black12;
            Color endColor = isDisable.value ? Color(0xFFE05943) : Colors.black12;
            return Container(
              height: 60,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [ startColor, endColor],
                  )),
              child: TextButton(
                onPressed: (){},
                child: Text("textButton"),
                style: ButtonStyle(
                  // backgroundColor:  MaterialStateProperty.all(Colors.blue),
                ),
              ),
            );
          }),
          SizedBox(height: 20),
          Obx((){
            return XlmButton(
              text: '撤销申请',
              disabled: isDisable.value,
              onPressed: (){

              },
              // borderRadius: 40,
              disabledBackgroundColor: Colors.black12,
              gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFFF29278), Color(0xFFE05943)],
              ),
              fontSize: 14,

            ).intoSizedBox(height: 50);
          }),
          SizedBox(height: 20),
          Column(
            children: [
              XlmButton(
                text: '撤销申请',
                disabled: isDisable.value,
                onPressed: (){

                },
                // borderRadius: 40,
                disabledBackgroundColor: Colors.black12,
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFFF29278), Color(0xFFE05943)],
                ),
                fontSize: 14,

              ),
              SizedBox(height: 20),
              // SizedBox.expand(
              //   child: Container(
              //     color: Colors.blue,
              //   ),
              // ),
              // SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: SizedBox(
                  child: XlmButton(
                    text: '撤销申请',
                    disabled: isDisable.value,
                    onPressed: (){

                    },
                    // borderRadius: 40,
                    disabledBackgroundColor: Colors.black12,
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFF29278), Color(0xFFE05943)],
                    ),
                    fontSize: 14,

                  ),
                ),
              )
            ],
          ).intoContainer(color: Colors.black12),
        ],
      ),
    );
  }
  
}