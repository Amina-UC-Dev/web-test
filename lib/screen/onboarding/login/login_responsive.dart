import 'package:beonchat_admin/screen/onboarding/login/login.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginResponsive extends StatelessWidget {
  const LoginResponsive({Key? key}) : super(key: key);

  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:  const Login(
        type: 1,
      ),
      tablet:  const Login(
        type: 2,
      ),
      desktop:  const Login(
        type: 3,
      ),
    );
  }
}
