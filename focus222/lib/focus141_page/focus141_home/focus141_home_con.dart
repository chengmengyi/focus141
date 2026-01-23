import 'package:flutter/material.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_feng_utils.dart';
import 'package:focus222/focus141_bean/focus141_home_tab_bean.dart';
import 'package:focus222/focus141_page/focus141_home/focus141_cash_child/focus141_cash_child.dart';
import 'package:focus222/focus141_page/focus141_home/focus141_quiz_child/focus141_quiz_child.dart';

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
  }

  clickTab(int index){
    if(tabIndex==index){
      return;
    }
    tabIndex=index;
    update(["page"]);
  }

  @override
  bool focus141InitEvent() => true;

  @override
  focus141HandleEventMsg(int eventCode, int? intValue, String? strValue, anyValue) {
    switch(eventCode){
      case Focus141EventCode.updateHomeTab:
        clickTab(intValue??0);
        break;
    }
  }

}