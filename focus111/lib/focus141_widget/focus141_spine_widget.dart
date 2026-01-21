import 'package:flutter/material.dart';
import 'package:spine_flutter/spine_flutter.dart';

class Focus141SpineWidget extends StatelessWidget{
  String focus141Atlas;
  String focus141Json;
  String focus141AnimatorName;
  String focus141Folder;
  double? focus141Width;
  double? focus141Height;
  SpineWidgetController? focus141Controller;

  Focus141SpineWidget({
    required this.focus141Atlas,
    required this.focus141Json,
    required this.focus141AnimatorName,
    required this.focus141Folder,
    this.focus141Width,
    this.focus141Height,
    this.focus141Controller,
  });
  @override
  Widget build(BuildContext context) => SizedBox(
    width: focus141Width,
    height: focus141Height,
    child: SpineWidget.fromAsset(
      "assets/focus141_spine/$focus141Folder/$focus141Atlas.atlas",
      "assets/focus141_spine/$focus141Folder/$focus141Json.json",
      focus141Controller??SpineWidgetController(
        onInitialized: (controller) {
          controller.animationState.setAnimationByName(0, focus141AnimatorName, true);
        },
      ),
    ),
  );
}