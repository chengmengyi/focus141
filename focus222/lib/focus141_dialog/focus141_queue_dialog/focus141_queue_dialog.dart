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
import 'package:focus222/focus141_dialog/focus141_queue_dialog/focus141_queue_dialog_con.dart';
import 'package:focus222/focus141_widget/focus141_cash_type_money_widget.dart';

class Focus141QueueDialog extends Focus141Widget<Focus141QueueDialogCon>{
  Focus141CashMoneyListBean bean;
  Focus141QueueDialog({
    required this.bean,
  });


  @override
  Focus141QueueDialogCon initFocus141Con() => Focus141QueueDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 480.h,
    margin: EdgeInsets.only(left: 26.w,right: 26.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "queue_dialog1",focus141Width: double.infinity,focus141Height: double.infinity,),
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
        Focus141CashTypeMoneyWidget(
          typeEnum: Focus141CashTypeEnum.values.byName(bean.focus141cashQueueInfoBean?.cashType??""),
          money: bean.money,
          width: 158.w,
          height: 72.h,
        ),
        SizedBox(height: 22.h,),
        _rankWidget(),
        SizedBox(height: 22.h,),
        _skipBtnWidget(),
        SizedBox(height: 30.h,),
      ],
    ),
  );
  
  _rankWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(
                text: "${bean.focus141cashQueueInfoBean?.totalPro??0}",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: "woff",
                  color: Focus141Colors.colorEC2428,
                ),
              ),
              //228 in queue, Your Current rank: 22
              TextSpan(
                text: " in queue, Your Current rank: ",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: "woff",
                  color: Focus141Colors.color7B7B7B,
                ),
              ),
              TextSpan(
                text: "${bean.focus141cashQueueInfoBean?.currentPro??0}",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: "woff",
                  color: Focus141Colors.colorEC2428,
                ),
              ),
            ]
        ),
      ),
      Container(
        width: double.infinity,
        padding: EdgeInsets.all(6.w),
        margin: EdgeInsets.only(left: 10.w,right: 10.w),
        decoration: BoxDecoration(
          color: Focus141Colors.colorD7E3F6,
          borderRadius: BorderRadius.circular(12.w),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              height: 18.h,
              decoration: BoxDecoration(
                color: Focus141Colors.colorA6C2F2,
                borderRadius: BorderRadius.circular(10.w),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Focus141TextWidget(focus141TextContent: "User ID", focus141TextSize: 12.sp, focus141TextColor: Focus141Colors.color000000,focus141Height: 1.0,),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Focus141TextWidget(focus141TextContent: "Account", focus141TextSize: 12.sp, focus141TextColor: Focus141Colors.color000000,focus141Height: 1.0,),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Focus141TextWidget(focus141TextContent: "Amount", focus141TextSize: 12.sp, focus141TextColor: Focus141Colors.color000000,focus141Height: 1.0,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h,),
            SizedBox(
              width: double.infinity,
              height: 121.h,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context,index){
                  return Container(
                    width: double.infinity,
                    height: 28.h,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: Focus141Colors.colorFFFFFF,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: Focus141TextWidget(focus141TextContent: "User ID", focus141TextSize: 12.sp, focus141TextColor: Focus141Colors.color000000,focus141Height: 1.0,),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Focus141TextWidget(focus141TextContent: "Account", focus141TextSize: 12.sp, focus141TextColor: Focus141Colors.color000000,focus141Height: 1.0,),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Focus141TextWidget(focus141TextContent: "Amount", focus141TextSize: 12.sp, focus141TextColor: Focus141Colors.color000000,focus141Height: 1.0,),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 3.h,),
              ),
            )
          ],
        ),
      ),
    ],
  );

  _skipBtnWidget()=>Focus141ClickWidget(
    focus141OnTap: (){

    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "queue_dialog3",focus141Width: 208.w,focus141Height: 50.h,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: "icon_video", focus141Width: 24.w, focus141Height: 24.w),
            SizedBox(width: 2.w,),
            Focus141TextWidget(
              focus141TextContent: "Skip Wait",
              focus141TextSize: 20.sp,
              focus141TextColor: Focus141Colors.colorFFFFFF,
              focus141LineColor: Focus141Colors.color3E62D4,
            ),
          ],
        ),
      ],
    ),
  );

  _titleWidget()=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(top: 16.h,left: 20.w,right: 20.w),
      child: Row(
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "queue_dialog2", focus141Width: 27.w, focus141Height: 27.w),
          SizedBox(width: 2.w,),
          Expanded(
            child: Focus141TextWidget(
              focus141TextContent: " Verified! You're now in the payout queue.",
              focus141TextSize: 20.sp,
              focus141Height: 1.0,
              focus141TextAlign: TextAlign.center,
              focus141TextColor: Focus141Colors.colorFFFFFF,
              focus141LineColor: Focus141Colors.color000000,
            ),
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