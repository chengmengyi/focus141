import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus111/focus141_widget/focus_open_notification_dialog/focus_open_notification_dialog_con.dart';

class FocusOpenNotificationDialog extends Focus141Widget<FocusOpenNotificationDialogCon>{

  @override
  FocusOpenNotificationDialogCon initFocus141Con() => FocusOpenNotificationDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 352.h,
    margin: EdgeInsets.only(left: 22.w,right: 22.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "open1", focus141Width: double.infinity, focus141Height: double.infinity),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Focus141LocalImagesWidget(focus141ImagesName: "open2", focus141Width: 226.w, focus141Height: 147.w),
              Focus141TextWidget(focus141TextContent: "Turn on push notifications", focus141TextSize: 22.sp, focus141TextColor: Focus141Colors.color3F3F3F,),
              Focus141TextWidget(focus141TextContent: "open the notification to receive cash", focus141TextSize: 16.sp, focus141TextColor: Focus141Colors.colorA9A9A9,),
              SizedBox(height: 10.h,),
              Focus141ClickWidget(
                focus141OnTap: (){
                  focus141Con.clickTryAgain();
                },
                child: Container(
                  width: double.infinity,
                  height: 48.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 30.w,right: 30.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.w),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Focus141Colors.color3256CD,Focus141Colors.color6184F5,],
                    ),
                  ),
                  child: Focus141TextWidget(focus141TextContent: "Go and Open", focus141TextSize: 24.sp, focus141TextColor: Focus141Colors.colorFFFFFF,),
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickClose();
            },
            child: Container(
              width: 40.w,
              height: 40.w,
              alignment: Alignment.center,
              child: Focus141LocalImagesWidget(focus141ImagesName: "icon_close3", focus141Width: 18.w, focus141Height: 18.w),
            ),
          ),
        ),
      ],
    ),
  );
}