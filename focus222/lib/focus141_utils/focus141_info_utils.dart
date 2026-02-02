import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_utils/focua141_notification/focus141_notification_utils.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_cash_utils.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141InfoUtils {
  static final Focus141InfoUtils _focus141infoUtils=Focus141InfoUtils();
  static Focus141InfoUtils get instance => _focus141infoUtils;

  updateMoney(addNum)async{
    bFocus141Money.saveData(addDecimalFocus141(bFocus141Money.getData(), addNum));
    if(addNum>0){
      Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.showMoneyAnimator);
      await Future.delayed(Duration(milliseconds: 1500));
      Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateMoney);

      bFocus141AdCheckCoins.saveData(addDecimalFocus141(bFocus141AdCheckCoins.getData(), addNum));
      var currentMoney = bFocus141Money.getData();
      var firstCashMoney = Focus141ValueUtils.instance.getCashList().first;
      if(bShowReachCashMoneyDialog.getData()&&currentMoney>=firstCashMoney){
        bShowReachCashMoneyDialog.saveData(false);
        try{
          Focus141CashUtils.instance.showReachCashMoneyDialog(firstCashMoney, Focus141CashTypeEnum.values.byName(bCashType.getData()));
        }catch(e){

        }
      }
      FlutterRiskControlPlugins.instance.handleUserMoneyChanged(currentMoney, firstCashMoney);
    }
    Focus141NotificationUtils.instance.showForegroundNotification();
  }

  updateAnswerRightNum(){
    bFocus141AnswerRightNum.saveData(bFocus141AnswerRightNum.getData()+1);
  }

  updateAnswerRightNumToCheckAd(){
    bAnswerRightNumToCheckAd.saveData(bAnswerRightNumToCheckAd.getData()+1);
  }
}