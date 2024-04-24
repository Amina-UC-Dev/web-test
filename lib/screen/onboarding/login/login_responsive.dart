import 'package:beonchat_admin/screen/onboarding/login/login.dart';
import 'package:beonchat_admin/widget/responsive/my_responsive.dart';
import 'package:flutter/material.dart';

class LoginResponsive extends StatelessWidget {
  const LoginResponsive({Key? key}) : super(key: key);

  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return MyResponsive(builder: (BuildContext context2, _, screenMT) {
      return Login(
        type: screenMT.isMobile
            ? 1
            : screenMT.isTablet
                ? 2
                : 3,
      );
    });
  }
}
