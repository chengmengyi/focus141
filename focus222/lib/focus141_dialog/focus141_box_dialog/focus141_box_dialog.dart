import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_spine_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_dialog/focus141_box_dialog/focus141_box_dialog_controller.dart';
import 'package:focus222/focus141_widget/focus141_ad_btn_widget.dart';

class Focus141BoxDialog extends Focus141Widget<Focus141BoxDialogController>{
  double reward;
  Function() callback;
  Focus141BoxDialog({
    required this.reward,
    required this.callback,
});
  @override
  Focus141BoxDialogController initFocus141Con() => Focus141BoxDialogController();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.dialog;

  @override
  Widget initFocus141Widget() => Stack(
    alignment: Alignment.topCenter,
    children: [
      Focus141LocalImagesWidget(focus141ImagesName: "box_top", focus141Width: double.infinity, focus141Height: 130.h),
      _guangWidget(),
      _btnWidget(),
    ],
  );

  _guangWidget()=>Container(
    width: 356.w,
    height: 356.w,
    margin: EdgeInsets.only(top: 96.h),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        // Focus141LocalImagesWidget(focus141ImagesName: "box_guang", focus141Width: double.infinity, focus141Height: double.infinity,),
        SizedBox(
          width: 356.w,
          height: 356.h,
          child: Focus141SpineWidget(
            focus141Atlas: "zibaoxiangkaiqi",
            focus141Json: "zibaoxiangkaiqi",
            focus141AnimatorName: "open",
            focus141Folder: "CD1",
            focus141Controller: focus141Con.spineWidgetController,
          ),
        ),
        GetBuilder<Focus141BoxDialogController>(
          id: "money",
          builder: (_)=>Visibility(
            visible: focus141Con.showMoney,
            child: Container(
              margin: EdgeInsets.only(top: 185.w),
              child: Focus141TextWidget(
                focus141TextContent: "\$$reward",
                focus141TextSize: 48.sp,
                focus141FontWeight: FontWeight.bold,
                focus141TextColor: Focus141Colors.color9EF356,
                focus141LineColor: Focus141Colors.color055305,
              ),
            ),
          ),
        ),
      ],
    ),
  );

  _btnWidget()=>Container(
    margin: EdgeInsets.only(top: 440.w),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Focus141AdBtnWidget(
          reward: reward,
          width: 230.w,
          height: 50.h,
          onTap: (){
            focus141Con.clickDouble(reward,callback);
          },
        ),
        SizedBox(height: 10.h,),
        Focus141ClickWidget(
          focus141OnTap: (){
            focus141Con.clickSingle(reward,callback);
          },
          child: Focus141TextWidget(focus141TextContent: "+\$$reward", focus141TextSize: 20.sp, focus141TextColor: Focus141Colors.colorA7A7A7,),
        ),
        SizedBox(height: 10.h,),
      ],
    ),
  );
}