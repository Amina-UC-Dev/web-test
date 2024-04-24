import 'package:beonchat_admin/const/colors.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast {
  toast({required String message}) {
    return Fluttertoast.showToast(
        msg: message.tr,
        backgroundColor: Colours().black,
        textColor: Colours().white,
        gravity: ToastGravity.BOTTOM,
        webBgColor: "linear-gradient(to right, #000000, #000000)",
        webPosition: "right",
        webShowClose: true,
        timeInSecForIosWeb: 2,
        toastLength: Toast.LENGTH_LONG);
  }
}
