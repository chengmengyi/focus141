import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141ReachCashMoneyDialogCon extends Focus141Con{

  clickClaim(Function() callback){
    backFocus141();
    callback.call();
  }
}