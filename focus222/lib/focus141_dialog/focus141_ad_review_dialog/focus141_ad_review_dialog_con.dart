import 'dart:async';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141AdReviewDialogCon extends Focus141Con{
  var currentPro=0,totalPro=100;
  Timer? _startTimer;
  Timer? _endTimer;
  Function() callback;
  Focus141AdReviewDialogCon(this.callback);

  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.ad_review_pop);
  }

  @override
  void onReady() {
    super.onReady();
    _start();
  }

  _start(){
    _startTimer=Timer.periodic(Duration(milliseconds: 20), (t){
      currentPro++;
      update(["progress"]);
      if(currentPro>=70){
        _startTimer?.cancel();
        _end();
      }
    });
  }

  _end(){
    _endTimer=Timer.periodic(Duration(milliseconds: 100), (t){
      currentPro++;
      update(["progress"]);
      if(currentPro>=98){
        _endTimer?.cancel();
        backFocus141();
        callback.call();
      }
    });
  }

  @override
  void onClose() {
    _startTimer?.cancel();
    _endTimer?.cancel();
    super.onClose();
  }
}