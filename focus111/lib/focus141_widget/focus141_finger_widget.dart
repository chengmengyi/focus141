import 'package:flutter/material.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_spine_widget.dart';

class Focus141FingerWidget extends StatelessWidget{
  double focus141Width;
  double focus141Height;
  Focus141FingerWidget({
    required this.focus141Width,
    required this.focus141Height,
});

  @override
  Widget build(BuildContext context) => Lottie.asset(
    "assets/focus141_lottie/finger.json",
    width: focus141Width,
    height: focus141Height,
  );
  //     SizedBox(
  //   width: focus141Width,
  //   height: focus141Height,
  //   child: Focus141SpineWidget(
  //     focus141Atlas: "skeleton",
  //     focus141Json: "skeleton",
  //     focus141AnimatorName: "animation",
  //     focus141Folder: "CD5",
  //   ),
  // );
}