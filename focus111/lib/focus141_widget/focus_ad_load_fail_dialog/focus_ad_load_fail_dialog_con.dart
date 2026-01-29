import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class FocusAdLoadFailDialogCon extends Focus141Con{
  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.try_again_pop);
  }

  clickClose(Function(bool tryAgain) tryAgainCallback){
    backFocus141();
    tryAgainCallback.call(false);
  }

  clickTryAgain(Function(bool tryAgain) tryAgainCallback){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.try_again_pop_c);
    backFocus141();
    tryAgainCallback.call(true);
  }
}