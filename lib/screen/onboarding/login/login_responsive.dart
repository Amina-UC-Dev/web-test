import 'dart:async';

import 'package:beonchat_admin/provider/onboarding/login_provider.dart';
import 'package:beonchat_admin/screen/onboarding/login/login.dart';
import 'package:beonchat_admin/widget/responsive/my_responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginResponsive extends StatefulWidget {
  const LoginResponsive({Key? key}) : super(key: key);

  static String routeName = "/login";

  @override
  State<LoginResponsive> createState() => _LoginResponsiveState();

}

class _LoginResponsiveState extends State<LoginResponsive> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callB();

  }

  callB() async {
    Timer(const Duration(milliseconds: 50), () {
      Provider.of<LoginProvider>(context, listen: false).reset();
    });
  }
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
