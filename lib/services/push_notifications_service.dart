// SHA1: 3F:9C:6D:97:8C:59:FB:D3:76:54:69:76:ED:A0:34:23:D5:D6:54:7D

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class PushNotificationService {

  // Obtiene la instancia a firebase
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;

  static Future initializeApp() async{

    // Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('token = $token');

    //Local Noticications 
      

  }



}