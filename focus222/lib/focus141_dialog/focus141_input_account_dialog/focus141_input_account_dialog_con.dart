import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_cash_utils.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';

class Focus141InputAccountDialogCon extends Focus141Con{
  int money;
  Focus141CashTypeEnum typeEnum;
  Function() callback;
  TextEditingController textEditingController=TextEditingController();
  Focus141InputAccountDialogCon({
    required this.money,
    required this.typeEnum,
    required this.callback,
  });

  clickCashType(Focus141CashTypeEnum type){
    if(type==typeEnum){
      return;
    }
    typeEnum=type;
    bCashType.saveData(typeEnum.name);
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.changeCashType,focus141Dynamic: type);
    update(["cash_type"]);
  }

  clickConfrim()async{
    var account = textEditingController.text.trim();
    if(account.isEmpty){
      showToastFocus141(text: "Please input your account ID");
      return;
    }
    await Focus141CashUtils.instance.saveCashAccount(typeEnum, account);
    backFocus141();
    callback.call();
  }

  clickClose(){
    backFocus141();
  }

  @override
  void onClose() {
    textEditingController.dispose();
    super.onClose();
  }
}