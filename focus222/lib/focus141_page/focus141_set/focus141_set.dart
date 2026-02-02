import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_page/focus141_set/focus141_set_con.dart';

class Focus141Set extends Focus141Widget<Focus141SetCon>{
  @override
  Focus141SetCon initFocus141Con() => Focus141SetCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.page;

  @override
  Widget initFocus141Widget() => Stack(
    children: [
      Focus141LocalImagesWidget(focus141ImagesName: "wheel_bg", focus141Width: double.infinity, focus141Height: double.infinity,),
      SafeArea(
        child: Column(
          children: [
            _backWidget(),
            SizedBox(height: 30.h,),
            _privacyWidget(),
            SizedBox(height: 10.h,),
            _contactWidget(),
          ],
        ),
      ),
    ],
  );

  _privacyWidget()=>Focus141ClickWidget(
    focus141OnTap: (){
      focus141Con.toPrivacy();
    },
    child: Container(
      width: double.infinity,
      height: 54.h,
      margin: EdgeInsets.only(left: 20.w,right: 20.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "set1", focus141Width: double.infinity, focus141Height: 54.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 26.w),
              child: Focus141LocalImagesWidget(focus141ImagesName: "set2", focus141Width: 33.w, focus141Height: 33.w),
            ),
          ),
          Align(
            child: Focus141TextWidget(
              focus141TextContent: "Privacy Policy",
              focus141TextSize: 20.sp,
              focus141TextColor: Focus141Colors.colorFFFFFF,
              focus141LineColor: Focus141Colors.color975B3C,
            ),
          ),
        ],
      ),
    ),
  );

  _contactWidget()=>Focus141ClickWidget(
    focus141OnTap: (){
      focus141Con.toEmail();
    },
    child: Container(
      width: double.infinity,
      height: 54.h,
      margin: EdgeInsets.only(left: 20.w,right: 20.w),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "set1", focus141Width: double.infinity, focus141Height: 54.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 26.w),
              child: Focus141LocalImagesWidget(focus141ImagesName: "set2", focus141Width: 33.w, focus141Height: 33.w),
            ),
          ),
          Align(
            child: Focus141TextWidget(
              focus141TextContent: "Contact us",
              focus141TextSize: 20.sp,
              focus141TextColor: Focus141Colors.colorFFFFFF,
              focus141LineColor: Focus141Colors.color975B3C,
            ),
          ),
        ],
      ),
    ),
  );

  _backWidget()=>Row(
    children: [
      SizedBox(width: 22.w,),
      Focus141ClickWidget(
        focus141OnTap: (){
          backFocus141();
        },
        child: Focus141LocalImagesWidget(focus141ImagesName: "icon_back", focus141Width: 32.w, focus141Height: 32.w),
      ),
    ],
  );
}