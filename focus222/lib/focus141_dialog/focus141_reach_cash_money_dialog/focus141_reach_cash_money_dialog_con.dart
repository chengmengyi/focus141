import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141ReachCashMoneyDialogCon extends Focus141Con{

  clickClaim(Function() callback){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.reach_cash_pop_c);
    backFocus141();
    callback.call();
  }

  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.reach_cash_pop);
  }
}