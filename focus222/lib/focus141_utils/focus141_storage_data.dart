import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';


class Focus141StorageData{
  static const String bFocus141Money="bFocus141Money";
  static const String bFocus141AnswerRightNum="bFocus141AnswerRightNum";
  static const String bCashType="bCashType";
}

StorageData<double> bFocus141Money=StorageData<double>(key: Focus141StorageData.bFocus141Money, defaultValue: 0.0);


StorageData<int> bFocus141AnswerRightNum=StorageData<int>(key: Focus141StorageData.bFocus141AnswerRightNum, defaultValue: 0);

StorageData<String> bCashType=StorageData<String>(key: Focus141StorageData.bCashType, defaultValue: Focus141CashTypeEnum.paypal.name);
