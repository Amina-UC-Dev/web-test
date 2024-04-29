import 'package:device_info_plus/device_info_plus.dart';
import 'package:http/http.dart' as http;

class DeviceDetails {
  Future<String> getDeviceName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    String ip = await getIPAddress();
    return "$ip|${webBrowserInfo.platform}|${webBrowserInfo.userAgent}";
  }

  Future<String> getIPAddress() async {
    const url = 'https://api.ipify.org';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }
}