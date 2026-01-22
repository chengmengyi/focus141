import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_sign_reward_dialog/focus141_sign_reward_dialog_con.dart';

class Focus141SignRewardDialog extends Focus141Widget<Focus141SignRewardDialogCon>{
  
  @override
  Focus141SignRewardDialogCon initFocus141Con() => Focus141SignRewardDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 448.h,
    margin: EdgeInsets.only(left: 20.w,right: 20.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "sign_reward1", focus141Width: double.infinity, focus141Height: double.infinity,),
        _titleWidget(),
        _iconWidget(),
        _btnWidget(),
      ],
    ),
  );
  
  _btnWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: EdgeInsets.only(bottom: 22.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickDouble();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Focus141LocalImagesWidget(focus141ImagesName: "wheel_sign_reward5", focus141Width: 230.w, focus141Height: 48.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Focus141LocalImagesWidget(focus141ImagesName: "icon_video", focus141Width: 25.w, focus141Height: 25.w),
                    Focus141TextWidget(
                      focus141TextContent: "Double Claim",
                      focus141TextSize: 22.sp,
                      focus141TextColor: Focus141Colors.colorFFFFFF,
                      focus141LineColor: Focus141Colors.color000000,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickSingle();
            },
            child: Focus141TextWidget(
              focus141TextContent: "Claim",
              focus141TextSize: 22.sp,
              focus141Height: 1.0,
              focus141TextColor: Focus141Colors.color7F7F7F,
              focus141Decoration: TextDecoration.underline,
              focus141DecorationColor: Focus141Colors.color7F7F7F,
            ),
          ),
        ],
      ),
    ),
  );

  _iconWidget()=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(top: 142.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "wheel_sign_reward4", focus141Width: 118.w, focus141Height: 128.h),
          Focus141TextWidget(focus141TextContent: "daily check reward", focus141TextSize: 16.sp, focus141TextColor: Focus141Colors.color000000,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Focus141LocalImagesWidget(focus141ImagesName: "icon_money2", focus141Width: 46.w, focus141Height: 31.h),
              Focus141TextWidget(focus141TextContent: "+\$${focus141Con.signReward}", focus141TextSize: 24.sp, focus141TextColor: Focus141Colors.color9EF356,focus141LineColor: Focus141Colors.color055305,),
            ],
          ),
        ],
      ),
    ),
  );

  _titleWidget()=>Positioned(
    top: 40.h,
    left: 10.w,
    child: Focus141TextWidget(focus141TextContent: "Daily Bonus", focus141TextSize: 32.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
  );
}