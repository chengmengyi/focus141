import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_utils/focus141_app_lifecycle_utils.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class FocusOpenNotificationDialogCon extends Focus141Con{

  @override
  void onInit() {
    super.onInit();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.no_network_pop);
  }

  clickTryAgain(){
    backFocus141();
    Focus141AppLifecycleUtils.instance.toOpenNotification=true;
    AppSettings.openAppSettings(type: AppSettingsType.notification);
  }
  clickClose(){
    backFocus141();
  }

}