import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_ad_review_dialog/focus141_ad_review_dialog_con.dart';
import 'package:focus222/focus141_widget/focus141_cash_type_money_widget.dart';

class Focus141AdReviewDialog extends Focus141Widget<Focus141AdReviewDialogCon>{
  int money;
  Focus141CashTypeEnum typeEnum;
  Function() callback;
  Focus141AdReviewDialog({
    required this.money,
    required this.typeEnum,
    required this.callback,
});

  @override
  Focus141AdReviewDialogCon initFocus141Con() => Focus141AdReviewDialogCon(callback);

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 300.h,
    margin: EdgeInsets.only(left: 26.w,right: 26.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "ad_review_bg",focus141Width: double.infinity,focus141Height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Focus141TextWidget(
              focus141TextContent: "Advertiser Review Pending",
              focus141TextSize: 22.sp,
              focus141TextColor: Focus141Colors.colorFFFFFF,
              focus141LineColor: Focus141Colors.color000000,
            ),
          ),
        ),
        Align(
          child: Focus141CashTypeMoneyWidget(typeEnum: typeEnum, money: money, width: 158.w, height: 72.h),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 20.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GetBuilder<Focus141AdReviewDialogCon>(
                  id: "progress",
                  builder: (_)=>LayoutBuilder(
                    builder: (context,bc){
                      var width = bc.maxWidth-(2.w);
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 18.h,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 1.w,right: 1.w),
                            decoration: BoxDecoration(
                              color: Focus141Colors.color474747,
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: Container(
                              width: width*getProgress(focus141Con.currentPro, focus141Con.totalPro),
                              height: 16.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.w),
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [Focus141Colors.color58DEFF,Focus141Colors.color9AFFFF,]
                                ),
                              ),
                            ),
                          ),
                          Focus141TextWidget(focus141TextContent: "${(getProgress(focus141Con.currentPro, focus141Con.totalPro)*100).toInt()}%", focus141TextSize: 14.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 6.h,),
                Focus141TextWidget(focus141TextContent: "Review in progress...", focus141TextSize: 20.sp, focus141TextColor: Focus141Colors.colorA7A7A7,),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}