import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_reward_type.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_reward_dialog/focus141_reward_dialog_con.dart';
import 'package:focus222/focus141_widget/focus141_ad_btn_widget.dart';

class Focus141RewardDialog extends Focus141Widget<Focus141RewardDialogCon>{
  double reward;
  Focus141RewardType focus141rewardType;
  Function() callback;

  Focus141RewardDialog({
    required this.reward,
    required this.focus141rewardType,
    required this.callback,
});
  @override
  Focus141RewardDialogCon initFocus141Con() => Focus141RewardDialogCon(
    focus141rewardType: focus141rewardType,
  );

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 418.h,
    margin: EdgeInsets.only(left: 20.w,right: 20.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "reward_bg", focus141Width: double.infinity, focus141Height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 90.h),
            child: SizedBox(
              width: 262.w,
              height: 262.w,
              child: Stack(
                children: [
                  Focus141LocalImagesWidget(focus141ImagesName: "guang_bg", focus141Width: 262.w, focus141Height: 262.w,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 70.h),
                      child: Focus141LocalImagesWidget(focus141ImagesName: "icon_money2", focus141Width: 172.w, focus141Height: 101.w,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: 130.h),
                      child: Focus141TextWidget(
                        focus141TextContent: "+\$$reward",
                        focus141TextSize: 48.sp,
                        focus141FontWeight: FontWeight.bold,
                        focus141TextColor: Focus141Colors.color9EF356,
                        focus141LineColor: Focus141Colors.color055305,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Focus141AdBtnWidget(
                reward: reward,
                width: 230.w,
                height: 50.h,
                onTap: (){
                  focus141Con.clickDouble(reward,callback);
                },
              ),
              SizedBox(height: 10.h,),
              Focus141ClickWidget(
                focus141OnTap: (){
                  focus141Con.clickSingle(reward,callback);
                },
                child: Focus141TextWidget(focus141TextContent: "+\$$reward", focus141TextSize: 20.sp, focus141TextColor: Focus141Colors.colorA7A7A7,),
              ),
              SizedBox(height: 10.h,),
            ],
          ),
        ),
      ],
    ),
  );
}