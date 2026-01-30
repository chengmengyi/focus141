import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_quiz20_cask_task_dialog/focus141_quiz20_cask_task_dialog_con.dart';

class Focus141Quiz20CaskTaskDialog extends Focus141Widget<Focus141Quiz20CaskTaskDialogCon>{
  @override
  Focus141Quiz20CaskTaskDialogCon initFocus141Con() => Focus141Quiz20CaskTaskDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 410.h,
    margin: EdgeInsets.only(left: 26.w,right: 26.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "quiz201", focus141Width: double.infinity, focus141Height: double.infinity),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 5.h),
            child: Focus141TextWidget(
              focus141TextContent: "Oops, One More Step!",
              focus141TextSize: 26.sp,
              focus141Height: 1.0,
              focus141LineColor: Focus141Colors.color000000,
              focus141TextColor: Focus141Colors.colorFFFFFF,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(left: 18.w,right: 18.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Focus141LocalImagesWidget(focus141ImagesName: "quiz202", focus141Width: 174.w, focus141Height: 126.h),
                SizedBox(height: 10.h,),
                Focus141TextWidget(
                  focus141TextContent: "Advertiser review isn’t complete.",
                  focus141TextSize: 17.sp,
                  focus141Height: 1.0,
                  focus141TextColor: Focus141Colors.color000000,
                ),
                SizedBox(height: 10.h,),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: "For security reasons, we need to verify your account.Please complete ",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "woff",
                            height: 1.0,
                            color: Focus141Colors.color7B7B7B,
                          ),
                        ),
                        TextSpan(
                          text: "20 quiz sessions",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "woff",
                            height: 1.0,
                            color: Focus141Colors.colorEC2428,
                          ),
                        ),
                        TextSpan(
                          text: " to continue.",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "woff",
                            height: 1.0,
                            color: Focus141Colors.color7B7B7B,
                          ),
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 20.h,),
                Focus141ClickWidget(
                  focus141OnTap: (){
                    focus141Con.clickGo();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Focus141LocalImagesWidget(focus141ImagesName: "quiz203", focus141Width: 208.w, focus141Height: 50.h),
                      Focus141TextWidget(
                        focus141TextContent: "Quiz Now",
                        focus141TextSize: 24.sp,
                        focus141Height: 1.0,
                        focus141LineColor: Focus141Colors.color000000,
                        focus141TextColor: Focus141Colors.colorFFFFFF,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14.h,),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.h,
          right: 10.w,
          child: Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickClose();
            },
            child: Focus141LocalImagesWidget(focus141ImagesName: "icon_close", focus141Width: 18.w, focus141Height: 18.w,),
          ),
        ),
      ],
    ),
  );
}