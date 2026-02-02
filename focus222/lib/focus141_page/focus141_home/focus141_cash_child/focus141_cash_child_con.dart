import 'package:flutter/foundation.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_enum/focus141_loop_task_type_enum.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_ad_enum.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_bean/focus141_cash_loop_task_info_bean.dart';
import 'package:focus222/focus141_bean/focus141_cash_money_list_bean.dart';
import 'package:focus222/focus141_bean/focus141_cash_queue_info_bean.dart';
import 'package:focus222/focus141_dialog/focus141_cash_task_dialog/focus141_cash_task_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_loop_task_dialog/focus141_loop_task_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_no_money_dialog/focus141_no_money_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_queue_dialog/focus141_queue_dialog.dart';
import 'package:focus222/focus141_dialog/focus141_quiz20_cask_task_dialog/focus141_quiz20_cask_task_dialog.dart';
import 'package:focus222/focus141_utils/focus141_cash_utils.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141CashChildCon extends Focus141Con{
  List<Focus141CashMoneyListBean> cashMoneyList=[];
  Focus141CashTypeEnum selectedCashType=Focus141CashTypeEnum.values.byName(bCashType.getData());
  List<Focus141CashTypeEnum> cashTypeList=Focus141CashTypeEnum.values;

  @override
  void onReady() {
    super.onReady();
    _initCashMoneyList();
  }

  clickCashAppTab(Focus141CashTypeEnum typeEnum){
    if(typeEnum==selectedCashType){
      return;
    }
    selectedCashType=typeEnum;
    bCashType.saveData(selectedCashType.name);
    update(["tab","top_cash_type"]);
    _initCashMoneyList();
  }

  clickCashBtn(Focus141CashMoneyListBean bean){
    var myMoney = bFocus141Money.getData();
    if(myMoney<bean.money){
      showDialogFocus141(
        child: Focus141NoMoneyDialog(
          money: bean.money,
          myMoney: myMoney,
        ),
      );
      return;
    }
    Focus141CashUtils.instance.showInputAccountDialog(bean.money, selectedCashType);
  }

  toQuizTab(){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.cash_page_go,);
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateHomeTab,focus141Int: 0);
  }

  clickQueueBtn(Focus141CashMoneyListBean bean){
    if(kDebugMode){
      Focus141CashUtils.instance.updateQueueTaskProgress(bean.focus141cashQueueInfoBean);
      return;
    }
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.cash_page_speedup,);
    Focus141AdUtils.instance.showAdFocus141(
      adType: AdType.reward,
      showAd: Focus141ValueUtils.instance.showAd(AdType.reward),
      focus141AdEnum: Focus141AdEnum.fkskv_queue_rv,
      result: (give)async{
        if(give){
          Focus141CashUtils.instance.updateQueueTaskProgress(bean.focus141cashQueueInfoBean);
        }
      },
    );
  }

  clickLoopTaskBtn(){
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateHomeTab,focus141Int: 0);
  }

  clickCashItem(Focus141CashMoneyListBean bean){
    if(null!=bean.focus141cashQuiz20InfoBean){
      showDialogFocus141(child: Focus141Quiz20CaskTaskDialog());
    }
    if(null!=bean.focus141cashQueueInfoBean){
      showDialogFocus141(child: Focus141QueueDialog(bean: bean));
    }
    if(null!=bean.focus141cashQuiz50LoginInfoBean){
      showDialogFocus141(
        child: Focus141CashTaskDialog(bean: bean),
      );
    }
    if(null!=bean.focus141cashLoopTaskInfoBean){
      showDialogFocus141(
        child: Focus141LoopTaskDialog(bean: bean),
      );
    }
  }

  double getQueueProgress(Focus141CashQueueInfoBean? bean){
    var currentPro = bean?.currentPro??0;
    var totalPro = bean?.totalPro??0;
    if(totalPro<=0){
      return 0.0;
    }
    return getProgress(totalPro-currentPro, totalPro);
  }

  _initCashMoneyList()async{
    cashMoneyList.clear();
    for (var value in Focus141ValueUtils.instance.getCashList()) {
      var focus141cashQuiz20InfoBean = await Focus141CashUtils.instance.queryCashQuiz20Info(value, selectedCashType);
      var focus141cashQueueInfoBean = await Focus141CashUtils.instance.queryCashQueueInfo(value, selectedCashType);
      var focus141cashQuiz50LoginInfoBean = await Focus141CashUtils.instance.queryCashQuiz50AndLoginInfo(value, selectedCashType);
      var focus141cashLoopTaskInfoBean = await Focus141CashUtils.instance.queryCashLoopTaskInfo(value, selectedCashType);

      var focus141cashMoneyListBean = Focus141CashMoneyListBean(
          money: value,
          focus141cashQuiz20InfoBean: focus141cashQuiz20InfoBean,
          focus141cashQueueInfoBean: focus141cashQueueInfoBean,
          focus141cashQuiz50LoginInfoBean: focus141cashQuiz50LoginInfoBean,
          focus141cashLoopTaskInfoBean: focus141cashLoopTaskInfoBean
      );
      cashMoneyList.add(focus141cashMoneyListBean);
    }
    update(["cash_list"]);
  }

  @override
  bool focus141InitEvent() => true;

  @override
  focus141HandleEventMsg(int eventCode, int? intValue, String? strValue, anyValue) {
    switch(eventCode){
      case Focus141EventCode.updateCashInfo:
        _initCashMoneyList();
        break;
      case Focus141EventCode.updateMoney:
        _initCashMoneyList();
        update(["money"]);
        break;
      case Focus141EventCode.changeCashType:
        if(anyValue is Focus141CashTypeEnum){
          clickCashAppTab(anyValue);
        }
        break;
    }
  }
}