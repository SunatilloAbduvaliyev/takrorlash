import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

class FirebaseNotificationServices{
  static final _pushNotification = FirebaseMessaging.instance;
  ///Push Notification uchun ruxsat so'raymiz.
  ///va qurilma TOKEN'ni aniqlab olamiz.

  static Future<void> init()async{
    ///requestPermission bizga NotificationSettings qaytaradi bu orqali foydalanuvchi
    ///ruxsat berdimi yoki yo'qligini aniqlab olamiz.
    final notificationSettings = await _pushNotification.requestPermission(
      provisional: true,
    );
    ///ruxsat holati
    debugPrint(notificationSettings.authorizationStatus.toString());
    ///token olishimiz uchun
    final token = await _pushNotification.getToken();
    debugPrint("Token $token");
    ///Orqa fonda xabarni olish uchun
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    ///Dastur vaqtida xaborni olish uchun
    FirebaseMessaging.onMessage.listen((RemoteMessage message){
      debugPrint("Foreground vatida keldi");
      debugPrint("Message data keys: ${message.data.keys}");
      debugPrint("Message data values: ${message.data.values}");
      if(message.notification !=null){
        debugPrint("Assosiy ma'lumot ${message.notification}");
      }
    });
    ///Orqa fonda xabarni ustiga bosib dasturga kirgan vaqtda
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message){
      debugPrint("ORQA FONDAN DASTURGA KIRDIM");
    });
  }
  @pragma('vm:entry-point')
  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage messaging)async{
    await Firebase.initializeApp();
    debugPrint("BackgroundMode: ${messaging.data}");
  }
}