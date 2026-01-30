import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_enum/focus141_loop_task_type_enum.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_bean/focus141_cash_money_list_bean.dart';
import 'package:focus222/focus141_page/focus141_home/focus141_cash_child/focus141_cash_child_con.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';
import 'package:focus222/focus141_utils/focus141_utils.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141CashChild extends Focus141Widget<Focus141CashChildCon>{
  @override
  Focus141CashChildCon initFocus141Con() => Focus141CashChildCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.child;

  @override
  Widget initFocus141Widget() => Column(
    children: [
      _topMoneyWidget(),
      _cashTypeTabWidget(),
      _cashMoneyListWidget(),
    ],
  );

  _topMoneyWidget()=>SafeArea(
    child: Container(
      width: double.infinity,
      height: 120.h,
      margin: EdgeInsets.only(top: 13.h,left: 13.w,right: 13.w),
      child: Stack(
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "cash1", focus141Width: double.infinity, focus141Height: double.infinity,),
          Container(
            padding: EdgeInsets.only(left: 10.w,right: 10.w,top: 2.h,bottom: 2.h),
            decoration: BoxDecoration(
              color: Focus141Colors.colorFFED4E,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.w),
                bottomRight: Radius.circular(10.w),
              ),
            ),
            child: Focus141TextWidget(focus141TextContent: " 100% Winning", focus141TextSize: 13.sp, focus141TextColor: Focus141Colors.color484000,focus141FontWeight: FontWeight.bold,),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 27.w),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Focus141TextWidget(focus141TextContent: "My BALANCE:", focus141TextSize: 20.sp, focus141TextColor: Focus141Colors.color000000,focus141FontWeight: FontWeight.bold,),
                  Container(
                    margin: EdgeInsets.only(top: 18.h),
                    child: GetBuilder<Focus141CashChildCon>(
                      id: "money",
                      builder: (_)=>Focus141TextWidget(
                        focus141TextContent: "\$${bFocus141Money.getData()}",
                        focus141TextSize: 30.sp,
                        focus141TextColor: Focus141Colors.color9EF356,
                        focus141FontWeight: FontWeight.bold,
                        focus141LineColor: Focus141Colors.color055305,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 30.w),
              child: GetBuilder<Focus141CashChildCon>(
                id: "top_cash_type",
                builder: (_)=>Focus141LocalImagesWidget(
                  focus141ImagesName: getTopCashTypeIcon(Focus141CashTypeEnum.values.byName(bCashType.getData())),
                  focus141Width: null,
                  focus141Height: 32.h,
                  boxFit: BoxFit.fitHeight,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );

  _cashTypeTabWidget()=>Container(
    width: double.infinity,
    height: 48.h,
    margin: EdgeInsets.only(left: 13.w,right: 13.w),
    child: GetBuilder<Focus141CashChildCon>(
      id: "tab",
      builder: (_)=>ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: focus141Con.cashTypeList.length,
        itemBuilder: (context,index){
          var typeEnum = focus141Con.cashTypeList[index];
          var selected = focus141Con.selectedCashType==typeEnum;
          return Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickCashAppTab(typeEnum);
            },
            child: Container(
              width: selected?110.w:100.w,
              height: 48.h,
              alignment: Alignment.center,
              child: Focus141LocalImagesWidget(
                focus141ImagesName: selected?getCashTypeTabSelIcon(typeEnum):getCashTypeTabUnsIcon(typeEnum),
                focus141Width: selected?110.w:100.w,
                focus141Height: selected?30.h:26.h,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 14.w,),
      ),
    ),
  );

  _cashMoneyListWidget()=>Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Focus141Colors.colorEFF7FF,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.w),
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Focus141TextWidget(
            focus141TextContent: "Choose withdraw amount",
            focus141TextSize: 16.sp,
            focus141TextColor: Focus141Colors.color242424,
          ),
          SizedBox(height: 18.h,),
          Expanded(
            child: GetBuilder<Focus141CashChildCon>(
              id: "cash_list",
              builder: (_){
                var myMoney = bFocus141Money.getData();
                return MediaQuery.removePadding(
                  context: ctx,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView.separated(
                    itemCount: focus141Con.cashMoneyList.length,
                    itemBuilder: (context,index){
                      var bean = focus141Con.cashMoneyList[index];
                      if(null!=bean.focus141cashQuiz20InfoBean){
                        return _taskQuiz20ItemWidget(bean);
                      }
                      if(null!=bean.focus141cashQueueInfoBean){
                        return _taskQueueItemWidget(bean);
                      }
                      if(null!=bean.focus141cashQuiz50LoginInfoBean){
                        return _taskQuiz50Login7ItemWidget(bean);
                      }
                      if(null!=bean.focus141cashLoopTaskInfoBean){
                        return _taskLoopTaskItemWidget(bean);
                      }
                      return _normalItemWidget(bean,myMoney);
                    },
                    separatorBuilder: (BuildContext context, int index) => SizedBox(height: 28.h,),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );

  _normalItemWidget(Focus141CashMoneyListBean bean, double myMoney)=>Container(
    width: double.infinity,
    padding: EdgeInsets.only(left: 10.w,right: 10.w,bottom: 10.h),
    decoration: BoxDecoration(
      color: Focus141Colors.colorFFFFFF,
      borderRadius: BorderRadius.circular(11.w),
      border: Border.all(
        width: 1.w,
        color: Focus141Colors.colorCBCBCB,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Focus141TextWidget(focus141TextContent: "\$${bean.money}", focus141TextSize: 40.sp, focus141TextColor: Focus141Colors.color273358,),
            Spacer(),
            Focus141ClickWidget(
              focus141OnTap: (){
                focus141Con.clickCashBtn(bean);
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Focus141LocalImagesWidget(focus141ImagesName: "btn_bg2",focus141Width: 130.w,focus141Height: 30.h,),
                  Focus141TextWidget(
                    focus141TextContent: "Cash Out",
                    focus141TextSize: 16.sp,
                    focus141TextColor: Focus141Colors.colorFFFFFF,
                    focus141LineColor: Focus141Colors.colorD5AD08,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: "icon_money1",focus141Width: 42.w,focus141Height: 28.h,),
            SizedBox(width: 4.w,),
            Expanded(
              child: LayoutBuilder(
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
                          width: width*getProgress(myMoney, bean.money),
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
                      Focus141TextWidget(focus141TextContent: "${(getProgress(myMoney, bean.money)*100).toInt()}%", focus141TextSize: 14.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );

  _taskQuiz20ItemWidget(Focus141CashMoneyListBean bean)=>Focus141ClickWidget(
    focus141OnTap: (){
      focus141Con.clickCashItem(bean);
    },
    child: SizedBox(
      width: double.infinity,
      height: 150.h,
      child: Stack(
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "quiz20_bg", focus141Width: double.infinity, focus141Height: double.infinity),
          Row(
            children: [
              SizedBox(width: 10.w),
              Focus141TextWidget(focus141TextContent: "\$${bean.money}", focus141TextSize: 40.sp, focus141TextColor: Focus141Colors.color273358,),
              Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Focus141LocalImagesWidget(focus141ImagesName: "cash3",focus141Width: 130.w,focus141Height: 30.h,),
                  Focus141TextWidget(
                    focus141TextContent: "Processing",
                    focus141TextSize: 16.sp,
                    focus141TextColor: Focus141Colors.colorFFFFFF,
                    focus141LineColor: Focus141Colors.colorFA816A,
                  ),
                ],
              ),
              SizedBox(width: 10.w),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 10.w,right: 10.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Focus141LocalImagesWidget(focus141ImagesName: "cash2", focus141Width: double.infinity, focus141Height: 28.h),
                      Focus141TextWidget(focus141TextContent: "Security check in progress to protect your payout", focus141TextSize: 12.sp, focus141TextColor: Focus141Colors.colorFFFFFF,),
                    ],
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Verification task：Complete ",
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
                  Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
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
                      ),
                      SizedBox(width: 4.w,),
                      Focus141ClickWidget(
                        focus141OnTap: (){
                          focus141Con.toQuizTab();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Focus141LocalImagesWidget(focus141ImagesName: "cash4",focus141Width: 72.w,focus141Height: 24.h,),
                            Focus141TextWidget(
                              focus141TextContent: "Go",
                              focus141TextSize: 16.sp,
                              focus141TextColor: Focus141Colors.colorFFFFFF,
                              focus141LineColor: Focus141Colors.colorD5AD08,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  _taskQueueItemWidget(Focus141CashMoneyListBean bean)=>Focus141ClickWidget(
    focus141OnTap: (){
      focus141Con.clickCashItem(bean);
    },
    child: SizedBox(
      width: double.infinity,
      height: 150.h,
      child: Stack(
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "quiz20_bg", focus141Width: double.infinity, focus141Height: double.infinity),
          Row(
            children: [
              SizedBox(width: 10.w),
              Focus141TextWidget(focus141TextContent: "\$${bean.money}", focus141TextSize: 40.sp, focus141TextColor: Focus141Colors.color273358,),
              Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Focus141LocalImagesWidget(focus141ImagesName: "cash5",focus141Width: 130.w,focus141Height: 30.h,),
                  Focus141TextWidget(
                    focus141TextContent: "In Queue",
                    focus141TextSize: 16.sp,
                    focus141TextColor: Focus141Colors.colorFFFFFF,
                    focus141LineColor: Focus141Colors.color238CFF,
                  ),
                ],
              ),
              SizedBox(width: 10.w),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 10.w,right: 10.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Focus141LocalImagesWidget(focus141ImagesName: "cash2", focus141Width: double.infinity, focus141Height: 28.h),
                      Focus141TextWidget(focus141TextContent: "You’re in line. Payouts are released in order", focus141TextSize: 12.sp, focus141TextColor: Focus141Colors.colorFFFFFF,),
                    ],
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Queue Progress:",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "woff",
                              color: Focus141Colors.color000000,
                            ),
                          ),
                          //Complete 20 Spins
                          TextSpan(
                            text: "${(focus141Con.getQueueProgress(bean.focus141cashQueueInfoBean)*100).toInt()}%",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "woff",
                              color: Focus141Colors.colorFF7E7E,
                            ),
                          ),
                        ]
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LayoutBuilder(
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
                                    width: width*focus141Con.getQueueProgress(bean.focus141cashQueueInfoBean),
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
                                Focus141TextWidget(
                                  focus141TextContent: "${(focus141Con.getQueueProgress(bean.focus141cashQueueInfoBean)*100).toInt()}%",
                                  focus141TextSize: 14.sp,
                                  focus141TextColor: Focus141Colors.colorFFFFFF,
                                  focus141LineColor: Focus141Colors.color000000,
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(width: 4.w,),
                      Focus141ClickWidget(
                        focus141OnTap: (){
                          focus141Con.clickQueueBtn(bean);
                        },
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 7.h),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Focus141LocalImagesWidget(focus141ImagesName: "cash4",focus141Width: 72.w,focus141Height: 24.h,),
                                  Focus141TextWidget(
                                    focus141TextContent: "Speed Up",
                                    focus141TextSize: 12.sp,
                                    focus141TextColor: Focus141Colors.colorFFFFFF,
                                    focus141LineColor: Focus141Colors.colorD5AD08,
                                  ),
                                ],
                              ),
                            ),
                            Focus141LocalImagesWidget(focus141ImagesName: "icon_video", focus141Width: 14.w, focus141Height: 14.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  _taskQuiz50Login7ItemWidget(Focus141CashMoneyListBean bean)=>Focus141ClickWidget(
    focus141OnTap: (){
      focus141Con.clickCashItem(bean);
    },
    child: SizedBox(
      width: double.infinity,
      height: 254.h,
      child: Stack(
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "cash6", focus141Width: double.infinity, focus141Height: double.infinity),
          Row(
            children: [
              SizedBox(width: 10.w),
              Focus141TextWidget(focus141TextContent: "\$${bean.money}", focus141TextSize: 40.sp, focus141TextColor: Focus141Colors.color273358,),
              Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  Focus141LocalImagesWidget(focus141ImagesName: "cash7",focus141Width: 130.w,focus141Height: 30.h,),
                  Focus141TextWidget(
                    focus141TextContent: "Verifying",
                    focus141TextSize: 16.sp,
                    focus141TextColor: Focus141Colors.colorFFFFFF,
                    focus141LineColor: Focus141Colors.color09C287,
                  ),
                ],
              ),
              SizedBox(width: 10.w),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 10.w,right: 10.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Focus141LocalImagesWidget(focus141ImagesName: "cash2", focus141Width: double.infinity, focus141Height: 28.h),
                      Container(
                        margin: EdgeInsets.only(left: 12.w,right: 12.w),
                        child: Focus141TextWidget(
                          focus141TextContent: "Almost there! Complete the final human check to release your cash",
                          focus141TextSize: 12.sp,
                          focus141Height: 1.0,
                          focus141TextColor: Focus141Colors.colorFFFFFF,
                        ),
                      ),
                    ],
                  ),
                  Focus141TextWidget(focus141TextContent: "Human verification in progress…", focus141TextSize: 16.sp, focus141TextColor: Focus141Colors.color000000,),
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
                  SizedBox(height: 12.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  _taskLoopTaskItemWidget(Focus141CashMoneyListBean bean){
    var tixianTask = Focus141ValueUtils.instance.getTixianTaskById(bean.focus141cashLoopTaskInfoBean?.taskId);
    return Focus141ClickWidget(
      focus141OnTap: (){
        focus141Con.clickCashItem(bean);
      },
      child: SizedBox(
        width: double.infinity,
        height: 152.h,
        child: Stack(
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: "cash8", focus141Width: double.infinity, focus141Height: double.infinity),
            Row(
              children: [
                SizedBox(width: 10.w),
                Focus141TextWidget(focus141TextContent: "\$${bean.money}", focus141TextSize: 40.sp, focus141TextColor: Focus141Colors.color273358,),
                Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Focus141LocalImagesWidget(focus141ImagesName: "cash9",focus141Width: 130.w,focus141Height: 30.h,),
                    Focus141TextWidget(
                      focus141TextContent: "Processing",
                      focus141TextSize: 16.sp,
                      focus141TextColor: Focus141Colors.colorFFFFFF,
                      focus141LineColor: Focus141Colors.color20B83C,
                    ),
                  ],
                ),
                SizedBox(width: 10.w),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(left: 10.w,right: 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 16.w,right: 16.w,top: 4.h,bottom: 4.h,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28.w),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Focus141Colors.color4AA2FF,Focus141Colors.color4A73FE,]
                        ),
                      ),
                      child: Row(
                        children: [
                          Focus141LocalImagesWidget(focus141ImagesName: "cash10", focus141Width: 18.w, focus141Height: 21.h),
                          SizedBox(width: 3.w,),
                          Expanded(
                            child: Focus141TextWidget(
                              focus141TextContent: "Final Step! Complete the final task to release your cash",
                              focus141TextSize: 12.sp,
                              focus141Height: 1.0,
                              focus141TextColor: Focus141Colors.colorFFFFFF,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                    Row(
                      children: [
                        Visibility(
                          visible: tixianTask?.title==Focus141LoopTaskTypeEnum.video.name,
                          child: Container(
                            margin: EdgeInsets.only(right: 10.w),
                            child: Focus141LocalImagesWidget(focus141ImagesName: "icon_video", focus141Width: 36.w, focus141Height: 36.w,),
                          ),
                        ),
                        Expanded(
                          child: LayoutBuilder(
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
                        ),
                        Visibility(
                          visible: tixianTask?.title!=Focus141LoopTaskTypeEnum.video.name,
                          child: Container(
                            margin: EdgeInsets.only(left: 4.w),
                            child: Focus141ClickWidget(
                              focus141OnTap: (){
                                focus141Con.clickLoopTaskBtn();
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Focus141LocalImagesWidget(focus141ImagesName: "cash4",focus141Width: 72.w,focus141Height: 24.h,),
                                  Focus141TextWidget(
                                    focus141TextContent: "Go",
                                    focus141TextSize: 16.sp,
                                    focus141TextColor: Focus141Colors.colorFFFFFF,
                                    focus141LineColor: Focus141Colors.colorD5AD08,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}