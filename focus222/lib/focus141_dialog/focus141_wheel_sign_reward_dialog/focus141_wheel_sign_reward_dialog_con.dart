import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_info_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141WheelSignRewardDialogCon extends Focus141Con{
  var signReward=Focus141ValueUtils.instance.getSignReward();
  double wheelReward;
  Focus141WheelSignRewardDialogCon({
    required this.wheelReward,
  });

  clickDouble(){
    Focus141AdUtils.instance.showAdFocus141(
      result: (give){
        Focus141InfoUtils.instance.updateMoney(mulDecimalFocus141((addDecimalFocus141(signReward, wheelReward)), 2));
        backFocus141();
      }
    );
  }

  clickSingle(){
    Focus141AdUtils.instance.showAdFocus141(
        result: (give){
          Focus141InfoUtils.instance.updateMoney(addDecimalFocus141(signReward, wheelReward));
          backFocus141();
        }
    );
  }
}