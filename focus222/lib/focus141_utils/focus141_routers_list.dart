import 'package:focus111/focus141_routers/focus141_router_address.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_page/focus141_home/focus141_home_page.dart';
import 'package:focus222/focus141_page/focus141_set/focus141_set.dart';
import 'package:focus222/focus141_page/focus141_wheel/focus141_wheel_page.dart';

class Focus141RoutersList {
  static List<GetPage> list=[
    GetPage(
        name: Focus141RouterAddress.bHome,
        page: ()=> Focus141HomePage(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: Focus141RouterAddress.bWheel,
        page: ()=> Focus141WheelPage(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: Focus141RouterAddress.bSet,
        page: ()=> Focus141Set(),
        transition: Transition.fadeIn
    ),
  ];
}