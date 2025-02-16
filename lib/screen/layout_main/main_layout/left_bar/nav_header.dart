import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:beonchat_admin/const/text_size.dart';
import 'package:beonchat_admin/widget/util/my_spacing.dart';
import 'package:flutter/material.dart';

class NavHeader extends StatelessWidget {
  const NavHeader(
      {super.key, required this.title, required this.dark, required this.hide});

  final String title;
  final bool dark, hide;

  @override
  Widget build(BuildContext context) {
    return hide
        ? Container()
        : Padding(
            padding: MySpacing.xy(24, 8),
            child: Text(
              title.toUpperCase(),
              style: Styles().text(
                textType: MyTextType.labelSmall,
                color: Colours().labelColor(dark),
              ),
            ),
          );
  }
}
