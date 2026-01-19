import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_ad_review_fail_dialog/focus141_ad_review_fail_dialog_con.dart';

class Focus141AdReviewFailDialog extends Focus141Widget<Focus141AdReviewFailDialogCon>{
  int money;
  Focus141CashTypeEnum typeEnum;
  Function() callback;
  Focus141AdReviewFailDialog({
    required this.money,
    required this.typeEnum,
    required this.callback,
});

  @override
  Focus141AdReviewFailDialogCon initFocus141Con() => Focus141AdReviewFailDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 400.h,
    margin: EdgeInsets.only(left: 26.w,right: 26.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "ad_review_fail_bg",focus141Width: double.infinity,focus141Height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Focus141TextWidget(
              focus141TextContent: "Oops, One More Step!",
              focus141TextSize: 22.sp,
              focus141TextColor: Focus141Colors.colorFFFFFF,
              focus141LineColor: Focus141Colors.color000000,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Focus141LocalImagesWidget(focus141ImagesName: "ad_review_fail1", focus141Width: 174.w, focus141Height: 126.h),
              SizedBox(height: 8.h,),
              Focus141TextWidget(focus141TextContent: "Advertiser review isn’t complete.", focus141TextSize: 16.sp, focus141TextColor: Focus141Colors.color000000),
        //   For security reasons, we need to verify your account.Please complete 20 quiz sessions to continue.
              SizedBox(height: 8.h,),
              Container(
                margin: EdgeInsets.only(left: 18.w,right: 18.w),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: "For security reasons, we need to verify your account.Please complete ",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: "woff",
                            color: Focus141Colors.color7B7B7B,
                          ),
                        ),
                        TextSpan(
                          text: "20 quiz sessions",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: "woff",
                            color: Focus141Colors.colorEC2428,
                          ),
                        ),
                        TextSpan(
                          text: " to continue.",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: "woff",
                            color: Focus141Colors.color7B7B7B,
                          ),
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 12.h,),
              Focus141ClickWidget(
                focus141OnTap: (){
                  focus141Con.clickQuiz(money, typeEnum,callback);
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Focus141LocalImagesWidget(focus141ImagesName: "btn_bg5",focus141Width: 208.w,focus141Height: 50.h,),
                    Focus141TextWidget(
                      focus141TextContent: "Quiz Now",
                      focus141TextSize: 24.sp,
                      focus141TextColor: Focus141Colors.colorFFFFFF,
                      focus141LineColor: Focus141Colors.color3E62D4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.h,),
            ],
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