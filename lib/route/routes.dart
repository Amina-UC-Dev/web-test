import 'package:beonchat_admin/screen/onboarding/login/login_responsive.dart';
import 'package:beonchat_admin/screen/onboarding/splash/splash_responsive.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes() {
  return {
    SplashResponsive.routeName: (ctx) => const SplashResponsive(),
    LoginResponsive.routeName: (ctx) => const LoginResponsive(),
  };
}
