import 'dart:math';

import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_loop_task_type_enum.dart';
import 'package:focus111/focus141_enum/focus141_reward_type.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_enum.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_dialog/focus141_reward_dialog/focus141_reward_dialog.dart';
import 'package:focus222/focus141_utils/focus141_cash_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141WheelCon extends Focus141Con with GetSingleTickerProviderStateMixin{
  var wheelReward=0,canClick=true,fromOldUser=false;
  List<int> wheelList=[20,100,50,10,80,10,5,0];
  late AnimationController _wheelAnimationController;
  Animation<double>? wheelAnimation;
  late AnimationStatusListener _statusListener;

  @override
  void onInit() {
    super.onInit();
    if(null!=Get.arguments){
      var map = Get.arguments as Map<String, dynamic>;
      fromOldUser=map["fromOld"]??false;
    }
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.wheel_pop,params: {"source_from":fromOldUser?"old":"quiz"});
    _initAnimator();
    _initWheelReward();
  }

  @override
  void onReady() {
    super.onReady();
    canClick=false;
    _wheelAnimationController..reset()..forward();
  }

  clickWheel(){
    if(!canClick){
      return;
    }
    _initWheelReward();
    canClick=false;
    _wheelAnimationController..reset()..forward();
  }

  _initAnimator(){
    _wheelAnimationController=AnimationController(vsync: this,duration: const Duration(milliseconds: 2000));
    _statusListener=(status){
      if(status==AnimationStatus.completed){
        _wheelCompleted();
      }
    };
    _wheelAnimationController.addStatusListener(_statusListener);
  }

  _wheelCompleted()async{
    await Future.delayed(Duration(milliseconds: 1000));
    Focus141AdUtils.instance.showAdFocus141(
      adType: AdType.interstitial,
      focus141AdEnum: fromOldUser?Focus141AdEnum.fkskv_olduser_wheelspin_int:Focus141AdEnum.fkskv_wheelspin_int,
      showAd: Focus141ValueUtils.instance.showAd(AdType.interstitial),
      result: (give){
        canClick=true;
        Focus141CashUtils.instance.updateLoopTask(taskType: Focus141LoopTaskTypeEnum.wheel);
        if(fromOldUser){
          backFocus141(params: {"reward":wheelReward.toDouble()});
          return;
        }
        showDialogFocus141(
          child: Focus141RewardDialog(
            focus141rewardType: Focus141RewardType.wheel,
            reward: wheelReward.toDouble(),
            callback: (){
              backFocus141(params: {});
            },
          ),
        );
      },
    );
  }

  _initWheelReward(){
    wheelReward=Focus141ValueUtils.instance.getWheelAddNum();
    var indexWhere = wheelList.indexWhere((value)=>value==wheelReward);
    if(indexWhere<0){
      canClick=true;
      return;
    }
    var angle = 720-indexWhere*45;
    wheelAnimation=Tween<double>(begin: 0,end: (720+angle)*(pi/180)).animate(_wheelAnimationController);
  }

  clickBack(){
    if(!canClick){
      return;
    }
    backFocus141();
  }

  @override
  void onClose() {
    _wheelAnimationController.removeStatusListener(_statusListener);
    _wheelAnimationController.dispose();
    super.onClose();
  }

}