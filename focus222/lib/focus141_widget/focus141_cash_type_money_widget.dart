import 'package:flutter/material.dart';
import 'package:focus111/focus141_enum/focus141_cash_type_enum.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_utils/focus141_utils.dart';

class Focus141CashTypeMoneyWidget extends StatelessWidget{
  Focus141CashTypeEnum typeEnum;
  int money;
  double width;
  double height;

  Focus141CashTypeMoneyWidget({
    required this.typeEnum,
    required this.money,
    required this.width,
    required this.height,
});
  @override
  Widget build(BuildContext context) => Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Focus141LocalImagesWidget(focus141ImagesName: getCashTypeMoneyBgImage(typeEnum), focus141Width: width, focus141Height: height),
      Focus141TextWidget(focus141TextContent: "\$$money", focus141TextSize: 32.sp, focus141TextColor: Focus141Colors.color5AA11D),
    ],
  );
}