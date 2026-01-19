import 'dart:async';

import 'package:event_bus/event_bus.dart';

class Focus141EventUtils {
  static final Focus141EventUtils _focus141eventUtils=Focus141EventUtils();
  static Focus141EventUtils get instance => _focus141eventUtils;

  final EventBus _focus141EventBus=EventBus();

  sendMsg({
    required int focus141Code,
    int? focus141Int,
    String? focus141Str,
    dynamic focus141Dynamic,
}){
    _focus141EventBus.fire({
      "focus141Code":focus141Code,
      "focus141Int":focus141Int,
      "focus141Str":focus141Str,
      "focus141Dynamic":focus141Dynamic,
    });
  }


  StreamSubscription<Map> listen(focus141HandleEventMsg) =>_focus141EventBus.on<Map>().listen((data) {
    focus141HandleEventMsg(data["focus141Code"],data["focus141Int"],data["focus141Str"],data["focus141Dynamic"],);
  });
}