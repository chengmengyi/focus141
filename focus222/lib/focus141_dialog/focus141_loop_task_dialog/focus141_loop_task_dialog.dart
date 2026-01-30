import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_bean/focus141_cash_money_list_bean.dart';
import 'package:focus222/focus141_dialog/focus141_loop_task_dialog/focus141_loop_task_dialog_con.dart';
import 'package:focus222/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_widget/focus141_cash_type_money_widget.dart';

class Focus141LoopTaskDialog extends Focus141Widget<Focus141LoopTaskDialogCon>{
  Focus141CashMoneyListBean bean;
  Focus141LoopTaskDialog({
    required this.bean,
  });

  @override
  Focus141LoopTaskDialogCon initFocus141Con() => Focus141LoopTaskDialogCon(bean: bean);

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 330.h,
    margin: EdgeInsets.only(left: 26.w,right: 26.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "loop1",focus141Width: double.infinity,focus141Height: double.infinity,),
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
        _cashMoneyWidget(),
        _loopTaskWidget(),
        SizedBox(height: 10.h,),
        Container(
          margin: EdgeInsets.only(left: 30.w,right: 30.w),
          child: Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickContinue();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Focus141LocalImagesWidget(focus141ImagesName: "btn_bg4",focus141Width: 208.w,focus141Height: 50.h,),
                Focus141TextWidget(
                  focus141TextContent: "Cash Out",
                  focus141TextSize: 20.sp,
                  focus141TextColor: Focus141Colors.colorFFFFFF,
                  focus141LineColor: Focus141Colors.color3E62D4,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 30.h,),
      ],
    ),
  );

  _loopTaskWidget()=>Container(
    margin: EdgeInsets.only(left: 20.w,right: 20.w),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: [
                TextSpan(
                  text: "Final Task：",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: "woff",
                    color: Focus141Colors.color000000,
                  ),
                ),
                TextSpan(
                  text: getLoopTaskLeftStr(bean.focus141cashLoopTaskInfoBean),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: "woff",
                    color: Focus141Colors.color000000,
                  ),
                ),
                TextSpan(
                  text: "${bean.focus141cashLoopTaskInfoBean?.currentPro??0}/${bean.focus141cashLoopTaskInfoBean?.totalPro??0}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: "woff",
                    color: Focus141Colors.colorFF7E7E,
                  ),
                ),
                TextSpan(
                  text: getLoopTaskRightStr(bean.focus141cashLoopTaskInfoBean),
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: "woff",
                    color: Focus141Colors.color000000,
                  ),
                ),
              ]
          ),
        ),
        LayoutBuilder(
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
                    width: width*getProgress(bean.focus141cashLoopTaskInfoBean?.currentPro??0, bean.focus141cashLoopTaskInfoBean?.totalPro??0),
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
                Focus141TextWidget(focus141TextContent: "${bean.focus141cashLoopTaskInfoBean?.currentPro??0}/${bean.focus141cashLoopTaskInfoBean?.totalPro??0}", focus141TextSize: 14.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
              ],
            );
          },
        ),
      ],
    ),
  );

  _cashMoneyWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Focus141CashTypeMoneyWidget(
        typeEnum: focus141Con.getCashType(),
        money: bean.money,
        width: 158.w,
        height: 72.h,
      ),
      SizedBox(height: 10.h,),
      Container(
        margin: EdgeInsets.only(left: 26.w,right: 26.w),
        child: Focus141TextWidget(
          focus141TextContent: "Only one step away from successful withdrawal",
          focus141TextSize: 18.sp,
          focus141Height: 1.0,
          focus141TextAlign: TextAlign.center,
          focus141TextColor: Focus141Colors.color000000,
        ),
      ),
    ],
  );

  _titleWidget()=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(top: 12.h),
      child:   Focus141TextWidget(
        focus141TextContent: "One Last Step",
        focus141TextSize: 32.sp,
        focus141Height: 1.0,
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