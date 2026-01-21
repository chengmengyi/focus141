import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141OldUserDialogCon extends Focus141Con{
  clickSpin(Function(bool clickDouble) callback){
    backFocus141();
    callback.call(true);
  }

  clickClose(Function(bool clickDouble) callback){
    backFocus141();
    callback.call(false);
  }
}