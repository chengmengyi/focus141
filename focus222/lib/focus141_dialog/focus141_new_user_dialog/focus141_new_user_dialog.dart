import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_finger_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_spine_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_new_user_dialog/focus141_new_user_dialog_con.dart';

class Focus141NewUserDialog extends Focus141Widget<Focus141NewUserDialogCon>{
  Function(double reard) callback;
  Focus141NewUserDialog({
    required this.callback,
});

  @override
  Focus141NewUserDialogCon initFocus141Con() => Focus141NewUserDialogCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => SizedBox(
    width: double.infinity,
    height: 650.h,
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "new_user1", focus141Width: double.infinity, focus141Height: double.infinity,),
        Align(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _titleWidget(),
              SizedBox(height: 20.h,),
              _boxWidget(),
              _btnWidget(),
            ],
          ),
        ),
      ],
    ),
  );

  _boxWidget()=>GetBuilder<Focus141NewUserDialogCon>(
    id: "box",
    builder: (_) =>Stack(
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: focus141Con.newUserDialogShowView==NewUserDialogShowView.box,
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: Container(
            margin: EdgeInsets.only(top: 80.h),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Focus141ClickWidget(
                  focus141OnTap: (){
                    focus141Con.clickBox();
                  },
                  child: ShakeAnimationWidget(
                    shakeAnimationController: focus141Con.shakeAnimationController,
                    shakeAnimationType: ShakeAnimationType.RoateShake,
                    isForward: false,
                    shakeCount: 4,
                    shakeRange: 0.1,
                    child: Focus141LocalImagesWidget(focus141ImagesName: "new_user3", focus141Width: 236.w, focus141Height: 118.h),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100.h),
                  child: Focus141ClickWidget(
                    focus141OnTap: (){
                      focus141Con.clickBox();
                    },
                    child: Focus141FingerWidget(focus141Width: 104.w, focus141Height: 104.w),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: focus141Con.newUserDialogShowView==NewUserDialogShowView.animator,
          maintainAnimation: true,
          maintainState: true,
          maintainSize: true,
          child: AspectRatio(
            aspectRatio: 1,
            child: Focus141SpineWidget(
              focus141Atlas: "zibaoxiangkaiqi",
              focus141Json: "zibaoxiangkaiqi",
              focus141AnimatorName: "open",
              focus141Folder: "CD1",
              focus141Controller: focus141Con.spineWidgetController,
            ),
          ),
        ),
        Visibility(
          visible: focus141Con.newUserDialogShowView==NewUserDialogShowView.result,
          child: SizedBox(
            width: 268.w,
            height: 268.w,
            child: Stack(
              children: [
                Focus141LocalImagesWidget(focus141ImagesName: "icon_guang", focus141Width: double.infinity, focus141Height: double.infinity),
                Align(
                  child: Focus141LocalImagesWidget(focus141ImagesName: "icon_money2", focus141Width: 198.w, focus141Height: 116.h),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 60.h),
                    child: Focus141TextWidget(
                      focus141TextContent: "\$${focus141Con.newUserAdd}",
                      focus141TextSize: 48.sp,
                      focus141TextColor: Focus141Colors.color9EF356,
                      focus141LineColor: Focus141Colors.color055305,
                      focus141Height: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  _btnWidget()=>GetBuilder<Focus141NewUserDialogCon>(
    id: "btn",
    builder: (_)=>Visibility(
      visible: focus141Con.newUserDialogShowView==NewUserDialogShowView.result,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickDouble(callback);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Focus141LocalImagesWidget(focus141ImagesName: "new_user4", focus141Width: 198.w, focus141Height: 54.h),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Focus141LocalImagesWidget(focus141ImagesName: "icon_video", focus141Width: 25.w, focus141Height: 25.w),
                    Focus141TextWidget(
                      focus141TextContent: "Double Claim",
                      focus141TextSize: 22.sp,
                      focus141TextColor: Focus141Colors.colorFFFFFF,
                      focus141LineColor: Focus141Colors.color0F8418,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Focus141ClickWidget(
            focus141OnTap: (){
              focus141Con.clickSingle(callback);
            },
            child: Focus141TextWidget(
              focus141TextContent: "Claim",
              focus141TextSize: 22.sp,
              focus141Height: 1.0,
              focus141TextColor: Focus141Colors.colorCBCBCB,
              focus141Decoration: TextDecoration.underline,
              focus141DecorationColor: Focus141Colors.colorCBCBCB,
            ),
          ),
        ],
      ),
    ),
  );

  _titleWidget()=>Container(
    margin: EdgeInsets.only(left: 10.w,right: 10.w),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "new_user2", focus141Width: double.infinity, focus141Height: 45.h),
        Focus141TextWidget(
          focus141TextContent: "Win new player bonus",
          focus141TextSize: 32.sp,
          focus141TextColor: Focus141Colors.color20C5E3,
          focus141Height: 1.0,
          focus141LineColor: Focus141Colors.colorFFFFFF,
        ),
      ],
    ),
  );
}