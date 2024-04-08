// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';
//
// class MyController extends GetxController {
//   changeLanguage(
//       {required String val1,
//       required String val2,
//       required BuildContext context,
//       required String from,
//       required int type}) async {
//     var locate = Locale(val1, val2);
//     CacheDataStorage().setValue(key: "lang", value: val1);
//     CacheDataStorage().setValue(key: 'lang_country', value: val2);
//     await Get.updateLocale(locate);
//     Provider.of<LanguageProvider>(context, listen: false).getLanguage();
//     if (from == SettingsResponsive.routeName ||
//         from == QuickLinksResponsive.routeName) {
//       AlertWidget().show(
//         context: context,
//         msg: "lang_success",
//         type: type,
//         callB: () {
//           Navigator.popUntil(
//             context,
//             ModalRoute.withName(MainResponsive.routeName),
//           );
//
//           if (from == SettingsResponsive.routeName) {
//             Provider.of<CompanyManagementProvider>(context, listen: false)
//                 .updateScreen(MainResponsive.routeName);
//             Provider.of<CompanyManagementProvider>(context, listen: false)
//                 .setAccountList(context: context, callFromManage: true);
//           }
//           Navigator.pushNamed(context, from);
//         },
//       );
//     } else if (from == SplashResponsive.routeName) {
//       Provider.of<LocationServiceProvider>(context, listen: false)
//           .getCurrentLocation(
//               screen: LocationResponsive.routeName, context: context);
//       Provider.of<LocationProvider>(context, listen: false)
//           .updateScreen(LanguageResponsive.routeName, false);
//       Navigator.pushNamed(context, LocationResponsive.routeName);
//     }
//   }
// }
