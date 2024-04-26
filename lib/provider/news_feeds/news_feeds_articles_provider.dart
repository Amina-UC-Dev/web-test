import 'package:beonchat_admin/model/news_feeds/news_feeds_articles_all_model.dart';
import 'package:beonchat_admin/screen/news_feeds/news_feeds_articles/widget/news_feeds_articles_widgets.dart';
import 'package:beonchat_admin/widget/util/my_form_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class NewsFeedsArticlesProvider extends ChangeNotifier {
  DateFormat dateFormatter = DateFormat('dd/MM/yyyy');
  DateFormat timeFormatter = DateFormat('jms');

  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  bool themeDarkStatus = true;

  DataTableSource? newsFeedsArticleListData;
  String selectdOpitonValue = "select here";

  List listOption = [
    {"id": "1", "name": "name here 1"},
    {"id": "2", "name": "name here 2"},
    {"id": "3", "name": "name here 3"},
    {"id": "4", "name": "name here 4"}
  ];

  final formKey = GlobalKey<FormState>();

  //MyFormValidator basicValidator = MyFormValidator();

  gettingList(bool darkStatus) {
    List<NewsFeedsArticleListModel> list = [];

    for (int num = 1; num <= 30; num++) {
      list.add(NewsFeedsArticleListModel(
        id: num.toString(),
        typeName: "events",
        categoryName: "climate future",
        sort: "1",
        title: "Ahlam & Assala 2023 Live at Coca-Cola Arena, Dubai",
        description:
            "Get ready for an extraordinary evening of music and enchantment as two iconic Arab music divas, Ahlam and Assala, come together for a spectacular live performance at the prestigious Coca-Cola ",
        adsTitle: "business 4",
        articleDate: "12 Dec 2024 08:00 pm",
        createDate: "10 Oct 2023",
        status: "active",
        action: "",
      ));
    }
    //newsFeedsArticleListModel.addAll(list);
    newsFeedsArticleListData = NewsFeedsArticleDataTableSource(list, darkStatus);
    notifyListeners();
  }

  onChangeLabelType(dynamic value) {
    selectdOpitonValue = value["name"];
    print(value);
    notifyListeners();
  }

  onSubmitBasicForm() {
    if (formKey.currentState!.validate()) {}
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked =
        await showDatePicker(context: context, initialDate: selectedDate ?? DateTime.now(), firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      selectedTime = picked;
      notifyListeners();
    }
  }
}
