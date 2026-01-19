import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';

class Focus141InfoUtils {
  static final Focus141InfoUtils _focus141infoUtils=Focus141InfoUtils();
  static Focus141InfoUtils get instance => _focus141infoUtils;

  updateMoney(addNum){
    bFocus141Money.saveData(addDecimalFocus141(bFocus141Money.getData(), addNum));
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateMoney);
  }

  updateAnswerRightNum(){
    bFocus141AnswerRightNum.saveData(bFocus141AnswerRightNum.getData()+1);
  }
}