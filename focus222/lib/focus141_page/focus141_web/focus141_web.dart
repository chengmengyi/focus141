import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus222/focus141_page/focus141_web/focus141_web_con.dart';

class Focus141Web extends Focus141Widget<Focus141WebCon>{
  @override
  Focus141WebCon initFocus141Con() => Focus141WebCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.page;

  @override
  Widget initFocus141Widget() => Stack(
    children: [
      Focus141LocalImagesWidget(focus141ImagesName: "wheel_bg", focus141Width: double.infinity, focus141Height: double.infinity,),
      SafeArea(
        child: Column(
          children: [
            _backWidget(),
            SizedBox(height: 10.h,),
            Expanded(child: WebViewWidget(controller: focus141Con.controller)),
          ],
        ),
      ),
    ],
  );

  _backWidget()=>Row(
    children: [
      SizedBox(width: 22.w,),
      Focus141ClickWidget(
        focus141OnTap: (){
          backFocus141();
        },
        child: Focus141LocalImagesWidget(focus141ImagesName: "icon_back", focus141Width: 32.w, focus141Height: 32.w),
      ),
    ],
  );
}