import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class FocusAdLimitDialogCon extends Focus141Con{
  // clickClose(Function() tryAgainCallback){
  //   backFocus141();
  //   tryAgainCallback.call();
  // }

  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.see_you_tommorow);
  }

  clickTryAgain(Function() tryAgainCallback){
    backFocus141();
    tryAgainCallback.call();
  }


}