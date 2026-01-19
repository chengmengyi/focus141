import 'dart:convert';

import 'package:flutter/material.dart';

import 'focus141_utils.dart';

export 'package:get_storage/get_storage.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:get/get.dart';
export 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
export 'package:webview_flutter/webview_flutter.dart';
export 'package:flutter_android_ad_plugins/flutter_android_ad_plugins.dart';
export 'package:flutter_android_ad_plugins/hep/ad_type.dart';
export 'package:flutter_android_ad_plugins/hep/ad_num_hep.dart';
export 'package:decimal/decimal.dart';
export 'package:marqueer/marqueer.dart';
export 'package:lottie/lottie.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:app_settings/app_settings.dart';
export 'package:permission_handler/permission_handler.dart';
export 'package:flutter_tba_info/flutter_tba_info.dart';


extension StringBase64 on String{
  String base64()=>const Utf8Decoder().convert(base64Decode(this));
}

double getProgress(num1,num2){
  try{
    if(num2==0){
      return 0.0;
    }
    var d = num1/num2;
    if(d<0){
      return 0.0;
    }else if(d>1.0){
      return 1.0;
    }else{
      return d;
    }
  }catch(e){
    return 0.0;
  }
}


double addDecimalFocus141(num1,num2){
  try{
    return (Decimal.parse("$num1")+Decimal.parse("$num2")).toDouble();
  }catch(e){
    return 0.0;
  }
}

double mulDecimalFocus141(num1,num2){
  try{
    return (Decimal.parse("$num1")*Decimal.parse("$num2")).toDouble();
  }catch(e){
    return 0.0;
  }
}

double divDecimalFocus141(num1,num2){
  try{
    return (Decimal.parse("$num1")/Decimal.parse("$num2")).toDouble();
  }catch(e){
    return 0.0;
  }
}

extension Strint2Double on String{
  double toDouble(){
    try{
      return double.parse(this);
    }catch(e){
      return 0.0;
    }
  }
}


showDialogFocus141({required Widget child,}){
  Get.dialog(
    child,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.8),
  );
}

backFocus141({Map<String,dynamic>? params}){
  Get.back(result: params);
}