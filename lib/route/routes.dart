import 'package:beonchat_admin/screen/dashboard/dashboard_responsive.dart';
import 'package:beonchat_admin/screen/news_feeds/news_feeds_articles/news_feeds_articles_responsive.dart';
import 'package:beonchat_admin/screen/onboarding/login/login_responsive.dart';
import 'package:beonchat_admin/screen/onboarding/splash/splash_responsive.dart';
import 'package:beonchat_admin/screen/reports/user_registration_report/user_registration_report_responsive.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes() {
  return {
    SplashResponsive.routeName: (ctx) => const SplashResponsive(),
    LoginResponsive.routeName: (ctx) => const LoginResponsive(),
    DashBoardResponsive.routeName: (ctx) => const DashBoardResponsive(),
    UserRegistrationReportResponsive.routeName: (ctx) => const UserRegistrationReportResponsive(),
    NewsFeedsArticlesResponsive.routeName: (ctx) => const NewsFeedsArticlesResponsive(),
  };
}
