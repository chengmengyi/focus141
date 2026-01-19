import 'package:flutter/material.dart';
import 'package:focus111/focus141_page/focus141_widget.dart';
import 'package:focus111/focus141_page/focus141_widget_type.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_page/focus141_home/focus141_home_con.dart';

class Focus141HomePage extends Focus141Widget<Focus141HomeCon>{
  @override
  Focus141HomeCon initFocus141Con() => Focus141HomeCon();

  @override
  Focus141WidgetType initFocus141Type() => Focus141WidgetType.page;

  @override
  Widget initFocus141Widget() => Stack(
    children: [
      Focus141LocalImagesWidget(focus141ImagesName: "home_bg", focus141Width: double.infinity, focus141Height: double.infinity,),
      GetBuilder<Focus141HomeCon>(
        id: "page",
        builder: (_)=>Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: focus141Con.tabIndex,
                children: focus141Con.pageList,
              ),
            ),
            _bottomWidget(),
          ],
        ),
      ),
    ],
  );

  _bottomWidget()=>SizedBox(
    width: double.infinity,
    height: 76.h,
    child: Stack(
      children: [
        Focus141LocalImagesWidget(focus141ImagesName: "home_tab_bg", focus141Width: double.infinity, focus141Height: 76.h),
        Row(
          children: [
            _tabItemWidget(0),
            _tabItemWidget(1),
          ],
        ),
      ],
    ),
  );

  _tabItemWidget(int index){
    var tabBean = focus141Con.tabList[index];
    var selected = focus141Con.tabIndex==index;
    return Expanded(
      child: Focus141ClickWidget(
        focus141OnTap: (){
          focus141Con.clickTab(index);
        },
        child: Stack(
          children: [
            Align(
              child: Visibility(
                visible: selected,
                child: Container(
                  margin: EdgeInsets.only(left: 25.w,right: 25.w),
                  child: Focus141LocalImagesWidget(focus141ImagesName: "home_tab_sel_bg", focus141Width: double.infinity, focus141Height: 62.h,),
                ),
              ),
            ),
            Align(
              alignment: selected?Alignment.topCenter:Alignment.bottomCenter,
              child: Focus141LocalImagesWidget(focus141ImagesName: tabBean.icon, focus141Width: 65.w, focus141Height: 65.h),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: selected?10.h:0),
                child: Focus141TextWidget(
                  focus141TextContent: tabBean.text,
                  focus141TextSize: 24.sp,
                  focus141TextColor: Focus141Colors.colorFFFFFF,
                  focus141LineColor: Focus141Colors.color000000,
                  focus141FontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}