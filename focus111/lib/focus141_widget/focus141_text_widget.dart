import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:outlined_text/outlined_text.dart';

class Focus141TextWidget extends StatelessWidget{
  String focus141TextContent;
  double focus141TextSize;
  Color focus141TextColor;
  Color? focus141LineColor;
  FontWeight? focus141FontWeight;
  double? focus141Height;
  TextAlign? focus141TextAlign;
  TextDecoration? focus141Decoration;
  Color? focus141DecorationColor;

  Focus141TextWidget({
    required this.focus141TextContent,
    required this.focus141TextSize,
    required this.focus141TextColor,
    this.focus141LineColor,
    this.focus141FontWeight,
    this.focus141Height,
    this.focus141TextAlign,
    this.focus141Decoration,
    this.focus141DecorationColor,
});

  @override
  Widget build(BuildContext context) => OutlinedText(
    text: Text(
      focus141TextContent,
      style: TextStyle(
        fontSize: focus141TextSize,
        color: focus141TextColor,
        height: focus141Height??0,
        fontWeight: focus141FontWeight,
        fontFamily: "woff",
        decoration: focus141Decoration,
        decorationColor: focus141DecorationColor,
      ),
      textAlign: focus141TextAlign,
    ),
    strokes: focus141LineColor==null?
    []:
    [
      OutlinedTextStroke(
        color: focus141LineColor!,
        width: 2.w,
      ),
    ],
  );
}