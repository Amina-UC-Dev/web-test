import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/const/styles.dart';
import 'package:flutter/material.dart';

class LogoText extends StatelessWidget {
  const LogoText(
      {Key? key,
        required this.size,
        required this.space,
        required this.color,
        this.trans})
      : super(key: key);

  final double size, space;
  final Color color;
  final Color? trans;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "be",
        style: Styles().logoAppBar(
            color: trans ?? Colours().primary, size: size, space: space),
        children: [
          TextSpan(
            text: "onchat",
            style: Styles()
                .logoAppBar(color: trans ?? color, size: size, space: space),
          ),
        ],
      ),
      maxLines: 1,
    );
  }
}