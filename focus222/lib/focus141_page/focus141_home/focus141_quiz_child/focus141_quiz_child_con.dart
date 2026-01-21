import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_enum/focus141_loop_task_type_enum.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_routers/focus141_router_address.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_bean/focus141_home_pro_bean.dart';
import 'package:focus222/focus141_bean/focus141_quiz_bean.dart';
import 'package:focus222/focus141_bean/focus141_quiz_type_bean.dart';
import 'package:focus222/focus141_dialog/focus141_box_dialog/focus141_box_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_new_user_dialog/focus141_new_user_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_old_user_dialog/focus141_old_user_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_reach_cash_money_dialog/focus141_reach_cash_money_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_reward_dialog/focus141_reward_dialog.dart';
import 'package:focus222/focus141_utils/focus141_cash_utils.dart';
import 'package:focus222/focus141_utils/focus141_home_pro_utils.dart';
import 'package:focus222/focus141_utils/focus141_info_utils.dart';
import 'package:focus222/focus141_utils/focus141_quiz_utils.dart';
import 'package:focus222/focus141_utils/focus141_user_guide_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141QuizChildCon extends Focus141Con{
  var quizIndex=0,quizTypeIndex=0,currentChooseAnswer="",_canClick=true;
  List<Focus141QuizTypeBean> quizTypeList=[];

  List<Focus141HomeProBean> progressList=[];
  ScrollController scrollController=ScrollController();

  Timer? _rightAnswerTimer;
  Offset? fingerOffset;
  GlobalKey answerAGlobalKey=GlobalKey();
  GlobalKey answerBGlobalKey=GlobalKey();

  @override
  void onInit() {
    super.onInit();
    _initProgressList();
  }

  @override
  void onReady() {
    super.onReady();
    _initQuizList();
  }

  _initProgressList()async{
    var list = await Focus141HomeProUtils.instance.getProList();
    progressList.clear();
    progressList.addAll(list);
    update(["progress"]);
    _jumpProgress();
  }

  _jumpProgress(){
    var lastIndexWhere = progressList.lastIndexWhere((value)=>value.received==1);
    if(lastIndexWhere>=0){
      var emptyCount = progressList.take(lastIndexWhere+1).where((e) => e.type == Focus141HomeProType.empty).length;
      var otherCount = progressList.take(lastIndexWhere+1).where((e) => e.type != Focus141HomeProType.empty).length;
      var distance = (25.w)*emptyCount+(30.w)*otherCount;
      scrollController.animateTo(distance, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  clickProgress(Focus141HomeProBean bean)async{
    if(bean.received==1){
      return;
    }
    if(bean.type==Focus141HomeProType.box){
      showDialogFocus141(
        child: Focus141BoxDialog(
          reward: Focus141ValueUtils.instance.getBoxReward(),
          callback: ()async{
            await Focus141HomeProUtils.instance.updateProgress(bean);
            bean.received=1;
            update(["progress"]);
          },
        ),
      );
    }else if(bean.type==Focus141HomeProType.wheel){
      var result = await Get.toNamed(Focus141RouterAddress.bWheel);
      if(null!=result){
        await Focus141HomeProUtils.instance.updateProgress(bean);
        bean.received=1;
        update(["progress"]);
      }
    }
  }

  String getProIcon(Focus141HomeProBean bean, bool selected){
    switch(bean.type){
      case Focus141HomeProType.box:
        if(bean.received==1||!selected){
          return "box_uns";
        }
        return "box_sel";
      case Focus141HomeProType.wheel:
        if(bean.received==1||!selected){
          return "wheel_uns";
        }
        return "wheel_sel";
      default: return "";
    }
  }

  Focus141QuizTypeBean? getQuizTypeBean(){
    if(quizTypeIndex<quizTypeList.length){
      return quizTypeList[quizTypeIndex];
    }
    return null;
  }

  Focus141QuizBean? getQuizBean(Focus141QuizTypeBean typeBean){
    if(quizIndex<typeBean.list.length){
      return typeBean.list[quizIndex];
    }
    return null;
  }

  String getAnswerBgImage(String index,Focus141QuizBean quizBean){
    if(index!=currentChooseAnswer){
      return "answer_normal";
    }
    if(quizBean.answer==currentChooseAnswer){
      return "answer_right";
    }
    return "answer_error";
  }

  String getAnswerResultImage(String index,Focus141QuizBean quizBean){
    if(index!=currentChooseAnswer){
      return "";
    }
    if(quizBean.answer==currentChooseAnswer){
      return "icon_answer_right";
    }
    return "icon_answer_error";
  }

  _initQuizList(){
    var initQuizList = Focus141QuizUtils.instance.initQuizList();
    quizTypeList.clear();
    quizTypeList.addAll(initQuizList);
    if(initQuizList.isNotEmpty){
      update(["quiz"]);
    }
  }

  clickAnswer(String index,Focus141QuizBean quizBean,Focus141QuizTypeBean typeBean)async{
    if(currentChooseAnswer==index||!_canClick){
      return;
    }
    _canClick=false;
    currentChooseAnswer=index;
    fingerOffset = null;
    update(["answer","finger"]);
    await Future.delayed(Duration(milliseconds: 1000));
    var result = quizBean.answer==index;
    if(result){
      showDialogFocus141(
        child: Focus141RewardDialog(
          reward: Focus141ValueUtils.instance.getQuizReward(),
          callback: (){
            _updateNextQuiz(typeBean);
            Focus141InfoUtils.instance.updateAnswerRightNum();
            update(["progress"]);
          },
        ),
      );
    }else{
      _updateNextQuiz(typeBean);
    }
  }

  _updateNextQuiz(Focus141QuizTypeBean typeBean){
    currentChooseAnswer="";
    //最后一道题
    if(quizIndex+1>=typeBean.size){
      //最后一个类型了，从头开始
      if(quizTypeIndex+1>=quizTypeList.length){
        quizIndex=0;
        quizTypeIndex=0;
      }else{
        quizTypeIndex++;
      }
    }else{
      quizIndex++;
    }
    _canClick=true;
    update(["quiz"]);
    _startRightAnswerTimer();
  }

  _startRightAnswerTimer(){
    _endRightAnswerTimer();
    _rightAnswerTimer=Timer(Duration(milliseconds: 5000), (){
      try{
        var focus141quizBean = quizTypeList[quizTypeIndex].list[quizIndex];
        var globalKey = focus141quizBean.answer=="a"?answerAGlobalKey:answerBGlobalKey;
        var renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;
        fingerOffset = renderBox.localToGlobal(Offset.zero);
        update(["finger"]);
      }catch(e){

      }
    },);
  }

  _endRightAnswerTimer(){
    _rightAnswerTimer?.cancel();
    _rightAnswerTimer=null;
  }

  clickFinger(){
    try{
      var focus141quizTypeBean = quizTypeList[quizTypeIndex];
      var focus141quizBean = focus141quizTypeBean.list[quizIndex];
      clickAnswer(focus141quizBean.answer??"a", focus141quizBean, focus141quizTypeBean);
    }catch(e){

    }
  }

  test()async{
    if(!kDebugMode){
      return;
    }

    // Focus141InfoUtils.instance.updateAnswerRightNum();
    // update(["progress"]);
    // Focus141ValueUtils.instance.initValue();
    // Focus141InfoUtils.instance.updateMoney(2000);
    // Focus141CashUtils.instance.showReachCashMoneyDialog(800,Focus141CashTypeEnum.cashapp);
    // Focus141CashUtils.instance.updateLoopTask(taskType: Focus141LoopTaskTypeEnum.wheel);
    // Focus141CashUtils.instance.updateQuizTaskProgress();
    // Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.showMoneyReward,focus141Dynamic: 220);
    // Focus141UserGuideUtils.instance.showNewUserGuide();
    Focus141UserGuideUtils.instance.test();
  }

  @override
  void onClose() {
    scrollController.dispose();
    _endRightAnswerTimer();
    super.onClose();
  }

}