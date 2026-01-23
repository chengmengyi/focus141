import 'dart:convert';

import 'package:flutter_android_ad_plugins/data/ad_info_data.dart';
import 'package:flutter_android_ad_plugins/data/config_ad_data.dart';
import 'package:flutter_android_ad_plugins/flutter_android_ad_plugins.dart';
import 'package:flutter_android_ad_plugins/hep/ios_load_ad_result_callback.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_feng_utils.dart';
import 'package:focus111/focus141_utils/focus141_local_quiz.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141AdUtils {
  static final Focus141AdUtils _focus141adUtils=Focus141AdUtils();
  static Focus141AdUtils get instance => _focus141adUtils;

  initAdFocus141(){
    FlutterAndroidAdPlugins.instance.initMax(
      maxKey: Focus141LocalQuiz.maxKeyBase64.base64(),
      topOnAppId: Focus141LocalQuiz.topOnIdBase64.base64(),
      topOnAppKey: Focus141LocalQuiz.topOnKeyBase64.base64(),
      data: _createAdDataFocus141(),
      userConsent: true,
      doNotSell: false,
      fengKongLogic: (){
        return Focus141FengUtils.instance.hasFeng();
      },
      iosLoadAdResultCallback: IosLoadAdResultCallback(
        startLoadAdCallback: (info){
          // TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ad_request,params: {"ad_code_id":info?.adId,"ad_format":info?.adType.name,"ad_platform":info?.adPlat});
        },
        loadAdSuccessCallback: (maxAd,info,loadTime){
          // TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ytmcp_ad_return,params: {"ad_code_id":info?.adId,"ad_format":info?.adType.name,"ad_platform":info?.adPlat,"ad_request_time":loadTime});
        },
        loadAdFailCallback: (info,failReason){
          // TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ytmcp_ad_return_fail,params: {"ad_code_id":info?.adId,"ad_format":info?.adType.name,"ad_platform":info?.adPlat});
        },
        initSdkSuccess: (time,platform){
          // TreaTttIwjodwm.instance.pointEventdjwijiwo(point: TreaPointEnumDjwidjo.ytmcp_ad_initsuc,params: {"ad_platform":platform,"oxrsl_ad_init_time":time});
        },
      ),
    );
  }

  showAdFocus141({
    required Function(bool giveReard) result,
}){
    result.call(true);
  }


  ConfigAdData _createAdDataFocus141(){
    var data = bAdFirebaseConfig.getData();
    if(data.isEmpty){
      data=Focus141LocalQuiz.adLocalConfigBase64.base64();
    }
    var json = jsonDecode(data);
    return ConfigAdData(
      maxShowNum: json["lcztqkkm"],
      maxClickNum: json["knwrbqog"],
      priceSwitch: json["fkskv_switch"]??false,
      newInterList: _createNewAdListFocus141(json["fkskv_int"]),
      newRewardList: _createNewAdListFocus141(json["fkskv_rv"]),
    );
  }

  List<AdInfoData> _createNewAdListFocus141(List? list){
    if(null==list){
      return [];
    }
    List<AdInfoData> resultList=[];
    for (var value in list) {
      resultList.add(
          AdInfoData(
            adId: value["pjrqukgl"],
            adPlat: value["xharxyyv"],
            adType: value["rcmdajku"]=="reward"?AdType.reward:AdType.interstitial,
            expireTime: value["ifdwoqke"],
          )
      );
    }
    return resultList;
  }

  updateAdInfo(){
    FlutterAndroidAdPlugins.instance.updateAdData(_createAdDataFocus141());
  }
}