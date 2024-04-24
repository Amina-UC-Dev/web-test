import 'package:beonchat_admin/screen/onboarding/splash/splash.dart';
import 'package:beonchat_admin/widget/responsive/my_responsive.dart';
import 'package:flutter/material.dart';

class SplashResponsive extends StatelessWidget {
  const SplashResponsive({Key? key}) : super(key: key);

  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context2, _, screenMT) {
      return Splash(
        type: screenMT.isMobile
            ? 1
            : screenMT.isTablet
            ? 2
            : 3,
      );
    });
  }
}
