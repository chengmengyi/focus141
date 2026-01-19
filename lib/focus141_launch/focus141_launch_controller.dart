import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_routers/focus141_router_address.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141LaunchController extends Focus141Con with GetSingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void onInit() {
    super.onInit();
    controller=AnimationController(duration: const Duration(seconds: 13),vsync: this)
      ..addListener(() {
        update(["progress"]);
      })
      ..addStatusListener((status) {
        if(status==AnimationStatus.completed){
          _completed();
        }
      });
  }

  @override
  void onReady() {
    super.onReady();
    controller.forward();
  }

  _completed(){
    Get.offNamed(Focus141RouterAddress.bHome);
  }
}