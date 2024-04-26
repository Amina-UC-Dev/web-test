import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/model/news_feeds/news_feeds_articles_all_model.dart';
import 'package:beonchat_admin/provider/news_feeds/news_feeds_articles_provider.dart';
import 'package:beonchat_admin/widget/dialog/alert.dart';
import 'package:beonchat_admin/widget/dialog/dialog.dart';
import 'package:beonchat_admin/widget/responsive/my_flex.dart';
import 'package:beonchat_admin/widget/responsive/my_flex_item.dart';
import 'package:beonchat_admin/widget/table/table.dart';
import 'package:beonchat_admin/widget/util/my_button.dart';
import 'package:beonchat_admin/widget/util/my_card.dart';
import 'package:beonchat_admin/widget/util/my_container.dart';
import 'package:beonchat_admin/widget/util/my_shadow.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

class NewsFeedsArticlesListWidget extends StatelessWidget {
  const NewsFeedsArticlesListWidget({super.key, required this.dark, required this.type});

  final bool dark;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsFeedsArticlesProvider>(builder: (_, newsFeedsPro, __) {
      return MyCard(
        shadow: MyShadow(elevation: 0.5),
        paddingAll: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 5),
              child: MyFlex(
                runAlignment: WrapAlignment.start,
                wrapAlignment: WrapAlignment.start,
                wrapCrossAlignment: WrapCrossAlignment.center,
                contentPadding: false,
                spacing: 0,
                runSpacing: 0,
                children: [
                  MyFlexItem(
                    sizes: "md-8 lg-6",
                    child: Text(
                      'Articles',
                      style: Styles().text(
                        textType: MyTextType.titleMedium,
                        color: Colours().appBarOnBgColor(dark),
                        fontW: FontWeight.w600,
                        size: 15,
                      ),
                    ),
                  ),
                  MyFlexItem(
                    sizes: "md-4 lg-6",
                    child: Wrap(
                      runAlignment: WrapAlignment.start,
                      alignment: WrapAlignment.end,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 5,
                      runSpacing: 0,
                      children: [
                        MyButton(
                          onPressed: () {
                            AlertWidget().show(
                              context: context,
                              dark: dark,
                              title: "alert title",
                              message:
                                  " this is message content this is message content this is message content this is message content this is message content this is message content",
                            );
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: Colours().warning,
                          borderRadiusAll: 6,
                          child: Text("alert",
                              style: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().white,
                                fontW: FontWeight.w400,
                                size: 13,
                              )),
                        ),
                        MyButton(
                          onPressed: () {
                            ConfirmWidget().show(
                              context: context,
                              dark: dark,
                              title: "confirm  title",
                              message: "are you sure you want to delete?",
                              buttonTextFalse: "cancel",
                              buttonTextTrue: "confirm",
                              funcTrue: () {
                                Navigator.pop(context);
                              },
                            );
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: Colours().danger,
                          borderRadiusAll: 6,
                          child: Text("confirm",
                              style: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().white,
                                fontW: FontWeight.w400,
                                size: 13,
                              )),
                        ),
                        MyButton(
                          onPressed: () {
                            DialogWidget().show(
                                context: context,
                                dark: dark,
                                title: "Form Title",
                                content: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("asasdasdasd"),
                                  ],
                                ));
                          },
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: Colours().info,
                          borderRadiusAll: 6,
                          child: Text("form",
                              style: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().white,
                                fontW: FontWeight.w400,
                                size: 13,
                              )),
                        ),
                        MyButton(
                          onPressed: () {},
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: Colours().blue,
                          borderRadiusAll: 6,
                          child: Text("send notify",
                              style: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().white,
                                fontW: FontWeight.w400,
                                size: 13,
                              )),
                        ),
                        MyButton(
                          onPressed: () {},
                          elevation: 0,
                          padding: MySpacing.xy(20, 16),
                          backgroundColor: Colours().success,
                          borderRadiusAll: 6,
                          child: Text("add article",
                              style: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().white,
                                fontW: FontWeight.w400,
                                size: 13,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            MySpacing.height(12),
            NewsFeedsArticlesFilterWidget(dark: dark),

            /*Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("first name",
                    style: Styles().text(
                      textType: MyTextType.labelMedium,
                      color: Colours().appBarOnBgColor(dark),
                      fontW: FontWeight.w400,
                      size: 13,
                    )),
                MySpacing.height(8),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "First Name",
                      hintStyle: Styles().text(
                        textType: MyTextType.bodySmall,
                        color: Colours().appBarOnBgColor(dark),
                        fontW: FontWeight.w400,
                        size: 13,
                      ),
                      border: outlineInputBorder(dark),
                      enabledBorder: outlineInputBorder(dark),
                      focusedBorder: focusedInputBorder,
                      contentPadding: MySpacing.all(16),
                      isCollapsed: true,
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                ),
              ],
            ),*/

            // DATA TABLE
            MySpacing.height(12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: newsFeedsPro.newsFeedsArticleListData != null
                  ? NewsFeedsArticlesDataTableWidget(
                      dark: dark,
                      type: type,
                    )
                  : Container(),
            ),
            MySpacing.height(40),
          ],
        ),
      );
    });
  }
}

class NewsFeedsArticlesFilterWidget extends StatelessWidget {
  const NewsFeedsArticlesFilterWidget({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsFeedsArticlesProvider>(builder: (_, newsFeedsPro, __) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: MyFlex(
          runAlignment: WrapAlignment.start,
          wrapAlignment: WrapAlignment.start,
          wrapCrossAlignment: WrapCrossAlignment.end,
          contentPadding: false,
          spacing: 5,
          runSpacing: 10,
          children: [
            for (int num = 1; num < 5; num++)
              MyFlexItem(
                  sizes: "md-4 lg-2",
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "label here",
                        style: Styles().text(
                          textType: MyTextType.titleMedium,
                          color: Colours().blue,
                          fontW: FontWeight.w400,
                          size: 10,
                        ),
                      ),
                      MySpacing.height(5),
                      PopupMenuButton(
                          onSelected: newsFeedsPro.onChangeLabelType,
                          itemBuilder: (BuildContext context) {
                            return newsFeedsPro.listOption.map((option) {
                              return PopupMenuItem(
                                  value: option,
                                  height: 32,
                                  child: Text(option["name"],
                                      maxLines: 1,
                                      style: Styles().text(
                                        textType: MyTextType.bodySmall,
                                        color: Colours().appBarOnBgColor(dark),
                                        fontW: FontWeight.w400,
                                        size: 13,
                                      )));
                            }).toList();
                          },
                          color: Colours().cardColor(dark),
                          child: MyContainer.bordered(
                            padding: MySpacing.xy(12, 8),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(newsFeedsPro.selectdOpitonValue,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles().text(
                                        textType: MyTextType.labelMedium,
                                        color: Colours().appBarOnBgColor(dark),
                                        fontW: FontWeight.w400,
                                        size: 13,
                                      )),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 4),
                                  child: Icon(LucideIcons.chevronDown, size: 22, color: Colours().appBarOnBgColor(dark)),
                                )
                              ],
                            ),
                          )),
                    ],
                  )),
            MyFlexItem(
              sizes: "md-4 lg-2",
              child: Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.end,
                spacing: 5,
                runSpacing: 0,
                children: [
                  MyButton(
                    onPressed: () {},
                    elevation: 0,
                    padding: MySpacing.xy(20, 16),
                    backgroundColor: Colours().info,
                    borderRadiusAll: 6,
                    child: Text("reset",
                        style: Styles().text(
                          textType: MyTextType.bodySmall,
                          color: Colours().white,
                          fontW: FontWeight.w400,
                          size: 13,
                        )),
                  ),
                  MyButton(
                    onPressed: () {},
                    elevation: 0,
                    padding: MySpacing.xy(20, 16),
                    backgroundColor: Colours().blue,
                    borderRadiusAll: 6,
                    child: Text("filter",
                        style: Styles().text(
                          textType: MyTextType.bodySmall,
                          color: Colours().white,
                          fontW: FontWeight.w400,
                          size: 13,
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class NewsFeedsArticlesDataTableWidget extends StatelessWidget {
  const NewsFeedsArticlesDataTableWidget({super.key, required this.dark, required this.type});

  final bool dark;
  final int type;

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsFeedsArticlesProvider>(builder: (_, newsFeedsPro, __) {
      return PaginatedDataTable(
        //arrowHeadColor: Colours().grey2,
        source: newsFeedsPro.newsFeedsArticleListData!,
        columns: [
          DataColumn(label: TableRowHead(label: "id", dark: dark)),
          DataColumn(label: TableRowHead(label: "type", dark: dark)),
          DataColumn(label: TableRowHead(label: "category", dark: dark)),
          DataColumn(label: TableRowHead(label: "sort", dark: dark)),
          DataColumn(label: TableRowHead(label: "title", dark: dark)),
          DataColumn(label: TableRowHead(label: "description", dark: dark)),
          DataColumn(label: TableRowHead(label: "ads title", dark: dark)),
          DataColumn(label: TableRowHead(label: "article date", dark: dark)),
          DataColumn(label: TableRowHead(label: "date created", dark: dark)),
          DataColumn(label: TableRowHead(label: "action", dark: dark)),
          DataColumn(label: TableRowHead(label: "action", dark: dark)),
        ],
        columnSpacing: 25,
        horizontalMargin: 28,
        //dataRowHeight: 50,
        rowsPerPage: 12,
        //availableRowsPerPage: const <int> [ 5, 5* 2, 5*5,  5 * 10],
      );
    });
  }
}

// const <int>[defaultRowsPerPage, defaultRowsPerPage * 2, defaultRowsPerPage * 5, defaultRowsPerPage * 10],

class NewsFeedsArticleDataTableSource extends DataTableSource {
  List<NewsFeedsArticleListModel> data = [];
  bool dark;

  NewsFeedsArticleDataTableSource(this.data, this.dark);

  bool get isRowCountApproximate => false;

  int get rowCount => data.length;

  int get selectedRowCount => 0;

  DataRow getRow(int index) {
    return DataRow(
      //color: MaterialStatePropertyAll(!dark ? Colours().white : Colours().dark1 ),
      cells: [
        DataCell(TableRowContent(width: null, label: data[index].id.toString(), dark: dark)),
        DataCell(TableRowContent(width: null, label: data[index].typeName.toString(), dark: dark)),
        DataCell(TableRowContent(width: null, label: data[index].categoryName.toString(), dark: dark)),
        DataCell(TableRowContent(width: null, label: data[index].sort.toString(), dark: dark)),
        DataCell(TableRowContent(width: 250, label: data[index].title.toString(), dark: dark)),
        DataCell(TableRowContent(width: 400, label: data[index].description.toString(), dark: dark)),
        DataCell(TableRowContent(width: null, label: data[index].adsTitle.toString(), dark: dark)),
        DataCell(TableRowContent(width: null, label: data[index].articleDate.toString(), dark: dark)),
        DataCell(TableRowContent(width: null, label: data[index].createDate.toString(), dark: dark)),
        DataCell(TableRowContent(width: null, label: data[index].status.toString(), dark: dark)),
        DataCell(
          PopupMenuButton(
              //onSelected: newsFeedsPro.onChangeLabelType,
              itemBuilder: (BuildContext context) {
                return ['update', 'deactivate', 'delete'].map((option) {
                  return PopupMenuItem(
                      value: option,
                      height: 30,
                      child: Text(option,
                          maxLines: 1,
                          style: Styles().text(
                            textType: MyTextType.bodySmall,
                            color: Colours().appBarOnBgColor(dark),
                            fontW: FontWeight.w400,
                            size: 12,
                          )));
                }).toList();
              },
              color: Colours().cardColor(dark),
              child: MyContainer.bordered(
                padding: MySpacing.xy(10, 7),
                color: Colours().blue,
                child: Row(
                  children: [
                    Expanded(
                      child: Text("action",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles().text(
                            textType: MyTextType.labelMedium,
                            color: Colours().white,
                            fontW: FontWeight.w400,
                            size: 12,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 4),
                      child: Icon(LucideIcons.chevronDown, size: 16, color: Colours().white),
                    )
                  ],
                ),
              )),
        )
      ],
    );
  }
}
