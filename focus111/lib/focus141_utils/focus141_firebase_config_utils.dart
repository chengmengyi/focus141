import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:focus111/focus141_utils/focus141_ad_utils.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_feng_utils.dart';

class Focus141FirebaseConfigUtils{
  static final Focus141FirebaseConfigUtils _configUtils=Focus141FirebaseConfigUtils();
  static Focus141FirebaseConfigUtils get instance => _configUtils;

  Function(String s)? valueConfigCallback;
  int floatDis=10;

  initFirebaseConfig()async{
    // try{
    //   await Firebase.initializeApp();
    //   var remoteConfig=FirebaseRemoteConfig.instance;
    //   await remoteConfig.setConfigSettings(
    //     RemoteConfigSettings(
    //       fetchTimeout: const Duration(seconds: 10),
    //       minimumFetchInterval: const Duration(seconds: 1),
    //     ),
    //   );
    //   await remoteConfig.fetchAndActivate();
    //   _getFirebaseConfig(remoteConfig);
    // }catch(e){
    //   await Future.delayed(const Duration(milliseconds: 1000));
    //   initFirebaseConfig();
    // }
  }

  _getFirebaseConfig(FirebaseRemoteConfig remoteConfig){
    var qland_number = remoteConfig.getString("qland_number");
    if(qland_number.isNotEmpty){
      valueConfigCallback?.call(qland_number);
    }
    var fkskv_ad_config = remoteConfig.getString("fkskv_ad_config");
    if(fkskv_ad_config.isNotEmpty){
      bAdFirebaseConfig.saveData(fkskv_ad_config);
      Focus141AdUtils.instance.updateAdInfo();
    }
    var risk_control = remoteConfig.getString("risk_control");
    if(risk_control.isNotEmpty){
      bFengkongFirebaseConfig.saveData(risk_control);
      Focus141FengUtils.instance.initFeng();
    }
    var float_dis = remoteConfig.getInt("float_dis");
    if(float_dis>0){
      floatDis=float_dis;
    }
  }
}