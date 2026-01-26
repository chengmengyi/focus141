import 'dart:async';

import 'package:flutter/material.dart';
import 'package:focus111/focus141_event/focus141_event_code.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';
import 'package:focus111/focus141_page/focus141_stateful_widget.dart';
import 'package:focus111/focus141_utils/focus141_ad_enum.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_colors.dart';
import 'package:focus111/focus141_utils/focus141_firebase_config_utils.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:focus111/focus141_widget/focus141_click_widget.dart';
import 'package:focus111/focus141_widget/focus141_local_images_widget.dart';
import 'package:focus111/focus141_widget/focus141_text_widget.dart';
import 'package:focus222/focus141_utils/focus141_storage_data.dart';
import 'package:focus222/focus141_utils/focus141_value_utils.dart';

class Focus141BubbleWidget extends Focus141StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Focus141BubbleWidgetState();
}

class _Focus141BubbleWidgetState extends Focus141StatefulState<Focus141BubbleWidget>{
  double addNum=Focus141ValueUtils.instance.getBubbleReward();
  double maxWidthFocus141=375.w,currentXFocus141=0.0;
  double maxHeightFocus141=812.h,currentYFocus141=0.0;
  Timer? _timerFocus141;
  bool rightFocus141=true,downFocus141=true,showBubble=true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimerFocus141();
    });
  }
  
  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (c,bc){
      maxWidthFocus141=bc.maxWidth-64.w;
      maxHeightFocus141=bc.maxHeight-64.h;
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: currentYFocus141,
              left: currentXFocus141,
              child: Visibility(
                visible: showBubble,
                child: Focus141ClickWidget(
                  focus141OnTap: (){
                    _clickBubbleFocus141();
                  },
                  child: SizedBox(
                    width: 110.w,
                    height: 110.w,
                    child: Stack(
                      children: [
                        Focus141LocalImagesWidget(focus141ImagesName: "icon_bubble", focus141Width: 110.w, focus141Height: 110.w),
                        Positioned(
                          top: 16.h,
                          right: 16.w,
                          child: Focus141LocalImagesWidget(focus141ImagesName: "icon_video", focus141Width: 26.w, focus141Height: 26.w),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10.h),
                            child: Focus141TextWidget(
                              focus141TextContent: "+\$$addNum",
                              focus141TextSize: 26.sp,
                              focus141TextColor: Focus141Colors.color9EF356,
                              focus141LineColor: Focus141Colors.color055305,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );

  _startTimerFocus141(){
    _timerFocus141=Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if(rightFocus141){
        currentXFocus141++;
        if(downFocus141){
          currentYFocus141++;
          if(currentYFocus141>=maxHeightFocus141){
            downFocus141=false;
          }
        }else{
          currentYFocus141--;
          if(currentYFocus141<=0){
            downFocus141=true;
          }
        }
        if(currentXFocus141>=maxWidthFocus141){
          rightFocus141=false;
        }
      }else{
        currentXFocus141--;
        if(downFocus141){
          currentYFocus141++;
          if(currentYFocus141>=maxHeightFocus141){
            downFocus141=false;
          }
        }else{
          currentYFocus141--;
          if(currentYFocus141<=0){
            downFocus141=true;
          }
        }
        if(currentXFocus141<=0){
          rightFocus141=true;
        }
      }
      setState(() {});
    });
  }

  _clickBubbleFocus141(){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.float_c);
    setState(() {
      showBubble=false;
    });
    if(bFirstClickBubble.getData()){
      bFirstClickBubble.saveData(false);
      _updateMoney();
      setState(() {
        addNum=Focus141ValueUtils.instance.getBubbleReward();
      });
      _delayShowBubble();
      return;
    }
    Focus141AdUtils.instance.showAdFocus141(
      adType: AdType.reward,
      focus141AdEnum: Focus141AdEnum.fkskv_bubble_rv,
      showAd: Focus141ValueUtils.instance.showAd(AdType.reward),
      result: (give){
        if(give){
          _updateMoney();
        }
        setState(() {
          addNum=Focus141ValueUtils.instance.getBubbleReward();
        });
        _delayShowBubble();
      },
    );
  }

  _updateMoney(){
    Focus141EventUtils.instance.sendMsg(focus141Code: Focus141EventCode.showMoneyReward,focus141Dynamic: addNum);
  }

  _delayShowBubble()async{
    await Future.delayed(Duration(seconds: Focus141FirebaseConfigUtils.instance.floatDis));
    setState(() {
      showBubble=true;
    });
  }

  @override
  bool focus141InitEvent() => true;

  @override
  focus141HandleEventMsg(int eventCode, int? intValue, String? strValue, anyValue) {
    switch(eventCode){
      case Focus141EventCode.updateMoney:
        setState(() {
          addNum=Focus141ValueUtils.instance.getBubbleReward();
        });
        break;
    }
  }

  @override
  void dispose() {
    _timerFocus141?.cancel();
    _timerFocus141=null;
    super.dispose();
  }
}