import 'package:flutter/material.dart';
import 'package:focus/focus141_launch/focus141_launch_controller.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';

class Focus141LaunchPage extends Focus141Widget<Focus141LaunchController>{
  @override
  Focus141LaunchController initFocus141Con() => Focus141LaunchController();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.page;

  @override
  Widget initFocus141Widget() => Stack(
    alignment: Alignment.topCenter,
    children: [
      Focus141LocalImagesWidget(focus141ImagesName: "launch_bg", focus141Width: double.infinity, focus141Height: double.infinity,),
      Column(
        children: [
          SizedBox(height: 160.h,),
          Focus141LocalImagesWidget(focus141ImagesName: "logo", focus141Width: 130.w, focus141Height: 130.w,),
          Spacer(),
          SizedBox(
            width: 290.w,
            height: 18.h,
            child: GetBuilder<Focus141LaunchController>(
              id: "progress",
              builder: (_)=>Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Focus141LocalImagesWidget(focus141ImagesName: "progress_bg", focus141Width: 290.w, focus141Height: 18.h,),
                  Container(
                    margin: EdgeInsets.only(left: 1.w),
                    child: ClipRect(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        widthFactor: focus141Con.controller.value,
                        child: Focus141LocalImagesWidget(focus141ImagesName: "progress", focus141Width: 288, focus141Height: 16.h),
                      ),
                    ),
                  ),
                  Align(
                    child: Focus141TextWidget(
                      focus141TextContent: "${(focus141Con.controller.value*100).toInt()}%",
                      focus141TextSize: 15.sp,
                      focus141TextColor: Focus141Colors.colorFFFFFF,
                      focus141LineColor: Focus141Colors.color000000,
                      focus141FontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 160.h,),
        ],
      ),
    ],
  );
}