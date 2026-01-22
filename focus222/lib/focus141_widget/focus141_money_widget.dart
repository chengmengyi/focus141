import 'package:flutter/material.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_page/focus141_stateful_widget.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';

class Focus141MoneyWidget extends Focus141StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Focus141MoneyWidgetState();
}

class _Focus141MoneyWidgetState extends Focus141StatefulState<Focus141MoneyWidget>{
  @override
  Widget build(BuildContext context) => SizedBox(
    height: 48.w,
    child: Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 44.h,
          decoration: BoxDecoration(
            color: Focus141Colors.colorF3EFE3,
            borderRadius: BorderRadius.circular(38.w),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 52.w,),
              Focus141TextWidget(
                focus141TextContent: "\$${bFocus141Money.getData()}",
                focus141TextSize: 20.sp,
                focus141TextColor: Focus141Colors.colorFFFFFF,
                focus141LineColor: Focus141Colors.color000000,
                focus141FontWeight: FontWeight.bold,
              ),
              SizedBox(width: 25.w,),
              Focus141ClickWidget(
                focus141OnTap: (){
                  Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.updateHomeTab,focus141Int: 1);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Focus141LocalImagesWidget(focus141ImagesName: "cash_btn_bg", focus141Width: 68.w, focus141Height: 24.h),
                    Focus141TextWidget(
                      focus141TextContent: "Withdraw",
                      focus141TextSize: 13.sp,
                      focus141TextColor: Focus141Colors.colorFFFFFF,
                      focus141FontWeight: FontWeight.bold,
                      focus141LineColor: Focus141Colors.colorCD4038,
                    ),
                  ],
                ),
              ),
              SizedBox(width: 5.w,),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: "home_money_bg", focus141Width: 48.w, focus141Height: 48.w,),
            Focus141LocalImagesWidget(focus141ImagesName: "icon_money1", focus141Width: 43.w, focus141Height: 30.h,),
          ],
        ),
      ],
    ),
  );

  @override
  bool focus141InitEvent() => true;

  @override
  focus141HandleEventMsg(int eventCode, int? intValue, String? strValue, anyValue) {
    switch(eventCode){
      case Focus141EventCode.updateMoney:
        setState(() {});
        break;
    }
  }
}