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
import 'package:beonchat_admin/widget/textfield/textfield.dart';
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
              padding: MySpacing.fromLTRB(16, 16, 16, 5),
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
                          onPressed: () {
                            DialogWidget().show(
                              context: context,
                              dark: dark,
                              title: "Add Article",
                              content: FormDummy(dark: dark),
                            );
                          },
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

            // DATA TABLE
            MySpacing.height(12),
            Padding(
              padding: MySpacing.x(16),
              child: newsFeedsPro.newsFeedsArticleListData != null ? NewsFeedsArticlesDataTableWidget(dark: dark) : Container(),
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
        padding: MySpacing.x(25),
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
                      InputLabel(label: "label here", dark: dark),
                      DropdownButtonFormField(
                          dropdownColor: Colours().white,
                          menuMaxHeight: 200,
                          isExpanded: true,
                          items: newsFeedsPro.listOption
                              .map((option) => DropdownMenuItem(
                                  value: option,
                                  child: Text(option["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles().text(
                                        textType: MyTextType.bodySmall,
                                        color: Colours().appBarOnBgColor(dark),
                                        fontW: FontWeight.w400,
                                        size: 13,
                                      ))))
                              .toList(),
                          icon: const Icon(
                            LucideIcons.chevronDown,
                            size: 20,
                          ),
                          decoration: InputDecoration(
                              hintText: "select",
                              hintStyle: Styles().text(
                                textType: MyTextType.labelMedium,
                                color: Colours().appBarOnBgColor(dark),
                                fontW: FontWeight.w400,
                                size: 13,
                              ),
                              border: outlineInputBorder(dark),
                              enabledBorder: outlineInputBorder(dark),
                              focusedBorder: focusedInputBorder,
                              contentPadding: MySpacing.xy(14, 12),
                              isCollapsed: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never),
                          onChanged: newsFeedsPro.onChangeLabelType)
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
                    padding: MySpacing.xy(20, 18),
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
                    padding: MySpacing.xy(20, 18),
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
  const NewsFeedsArticlesDataTableWidget({super.key, required this.dark});

  final bool dark;

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

class FormDummy extends StatelessWidget {
  const FormDummy({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsFeedsArticlesProvider>(builder: (_, newsFeedsPro, __) {
      return Form(
        key: newsFeedsPro.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //////////////////////////
            MyFlex(
              runSpacing: 15,
              children: [
                ////////////////////////////
                MyFlexItem(
                    sizes: "md-6 lg-6",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(label: "select type", dark: dark, isRequired: true),
                        DropdownButtonFormField(
                          dropdownColor: Colours().white,
                          menuMaxHeight: 200,
                          isExpanded: true,
                          items: newsFeedsPro.listOption
                              .map((option) => DropdownMenuItem(
                                  value: option,
                                  child: Text(option["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Styles().text(
                                        textType: MyTextType.bodySmall,
                                        color: Colours().appBarOnBgColor(dark),
                                        fontW: FontWeight.w400,
                                        size: 13,
                                      ))))
                              .toList(),
                          icon: const Icon(
                            LucideIcons.chevronDown,
                            size: 20,
                          ),
                          decoration: InputDecoration(
                              hintText: "select",
                              hintStyle: Styles().text(
                                textType: MyTextType.labelMedium,
                                color: Colours().appBarOnBgColor(dark),
                                fontW: FontWeight.w400,
                                size: 13,
                              ),
                              border: outlineInputBorder(dark),
                              enabledBorder: outlineInputBorder(dark),
                              focusedBorder: focusedInputBorder,
                              contentPadding: MySpacing.xy(15, 14),
                              isCollapsed: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never),
                          onChanged: newsFeedsPro.onChangeLabelType,
                          validator: (val) {
                            if (val == null) {
                              return "";
                            }
                            return null;
                          },
                        ),
                      ],
                    )),

                ////////////////////////////
                MyFlexItem(
                    sizes: "md-6 lg-6",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(label: "select category", dark: dark, isRequired: true),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "0",
                              hintStyle: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().grey4,
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
                    )),

                ////////////////////////////
                MyFlexItem(
                    sizes: "md-6 lg-6",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(label: "select status", dark: dark, isRequired: true),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "0",
                              hintStyle: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().grey4,
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
                    )),

                MyFlexItem(
                  sizes: "md-6 lg-6",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputLabel(label: "date", dark: dark, isRequired: true),
                      MyFlex(
                        spacing: 0,
                        runSpacing: 8,
                        children: [
                          MyFlexItem(
                            sizes: "lg-6",
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "day",
                                  hintStyle: Styles().text(
                                    textType: MyTextType.bodySmall,
                                    color: Colours().grey4,
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
                          ),
                          MyFlexItem(sizes: "lg-1", child: Container()),
                          MyFlexItem(
                            sizes: "lg-5",
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "day",
                                  hintStyle: Styles().text(
                                    textType: MyTextType.bodySmall,
                                    color: Colours().grey4,
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                ///////////////////////////////////////////////////
                MyFlexItem(
                    sizes: "lg-12",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(label: "title", dark: dark, isRequired: true),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "title / name",
                              hintStyle: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().grey4,
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
                    )),

                ////////////////////////////
                MyFlexItem(
                    sizes: "lg-12",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(label: "description", dark: dark, isRequired: true),
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "";
                            }
                            return null;
                          },
                          maxLines: 4,
                          decoration: InputDecoration(
                              hintText: "type here...",
                              hintStyle: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().grey4,
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
                    )),

                //////////////////////////////
                MyFlexItem(
                    sizes: "md-6 lg-6",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(label: "sort order", dark: dark),
                        TextFormField(
                          decoration: InputDecoration(
                              hintText: "0",
                              hintStyle: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().grey4,
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
                    )),

                //////////////////////////////
                MyFlexItem(
                    sizes: "md-6 lg-6",
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputLabel(label: "password", dark: dark),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          //obscureText: !controller.showPassword,
                          decoration: InputDecoration(
                              hintText: "Sample Password",
                              hintStyle: Styles().text(
                                textType: MyTextType.bodySmall,
                                color: Colours().grey4,
                                fontW: FontWeight.w400,
                                size: 13,
                              ),
                              border: outlineInputBorder(dark),
                              enabledBorder: outlineInputBorder(dark),
                              focusedBorder: focusedInputBorder,
                              prefixIcon: const Icon(LucideIcons.lock, size: 20),
                              suffixIcon: InkWell(
                                onTap: () {},
                                child: Icon(LucideIcons.eye, size: 20),
                              ),
                              contentPadding: MySpacing.all(16),
                              isCollapsed: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never),
                        ),
                        // LucideIcons.eyeOff
                      ],
                    ))
              ],
            ),

            MySpacing.height(40),
            const Divider(height: 0, thickness: 1),
            MySpacing.height(20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  onPressed: () {
                    newsFeedsPro.onSubmitBasicForm();
                    //Navigator.pop(context);
                  },
                  elevation: 0,
                  padding: MySpacing.xy(20, 16),
                  backgroundColor: Colours().blue,
                  borderRadiusAll: 6,
                  child: Text("submit",
                      style: Styles().text(
                        textType: MyTextType.bodySmall,
                        color: Colours().white,
                        fontW: FontWeight.w400,
                        size: 13,
                      )),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}

class InputLabel extends StatelessWidget {
  const InputLabel({super.key, required this.label, this.isRequired, required this.dark});

  final String label;
  final bool? isRequired;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    bool isRequiredField = isRequired ?? false;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: Styles().text(
                  textType: MyTextType.titleMedium,
                  color: Colours().blue,
                  fontW: FontWeight.w400,
                  size: 12,
                )),
            isRequiredField
                ? Text(" *",
                    style: Styles().text(
                      textType: MyTextType.labelMedium,
                      color: Colours().red,
                      fontW: FontWeight.w400,
                      size: 13,
                    ))
                : Container(),
          ],
        ),
        MySpacing.height(5),
      ],
    );
  }
}
