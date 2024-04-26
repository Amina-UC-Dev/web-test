import 'package:beonchat_admin/service/API/api_urls.dart';
import 'package:beonchat_admin/widget/loader/loader_widget.dart';
import 'package:beonchat_admin/widget/toast/toast_widget.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final FocusNode passwordFocus = FocusNode();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  reset(bool update) async {
    email.text = "";
    password.text = "";
    notifyListeners();
  }

  login(
      {required BuildContext context,
        required int type,
        required String passwordText,
        required String emailText,
       }) async {
    // Loader().showAlertLoader(context: context, type: type);
    // String deviceToken =
    //     (await CacheDataStorage().getValue(key: "device_token")) ?? "token";
    // String apiToken =
    //    "030723553bff7";
    // String url = "${ApiUrls().baseUrl}beonchat/admin/login";
    // Map<String, String> header = {
    //   "Content-Type": "application/json",
    // };
    //
    // Map<String, dynamic> body = {
    //   "api_token": apiToken,
    //   "email_id": emailText,
    //   "password": passwordText,
    //   "device_fcm_token": deviceToken,
    // };
    // var response =
    // await apiService.postApi(url: url, header: header, body: body);
    // Navigator.pop(context);
    // if (response != null) {
    //   if (response["success"] == "1") {
        // loginModel = LoginModel.fromJson(response);
        // DeviceDetails deviceDetails =
        // loginModel!.result!.loginResponse!.deviceDetails!;
        // MasterAccountDetails masterAccountDetails =
        // loginModel!.result!.loginResponse!.masterAccountDetails!;
        // AccountVerifiDetails accountVerificationDetails =
        // loginModel!.result!.loginResponse!.accountVerificationDetails!;
        // switch (accountVerificationDetails.status!) {
        //   case "0":
        //     CacheDataStorage().setValue(key: "login_status", value: "1");
        //     if (mailType) {
        //       CacheDataStorage().setValue(key: "email_user", value: emailText);
        //       CacheDataStorage()
        //           .setValue(key: "email_password", value: passwordText);
        //     } else {
        //       CacheDataStorage()
        //           .setValue(key: "mobile_user", value: mobileText);
        //       CacheDataStorage().setValue(
        //           key: "mobile_user_country", value: countryCodeValue);
        //       CacheDataStorage().setValue(
        //           key: "mobile_user_country_id",
        //           value: mailType ? "" : countryCodeIdValue);
        //       CacheDataStorage()
        //           .setValue(key: "mobile_password", value: passwordText);
        //     }
        //     CacheDataStorage()
        //         .setValue(key: "app_id", value: deviceDetails.appId!);
        //     CacheDataStorage()
        //         .setValue(key: "api_token", value: deviceDetails.apiToken!);
        //     CacheDataStorage().setValue(key: "bottom_index", value: "0");
        //     CacheDataStorage()
        //         .setValue(key: "account_id", value: deviceDetails.accountId!);
        //     CacheDataStorage()
        //         .setValue(key: "active_id", value: deviceDetails.accountId!);
        //     CacheDataStorage()
        //         .setValue(key: "master_id", value: deviceDetails.accountId!);
        //     // CacheDataStorage().setValue(
        //     //     key: "master_account_type", value:  masterAccountDetails.accountType!);
        //     CacheDataStorage().setValue(
        //         key: "account_type", value: masterAccountDetails.accountType!);
        //     CacheDataStorage()
        //         .setValue(key: "name", value: masterAccountDetails.name!);
        //     CacheDataStorage()
        //         .setValue(key: "logo", value: masterAccountDetails.logo!);
        //     CacheDataStorage().setValue(
        //         key: "category_name",
        //         value: masterAccountDetails.categoryName!);
        //     // CacheDataStorage()
        //     //     .setValue(key: "master", value: masterAccountDetails.master!);
        //     // CacheDataStorage()
        //     //     .setValue(key: "flag", value: masterAccountDetails.flag!);
        //     // CacheDataStorage().setValue(
        //     //     key: "group_id", value: masterAccountDetails.groupId!);
        //     // CacheDataStorage().setValue(key: "account_list_status", value: "1");
        //     CacheDataStorage().setValue(key: "launch_init", value: "1");
        //     if (companyCreation) {
        //       Provider.of<CreateCompanyProvider>(context, listen: false)
        //           .checkCreateCompanyRequestStatusApi(
        //           context: context,
        //           type: type,
        //           signUpFlow: true,
        //           entryScreen: LoginResponsive.routeName);
        //     } else {
        //       Navigator.pushNamedAndRemoveUntil(
        //           context, MainResponsive.routeName, (route) => false);
        //     }
        //     break;
        //   case "1":
        //     if (companyCreation) {
        //       loginAlertPopup(context, type);
        //     } else {}
        //
        //     break;
        //   case "2":
        //     if (companyCreation) {
        //       loginAlertPopup(context, type);
        //     } else {
        //       Provider.of<PersonalSignupProvider>(context, listen: false)
        //           .updateScreen(
        //           screen: "login_company_refer",
        //           refCompanyId: response["result"]["login_response"]
        //           ["account_verifi_details"]["comp_result"]
        //           ["company_id"],
        //           refUsername: mailType ? emailText : mobileText,
        //           refCode: countryCodeValue,
        //           refCodeId: countryCodeIdValue,
        //           loginType: mailTypeValue ? 0 : 1);
        //       Navigator.pushNamed(
        //           context, ThirdPartTypeSelectionResponsive.routeName);
        //     }
        //     break;
        // }
    //   } else {
    //     ShowToast().toast(
    //         message: "#${response["errorCode"]} ${response["errorMessage"]}");
    //   }
    // } else {
    //   ShowToast().toast(message: "something_went_wrong");
    // }
  }
}
