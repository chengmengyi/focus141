import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_routers/focus141_router_address.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_dialog/focus141_new_user_dialog/focus141_new_user_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_old_user_dialog/focus141_old_user_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_sign_reward_dialog/focus141_sign_reward_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_wheel_sign_reward_dialog/focus141_wheel_sign_reward_dialog.dart';
import 'package:focus222/focus141_utils/focus141_cash_utils.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';

class Focus141UserGuideUtils {
  static final Focus141UserGuideUtils _focus141userGuideUtils=Focus141UserGuideUtils();
  static Focus141UserGuideUtils get instance => _focus141userGuideUtils;

  showNewUserGuide(){
    var newUserTime = bNewUserGuideTime.getData();
    if(newUserTime.isEmpty){
      bNewUserGuideTime.saveData(getTodayTime());
      showDialogFocus141(
        child: Focus141NewUserDialog(
          callback: (double reard){
            Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.showMoneyReward,focus141Dynamic: reard);
          },
        ),
      );
    }else if(newUserTime!=getTodayTime()&&bOldUserGuideTime.getData()!=getTodayTime()){
      bOldUserGuideTime.saveData(getTodayTime());
      showDialogFocus141(
        child: Focus141OldUserDialog(
          callback: (bool clickDouble){
            Focus141CashUtils.instance.updateLogin7TaskProgress();
            if(clickDouble){
              _toWheel();
            }else{
              showDialogFocus141(
                child: Focus141SignRewardDialog(),
              );
            }
          },
        ),
      );
    }
  }

  _toWheel()async{
    var result = await Get.toNamed(Focus141RouterAddress.bWheel,arguments: {"fromOld":true});
    if(null!=result){
      var reward = result["reward"];
      showDialogFocus141(
        child: Focus141WheelSignRewardDialog(wheelReward: reward),
      );
    }
  }
}