import 'dart:math';

import 'package:beonchat_admin/model/reports/user_registration_all_model.dart';
import 'package:flutter/material.dart';

class UserRegistrationReportProvider extends ChangeNotifier {
  String selectdOpitonValue = "select here";
  List<UserRegistrationReportModel> userRegistrationReportModel = [];

  List listOption = [
    {"id": "1", "name": "name here 1"},
    {"id": "2", "name": "name here 2"},
    {"id": "3", "name": "name here 3"},
    {"id": "4", "name": "name here 4"}
  ];

  /*List<UserRegistrationReportModel> userRegistrationReportModel = [
    UserRegistrationReportModel(xId: 1, user: 100, team: 236, company: 50),
    UserRegistrationReportModel(xId: 2, user: 350, team: 242, company: 10),
    UserRegistrationReportModel(xId: 3, user: 130, team: 313, company: 56),
    UserRegistrationReportModel(xId: 4, user: 200, team: 359, company: 80),
    UserRegistrationReportModel(xId: 5, user: 190, team: 272, company: 43)
  ];*/

  gettingList() {
    List<UserRegistrationReportModel> list = [];

    for (int day = 0; day < 31; day++) {
      list.add(UserRegistrationReportModel(xId: day, user: Random().nextInt(300), team: Random().nextInt(300), company: Random().nextInt(300)));
    }
    userRegistrationReportModel.addAll(list);
    notifyListeners();
  }

  onChangeLabelType(dynamic value) {
    selectdOpitonValue = value["name"];
    print(value);
    notifyListeners();
  }
}
