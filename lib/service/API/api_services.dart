import 'dart:convert';
import 'dart:io';
import 'package:beonchat_admin/widget/toast/toast_widget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future postApi({
    required String url,
    required Map<String, dynamic> body,
    required Map<String, String> header,
  }) async {
    try {
      final request = await http.post(Uri.parse(url),
          body: json.encode(body), headers: header);
      var response = json.decode(request.body);
      return response;
    } on SocketException {
      print("socket error:");
      ShowToast().toast(message: "connect_network".tr);
    } catch (e) {
      print("api error $e");
      ShowToast().toast(message: e.toString());
      return;
    }
  }

  Future getApi({
    required String url,
    required Map<String, String> header,
  }) async {
    try {
      final request = await http.get(Uri.parse(url), headers: header);
      var response = json.decode(request.body);
      return response;
    } on SocketException {
      ShowToast().toast(message: "connect_network".tr);
    } catch (e) {
      ShowToast().toast(message: e.toString());
      return;
    }
  }

  Future getByteData({
    required String url,
    required Map<String, String> header,
  }) async {
    try {
      final request = await http.get(Uri.parse(url), headers: header);
      return request.bodyBytes;
    } on SocketException {
      ShowToast().toast(message: "connect_network".tr);
    } catch (e) {
      ShowToast().toast(message: e.toString());
      return;
    }
  }
}
