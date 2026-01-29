import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus111/focus141_widget/focus_ad_limit_dialog/focus_ad_limit_dialog_con.dart';

class FocusAdLimitDialog extends Focus141Widget<FocusAdLimitDialogCon>{
  Function() callback;
  FocusAdLimitDialog({
    required this.callback,
});

  @override
  FocusAdLimitDialogCon initFocus141Con() => FocusAdLimitDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 352.h,
    margin: EdgeInsets.only(left: 22.w,right: 22.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "limit1", focus141Width: double.infinity, focus141Height: double.infinity),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Focus141TextWidget(focus141TextContent: "Ad limit reached", focus141TextSize: 26.sp, focus141TextColor: Focus141Colors.color3F3F3F,),
              Focus141LocalImagesWidget(focus141ImagesName: "limit2", focus141Width: 198.w, focus141Height: 198.w),
              Container(
                margin: EdgeInsets.only(left: 20.w,right: 20.w),
                child: Focus141TextWidget(
                  focus141TextContent: "You've watched all available ads for today. Try again tomorrow.",
                  focus141TextSize: 14.sp,
                  focus141TextColor: Focus141Colors.colorA9A9A9,
                  focus141Height: 1.0,
                  focus141TextAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10.h,),
              Focus141ClickWidget(
                focus141OnTap: (){
                  focus141Con.clickTryAgain(callback);
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
                  child: Focus141TextWidget(focus141TextContent: "Got it", focus141TextSize: 24.sp, focus141TextColor: Focus141Colors.colorFFFFFF,),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}