import 'package:beonchat_admin/provider/onboarding/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers() {
  return [
    ChangeNotifierProvider.value(value: LoginProvider()),
  ];
}
