import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_con.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:get/get.dart';

abstract class Focus141Widget<T extends Focus141Con> extends StatelessWidget{
  var _init=true;
  late T focus141Con;
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    if(_init){
      focus141Con=Get.put(initFocus141Con());
      _init=false;
    }
    ctx=context;
    focus141Con.context=context;
    switch(initFocus141Type()){
      case Focus141WidgetType.page: return _pageWidget();
      case Focus141WidgetType.child: return initFocus141Widget();
      case Focus141WidgetType.widget: return initFocus141Widget();
      case Focus141WidgetType.dialog: return _dialogWidget();
    }
  }

  T initFocus141Con();

  Widget initFocus141Widget();

  Focus141WidgetType initFocus141Type();

  Widget _pageWidget()=>Scaffold(
    body: SafeArea(
      top: false,
      child: initFocus141Widget(),
    ),
  );

  Widget _dialogWidget()=>WillPopScope(
    child: Material(
      type: MaterialType.transparency,
      child: Center(
        child: initFocus141Widget(),
      ),
    ),
    onWillPop: ()async{
      return false;
    },
  );
}