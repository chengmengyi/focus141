import 'package:flutter/material.dart';

class Focus141LocalImagesWidget extends StatelessWidget{
  String focus141ImagesName;
  double? focus141Width;
  double? focus141Height;
  BoxFit? boxFit;
  Focus141LocalImagesWidget({
    required this.focus141ImagesName,
    required this.focus141Width,
    required this.focus141Height,
    this.boxFit,
});

  @override
  Widget build(BuildContext context) => Image.asset(
    "assets/focus141_images/$focus141ImagesName.webp",
    width: focus141Width,
    height: focus141Height,
    fit: boxFit??BoxFit.fill,
  );
}