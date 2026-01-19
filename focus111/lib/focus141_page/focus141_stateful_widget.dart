import 'dart:async';

import 'package:flutter/material.dart';
import 'package:focus111/focus141_event/focus141_event_utils.dart';

abstract class Focus141StatefulWidget extends StatefulWidget{
  const Focus141StatefulWidget({Key? key}) : super(key: key);
}

abstract class Focus141StatefulState<T extends Focus141StatefulWidget> extends State<T>{
  StreamSubscription<Map>? _streamSubscription;

  @override
  void initState() {
    super.initState();
    if(focus141InitEvent()){
      _streamSubscription=Focus141EventUtils.instance.listen(focus141HandleEventMsg);
    }
  }

  bool focus141InitEvent()=>false;

  focus141HandleEventMsg(int eventCode,int? intValue,String? strValue,dynamic anyValue){

  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _streamSubscription=null;
    super.dispose();
  }
}