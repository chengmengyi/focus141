import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus111/focus141_widget/focus_ad_load_fail_dialog/focus_ad_load_fail_dialog_con.dart';

class FocusAdLoadFailDialog extends Focus141Widget<FocusAdLoadFailDialogCon>{
  Function(bool tryAgain) tryAgainCallback;
  FocusAdLoadFailDialog({
    required this.tryAgainCallback,
});

  @override
  FocusAdLoadFailDialogCon initFocus141Con() => FocusAdLoadFailDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: double.infinity,
        height: 338.h,
        margin: EdgeInsets.only(left: 22.w,right: 22.w),
        child: Stack(
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: "fail1", focus141Width: double.infinity, focus141Height: double.infinity),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Focus141LocalImagesWidget(focus141ImagesName: "fail2", focus141Width: 120.w, focus141Height: 120.w,),
                  Focus141TextWidget(focus141TextContent: "Ads are loading", focus141TextSize: 16.sp, focus141TextColor: Focus141Colors.color3F3F3F,),
                  Focus141TextWidget(focus141TextContent: "Please try again later", focus141TextSize: 16.sp, focus141TextColor: Focus141Colors.color3F3F3F,),
                  SizedBox(height: 10.h,),
                  Focus141ClickWidget(
                    focus141OnTap: (){
                      focus141Con.clickTryAgain(tryAgainCallback);
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Focus141LocalImagesWidget(focus141ImagesName: "fail3", focus141Width: 230.w, focus141Height: 50.h,),
                        Focus141TextWidget(
                          focus141TextContent: "Try Again",
                          focus141TextSize: 24.sp,
                          focus141TextColor: Focus141Colors.colorFFFFFF,
                          focus141LineColor: Focus141Colors.color000000,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h,),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 16.h,),
      Focus141ClickWidget(
        focus141OnTap: (){
          focus141Con.clickClose(tryAgainCallback);
        },
        child: Focus141LocalImagesWidget(focus141ImagesName: "icon_close2", focus141Width: 28.w, focus141Height: 28.w,),
      )
    ],
  );
}