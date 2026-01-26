import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_routers/focus141_router_address.dart';
import 'package:focus111/focus141_utils/focus141_ad_enum.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_check_adjust_utils.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141LaunchController extends Focus141Con with GetSingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.launch_page);
    controller=AnimationController(duration: const Duration(seconds: 13),vsync: this)
      ..addListener(() {
        update(["progress"]);
      })
      ..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          _completed();
        }
      });
  }

  @override
  void onReady() {
    super.onReady();
    controller.forward();
  }

  _completed(){
    var userFocus141 = Focus141CheckAdjustUtils.instance.getUserFocus141();
    if(!userFocus141){
      _toHome(userFocus141);
      return;
    }
    if(showOpenAd.getData()){
      Focus141AdUtils.instance.showAdFocus141(
        adType: AdType.interstitial,
        focus141AdEnum: Focus141AdEnum.fkskv_launch,
        showAd: true,
        result: (give){
          _toHome(true);
        },
      );
    }else{
      _toHome(true);
    }
  }
  
  _toHome(bool userFocus141){
    showOpenAd.saveData(true);
    Get.offNamed(Focus141RouterAddress.bHome);
  }
}