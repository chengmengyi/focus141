import 'package:flutter/material.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';

class Focus141AdBtnWidget extends StatelessWidget{
  double reward;
  double width;
  double height;
  Function() onTap;
  Focus141AdBtnWidget({
    required this.reward,
    required this.width,
    required this.height,
    required this.onTap,
});

  @override
  Widget build(BuildContext context) => Focus141ClickWidget(
    focus141OnTap: onTap,
    child: SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Focus141LocalImagesWidget(focus141ImagesName: "btn_bg", focus141Width: width, focus141Height: height),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Focus141LocalImagesWidget(focus141ImagesName: "icon_video", focus141Width: 24.w, focus141Height: 24.w),
              SizedBox(width: 2.w,),
              Focus141TextWidget(
                focus141TextContent: "Claim\$${mulDecimalFocus141(reward, 2)}",
                focus141TextSize: 20.sp,
                focus141FontWeight: FontWeight.bold,
                focus141TextColor: Focus141Colors.colorFFFFFF,
                focus141LineColor: Focus141Colors.color000000,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}