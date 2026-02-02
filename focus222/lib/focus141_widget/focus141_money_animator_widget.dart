import 'package:flutter/material.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_spine_widget.dart';
import 'package:spine_flutter/spine_flutter.dart';
import 'package:focus111/focus141_page/focus141_stateful_widget.dart';

class Focus141MoneyAnimatorWidget extends Focus141StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_Focus141MoneyAnimatorWidgetState();
}

class _Focus141MoneyAnimatorWidgetState extends Focus141StatefulState<Focus141MoneyAnimatorWidget>{
  var showAnimator=false;
  late SpineWidgetController spineWidgetController;

  @override
  void initState() {
    super.initState();
    spineWidgetController=SpineWidgetController(
      onInitialized: (controller) {

      },
    );
  }

  @override
  Widget build(BuildContext context) =>Offstage(
    offstage: !showAnimator,
    child: Container(
      margin: EdgeInsets.only(top: 80.h,left: 50.w,right: 50.w),
      child: Focus141SpineWidget(
        focus141Atlas: "skeleton",
        focus141Json: "skeleton",
        focus141AnimatorName: "animation",
        focus141Folder: "CD3",
        focus141Controller: spineWidgetController,
      ),
    ),
  );


  @override
  bool focus141InitEvent() => true;


  @override
  focus141HandleEventMsg(int eventCode, int? intValue, String? strValue, anyValue) {
      switch(eventCode){
        case Focus141EventCode.showMoneyAnimator:
          _showMoneyAnimator();
          break;
      }
  }

  _showMoneyAnimator()async{
    setState(() {
      showAnimator=true;
    });
    spineWidgetController.animationState.setAnimationByName(0, "animation", false);
    await Future.delayed(Duration(milliseconds: 1500));
    if (!mounted){
      return;
    }
    setState(() {
      showAnimator=false;
    });
  }
}