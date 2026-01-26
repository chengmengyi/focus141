import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141FirstAnswerQuizDialogCon extends Focus141Con{
  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.quiz_guide_cash_pop);
  }

  clickCash(Function() callback){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.quiz_guide_cash_pop_c);
    backFocus141();
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateHomeTab,focus141Int: 1);
    callback.call();
  }

  clickClose(Function() callback){
    backFocus141();
    callback.call();
  }
}