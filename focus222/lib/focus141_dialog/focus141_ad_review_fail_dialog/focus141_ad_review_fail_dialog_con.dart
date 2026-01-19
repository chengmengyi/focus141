import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141AdReviewFailDialogCon extends Focus141Con{

  clickClose(){
    backFocus141();
  }

  clickQuiz(int money,Focus141CashTypeEnum typeEnum, Function() callback)async{
    backFocus141();
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateHomeTab,focus141Int: 0);
    callback.call();
  }
}