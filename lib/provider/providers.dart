import 'package:beonchat_admin/provider/app_theme/app_theme_provider.dart';
import 'package:beonchat_admin/provider/dashboard/dashboard_provider.dart';
import 'package:beonchat_admin/provider/main/main_provider.dart';
import 'package:beonchat_admin/provider/onboarding/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers() {
  return [
    ChangeNotifierProvider.value(value: AppThemeProvider()),
    ChangeNotifierProvider.value(value: LoginProvider()),
    ChangeNotifierProvider.value(value: MainProvider()),
    ChangeNotifierProvider.value(value: DashBoardProvider()),
  ];
}
