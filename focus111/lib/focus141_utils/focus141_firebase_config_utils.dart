import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class Focus141FirebaseConfigUtils{
  static final Focus141FirebaseConfigUtils _configUtils=Focus141FirebaseConfigUtils();
  static Focus141FirebaseConfigUtils get instance => _configUtils;

  Function(String s)? valueConfigCallback;

  initFirebaseConfig()async{
    try{
      await Firebase.initializeApp();
      var remoteConfig=FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(seconds: 1),
        ),
      );
      await remoteConfig.fetchAndActivate();
      _getFirebaseConfig(remoteConfig);
    }catch(e){
      await Future.delayed(const Duration(milliseconds: 1000));
      initFirebaseConfig();
    }
  }

  _getFirebaseConfig(FirebaseRemoteConfig remoteConfig){
    var qland_number = remoteConfig.getString("qland_number");
    if(qland_number.isNotEmpty){
      valueConfigCallback?.call(qland_number);
    }
  }
}