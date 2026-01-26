import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141OldUserDialogCon extends Focus141Con{

  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.old_user_pop);
  }

  clickSpin(Function(bool clickDouble) callback){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.old_user_pop_c);
    backFocus141();
    callback.call(true);
  }

  clickClose(Function(bool clickDouble) callback){
    backFocus141();
    callback.call(false);
  }

}