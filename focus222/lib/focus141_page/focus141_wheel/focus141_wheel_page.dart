import 'dart:math';

import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_page/focus141_wheel/focus141_wheel_con.dart';

class Focus141WheelPage extends Focus141Widget<Focus141WheelCon>{
  @override
  Focus141WheelCon initFocus141Con() => Focus141WheelCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.page;

  @override
  Widget initFocus141Widget() => WillPopScope(
    onWillPop: () async{
      focus141Con.clickBack();
      return false;
    },
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "wheel_bg", focus141Width: double.infinity, focus141Height: double.infinity,),
        SafeArea(
          child: Column(
            children: [
              _backWidget(),
              _topInfoWidget(),
              SizedBox(height: 30.h,),
              _wheelContentWidget(),
            ],
          ),
        ),
      ],
    ),
  );

  _wheelContentWidget()=>LayoutBuilder(
    builder: (context,bc){
      var maxWidth = bc.maxWidth;
      var radius = (maxWidth / 2 - 30)*0.7;
      return Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.only(top: maxWidth-20.h),
            child: Focus141LocalImagesWidget(focus141ImagesName: "wheel_bottom", focus141Width: 296.w, focus141Height: 76.h),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.h),
            child: AspectRatio(
              aspectRatio: 1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: focus141Con.wheelAnimation!,
                    builder: (context,child)=>Transform.rotate(
                      angle: focus141Con.wheelAnimation!.value,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Focus141LocalImagesWidget(focus141ImagesName: "wheel", focus141Width: double.infinity, focus141Height: double.infinity,),
                            ...List.generate(
                              focus141Con.wheelList.length, (i) =>
                                _wheelItemWidget(
                                  money: focus141Con.wheelList[i],
                                  angleDeg: i * 45.0 - 90,
                                  radius: radius,
                                ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Focus141ClickWidget(
                    focus141OnTap: (){
                      focus141Con.clickWheel();
                    },
                    child: Focus141LocalImagesWidget(focus141ImagesName: "wheel_go", focus141Width: 84.w, focus141Height: 105.h,),
                  ),
                ],
              ),
            ),
          ),
          Focus141LocalImagesWidget(focus141ImagesName: "wheel_finger", focus141Width: 86.w, focus141Height: 60.h),
        ],
      );
    },
  );
  
  _topInfoWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Focus141LocalImagesWidget(focus141ImagesName: "wheel_top", focus141Width: 332.w, focus141Height: 98.h,),
      Stack(
        alignment: Alignment.center,
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "wheel_tips_bg", focus141Width: double.infinity, focus141Height: 28.h),
          Focus141TextWidget(focus141TextContent: "20000 users have successfully withdrawn money", focus141TextSize: 15.sp, focus141TextColor: Focus141Colors.colorFFFFFF,),
        ],
      )
    ],
  );

  Widget _wheelItemWidget({
    required int money,
    required double angleDeg,
    required double radius,
  }) {
    final angleRad = angleDeg * pi / 180;
    final offset = Offset(
      radius * cos(angleRad),
      radius * sin(angleRad),
    );
    final textRotation = angleRad + pi / 2;
    return Transform.translate(
      offset: offset,
      child: Transform.rotate(
        angle: textRotation,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: "icon_money1", focus141Width: 60.w, focus141Height: 40.h),
            Container(
              margin: EdgeInsets.only(top: 20.h),
              child: Focus141TextWidget(
                focus141TextContent: "+\$$money",
                focus141TextSize: 15.sp,
                focus141FontWeight: FontWeight.bold,
                focus141TextColor: Focus141Colors.colorFFFFFF,
                focus141LineColor: Focus141Colors.color000000,
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  _backWidget()=>Row(
    children: [
      SizedBox(width: 22.w,),
      Focus141ClickWidget(
        focus141OnTap: (){
          focus141Con.clickBack();
        },
        child: Focus141LocalImagesWidget(focus141ImagesName: "icon_back", focus141Width: 32.w, focus141Height: 32.w),
      ),
    ],
  );
}