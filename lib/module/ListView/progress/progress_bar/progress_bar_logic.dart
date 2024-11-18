import 'dart:async';

import 'package:get/get.dart';

import 'progress_bar_state.dart';

class ProgressBarLogic extends GetxController {
  final ProgressBarState state = ProgressBarState();

  Timer? _timer;

  final totalStep = 100;
  final currentStep = 10.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    startTimer();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    stopTimer();
  }

   startTimer(){
      stopTimer();
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
          if(currentStep.value >= totalStep){
              stopTimer();
          }else{
            currentStep.value += 1;
          }
      });
   }

   stopTimer(){
      _timer?.cancel();
      _timer = null;
   }
}
