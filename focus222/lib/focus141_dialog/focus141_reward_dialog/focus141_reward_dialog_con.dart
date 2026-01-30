import 'package:focus111/focus141_enum/focus141_reward_type.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_enum.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus_no_net_dialog/focus_no_net_dialog.dart';
import 'package:focus222/focus141_utils/focus141_info_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141RewardDialogCon extends Focus141Con{
  Focus141RewardType focus141rewardType;
  var showRewardAd=Focus141ValueUtils.instance.showAd(AdType.reward);
  Focus141RewardDialogCon({
    required this.focus141rewardType,
  });

  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.coin_pop,params: {"source_from":focus141rewardType.name});
  }

  clickDouble(double reward, Function() callback)async{
    List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.wifi)||connectivityResult.contains(ConnectivityResult.mobile)){
      Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.coin_pop_c,params: {"source_from":focus141rewardType.name});
      Focus141AdUtils.instance.showAdFocus141(
        adType: AdType.reward,
        showAd: showRewardAd,
        focus141AdEnum: _getDoubleAdEnum(),
        result: (give){
          if(give){
            Focus141InfoUtils.instance.updateMoney(mulDecimalFocus141(reward, 2));
          }
          backFocus141();
          callback.call();
        },
      );
    }else{
      showDialogFocus141(child: FocusNoNetDialog(callback: (){},));
    }
  }
  clickSingle(double reward, Function() callback){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.coin_pop_close,params: {"source_from":focus141rewardType.name});
    Focus141AdUtils.instance.showAdFocus141(
      adType: AdType.interstitial,
      showAd: Focus141ValueUtils.instance.showAd(AdType.interstitial),
      focus141AdEnum: _getSingleAdEnum(),
      result: (give){
        Focus141InfoUtils.instance.updateMoney(reward);
        backFocus141();
        callback.call();
      },
    );
  }

  Focus141AdEnum _getDoubleAdEnum(){
    switch(focus141rewardType){
      case Focus141RewardType.quiz: return Focus141AdEnum.fkskv_quiz_rv;
      case Focus141RewardType.wheel: return Focus141AdEnum.fkskv_wheel_rv;
    }
  }

  Focus141AdEnum _getSingleAdEnum(){
    switch(focus141rewardType){
      case Focus141RewardType.quiz: return Focus141AdEnum.fkskv_quiz_int;
      case Focus141RewardType.wheel: return Focus141AdEnum.fkskv_wheel_int;
    }
  }
}