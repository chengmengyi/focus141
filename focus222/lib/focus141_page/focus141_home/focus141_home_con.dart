import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_loop_task_type_enum.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_feng_utils.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus222/focus141_bean/focus141_home_tab_bean.dart';
import 'package:focus222/focus141_page/focus141_home/focus141_cash_child/focus141_cash_child.dart';
import 'package:focus222/focus141_page/focus141_home/focus141_quiz_child/focus141_quiz_child.dart';
import 'package:focus222/focus141_utils/focus141_cash_utils.dart';
import 'package:focus222/focus141_utils/focus141_user_guide_utils.dart';

class Focus141HomeCon extends Focus141Con{
  var tabIndex=0;
  List<Focus141HomeTabBean> tabList=[
    Focus141HomeTabBean(text: "Quiz", icon: "home_quiz"),
    Focus141HomeTabBean(text: "Cash", icon: "home_cash"),
  ];
  List<Widget> pageList=[Focus141QuizChild(),Focus141CashChild()];

  @override
  void onInit() {
    super.onInit();
    Focus141FengUtils.instance.initFeng();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.quiz_page,params: {"source_from":"inform"});
    Focus141AdUtils.instance.adShowSuccessCallback=(){
      Focus141CashUtils.instance.updateLoopTask(taskType: Focus141LoopTaskTypeEnum.video);
    };
  }

  @override
  void onReady() {
    super.onReady();
    Focus141UserGuideUtils.instance.showNewUserGuide();
  }

  clickTab(int index){
    if(tabIndex==index){
      return;
    }
    tabIndex=index;
    update(["page"]);
    if(index==0){
      Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.quiz_page,params: {"source_from":"inform"});
    }
    if(index==1){
      Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.cash_page);
    }
  }

  @override
  bool focus141InitEvent() => true;

  @override
  focus141HandleEventMsg(int eventCode, int? intValue, String? strValue, anyValue) {
    switch(eventCode){
      case Focus141EventCode.updateHomeTab:
        var index = intValue??0;
        if(tabIndex==index){
          return;
        }
        tabIndex=index;
        update(["page"]);
        if(index==0){
          Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.quiz_page,params: {"source_from":"task"});
        }
        break;
    }
  }
}