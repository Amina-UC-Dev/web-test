import 'package:get/get.dart';

class AppTranslation extends Translations {
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "home": "home",
          "directory": "directory",
          "notifications": "notifications",
          "settings": "settings",
          "search": "search",
          "menu": "menu",
          "personal": "personal",
        },
        'ar_AE': {
          "home": "بيت",
          "directory": "الدليل",
          "notifications": "إشعارات",
          "settings": "إعدادات",
          "search": "يبحث",
          "menu": "قائمة طعام",
          "personal": "شخصي",
        },
      };
}
