import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';

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