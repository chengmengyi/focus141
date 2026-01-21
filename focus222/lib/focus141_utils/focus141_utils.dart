import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_enum/focus141_loop_task_type_enum.dart';
import 'package:focus222/focus141_bean/focus141_cash_loop_task_info_bean.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

String getTopCashTypeIcon(Focus141CashTypeEnum cashType){
  switch(cashType){
    case Focus141CashTypeEnum.cashapp:return "top_cash_type_cashapp";
    case Focus141CashTypeEnum.paypal:return "top_cash_type_paypal";
  }
}

String getCashTypeTabSelIcon(Focus141CashTypeEnum cashType){
  switch(cashType){
    case Focus141CashTypeEnum.cashapp:return "cashapp_sel";
    case Focus141CashTypeEnum.paypal:return "paypal_sel";
  }
}

String getCashTypeTabUnsIcon(Focus141CashTypeEnum cashType){
  switch(cashType){
    case Focus141CashTypeEnum.cashapp:return "cashapp_uns";
    case Focus141CashTypeEnum.paypal:return "paypal_uns";
  }
}

String getCashTypeMoneyBgImage(Focus141CashTypeEnum cashType){
  switch(cashType){
    case Focus141CashTypeEnum.cashapp:return "bg_cashapp";
    case Focus141CashTypeEnum.paypal:return "bg_paypal";
  }
}

String getInputAccountCashType(Focus141CashTypeEnum cashType,bool selected){
  switch(cashType){
    case Focus141CashTypeEnum.cashapp:return selected?"input_cashapp_sel":"input_cashapp_uns";
    case Focus141CashTypeEnum.paypal:return selected?"input_paypal_sel":"input_paypal_uns";
  }
}

String getLoopTaskLeftStr(Focus141CashLoopTaskInfoBean? bean){
  try{
    switch(_getLoopTaskTypeEnum(bean)){
      case Focus141LoopTaskTypeEnum.quiz: return "Quiz ";
      case Focus141LoopTaskTypeEnum.wheel: return "Spin ";
      case Focus141LoopTaskTypeEnum.video: return "Watch ";
    }
  }catch(e){
    return "";
  }
}

String getLoopTaskRightStr(Focus141CashLoopTaskInfoBean? bean){
  try{
    switch(_getLoopTaskTypeEnum(bean)){
      case Focus141LoopTaskTypeEnum.video: return " Ad Video";
      default: return " Times";
    }
  }catch(e){
    return "";
  }
}

Focus141LoopTaskTypeEnum _getLoopTaskTypeEnum(Focus141CashLoopTaskInfoBean? bean){
  try{
    var tixianTask = Focus141ValueUtils.instance.getTixianTaskById(bean?.taskId);
    return Focus141LoopTaskTypeEnum.values.byName(tixianTask?.title??"");
  }catch(e){
    return Focus141LoopTaskTypeEnum.quiz;
  }
}
