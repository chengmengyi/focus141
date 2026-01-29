import 'dart:async';

import 'package:flutter_android_ad_plugins/flutter_android_ad_plugins.dart';
import 'package:flutter_android_ad_plugins/hep/ad_type.dart';
import 'package:flutter_app_lifecycle/app_state_observer.dart';
import 'package:flutter_app_lifecycle/flutter_app_lifecycle.dart';
import 'package:focus111/focus141_utils/focus141_ad_enum.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focua141_notification/focus141_notification_utils.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';

class Focus141AppLifecycleUtils {
  static final Focus141AppLifecycleUtils _focus141appLifecycleUtils=Focus141AppLifecycleUtils();
  static Focus141AppLifecycleUtils get instance => _focus141appLifecycleUtils;

  var toOpenNotification=false,_isBackAppLifecycle=false;

  Timer? _timerFocus141;

  addAppLifecycleListener(){
    FlutterAppLifecycle.instance.setCallObserver(
        AppStateObserver(
          call: (bool back) {
            _callback(back);
          },
        ),
    );
  }

  _callback(bool back){
    if(back){
      // HissMp3Utils.instance.stopBgm();
      _timerFocus141=Timer(Duration(milliseconds: 3000), (){
        _isBackAppLifecycle=true;
      });
    }else{
      if(!FlutterAndroidAdPlugins.instance.adShowing()){
        // HissMp3Utils.instance.playBgm();
      }
      _timerFocus141?.cancel();
      _timerFocus141=null;
      if(toOpenNotification){
        Focus141NotificationUtils.instance.initNotificationFocus141();
        toOpenNotification=false;
      }else{
        if(_isBackAppLifecycle&&!FlutterAndroidAdPlugins.instance.adShowing()){
          Focus141NotificationUtils.instance.uploadShowNumFocus141();
          Focus141TbaUtils.instance.uploadLocalData();
          Focus141AdUtils.instance.showAdFocus141(
            adType: AdType.interstitial,
            focus141AdEnum: Focus141AdEnum.fkskv_launch,
            showAd: true,
            isOpenAd: true,
            result: (give){

            },
          );
        }
        _isBackAppLifecycle=false;
      }
    }
  }
}