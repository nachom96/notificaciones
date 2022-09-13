// SHA1: 3F:9C:6D:97:8C:59:FB:D3:76:54:69:76:ED:A0:34:23:D5:D6:54:7D

import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

class PushNotificationService {

  // Obtiene la instancia a firebase
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler ( RemoteMessage message ) async{
    // print('onBackground Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.body ?? 'No title');
  }

  static Future _onMessageHandler ( RemoteMessage message ) async{
    // print('onMessage Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.body ?? 'No title');
  }

  static Future _onMessageOpenApp ( RemoteMessage message ) async{
    // print('onMessageOpenApp Handler ${message.messageId}');
    print(message.data);
    _messageStream.add(message.notification?.body ?? 'No title');
  }

  static Future initializeApp() async{

    // Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print('token = $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage( _backgroundHandler );
    FirebaseMessaging.onMessage.listen( _onMessageHandler );
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp );

    //Local Noticications      
  }

  static closeStreams(){
    _messageStream.close();
  }



}
