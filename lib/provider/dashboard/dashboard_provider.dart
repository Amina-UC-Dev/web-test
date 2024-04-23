import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/model/dashboard/dashboard_couter_model.dart';
import 'package:flutter/material.dart';

class DashBoardProvider extends ChangeNotifier {
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
