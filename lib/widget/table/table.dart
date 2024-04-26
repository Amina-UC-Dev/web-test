import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:flutter/material.dart';

class TableRowHead extends StatelessWidget {
  const TableRowHead({super.key, required this.label, required this.dark});

  final String label;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Styles().text(
        textType: MyTextType.titleMedium,
        color: Colours().appBarOnBgColor(dark),
        fontW: FontWeight.w500,
        size: 12,
      ),
    );
  }
}

class TableRowContent extends StatelessWidget {
  const TableRowContent({super.key, required this.width, required this.label, required this.dark});

  final double? width;
  final String label;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? null,
      child: Text(
        label,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Styles().text(
          textType: MyTextType.bodySmall,
          color: Colours().appBarOnBgColor(dark),
          fontW: FontWeight.w400,
          size: 12,
        ),
      ),
    );
  }
}
