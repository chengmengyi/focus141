import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_old_user_dialog/focus141_old_user_dialog_con.dart';

class Focus141OldUserDialog extends Focus141Widget<Focus141OldUserDialogCon>{
  Function(bool clickDouble) callback;
  Focus141OldUserDialog({
    required this.callback,
});
  @override
  Focus141OldUserDialogCon initFocus141Con() => Focus141OldUserDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Container(
    width: double.infinity,
    height: 448.h,
    margin: EdgeInsets.only(left: 20.w,right: 20.w),
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "old1", focus141Width: double.infinity, focus141Height: double.infinity,),
        _titleWidget(),
        _descWidget(),
        _iconWidget(),
        _btnWidget(),
        _closeWidget(),
      ],
    ),
  );
  
  _btnWidget()=>Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: EdgeInsets.only(bottom: 22.h),
      child: Focus141ClickWidget(
        focus141OnTap: (){
          focus141Con.clickSpin(callback);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Focus141LocalImagesWidget(focus141ImagesName: "old3", focus141Width: 196.w, focus141Height: 52.h),
            Focus141TextWidget(focus141TextContent: "Spin", focus141TextSize: 24.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.colorD68620,),
          ],
        ),
      ),
    ),
  );

  _iconWidget()=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(top: 142.h),
      child: Focus141LocalImagesWidget(focus141ImagesName: "old2", focus141Width: 188.w, focus141Height: 210.h),
    ),
  );

  _titleWidget()=>Positioned(
    top: 40.h,
    left: 10.w,
    child: Focus141TextWidget(focus141TextContent: "Daily Bonus", focus141TextSize: 32.sp, focus141TextColor: Focus141Colors.colorFFFFFF,focus141LineColor: Focus141Colors.color000000,),
  );

  _descWidget()=>Align(
    alignment: Alignment.topCenter,
    child: Container(
      margin: EdgeInsets.only(top: 98.h),
      child: Focus141TextWidget(focus141TextContent: "Spin the wheel daily for prize！", focus141TextSize: 20.sp, focus141TextColor: Focus141Colors.color434343),
    ),
  );

  _closeWidget()=> Positioned(
    top: 50.h,
    right: 10.w,
    child: Focus141ClickWidget(
      focus141OnTap: (){
        focus141Con.clickClose(callback);
      },
      child: Container(
        width: 40.w,
        height: 40.w,
        alignment: Alignment.center,
        child: Focus141LocalImagesWidget(focus141ImagesName: "icon_close", focus141Width: 16.w, focus141Height: 16.w),
      ),
    ),
  );
}