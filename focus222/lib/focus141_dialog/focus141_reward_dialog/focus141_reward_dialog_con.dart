import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_info_utils.dart';

class Focus141RewardDialogCon extends Focus141Con{

  clickDouble(double reward, Function() callback){
    Focus141AdUtils.instance.showAdFocus141(
      result: (give){
        if(give){
          Focus141InfoUtils.instance.updateMoney(mulDecimalFocus141(reward, 2));
        }
        backFocus141();
        callback.call();
      },
    );
  }
  clickSingle(double reward, Function() callback){
    Focus141AdUtils.instance.showAdFocus141(
      result: (give){
        Focus141InfoUtils.instance.updateMoney(reward);
        backFocus141();
        callback.call();
      },
    );
  }

}