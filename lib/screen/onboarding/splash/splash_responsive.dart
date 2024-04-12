import 'package:beonchat_admin/const/screen_size.dart';
import 'package:beonchat_admin/screen/onboarding/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SplashResponsive extends StatelessWidget {
  const SplashResponsive({Key? key}) : super(key: key);

  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: w < mobileSize
            ? const Size(375, 812)
            : w < tabSize
                ? const Size(768, 1024)
                : const Size(1920, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return ScreenTypeLayout(
            mobile: const Splash(
              type: 1,
            ),
            tablet: const Splash(
              type: 2,
            ),
            desktop: const Splash(
              type: 3,
            ),
          );
        });
  }
}
