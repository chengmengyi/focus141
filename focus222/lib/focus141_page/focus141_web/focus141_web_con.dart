import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141WebCon extends Focus141Con{
  late WebViewController controller;

  @override
  void onInit() {
    super.onInit();
    _loadCommonUrl(Get.arguments["url"]);
  }

  _loadCommonUrl(url){
    controller=WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)..loadRequest(Uri.parse(url));
  }
}