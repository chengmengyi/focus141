import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_routers/focus141_router_address.dart';
import 'package:focus111/focus141_utils/focus141_local_quiz.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141SetCon extends Focus141Con{

  toPrivacy(){
    Get.toNamed(Focus141RouterAddress.bWeb,arguments: {"url":Focus141LocalQuiz.privacy});
  }

  toEmail(){
    FlutterTbaInfo.instance.jumpToEmail(Focus141LocalQuiz.email);
  }
}