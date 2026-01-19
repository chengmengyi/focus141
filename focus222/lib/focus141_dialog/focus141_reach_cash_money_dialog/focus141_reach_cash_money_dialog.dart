import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_reach_cash_money_dialog/focus141_reach_cash_money_dialog_con.dart';
import 'package:focus222/focus141_widget/focus141_cash_type_money_widget.dart';

class Focus141ReachCashMoneyDialog extends Focus141Widget<Focus141ReachCashMoneyDialogCon>{
  int money;
  Focus141CashTypeEnum typeEnum;
  Function() callback;

  Focus141ReachCashMoneyDialog({
    required this.money,
    required this.typeEnum,
    required this.callback,
  });
  @override
  Focus141ReachCashMoneyDialogCon initFocus141Con() => Focus141ReachCashMoneyDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      _topTitleWidget(),
      SizedBox(height: 30.h,),
      _moneyWidget(),
      SizedBox(height: 30.h,),
      _tipsWidget(),
      SizedBox(height: 12.h,),
      _btnWidget(),
    ],
  );

  _moneyWidget()=>Stack(
    alignment: Alignment.center,
    children: [
      Focus141LocalImagesWidget(focus141ImagesName: "guang_bg", focus141Width: 262.w, focus141Height: 262.w,),
      Focus141CashTypeMoneyWidget(typeEnum: typeEnum, money: money, width: 194.w, height: 88.h),
    ],
  );

  _tipsWidget()=>RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
        children: [
          // Your balance just reached $1000
          TextSpan(
            text: "Your balance just reached ",
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "woff",
              color: Focus141Colors.colorCCCCCC,
            ),
          ),
          TextSpan(
            text: "\$$money",
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: "woff",
              color: Focus141Colors.color5AA11D,
            ),
          ),
        ]
    ),
  );

  _topTitleWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Focus141TextWidget(
        focus141TextContent: "Sponsor Congrats! You",
        focus141TextSize: 24.sp,
        focus141TextColor: Focus141Colors.colorFCEA3B,
        focus141LineColor: Focus141Colors.colorDB6E16,
      ),
      Focus141TextWidget(
        focus141TextContent: "Hit the Payout Mark",
        focus141TextSize: 24.sp,
        focus141TextColor: Focus141Colors.colorFCEA3B,
        focus141LineColor: Focus141Colors.colorDB6E16,
      ),
    ],
  );

  _btnWidget()=>Focus141ClickWidget(
    focus141OnTap: (){
      focus141Con.clickClaim(callback);
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "btn_bg4",focus141Width: 248.w,focus141Height: 50.h,),
        Focus141TextWidget(
          focus141TextContent: "Claim My \$$money Now",
          focus141TextSize: 20.sp,
          focus141TextColor: Focus141Colors.colorFFFFFF,
          focus141LineColor: Focus141Colors.color3E62D4,
        ),
      ],
    ),
  );
}