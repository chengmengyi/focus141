import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_info_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141SignRewardDialogCon extends Focus141Con{
  var signReward=Focus141ValueUtils.instance.getSignReward();

  clickDouble(){
    Focus141AdUtils.instance.showAdFocus141(
      result: (give){
        Focus141InfoUtils.instance.updateMoney(mulDecimalFocus141(signReward, 2));
        backFocus141();
      }
    );
  }

  clickSingle(){
    Focus141AdUtils.instance.showAdFocus141(
        result: (give){
          Focus141InfoUtils.instance.updateMoney(signReward);
          backFocus141();
        }
    );
  }
}