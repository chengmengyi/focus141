import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focus/focus141_launch/focus141_launch_page.dart';
import 'package:focus111/focus141_routers/focus141_router_address.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_firebase_config_utils.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_home_pro_utils.dart';
import 'package:focus222/focus141_utils/focus141_routers_list.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';
import 'package:spine_flutter/spine_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
      )
  );
  await GetStorage.init();
  await initSpineFlutter();

  //b
  Focus141HomeProUtils.instance.initProgress();
  Focus141ValueUtils.instance.initValue();
  Focus141FirebaseConfigUtils.instance.initFirebaseConfig();
  Focus141TbaUtils.instance.uploadInstall();
  Focus141AdUtils.instance.initAdFocus141();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<GetPage> pages=[
      GetPage(
          name: Focus141RouterAddress.launch,
          page: ()=> Focus141LaunchPage(),
          transition: Transition.fadeIn
      ),
    ];
    pages.addAll(Focus141RoutersList.list);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (c,child)=>GetMaterialApp(
        title: "FocusQuest",
        enableLog: true,
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: Focus141RouterAddress.launch,
        debugShowCheckedModeBanner: false,
        getPages: pages,
        defaultTransition: Transition.rightToLeft,
      ),
    );
  }
}

