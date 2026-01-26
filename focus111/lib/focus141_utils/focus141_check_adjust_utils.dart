import 'dart:io';

import 'package:flutter_android_ad_plugins/data/ad_money_info_bean.dart';
import 'package:flutter_check_adjust/flutter_check_adjust.dart';
import 'package:flutter_check_adjust/request_adjust/request_adjust_callback.dart';
import 'package:flutter_check_adjust/request_cloak/request_cloak_callback.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:focus111/focus141_utils/focus141_local_quiz.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141CheckAdjustUtils{
  static final Focus141CheckAdjustUtils _adjustUtils=Focus141CheckAdjustUtils();
  static Focus141CheckAdjustUtils get instance => _adjustUtils;

  initFocus141()async{
    var distinctId = await FlutterTbaInfo.instance.getDistinctId();
    var cloakData={
      "wysiwyg":await FlutterTbaInfo.instance.getBundleId(),
      "wiry":Platform.isAndroid?"congener":"sent",
      "fare":await FlutterTbaInfo.instance.getAppVersion(),
      "pin":await FlutterTbaInfo.instance.getDistinctId(),
      "skyward":DateTime.now().millisecondsSinceEpoch,
      "rowe":await FlutterTbaInfo.instance.getDeviceModel(),
      "prig":await FlutterTbaInfo.instance.getOsVersion(),
      "nibelung":await FlutterTbaInfo.instance.getIdfv(),
      "macon":await FlutterTbaInfo.instance.getGaid(),
      "apostasy":await FlutterTbaInfo.instance.getAndroidId(),
      "dive":await FlutterTbaInfo.instance.getBrand(),
    };
    FlutterCheckAdjust.instance.init(
      adjustAppToken: Focus141LocalQuiz.adjustKeyBase64.base64(),
      distinctId: distinctId,
      clockUrl: Focus141LocalQuiz.cloakUrl,
      cloakWhiteKey: "those",
      cloakData: cloakData,
      referrerConfList: [],
      requestAdjustCallback: RequestAdjustCallback(
        startRequestAdjust: (){
          // HissPointUtils.instance.pointEvent(hissPointEnum: HissPointEnum.adjust_req);
        },
        requestSuccess: (bool isB){
          // HissPointUtils.instance.pointEvent(hissPointEnum: HissPointEnum.adjust_suc,params: {"cloak_user":isB?1:0});
          // _delayCheckUser();
        },
        firstRequestAdjustB: (){
          Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.organic_to_buy);
        },
      ),
      requestCloakCallback: RequestCloakCallback(
        startRequestCloak: (){
          Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.cloak_req);
        },
        requestSuccess: (bool isWhite){
          Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.cloak_suc,params: {"cloak_user":isWhite?1:0});
        },
      ),
    );
  }

  bool getUserFocus141(){
    // if(kDebugMode){
    //   return true;
    // }
    if(Platform.isAndroid){
      return true;
    }
    return FlutterCheckAdjust.instance.checkUser();
  }

  uploadRevenueFocus141(AdMoneyInfoBean? ad){
    FlutterCheckAdjust.instance.uploadAdRevenueToAdjust(ad?.networkName??"", ad?.revenue??0, ad?.adUnitId??"");
  }
}