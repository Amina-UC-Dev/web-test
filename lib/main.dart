import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/theme.dart';
import 'package:beonchat_admin/service/firebase/firebase_options.dart';
import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/provider/providers.dart';
import 'package:beonchat_admin/route/routes.dart';
import 'package:beonchat_admin/screen/onboarding/splash/splash_responsive.dart';
import 'package:beonchat_admin/service/app_translation/app_translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static Map<int, Color> color = const {
    50: Color(0xFFdff3ef),
    100: Color(0xFFb1e0d6),
    200: Color(0xFF7fcdbd),
    300: Color(0xFF4ab9a2),
    400: Color(0xFF1ca98f),
    500: Color(0xFF00997d),
    600: Color(0xFF008c70),
    700: Color(0xFF007c61),
    800: Color(0xFF006c53),
    900: Color(0xFF005038),
  };

  MaterialColor primeColor = MaterialColor(0xFF1CA990, MyApp.color);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeProvider(),
      child: MultiProvider(
        providers: providers(),
        child: Consumer<AppThemeProvider>(builder: (context2, provider, child) {
          return GetMaterialApp(
            builder: (BuildContext context, Widget? child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                ), //set desired text scale factor here
                child: child!,
              );
            },
            title: 'beonchat admin',
            color: Colours().primary,
            debugShowCheckedModeBanner: false,
            translations: AppTranslation(),
            locale: const Locale("en", "US"),
            fallbackLocale: const Locale("en", "US"),
            navigatorKey: Get.key,
            routes: routes(),
            scrollBehavior: const ScrollBehavior().copyWith(
              physics: const ClampingScrollPhysics(),
              platform: TargetPlatform.iOS,
            ),
            initialRoute: SplashResponsive.routeName,
            theme: ThemeDataStyle.themeData(provider.darkTheme, context),
            // theme: ThemeData(
            //   splashColor: Colours().trans,
            //   highlightColor: Colours().trans,
            //   hoverColor: Colours().trans,
            //   brightness: Brightness.dark,
            //   primarySwatch: primeColor,
            //   primaryColor: Colours().primary,
            //   scaffoldBackgroundColor: Colours().bg,
            //   appBarTheme: AppBarTheme(
            //     backgroundColor: Colours().black,
            //     iconTheme: IconThemeData(
            //       color: Colours().white,
            //     ),
            //   ),
            // ),
          );
        }),
      ),
    );
  }
}
