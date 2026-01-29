import 'dart:convert';
import 'dart:io';

import 'package:flutter_android_ad_plugins/data/ad_info_data.dart';
import 'package:flutter_android_ad_plugins/data/ad_money_info_bean.dart';
import 'package:flutter_android_ad_plugins/hep/hep.dart';
import 'package:flutter_check_adjust/dio/dio_hep.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:focus111/focus141_sql/focus141_sql_table_name.dart';
import 'package:focus111/focus141_sql/focus141_sql_utils.dart';
import 'package:focus111/focus141_utils/focus141_ad_enum.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_local_quiz.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';

class Focus141TbaUtils {
  static final Focus141TbaUtils _focus141tbaUtils=Focus141TbaUtils();
  static Focus141TbaUtils get instance => _focus141tbaUtils;

  uploadInstall({int tryNum=5})async{
    if(!bUploadInstallEvent.getData()){
      return;
    }
    var logId = await FlutterTbaInfo.instance.getLogId();
    var map = await _getCommonMap(logId);
    map["inflater"]="autumn";
    var referrerMap = await FlutterTbaInfo.instance.getReferrerMap();
    map["splendid"]=referrerMap["build"];
    map["organdy"]=referrerMap["referrer_url"];
    map["vortex"]=referrerMap["install_version"];
    map["gullet"]=referrerMap["user_agent"];
    map["maritime"]="spoonful";
    map["ancient"]=referrerMap["referrer_click_timestamp_seconds"];
    map["ornery"]=referrerMap["install_begin_timestamp_seconds"];
    map["feline"]=referrerMap["referrer_click_timestamp_server_seconds"];
    map["amuse"]=referrerMap["install_begin_timestamp_server_seconds"];
    map["beauty"]=referrerMap["install_first_seconds"];
    map["modify"]=referrerMap["last_update_seconds"];
    "tba--->install--->start--->params--->$map".log();
    var dioResult = await DioHep.instance.requestPost(path: _getUrl(logId), data: map,header: _headMap());
    "tba--->install--->result--->${dioResult.success}---->params--->$map".log();
    if(dioResult.success){
      bUploadInstallEvent.saveData(false);
    }else{
      if(tryNum>0){
        await Future.delayed(Duration(milliseconds: 1000));
        uploadInstall(tryNum: tryNum-1);
      }
    }
  }

  uploadSession({int tryNum=5})async{
    var logId = await FlutterTbaInfo.instance.getLogId();
    var map = await _getCommonMap(logId);
    map["inflater"]="culvert";
    "tba--->session--->start--->params--->$map".log();
    var dioResult = await DioHep.instance.requestPost(path: _getUrl(logId), data: map,header: _headMap());
    "tba--->session--->result--->${dioResult.success}---->params--->$map".log();
    if(!dioResult.success){
      await Future.delayed(Duration(milliseconds: 1000));
      uploadSession(tryNum: tryNum-1);
    }
  }

  uploadAd({
    required AdMoneyInfoBean? ad,
    required Focus141AdEnum focus141AdEnum,
    required AdInfoData? adInfoData,
    int tryNum=5,
  })async{
    var logId = await FlutterTbaInfo.instance.getLogId();
    var map = await _getCommonMap(logId);
    map["sequent"]={
      "exclaim":(ad?.revenue ?? 0) * 1000000,
      "spangle": "USD",
      "admire":ad?.networkName ?? "",
      "anguish":adInfoData?.adPlat ?? "",
      "nimbus":adInfoData?.adId ?? "",
      "faze":focus141AdEnum.name,
      "thud":adInfoData?.adType.name,
      "angle":ad?.revenuePrecision ?? "",
    };
    "tba--->ad--->start--->params--->$map".log();
    var dioResult = await DioHep.instance.requestPost(path: _getUrl(logId), data: map,header: _headMap());
    "tba--->ad--->result--->${dioResult.success}---->params--->$map".log();
    if(!dioResult.success){
      if(tryNum>0){
        await Future.delayed(Duration(milliseconds: 1000));
        uploadAd(ad: ad, focus141AdEnum: focus141AdEnum, adInfoData: adInfoData,tryNum: tryNum-1);
      }else{
        _saveLocalData(map);
      }
    }
  }

  uploadPoint({
    required Focus141PointEnum focus141PointEnum,
    Map<String,dynamic>? params,
    int tryNum=5
  })async{
    var logId = await FlutterTbaInfo.instance.getLogId();
    var map = await _getCommonMap(logId);
    map["inflater"]=focus141PointEnum.name;
    if(null!=params){
      for (var value in params.keys) {
        map["sexton#$value"]=params[value];
      }
    }
    "tba--->point--->start--->params--->$map".log();
    var dioResult = await DioHep.instance.requestPost(path: _getUrl(logId), data: map,header: _headMap());
    "tba--->point--->result--->${dioResult.success}---->params--->$map".log();
    if(!dioResult.success){
      if(tryNum>0){
        await Future.delayed(Duration(milliseconds: 1000));
        uploadPoint(focus141PointEnum: focus141PointEnum,params: params,tryNum: tryNum-1);
      }else{
        _saveLocalData(map);
      }
    }
  }

  Future<Map<String,dynamic>> _getCommonMap(String logId)async => {
    "brew":{
      "wysiwyg": await FlutterTbaInfo.instance.getBundleId(),
      "gargle": await FlutterTbaInfo.instance.getSystemLanguage(),
      "nibelung": await FlutterTbaInfo.instance.getIdfv(),
      "greene": await FlutterTbaInfo.instance.getOsCountry(),
    },
    "phonic":{
      "wiry": Platform.isAndroid?"congener":"sent",
      "fare": await FlutterTbaInfo.instance.getAppVersion(),
      "pin": await FlutterTbaInfo.instance.getDistinctId(),
      "squat": logId,
      "maroon": await FlutterTbaInfo.instance.getManufacturer(),
      "cranky": await FlutterTbaInfo.instance.getOperator(),
    },
    "embower":{
      "skyward": DateTime.now().millisecondsSinceEpoch,
      "prig": await FlutterTbaInfo.instance.getOsVersion(),
      "oman": await FlutterTbaInfo.instance.getNetworkType(),
      "apostasy": await FlutterTbaInfo.instance.getAndroidId(),
    },
    "matilda":{
      "dive": await FlutterTbaInfo.instance.getBrand(),
      "rowe": await FlutterTbaInfo.instance.getDeviceModel(),
      "imperate": await FlutterTbaInfo.instance.getIdfa(),
      "macon": await FlutterTbaInfo.instance.getGaid(),
    },
  };

  Map<String,dynamic> _headMap()=>{
    "skyward": DateTime.now().millisecondsSinceEpoch,
  };

  String _getUrl(String logId)=>"${Focus141LocalQuiz.tbaUrl}?skyward=${DateTime.now().millisecondsSinceEpoch}&squat=$logId";

  uploadLocalData()async{
    var database = await Focus141SqlUtils.instance.initSql();
    var list = await database.query(Focus141SqlTableName.tbaInfo);
    if(list.isEmpty){
      return;
    }
    List<Map<String,dynamic>> resultList=[];
    for (var value in list) {
      var jsonMap = value["content"] as String;
      resultList.add(jsonDecode(jsonMap));
    }
    var logId = await FlutterTbaInfo.instance.getLogId();
    var headMap = _headMap();
    headMap["Content-Encoding"]="gzip";
    "tba--->uploadLocalData--->params--->${resultList.length}".log();
    var dioResult = await DioHep.instance.requestPost(path: _getUrl(logId), data: resultList,header: headMap);
    "tba--->uploadLocalData--->result--->${dioResult.success}".log();
    if(dioResult.success){
      await database.delete(Focus141SqlTableName.tbaInfo);
    }
  }

  _saveLocalData(Map<String,dynamic> map)async{
    var database = await Focus141SqlUtils.instance.initSql();
    await database.insert(Focus141SqlTableName.tbaInfo, {"content":jsonEncode(map)});
    print("kkkkk");
  }
}