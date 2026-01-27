import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class FocusAdLoadFailDialogCon extends Focus141Con{
  clickClose(Function(bool tryAgain) tryAgainCallback){
    backFocus141();
    tryAgainCallback.call(false);
  }

  clickTryAgain(Function(bool tryAgain) tryAgainCallback){
    backFocus141();
    tryAgainCallback.call(true);
  }
}