import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_bean/focus141_cash_money_list_bean.dart';
import 'package:focus222/focus141_dialog/focus141_cash_task_dialog/focus141_cash_task_dialog_con.dart';
import 'package:focus222/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_widget/focus141_cash_type_money_widget.dart';

class Focus141CashTaskDialog extends Focus141Widget<Focus141CashTaskDialogCon>{
  Focus141CashMoneyListBean bean;
  Focus141CashTaskDialog({
    required this.bean,
  });

  @override
  Focus141CashTaskDialogCon initFocus141Con() => Focus141CashTaskDialogCon(bean: bean);

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 510.h,
    margin: EdgeInsets.only(left: 26.w,right: 26.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "task_dialog1",focus141Width: double.infinity,focus141Height: double.infinity,),
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
        SizedBox(height: 18.h,),
        _getTaskWidget(),
        SizedBox(height: 30.h,),
        Container(
          margin: EdgeInsets.only(left: 30.w,right: 30.w),
          child: Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickContinue();
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Focus141LocalImagesWidget(focus141ImagesName: "btn_bg4",focus141Width: double.infinity,focus141Height: 50.h,),
                Focus141TextWidget(
                  focus141TextContent: "Continue to Verify",
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

  _getTaskWidget(){
    if(null!=bean.focus141cashQuiz20InfoBean){
      return _quiz20Widget();
    }
    if(null!=bean.focus141cashQuiz50LoginInfoBean){
      return _quiz50AndLogin7Widget();
    }
    if(null!=bean.focus141cashLoopTaskInfoBean){
      return _loopTaskWidget();
    }
    return Container();
  }

  _quiz20Widget()=>Container(
    width: double.infinity,
    padding: EdgeInsets.all(10.w),
    margin: EdgeInsets.only(left: 12.w,right: 12.w,bottom: 60.h),
    decoration: BoxDecoration(
      color: Focus141Colors.colorE7E7E7,
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              children: [
                TextSpan(
                  text: "Complete ",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: "woff",
                    color: Focus141Colors.color000000,
                  ),
                ),
                //Complete 20 Spins
                TextSpan(
                  text: "${bean.focus141cashQuiz20InfoBean?.totalQuizNum??0}",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: "woff",
                    color: Focus141Colors.colorFF7E7E,
                  ),
                ),
                TextSpan(
                  text: " Quiz",
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
                    width: width*getProgress(bean.focus141cashQuiz20InfoBean?.quizNum??0, bean.focus141cashQuiz20InfoBean?.totalQuizNum??0),
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
                Focus141TextWidget(focus141TextContent: "${bean.focus141cashQuiz20InfoBean?.quizNum??0}/${bean.focus141cashQuiz20InfoBean?.totalQuizNum??0}", focus141TextSize: 14.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
              ],
            );
          },
        ),
      ],
    ),
  );

  _quiz50AndLogin7Widget()=>Container(
    width: double.infinity,
    padding: EdgeInsets.all(10.w),
    margin: EdgeInsets.only(left: 12.w,right: 12.w),
    decoration: BoxDecoration(
      color: Focus141Colors.colorE7E7E7,
      borderRadius: BorderRadius.circular(12.w),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Focus141Colors.colorFFFFFF,
            borderRadius: BorderRadius.circular(11.w),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Focus141TextWidget(
                focus141TextContent: "Answer ${bean.focus141cashQuiz50LoginInfoBean?.quizTotalNum??0} questions correctly",
                focus141TextSize: 16.sp,
                focus141Height: 1.0,
                focus141TextColor: Focus141Colors.colorEC2428,
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
                          width: width*getProgress(bean.focus141cashQuiz50LoginInfoBean?.quizNum??0, bean.focus141cashQuiz50LoginInfoBean?.quizTotalNum??0),
                          height: 16.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Focus141Colors.colorFF6F58,Focus141Colors.colorFFB19A,]
                            ),
                          ),
                        ),
                      ),
                      Focus141TextWidget(focus141TextContent: "${bean.focus141cashQuiz50LoginInfoBean?.quizNum??0}/${bean.focus141cashQuiz50LoginInfoBean?.quizTotalNum??0}", focus141TextSize: 14.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h,),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Focus141Colors.colorFFFFFF,
            borderRadius: BorderRadius.circular(11.w),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Focus141TextWidget(
                focus141TextContent: "Login app ${bean.focus141cashQuiz50LoginInfoBean?.loginTotalNum??0} days",
                focus141TextSize: 16.sp,
                focus141Height: 1.0,
                focus141TextColor: Focus141Colors.colorEC2428,
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
                          width: width*getProgress(bean.focus141cashQuiz50LoginInfoBean?.loginNum??0, bean.focus141cashQuiz50LoginInfoBean?.loginTotalNum??0),
                          height: 16.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Focus141Colors.colorFF6F58,Focus141Colors.colorFFB19A,]
                            ),
                          ),
                        ),
                      ),
                      Focus141TextWidget(focus141TextContent: "${bean.focus141cashQuiz50LoginInfoBean?.loginNum??0}/${bean.focus141cashQuiz50LoginInfoBean?.loginTotalNum??0}", focus141TextSize: 14.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
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
      SizedBox(height: 20.h,),
      Container(
        margin: EdgeInsets.only(left: 26.w,right: 26.w),
        child: Focus141TextWidget(
          focus141TextContent: "Finish the verification tasks to release it.",
          focus141TextSize: 20.sp,
          focus141Height: 1.0,
          focus141TextAlign: TextAlign.center,
          focus141TextColor: Focus141Colors.color7B7B7B,
        ),
      ),
    ],
  );

  _titleWidget()=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(top: 16.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Congratulations! Advertiser has
          // approved your  $1000！
          Focus141TextWidget(
            focus141TextContent: "Congratulations! Advertiser has",
            focus141TextSize: 18.sp,
            focus141Height: 1.0,
            focus141TextColor: Focus141Colors.colorFFFFFF,
            focus141LineColor: Focus141Colors.color000000,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Focus141TextWidget(
                focus141TextContent: "approved your  ",
                focus141TextSize: 18.sp,
                focus141Height: 1.0,
                focus141TextColor: Focus141Colors.colorFFFFFF,
                focus141LineColor: Focus141Colors.color000000,
              ),
              Focus141TextWidget(
                focus141TextContent: "\$${bean.money}",
                focus141TextSize: 24.sp,
                focus141Height: 1.0,
                focus141TextColor: Focus141Colors.colorEC2428,
                focus141LineColor: Focus141Colors.color000000,
              ),
            ],
          ),
        ],
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