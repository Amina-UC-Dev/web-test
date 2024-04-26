import 'package:flutter/cupertino.dart';

class DashboardProfiles {
  String logo;
  String name;
  String location;
  String date;

  DashboardProfiles({
    required this.logo,
    required this.name,
    required this.location,
    required this.date,
  });
}


class DashboardChartActiveUsers {
  String name;
  num counter;
  Color pointColor;

  DashboardChartActiveUsers({
    required this.name,
    required this.counter,
    required this.pointColor,
  });
}


class DashboarChartCampaignReport {
  num xId;
  num clicks;
  num usersignup;
  num companysignup;
  num appdownloads;

  DashboarChartCampaignReport({
    required this.xId,
    required this.clicks,
    required this.usersignup,
    required this.companysignup,
    required this.appdownloads,
  });
}