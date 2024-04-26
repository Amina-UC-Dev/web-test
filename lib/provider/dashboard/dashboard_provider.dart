import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/model/dashboard/dashboard_couter_model.dart';
import 'package:beonchat_admin/model/dashboard/dashboard_all_model.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
  List<DashboardProfiles> dashboardProfiles = [
    DashboardProfiles(
        logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFqOoz4MaONKcJ_3Ee9BZuUhT5A7Dt1Aza74ovEds3y80wek50SG6l0-Ia86avAbOqSLk&usqp=CAU",
        name: "renier rumbaoa",
        location: "dubai, dubai, united arab emirates",
        date: "02 jun 2023 - 01:19 pm"),
    DashboardProfiles(
        logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFqOoz4MaONKcJ_3Ee9BZuUhT5A7Dt1Aza74ovEds3y80wek50SG6l0-Ia86avAbOqSLk&usqp=CAU",
        name: "renier rumbaoa",
        location: "dubai, dubai, united arab emirates",
        date: "02 jun 2023 - 01:19 pm"),
    DashboardProfiles(
        logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFqOoz4MaONKcJ_3Ee9BZuUhT5A7Dt1Aza74ovEds3y80wek50SG6l0-Ia86avAbOqSLk&usqp=CAU",
        name: "renier rumbaoa",
        location: "dubai, dubai, united arab emirates",
        date: "02 jun 2023 - 01:19 pm"),
    DashboardProfiles(
        logo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFqOoz4MaONKcJ_3Ee9BZuUhT5A7Dt1Aza74ovEds3y80wek50SG6l0-Ia86avAbOqSLk&usqp=CAU",
        name: "renier rumbaoa",
        location: "dubai, dubai, united arab emirates",
        date: "02 jun 2023 - 01:19 pm")
  ];

  List<DashboardChartActiveUsers> dashboardChartActiveUsers = [
    DashboardChartActiveUsers(name: 'ios', counter: 25, pointColor: const Color.fromRGBO(9, 143, 251, 1)),
    DashboardChartActiveUsers(name: 'android', counter: 38, pointColor: const Color.fromRGBO(0, 227, 150, 1)),
    DashboardChartActiveUsers(name: 'huawei', counter: 34, pointColor: const Color.fromRGBO(254, 176, 25, 1)),
    DashboardChartActiveUsers(name: 'web', counter: 52, pointColor: const Color.fromRGBO(225, 69, 96, 1))
  ];

  List<DashboarChartCampaignReport> dashboarChartCampaignReport = [
    DashboarChartCampaignReport(xId: 1, clicks: 100, usersignup: 236, companysignup: 50, appdownloads: 366),
    DashboarChartCampaignReport(xId: 2, clicks: 350, usersignup: 242, companysignup: 10, appdownloads: 120),
    DashboarChartCampaignReport(xId: 3, clicks: 130, usersignup: 313, companysignup: 56, appdownloads: 156),
    DashboarChartCampaignReport(xId: 4, clicks: 200, usersignup: 359, companysignup: 80, appdownloads: 89),
    DashboarChartCampaignReport(xId: 5, clicks: 190, usersignup: 272, companysignup: 43, appdownloads: 57)
  ];

  List<DashboardCounter> dashCounts = [
    DashboardCounter(
      title: "total user profiles",
      icon: Icons.groups,
      count: "710",
      color: Colours().pink,
    ),
    DashboardCounter(
      title: "total company",
      icon: Icons.home_work_outlined,
      count: "878",
      color: Colours().primary,
    ),
    DashboardCounter(
      title: "total user reg",
      icon: Icons.switch_account_outlined,
      count: "0",
      color: Colours().warning,
    ),
    DashboardCounter(
      title: "total company reg",
      icon: Icons.perm_contact_cal,
      count: "10",
      color: Colours().blue,
    ),
    DashboardCounter(
      title: "pending user profile",
      icon: Icons.groups,
      count: "384",
      color: Colours().red3,
    ),
  ];
}
