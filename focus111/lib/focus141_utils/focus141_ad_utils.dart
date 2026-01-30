import 'dart:convert';

import 'package:flutter_android_ad_plugins/data/ad_info_data.dart';
import 'package:flutter_android_ad_plugins/data/config_ad_data.dart';
import 'package:flutter_android_ad_plugins/flutter_android_ad_plugins.dart';
import 'package:flutter_android_ad_plugins/hep/ios_ad_callback.dart';
import 'package:flutter_android_ad_plugins/hep/ios_load_ad_result_callback.dart';
import 'package:focus111/focus141_utils/focus141_ad_enum.dart';
import 'package:focus111/focus141_utils/focus141_check_adjust_utils.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_feng_utils.dart';
import 'package:focus111/focus141_utils/focus141_local_quiz.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_utils/focus141_voice_utils.dart';
import 'package:focus111/focus141_widget/focus_ad_limit_dialog/focus_ad_limit_dialog.dart';
import 'package:focus111/focus141_widget/focus_ad_load_fail_dialog/focus_ad_load_fail_dialog.dart';

class Focus141AdUtils {
  static final Focus141AdUtils _focus141adUtils=Focus141AdUtils();
  static Focus141AdUtils get instance => _focus141adUtils;

  Function()? adShowSuccessCallback;

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
          Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.ad_request,params: {"ad_code_id":info?.adId,"ad_format":info?.adType.name,"ad_platform":info?.adPlat});
        },
        loadAdSuccessCallback: (maxAd,info,loadTime){
          Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.fkskv_ad_return,params: {"ad_code_id":info?.adId,"ad_format":info?.adType.name,"ad_platform":info?.adPlat,"ad_request_time":loadTime});
        },
        loadAdFailCallback: (info,failReason){
          Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.fkskv_ad_return_fail,params: {"ad_code_id":info?.adId,"ad_format":info?.adType.name,"ad_platform":info?.adPlat});
        },
        initSdkSuccess: (time,platform){
          // Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.ytmcp_ad_initsuc,params: {"ad_platform":platform,"oxrsl_ad_init_time":time});
        },
      ),
    );
  }

  showAdFocus141({
    required AdType adType,
    required Focus141AdEnum focus141AdEnum,
    required bool showAd,
    required Function(bool giveReward) result,
    bool isOpenAd=false,
  }){
    if(!showAd){
      result.call(true);
      return;
    }
    if(Focus141FengUtils.instance.hasFeng()){
      if(adType==AdType.reward){
        showDialogFocus141(child: FocusAdLimitDialog(callback: (){},));
        return;
      }
      result.call(true);
      return;
    }

    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.fkskv_ad_chance,params: {"ad_pos_id":focus141AdEnum.name});

    var resultData = FlutterAndroidAdPlugins.instance.getCacheResultData(adType);
    if(null==resultData){
      Focus141TbaUtils.instance.uploadPoint(
        focus141PointEnum: Focus141PointEnum.fkskv_ad_impression_fail,
        params: {
          "ad_pos_id":focus141AdEnum.name,
          "reason":"no cache",
        },
      );
      FlutterAndroidAdPlugins.instance.loadAdWhenNoCache(adType);
      if(isOpenAd||adType==AdType.interstitial){
        result.call(true);
        return;
      }
      showDialogFocus141(
        child: FocusAdLoadFailDialog(
          tryAgainCallback: (bool tryAgain){
            if(tryAgain){
              var data = FlutterAndroidAdPlugins.instance.getCacheResultData(adType);
              if(null==data){
                result.call(adType==AdType.interstitial);
                return;
              }
              _showAdFocus141(adType: adType, focus141AdEnum: focus141AdEnum, showAd: showAd, result: result,isOpenAd: isOpenAd,);
            }else{
              result.call(adType==AdType.interstitial);
            }
          },
        ),
      );
      return;
    }
    _showAdFocus141(adType: adType, focus141AdEnum: focus141AdEnum, showAd: showAd, result: result,isOpenAd: isOpenAd,);
  }

  _showAdFocus141({
    required AdType adType,
    required Focus141AdEnum focus141AdEnum,
    required bool showAd,
    required Function(bool giveReward) result,
    bool isOpenAd=false,
  }){
    FlutterAndroidAdPlugins.instance.showAd(
      adType: adType,
      iosAdCallback: IosAdCallback(
        showSuccess: (ad,info){
          adShowSuccessCallback?.call();
          Focus141VoiceUtils.instance.pauseBgmFocus141();
          FlutterRiskControlPlugins.instance.handleShowAdSuccess(adType==AdType.reward);
          Focus141CheckAdjustUtils.instance.uploadRevenueFocus141(ad);
          Focus141TbaUtils.instance.uploadAd(ad: ad, focus141AdEnum: focus141AdEnum, adInfoData: info);
        },
        showFail: (){
          Focus141TbaUtils.instance.uploadPoint(
            focus141PointEnum: Focus141PointEnum.fkskv_ad_impression_fail,
            params: {
              "ad_pos_id":focus141AdEnum.name,
              "reason":"impfail",
            },
          );
          if(isOpenAd){
            result.call(false);
            return;
          }
          if(adType==AdType.reward){
            showToastFocus141(text: "Advertisement display failed, please try again later");
          }
          result.call(false);
        },
        closeAd: (ad,info,hasReward){
          Focus141VoiceUtils.instance.playBgmFocus141();
          Focus141TbaUtils.instance.uploadPoint(
            focus141PointEnum: Focus141PointEnum.fkskv_ad_imp_close,
            params: {
              "ad_code_id":info?.adId,
              "ad_format":info?.adType.name,
              "ad_platform":info?.adPlat,
              "ad_pos_id":focus141AdEnum.name,
            },
          );
          FlutterRiskControlPlugins.instance.handleCloseAd(adType==AdType.reward);
          result.call(true);
        },
        revenuePaid: (ad,info){
          FlutterRiskControlPlugins.instance.handleRevenuePaidAd(adType==AdType.reward);
        },
      ),
    );
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