import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141Quiz20CaskTaskDialogCon extends Focus141Con{

  clickClose(){
    backFocus141();
  }

  clickGo(){
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateHomeTab,focus141Int: 0);
    backFocus141();
  }
}