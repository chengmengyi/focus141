import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_bean/focus141_cash_money_list_bean.dart';

class Focus141LoopTaskDialogCon extends Focus141Con{

  Focus141CashMoneyListBean bean;
  Focus141LoopTaskDialogCon({
    required this.bean,
  });


  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.one_last_step_pop);
  }

  clickClose(){
    backFocus141();
  }

  clickContinue(){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.one_last_step_pop_c);
    backFocus141();
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateHomeTab,focus141Int: 0);
  }

  Focus141CashTypeEnum getCashType(){
    try{
      String? cashType;
      if(null!=bean.focus141cashQuiz20InfoBean){
        cashType=bean.focus141cashQuiz20InfoBean?.cashType;
      }
      if(null!=bean.focus141cashQueueInfoBean){
        cashType=bean.focus141cashQueueInfoBean?.cashType;
      }
      if(null!=bean.focus141cashQuiz50LoginInfoBean){
        cashType=bean.focus141cashQuiz50LoginInfoBean?.cashType;
      }
      if(null!=bean.focus141cashLoopTaskInfoBean){
        cashType=bean.focus141cashLoopTaskInfoBean?.cashType;
      }
      return Focus141CashTypeEnum.values.byName(cashType??"");
    }catch(e){
      return Focus141CashTypeEnum.cashapp;
    }
  }
}