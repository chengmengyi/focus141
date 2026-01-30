import 'dart:async';

import 'package:flutter/material.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:get/get.dart';

abstract class Focus141Con extends GetxController{
  StreamSubscription<Map>? _streamSubscription;
  late BuildContext context;

  @override
  void onInit() {
    super.onInit();
    if(focus141InitEvent()){
      _streamSubscription=Focus141EventUtils.instance.listen(focus141HandleEventMsg);
    }
  }

  bool focus141InitEvent()=>false;


  focus141HandleEventMsg(int eventCode,int? intValue,String? strValue,dynamic anyValue){

  }

  @override
  void onClose() {
    if(focus141InitEvent()){
      _streamSubscription?.cancel();
      _streamSubscription=null;
    }
    super.onClose();
  }
}