import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_finger_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_bean/focus141_home_pro_bean.dart';
import 'package:focus222/focus141_bean/focus141_quiz_bean.dart';
import 'package:focus222/focus141_bean/focus141_quiz_type_bean.dart';
import 'package:focus222/focus141_page/focus141_home/focus141_quiz_child/focus141_quiz_child_con.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';
import 'package:focus222/focus141_widget/focus141_bubble_widget.dart';
import 'package:focus222/focus141_widget/focus141_money_widget.dart';

class Focus141QuizChild extends Focus141Widget<Focus141QuizChildCon>{
  @override
  Focus141QuizChildCon initFocus141Con() => Focus141QuizChildCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.child;

  @override
  Widget initFocus141Widget() => Stack(
    children: [
      SafeArea(
        child: Column(
          children: [
            _topWidget(),
            SizedBox(height: 48.h,),
            _progressWidget(),
            SizedBox(height: 26.h,),
            _quizWidget(),
          ],
        ),
      ),
      _fingerWidget(),
      Focus141BubbleWidget(),
    ],
  );

  _quizWidget()=>Expanded(
    child: Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20.w,right: 20.w),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "quiz_bg", focus141Width: double.infinity, focus141Height: double.infinity,),
          GetBuilder<Focus141QuizChildCon>(
            id: "quiz",
            builder: (_){
              var quizTypeBean = focus141Con.getQuizTypeBean();
              if(null==quizTypeBean){
                return Container();
              }
              var quizBean = focus141Con.getQuizBean(quizTypeBean);
              if(null==quizBean){
                return Container();
              }
              return Column(
                children: [
                  SizedBox(height: 35.h,),
                  Focus141TextWidget(
                    focus141TextContent: quizTypeBean.type,
                    focus141TextSize: 24.sp,
                    focus141TextColor: Focus141Colors.colorFFFFFF,
                    focus141FontWeight: FontWeight.bold,
                    focus141LineColor: Focus141Colors.color000000,
                  ),
                  SizedBox(height: 20.h,),
                  _questionWidget(quizTypeBean,quizBean),
                  _quizAnswerWidget(quizTypeBean,quizBean),
                ],
              );
            },
          )
        ],
      ),
    ),
  );

  _questionWidget(Focus141QuizTypeBean quizTypeBean, Focus141QuizBean quizBean)=>Container(
    width: double.infinity,
    height: 170.h,
    margin: EdgeInsets.only(left: 20.w,right: 20.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "quiz_question_bg", focus141Width: double.infinity, focus141Height: double.infinity,),
        _quizProgressWidget(quizTypeBean),
        _quizTitleWidget(quizBean),
      ],
    ),
  );

  _quizTitleWidget(Focus141QuizBean quizBean)=>Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      width: double.infinity,
      height: 100.h,
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10.w,right: 10.w),
      child: Focus141TextWidget(focus141TextContent: quizBean.question??"", focus141TextSize: 20.sp, focus141TextColor: Focus141Colors.color000000,),
    ),
  );

  _quizAnswerWidget(Focus141QuizTypeBean quizTypeBean,Focus141QuizBean quizBean)=>Expanded(
    child: Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: GetBuilder<Focus141QuizChildCon>(
        id: "answer",
        builder: (_)=>Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _quizAnswerItemWidget("a",quizBean,quizTypeBean,focus141Con.answerAGlobalKey),
            SizedBox(height: 29.h,),
            _quizAnswerItemWidget("b",quizBean,quizTypeBean,focus141Con.answerBGlobalKey),
          ],
        ),
      ),
    ),
  );

  _quizAnswerItemWidget(String index, Focus141QuizBean quizBean,Focus141QuizTypeBean quizTypeBean,GlobalKey globalKey){
    var answerResultImage = focus141Con.getAnswerResultImage(index, quizBean);
    return Focus141ClickWidget(
      focus141OnTap: (){
        focus141Con.clickAnswer(index,quizBean,quizTypeBean);
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        key: globalKey,
        margin: EdgeInsets.only(left: 40.w,right: 40.w),
        child: Stack(
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: focus141Con.getAnswerBgImage(index,quizBean), focus141Width: double.infinity, focus141Height: 50.h,),
            Align(
              child: Focus141TextWidget(
                focus141TextContent: index=="a"?quizBean.a??"":quizBean.b??"",
                focus141TextSize: 24.sp,
                focus141FontWeight: FontWeight.bold,
                focus141TextColor: Focus141Colors.colorFFFFFF,
                focus141LineColor: Focus141Colors.color000000,
              ),
            ),
            answerResultImage.isEmpty?
            Container():
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: EdgeInsets.only(right: 20.w),
                child: Focus141LocalImagesWidget(focus141ImagesName: answerResultImage, focus141Width: 27.w, focus141Height: 27.w,),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: index==quizBean.answer&&focus141Con.firstAnswerQuiz,
                child: Container(
                  margin: EdgeInsets.only(left: 20.w),
                  child: Focus141LocalImagesWidget(
                    focus141ImagesName: "icon_money1",
                    focus141Width: 43.w,
                    focus141Height: 30.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _quizProgressWidget(Focus141QuizTypeBean quizTypeBean)=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(left: 20.w,right: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h,),
          Focus141TextWidget(focus141TextContent: "${focus141Con.quizIndex+1}/${quizTypeBean.size}", focus141TextSize: 20.sp, focus141TextColor: Focus141Colors.color000000,),
          LayoutBuilder(
            builder: (context,bc){
              var maxWidth = bc.maxWidth-(2.w);
              return Container(
                width: double.infinity,
                height: 12.h,
                padding: EdgeInsets.only(left: 1.w,right: 1.w),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Focus141Colors.color3D3B3B,
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Container(
                  width: maxWidth*getProgress(focus141Con.quizIndex+1, quizTypeBean.size),
                  height: 10.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.w),
                    gradient: LinearGradient(
                      colors: [Focus141Colors.colorF85656,Focus141Colors.colorFF8888,],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ),
  );

  _progressWidget()=>Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        width: double.infinity,
        height: 22.h,
        margin: EdgeInsets.only(left: 16.w,right: 16.w,top: 4.h,),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 22.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                color: Focus141Colors.colorEED6B7,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 14.h,
                margin: EdgeInsets.only(left: 4.w,right: 4),
                child: ClipRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        border: Border.all(
                          width: 1.w,
                          color: Focus141Colors.colorDEA064,
                        ),
                      ),
                      child: Focus141LocalImagesWidget(focus141ImagesName: "home_pro", focus141Width: double.infinity, focus141Height: 14.h),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      GetBuilder<Focus141QuizChildCon>(
        id: "progress",
        builder: (_){
          var data = bFocus141AnswerRightNum.getData();
          return Container(
            width: double.infinity,
            height: 50.h,
            margin: EdgeInsets.only(left: 16.w,right: 16.w),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: focus141Con.progressList.length,
              controller: focus141Con.scrollController,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                var bean = focus141Con.progressList[index];
                var selected = data>=(bean.step??0);
                if(bean.type==Focus141HomeProType.empty){
                  return SizedBox(width: 25.w,);
                }
                return Focus141ClickWidget(
                  focus141OnTap: (){
                    focus141Con.clickProgress(bean);
                  },
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25.w),
                        child: Focus141TextWidget(
                          focus141TextContent: "${bean.step??0}",
                          focus141TextSize: 14.sp,
                          focus141FontWeight: FontWeight.bold,
                          focus141TextColor: bean.received==1||!selected?Focus141Colors.colorA9A9A9:Focus141Colors.colorFFD023,
                          focus141LineColor: bean.received==1||!selected?Focus141Colors.color3F3F3F:Focus141Colors.colorD5391B,
                        ),
                      ),
                      Container(
                        width: 30.w,
                        height: 30.w,
                        alignment: Alignment.center,
                        child: Focus141LocalImagesWidget(
                          focus141ImagesName: focus141Con.getProIcon(bean,selected),
                          focus141Width: 30.w,
                          focus141Height: bean.type==Focus141HomeProType.wheel?30.w:24.h,
                        ),
                      ),
                      Visibility(
                        visible: bean.received==1,
                        child: Container(
                          margin: EdgeInsets.only(top: 12.h),
                          child: Focus141LocalImagesWidget(
                            focus141ImagesName: "icon_gou",
                            focus141Width: 20.w,
                            focus141Height: 15.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    ],
  );

  _topWidget()=>Row(
    children: [
      SizedBox(width: 10.w,),
      Focus141MoneyWidget(),
      Expanded(
        child:  Focus141ClickWidget(
          focus141OnTap: (){
            focus141Con.test();
          },
          child: SizedBox(width: double.infinity,height: 30.h,),
        ),
      ),
      Focus141ClickWidget(
        child: Focus141LocalImagesWidget(focus141ImagesName: "icon_set", focus141Width: 30.w, focus141Height: 30.w,),
      ),
      SizedBox(width: 10.w,),
    ],
  );

  _fingerWidget()=>GetBuilder<Focus141QuizChildCon>(
    id: "finger",
    builder: (_){
      if(null==focus141Con.fingerOffset){
        return Container();
      }
      var dx = (focus141Con.fingerOffset?.dx??0)+200.w;
      var dy = (focus141Con.fingerOffset?.dy??0)+20.h;
      return Container(
        margin: EdgeInsets.only(top: dy,left: dx),
        child: Focus141ClickWidget(
          focus141OnTap: (){
            focus141Con.clickFinger();
          },
          child: Focus141FingerWidget(focus141Width: 80.w, focus141Height: 80.w),
        ),
      );
    },
  );
}