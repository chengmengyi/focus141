import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_finger_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_first_answer_quiz_dialog/focus141_first_answer_quiz_dialog_con.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';

class Focus141FirstAnswerQuizDialog extends Focus141Widget<Focus141FirstAnswerQuizDialogCon>{
  double reward;
  Function() callback;
  Focus141FirstAnswerQuizDialog({
    required this.reward,
    required this.callback,
});

  @override
  Focus141FirstAnswerQuizDialogCon initFocus141Con() => Focus141FirstAnswerQuizDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: double.infinity,
        height: 380.h,
        margin: EdgeInsets.only(left: 16.w,right: 16.w),
        child: Stack(
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: "first_answer1", focus141Width: double.infinity, focus141Height: double.infinity),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 38.h),
                child: Focus141TextWidget(
                  focus141TextContent: "Congratulation！",
                  focus141TextSize: 24.sp,
                  focus141TextColor: Focus141Colors.colorFFFFFF,
                  focus141LineColor: Focus141Colors.color000000,
                ),
              ),
            ),
            _contentWidget(),
            Positioned(
              right: 40.w,
              bottom: 0,
              child: Focus141ClickWidget(
                focus141OnTap: (){
                  focus141Con.clickCash(callback);
                },
                child: Focus141FingerWidget(focus141Width: 80.w, focus141Height: 80.w),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20.h,),
      Focus141ClickWidget(
        focus141OnTap: (){
          focus141Con.clickClose(callback);
        },
        child: Focus141LocalImagesWidget(focus141ImagesName: "icon_close2", focus141Width: 28.w, focus141Height: 28.w,),
      ),
    ],
  );

  _contentWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: "icon_money1", focus141Width: 92.w, focus141Height: 62.w),
            SizedBox(width: 4.w,),
            Focus141TextWidget(
              focus141TextContent: "+\$$reward",
              focus141TextSize: 40.sp,
              focus141TextColor: Focus141Colors.color9EF356,
              focus141LineColor: Focus141Colors.color055305,
            ),
          ],
        ),
        SizedBox(height: 20.h,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Focus141TextWidget(
              focus141TextContent: "My Cash:",
              focus141TextSize: 20.sp,
              focus141TextColor: Focus141Colors.colorFFFFFF,
              focus141LineColor: Focus141Colors.color000000,
            ),
            SizedBox(width: 4.w,),
            Focus141TextWidget(
              focus141TextContent: "\$${bFocus141Money.getData()}",
              focus141TextSize: 20.sp,
              focus141TextColor: Focus141Colors.color9EF356,
              focus141LineColor: Focus141Colors.color055305,
            ),
          ],
        ),
        SizedBox(height: 20.h,),
        Focus141ClickWidget(
          focus141OnTap: (){
            focus141Con.clickCash(callback);
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Focus141LocalImagesWidget(focus141ImagesName: "new_user4", focus141Width: 198.w, focus141Height: 54.h),
              Focus141TextWidget(
                focus141TextContent: "Withdraw",
                focus141TextSize: 22.sp,
                focus141TextColor: Focus141Colors.colorFFFFFF,
                focus141LineColor: Focus141Colors.color0F8418,
              ),
            ],
          ),
        ),
        SizedBox(height: 38.h,),
      ],
    ),
  );
}