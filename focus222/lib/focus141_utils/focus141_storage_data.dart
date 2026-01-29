import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';


class Focus141StorageData{
  static const String bFocus141Money="bFocus141Money";
  static const String bFocus141AnswerRightNum="bFocus141AnswerRightNum";
  static const String bCashType="bCashType";
  static const String bNewUserGuideTime="bNewUserGuideTime";
  static const String bOldUserGuideTime="bOldUserGuideTime";
  static const String bValueFirebaseConfig="bValueFirebaseConfig";
  static const String bFirstAnswer="bFirstAnswer";
  static const String bFirstClickBubble="bFirstClickBubble";
  static const String bShowReachCashMoneyDialog="bShowReachCashMoneyDialog";
}

// StorageData<double> bFocus141Money=StorageData<double>(key: Focus141StorageData.bFocus141Money, defaultValue: 0.0);


StorageData<bool> bFirstAnswer=StorageData<bool>(key: Focus141StorageData.bFirstAnswer, defaultValue: true);
StorageData<bool> bFirstClickBubble=StorageData<bool>(key: Focus141StorageData.bFirstClickBubble, defaultValue: true);
StorageData<bool> bShowReachCashMoneyDialog=StorageData<bool>(key: Focus141StorageData.bShowReachCashMoneyDialog, defaultValue: true);


StorageData<int> bFocus141AnswerRightNum=StorageData<int>(key: Focus141StorageData.bFocus141AnswerRightNum, defaultValue: 0);

StorageData<String> bCashType=StorageData<String>(key: Focus141StorageData.bCashType, defaultValue: Focus141CashTypeEnum.paypal.name);
StorageData<String> bNewUserGuideTime=StorageData<String>(key: Focus141StorageData.bNewUserGuideTime, defaultValue: "");
StorageData<String> bOldUserGuideTime=StorageData<String>(key: Focus141StorageData.bOldUserGuideTime, defaultValue: "");
StorageData<String> bValueFirebaseConfig=StorageData<String>(key: Focus141StorageData.bValueFirebaseConfig, defaultValue: "");
