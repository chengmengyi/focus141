import 'package:flutter/material.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_page/focus141_stateful_widget.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_utils/focus141_info_utils.dart';

class Focus141MoneyReward2sWidget extends Focus141StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Focus141MoneyReward2sWidgetState();
}

class _Focus141MoneyReward2sWidgetState extends Focus141StatefulState<Focus141MoneyReward2sWidget>{
  var showView=false,addNum=0.0;

  @override
  Widget build(BuildContext context){
    if(!showView){
      return Container();
    }
    return SizedBox(
      width: 258.w,
      height: 280.h,
      child: Stack(
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "reward1", focus141Width: double.infinity, focus141Height: double.infinity),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 258.w,
              height: 258.w,
              child: Stack(
                children: [
                  Focus141LocalImagesWidget(focus141ImagesName: "icon_guang", focus141Width: double.infinity, focus141Height: double.infinity),
                  Align(
                    child: Focus141LocalImagesWidget(focus141ImagesName: "icon_money2", focus141Width: 198.w, focus141Height: 116.h),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 60.h),
                      child: Focus141TextWidget(
                        focus141TextContent: "\$$addNum",
                        focus141TextSize: 48.sp,
                        focus141TextColor: Focus141Colors.color9EF356,
                        focus141LineColor: Focus141Colors.color055305,
                        focus141Height: 1.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Focus141TextWidget(focus141TextContent: "Congratulation！", focus141TextSize: 24.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
          ),
        ],
      ),
    );
  }

  @override
  bool focus141InitEvent() => true;

  @override
  focus141HandleEventMsg(int eventCode, int? intValue, String? strValue, anyValue) {
    switch(eventCode){
      case Focus141EventCode.showMoneyReward:
        _showMoneyReward(anyValue);
        break;
    }
  }

  _showMoneyReward(anyValue) async{
    setState(() {
      addNum=anyValue.toString().toDouble();
      showView=true;
    });
    await Future.delayed(Duration(milliseconds: 2000));
    Focus141InfoUtils.instance.updateMoney(addNum);
    setState(() {
      showView=false;
    });
  }
}