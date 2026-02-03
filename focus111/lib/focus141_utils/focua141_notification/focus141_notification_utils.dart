import 'package:flutter/foundation.dart';
import 'package:focus111/focus141_utils/focua141_notification/focus141_notification_data.dart';
import 'package:focus111/focus141_utils/focus141_common_storage.dart';
import 'package:focus111/focus141_utils/focus141_point_enum.dart';
import 'package:focus111/focus141_utils/focus141_tba_utils.dart';
import 'package:focus111/focus141_utils/focus141_utils.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:focus111/focus141_widget/focus_open_notification_dialog/focus_open_notification_dialog.dart';

class Focus141NotificationUtils{
  static final Focus141NotificationUtils _focus141notificationUtils=Focus141NotificationUtils();
  static Focus141NotificationUtils get instance => _focus141notificationUtils;
  final List<Focus141NotificationData> dataList=[
    Focus141NotificationData(id: 1, title: "Title:Cash Ready!", body: "Your Bingo rewards are counted! Claim your cash before it expires.",duration: Duration(minutes: 30)),
    Focus141NotificationData(id: 2, title: "Verify & Withdraw", body: "Your payout is reserved. Complete a quick task to release your cash.",duration: Duration(minutes: 60)),
    Focus141NotificationData(id: 3, title: "Finish to Cash Out", body: "Only one step left! Play Bingo now to secure your payout.",duration: Duration(minutes: 90)),
    Focus141NotificationData(id: 4, title: "Cash Queue Update", body: "Daily bonus ready 🎁 Open now and feed your piggy bank.",duration: Duration(minutes: 120)),
    Focus141NotificationData(id: 5, title: "Bingo Bonus Waiting", body: "Open the app to collect your reward and boost your withdrawal progress.",duration: Duration(minutes: 150)),
  ];

  var _showOpenNotificationDialog=false;
  AndroidFlutterLocalNotificationsPlugin plugin=AndroidFlutterLocalNotificationsPlugin();


  checkHasNotification()async{
    if(bLastTimeShowNotificationTimer.getData()==getTodayTime()||!_showOpenNotificationDialog){
      return;
    }
    final status = await Permission.notification.status;
    if (!status.isGranted) {
      bLastTimeShowNotificationTimer.saveData(getTodayTime());
      showDialogFocus141(child: FocusOpenNotificationDialog());
    }
  }

  initNotificationFocus141()async{
    var status = await Permission.notification.request();
    if(!status.isGranted){
      _showOpenNotificationDialog=true;
      return;
    }
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.push_status);
    var success = await plugin.initialize(
      AndroidInitializationSettings("logo"),
      onDidReceiveNotificationResponse: (
          NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:
            _click(notificationResponse.payload);
            break;
          case NotificationResponseType.selectedNotificationAction:
            _click(notificationResponse.payload);
            break;
        }
      },
    );
    if(success){
      for (var value in dataList) {
        _showLocalNotification(value);
      }
      _showLockNotification(dataList.random());
      _showMediaNotification(dataList.random());
      showForegroundNotification();
    }
  }

  _showLocalNotification(Focus141NotificationData data)async{
    AndroidNotificationDetails details = AndroidNotificationDetails(
      'focus_channel',
      'focus_channel_name',
      styleInformation: BeautyStyleInformation(
        title: data.title,
        body: data.body,
        image: 'backimage',
        button: 'Claim',
        appIcon: 'logo',
      ),
      priority: Priority.high,
      importance: Importance.high,
      groupKey: "${data.id}",
    );
    await plugin.periodicallyShowWithDuration(
        data.id,
        data.title,
        data.body,
        kDebugMode?Duration(minutes: 1):data.duration,
        notificationDetails: details,
        scheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        payload: "local"
    );
  }

  _showLockNotification(Focus141NotificationData data)async{
    await plugin.showBroadcastNotification(
      70,
      data.title,
      data.body,
      kDebugMode?Duration(seconds: 5):Duration(minutes: 10),
      'android.intent.action.USER_PRESENT',
      AndroidNotificationDetails(
        'focus_channel_lock',
        'focus_channel_name_lock',
        priority: Priority.high,
        importance: Importance.high,
        styleInformation: BeautyStyleInformation(
          title: data.title,
          body: data.body,
          image: 'backimage',
          button: 'Claim',
          appIcon: 'logo',
        ),
        groupKey: "70",
      ),
      'unlock',
    );
  }

  _showMediaNotification(Focus141NotificationData data)async{
    //自定义通知ID
    final int id = 80;
    await plugin.show(
      id,
      data.title,
      data.body,
      notificationDetails: AndroidNotificationDetails(
        'focus_channel_media',
        'focus_channel_name_media',
        styleInformation: MediaStyleInformation(
          //支持网络图片链接
          image: 'backimage',
        ),
      ),
      payload: 'media',
    );
  }

  showForegroundNotification()async{
    //自定义通知ID
    final int id = 90;
    var myMoney = bFocus141Money.getData();
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        'focus_channel_fore',
        'focus_channel_name_fore',
        ongoing: true,
        styleInformation: ForegroundStyleInformation(value: '\$$myMoney')
    );
    await AndroidFlutterLocalNotificationsPlugin().startForegroundService(id, '', '', notificationDetails: androidNotificationDetails, payload: 'foreground');
  }

  uploadShowNumFocus141()async{
    var localNum = await plugin.extractMessageReceivedNum("local");
    if(localNum>0){
      for(var index=0;index<localNum;index++){
        Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.inform_p,params: {"type":"local"});
      }
    }
    var unlockNum = await plugin.extractMessageReceivedNum("unlock");
    if(unlockNum>0){
      for(var index=0;index<unlockNum;index++){
        Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.inform_p,params: {"type":"unlock"});
      }
    }
    var fcmNum = await plugin.extractMessageReceivedNum("fcm");
    if(fcmNum>0){
      for(var index=0;index<fcmNum;index++){
        Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.inform_p,params: {"type":"fcm"});
      }
    }

    var media = await plugin.extractMessageReceivedNum("media");
    if(media>0){
      for(var index=0;index<media;index++){
        Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.inform_p,params: {"type":"media"});
      }
    }
  }

  _click(String? from){
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.inform_c,params: {"type":from});
  }


  checkClickByLaunchApp()async{
    var launchDetails = await plugin.getNotificationAppLaunchDetails();
    Focus141TbaUtils.instance.uploadPoint(focus141PointEnum: Focus141PointEnum.launch_page,params: {"source_from":launchDetails?.didNotificationLaunchApp==true?"push":"icon"});
    if(launchDetails?.didNotificationLaunchApp==true){
      var id = launchDetails?.notificationResponse?.payload;
      _click(id);
    }
  }

  test(){
    // _showForegroundNotification();
    plugin.show(99, "title", "body",notificationDetails: AndroidNotificationDetails(
      'focus_channel_lock111',
      'focus_channel_name_lock1111',
      priority: Priority.high,
      importance: Importance.high,
      styleInformation: BeautyStyleInformation(
        title: "title",
        body: "body",
        image: 'backimage',
        button: 'Go Earn',
        appIcon: 'logo',
      ),
      groupKey: "99",
    ));
  }
}