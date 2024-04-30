import 'package:beonchat_admin/service/cache_storage/cache_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseServices {
  getFCMToken() async {
    String? fcmToken = await CachedStorage().getString(key: "fcm_token");
    if (fcmToken == null) {
      try {
        await FirebaseMessaging.instance
            .getToken(
                vapidKey:
                    'BPZOXe8t9c9cq53GAEFDbXhTHg3IV3ZLC5mhVMibuZlc4CVL1LNMCM0-fnvR9gr7gijOw9WtPba6z6LHhzm_zbc')
            .then((
          String? token,
        ) async {
          print("fcm :::: $token");
          await CachedStorage().setString(key: "fcm_token", value: token!);
        });
      } catch (e) {
        print("fcm error :::: ${e.toString()}");
      }
    }
  }
}
