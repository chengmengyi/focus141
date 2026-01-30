import 'package:flutter/material.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_finger_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';

class Focus141BoxGuideWidget extends StatelessWidget{
  Offset offset;
  Function() clickCallback;
  Focus141BoxGuideWidget({
    required this.offset,
    required this.clickCallback,
});

  @override
  Widget build(BuildContext context) => Material(
    type: MaterialType.transparency,
    child: GestureDetector(
      onPanDown: (d){
        clickCallback.call();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.7),
        child: Stack(
          children: [
            Positioned(
              top: offset.dy-(18.w),
              left: offset.dx-(17.w),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Focus141LocalImagesWidget(
                    focus141ImagesName: "box_bg",
                    focus141Width: 64.w,
                    focus141Height: 64.w,
                  ),
                  Focus141LocalImagesWidget(
                    focus141ImagesName: "box_sel",
                    focus141Width: 30.w,
                    focus141Height: 24.w,
                  ),
                ],
              ),
            ),
            Positioned(
              top: offset.dy+(18.w),
              left: offset.dx+(17.w),
              child: Focus141FingerWidget(focus141Width: 100.w, focus141Height: 100.w),
            )
          ],
        ),
      ),
    ),
  );
}