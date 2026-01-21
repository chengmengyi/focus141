import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_input_account_dialog/focus141_input_account_dialog_con.dart';
import 'package:focus222/focus141_utils/focus141_utils.dart';

class Focus141InputAccountDialog extends Focus141Widget<Focus141InputAccountDialogCon>{
  int money;
  Focus141CashTypeEnum typeEnum;
  Function() callback;
  Focus141InputAccountDialog({
    required this.money,
    required this.typeEnum,
    required this.callback,
  });
  @override
  Focus141InputAccountDialogCon initFocus141Con() => Focus141InputAccountDialogCon(
    money: money,
    typeEnum: typeEnum,
    callback: callback,
  );

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 480.h,
    margin: EdgeInsets.only(left: 26.w,right: 26.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "input1",focus141Width: double.infinity,focus141Height: double.infinity,),
        _titleWidget(),
        _closeBtnWidget(),
        _contentWidget(),
      ],
    ),
  );

  _contentWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _cashTypeWidget(),
        SizedBox(height: 35.h,),
        _inputWidget(),
        SizedBox(height: 35.h,),
        _tipsWidget(),
        SizedBox(height: 20.h,),
        _btnWidget(),
        SizedBox(height: 40.h,),
      ],
    ),
  );

  _cashTypeWidget()=>GetBuilder<Focus141InputAccountDialogCon>(
    id: "cash_type",
    builder: (_)=>Row(
      children: [
        SizedBox(width: 27.w,),
        Expanded(
          child: Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickCashType(Focus141CashTypeEnum.paypal);
            },
            child: Focus141LocalImagesWidget(
              focus141ImagesName: getInputAccountCashType(Focus141CashTypeEnum.paypal, focus141Con.typeEnum==Focus141CashTypeEnum.paypal),
              focus141Width: double.infinity,
              focus141Height: 58.h,
            ),
          ),
        ),
        SizedBox(width: 27.w,),
        Expanded(
          child: Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickCashType(Focus141CashTypeEnum.cashapp);
            },
            child: Focus141LocalImagesWidget(
              focus141ImagesName: getInputAccountCashType(Focus141CashTypeEnum.cashapp, focus141Con.typeEnum==Focus141CashTypeEnum.cashapp),
              focus141Width: double.infinity,
              focus141Height: 58.h,
            ),
          ),
        ),
        SizedBox(width: 27.w,),
      ],
    ),
  );

  _inputWidget()=>Container(
    margin: EdgeInsets.only(left: 10.w,right: 10.w),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Focus141TextWidget(focus141TextContent: "Email/Phone number:", focus141TextSize: 20.sp, focus141TextColor: Focus141Colors.color000000,),
        SizedBox(height: 14.h,),
        Container(
          width: double.infinity,
          height: 48.h,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 10.w,right: 10.w),
          decoration: BoxDecoration(
            color: Focus141Colors.colorD0D9E3,
            borderRadius: BorderRadius.circular(10.w),
          ),
          child: TextField(
            enabled: true,
            textAlign: TextAlign.left,
            controller: focus141Con.textEditingController,
            style: TextStyle(
              fontSize: 13.sp,
              color: Focus141Colors.color000000,
              fontFamily: "woff",
            ),
            decoration: InputDecoration(
              counterText: '',
              isCollapsed: true,
              hintText: "Please input your account ID",
              hintStyle: TextStyle(
                fontSize: 13.sp,
                color: Focus141Colors.color8F99A3,
                fontFamily: "woff",
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );

  _tipsWidget()=>Row(
    children: [
      SizedBox(width: 10.w,),
      Focus141LocalImagesWidget(focus141ImagesName: "input3", focus141Width: 15.w, focus141Height: 18.h),
      Expanded(
        child: Focus141TextWidget(focus141TextContent: "We’ll only use this for sending your withdrawal", focus141TextSize: 12.sp, focus141TextColor: Focus141Colors.color000000,),
      ),
      SizedBox(width: 10.w,),
    ],
  );

  _btnWidget()=>Container(
    margin: EdgeInsets.only(left: 30.w,right: 30.w),
    child: Focus141ClickWidget(
      focus141OnTap: (){
        focus141Con.clickConfrim();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "input2",focus141Width: double.infinity,focus141Height: 50.h,),
          Focus141TextWidget(
            focus141TextContent: "Confrim",
            focus141TextSize: 24.sp,
            focus141TextColor: Focus141Colors.colorFFFFFF,
            focus141LineColor: Focus141Colors.color3E62D4,
          ),
        ],
      ),
    ),
  );

  _titleWidget()=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(top: 16.h,left: 20.w,right: 20.w),
      child: Focus141TextWidget(
        focus141TextContent: "Confirm payment Information",
        focus141TextSize: 20.sp,
        focus141Height: 1.0,
        focus141TextAlign: TextAlign.center,
        focus141TextColor: Focus141Colors.colorFFFFFF,
        focus141LineColor: Focus141Colors.color000000,
      ),
    ),
  );

  _closeBtnWidget()=>Positioned(
    top: 10.h,
    right: 10.w,
    child: Focus141ClickWidget(
      focus141OnTap: (){
        focus141Con.clickClose();
      },
      child: Focus141LocalImagesWidget(focus141ImagesName: "icon_close", focus141Width: 18.w, focus141Height: 18.w,),
    ),
  );
}