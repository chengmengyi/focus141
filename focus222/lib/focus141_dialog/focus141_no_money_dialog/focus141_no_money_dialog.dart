import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_no_money_dialog/focus141_no_money_dialog_con.dart';

class Focus141NoMoneyDialog extends Focus141Widget<Focus141NoMoneyDialogCon>{
  int money;
  double myMoney;
  Focus141NoMoneyDialog({
    required this.money,
    required this.myMoney,
});

  @override
  Focus141NoMoneyDialogCon initFocus141Con() => Focus141NoMoneyDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 286.h,
    margin: EdgeInsets.only(left: 26.w,right: 26.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "no_money_bg",focus141Width: double.infinity,focus141Height: double.infinity,),
        Align(
          alignment: Alignment.topCenter,
          child: Focus141TextWidget(focus141TextContent: "Cash Out", focus141TextSize: 32.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
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
        Align(
          child: Container(
            margin: EdgeInsets.only(left: 10.w,right: 10.w),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  // Your current balance is $100, Collect
                  // $200 and you can withdraw cash！Go and
                  // Get more Cash！
                  TextSpan(
                    text: "Your current balance is ",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: "woff",
                      color: Focus141Colors.color000000,
                    ),
                  ),
                  TextSpan(
                    text: "\$$myMoney",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: "woff",
                      color: Focus141Colors.colorFF4E4E,
                    ),
                  ),
                  TextSpan(
                    text: ", Collect",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: "woff",
                      color: Focus141Colors.color000000,
                    ),
                  ),
                  TextSpan(
                    text: "\$$myMoney",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: "woff",
                      color: Focus141Colors.colorFF4E4E,
                    ),
                  ),
                  TextSpan(
                    text: " and you can withdraw cash！Go and Get more Cash！",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: "woff",
                      color: Focus141Colors.color000000,
                    ),
                  ),
                ]
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 18.h),
            child: Focus141ClickWidget(
              focus141OnTap: (){
                focus141Con.clickMore();
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Focus141LocalImagesWidget(focus141ImagesName: "btn_bg3",focus141Width: 208.w,focus141Height: 50.h,),
                  Focus141TextWidget(
                    focus141TextContent: "Get More Cash",
                    focus141TextSize: 16.sp,
                    focus141TextColor: Focus141Colors.colorFFFFFF,
                    focus141LineColor: Focus141Colors.color3E62D4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}