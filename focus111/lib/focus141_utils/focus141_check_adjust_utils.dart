import 'package:flutter_android_ad_plugins/data/ad_money_info_bean.dart';
import 'package:flutter_check_adjust/flutter_check_adjust.dart';

class Focus141CheckAdjustUtils{
  static final Focus141CheckAdjustUtils _adjustUtils=Focus141CheckAdjustUtils();
  static Focus141CheckAdjustUtils get instance => _adjustUtils;

  uploadRevenueFocus141(AdMoneyInfoBean? ad){
    FlutterCheckAdjust.instance.uploadAdRevenueToAdjust(ad?.networkName??"", ad?.revenue??0, ad?.adUnitId??"");
  }
}