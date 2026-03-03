import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_enum.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_info_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';
import 'package:spine_flutter/spine_flutter.dart';

class Focus141BoxDialogController extends Focus141Con{
  var showMoney=false;
  late SpineWidgetController spineWidgetController;

  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.box_double_pop);
    spineWidgetController=SpineWidgetController(
      onInitialized: (controller) async{
        controller.animationState.setAnimationByName(0, "open", false);
        await Future.delayed(Duration(milliseconds: 2000));
        showMoney=true;
        update(["money","btn"]);
      },
    );
  }

  clickDouble(double reward, Function() callback){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.box_double_pop_c);
    Focus141AdUtils.instance.showAdFocus141(
      adType: AdType.reward,
      showAd: Focus141ValueUtils.instance.showAd(AdType.reward),
      focus141AdEnum: Focus141AdEnum.fkskv_box_rv,
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
      adType: AdType.interstitial,
      showAd: Focus141ValueUtils.instance.showAd(AdType.interstitial),
      focus141AdEnum: Focus141AdEnum.fkskv_box_int,
      result: (give){
        Focus141InfoUtils.instance.updateMoney(reward);
        backFocus141();
        callback.call();
      },
    );
  }
}