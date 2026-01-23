import 'package:flutter_risk_control_plugins/call/risk_control_callback.dart';
import 'package:flutter_risk_control_plugins/flutter_risk_control_plugins.dart';
import 'package:flutter_risk_control_plugins/utis/risk_control_tag_enum.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_local_quiz.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';

class Focus141FengUtils{
  static final Focus141FengUtils _focus141fengUtils=Focus141FengUtils();
  static Focus141FengUtils get instance => _focus141fengUtils;

  initFeng()async{
    var data = bFengkongFirebaseConfig.getData();
    if(data.isEmpty){
      data=Focus141LocalQuiz.fengKongLocalStrBase64.base64();
    }
    FlutterRiskControlPlugins.instance.initRiskControl(
      riskConfigStr: data,
      bundleId: await FlutterTbaInfo.instance.getBundleId(),
      ipConfigBean: RiskControlIpConfigBean(
        url: "https://ip-prod.focusquestanswerrightplayfun.com/api/ccat",
        data: {"abird":await FlutterTbaInfo.instance.getAndroidId()},
        resultKey: "bape",
        decryptCode: 37,
      ),
      riskControlCallback: RiskControlCallback(
        setVideoAdMaxShowNum: (int count) {
          FlutterAndroidAdPlugins.instance.setEverydayWatchAdNum(count);
        },
        uploadSessionCustom: (Map<String, int> map) {
          Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.session_custom,params: map);
        },
        uploadRiskChance: (RiskControlTagEnum tag) {
          Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.risk_chance,params: {"risk_from":tag.name});
        },
      ),
    );
  }

  bool hasFeng()=>false;
}