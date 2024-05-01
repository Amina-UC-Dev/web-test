import 'package:beonchat_admin/provider/main/main_provider.dart';
import 'package:beonchat_admin/service/API/api_services.dart';
import 'package:beonchat_admin/service/API/api_urls.dart';
import 'package:beonchat_admin/service/cache_storage/cache_storage.dart';
import 'package:beonchat_admin/service/device_info/device_info.dart';
import 'package:beonchat_admin/widget/toast/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  final loginFormKey = GlobalKey<FormState>();
  final FocusNode passwordFocus = FocusNode();
  bool loginLoader = false;
  TextEditingController email = TextEditingController(text: "shahana@jazenet.com");
  TextEditingController password = TextEditingController(text: "q1w2e3r4");

  reset() async {
    email.text = "";
    password.text = "";
    loginLoader = false;
    notifyListeners();
  }

  loginAPI({
    required BuildContext context,
    required int type,
    required String emailText,
    required String passwordText,
  }) async {
    loginLoader = true;
    notifyListeners();
    // Loader().showTransAlertLoader(context: context, type: type);
    String url = "${ApiUrls().baseUrl}admin/login";
    String apiToken = ApiUrls().apiToken;
    String browserId = await DeviceDetails().getDeviceName();
    String fcmToken =
        (await CachedStorage().getString(key: "fcm_token")) ?? "token";

    Map<String, String> header = {
      "Content-Type": "application/json",
    };

    Map<String, dynamic> body = {
      "api_token": apiToken,
      "email": emailText,
      "password": passwordText,
      "brower_id ": browserId,
      "fcm_token": fcmToken,
    };
    print('body ==> $body');

    var response = await apiService.postApi(url: url, header: header, body: body);
    loginLoader = false;
    notifyListeners();
    // Navigator.pop(context);
    if (response != null) {
      print('login API response $response');
      if (response["success"] == "1") {
        var data = response["result"]["login_details"];
        var profDetail = response["result"]["login_details"]["profile_details"];
        CachedStorage().setString(key: "login_email", value: emailText);
        CachedStorage().setString(key: "login_password", value: passwordText);
        CachedStorage().setString(key: "app_id", value: data["app_id"]);
        CachedStorage().setString(key: "api_token", value: data["api_token"]);
        CachedStorage().setString(key: "admin_id", value: profDetail["admin_id"]);
        CachedStorage().setString(key: "name", value: profDetail["name"]);
        CachedStorage().setString(key: "email", value: profDetail["email"]);
        CachedStorage().setString(key: "admin_type", value: profDetail["admin_type"]);
        CachedStorage().setString(key: "form_status", value: profDetail["form_status"]);

        Provider.of<MainProvider>(context,listen: false).init(context);

      }
    } else {
      ShowToast().toast(message: "something_went_wrong");
    }
  }


  login({required context, required type, required emailText, required passwordText}){
    if (loginFormKey.currentState!.validate() && !loginLoader) {
      loginAPI(context: context, type: type, emailText: emailText, passwordText: passwordText);
    }

  }
}
