import 'package:beonchat_admin/widget/responsive/my_screen_media.dart';
import 'package:beonchat_admin/widget/responsive/my_screen_media_types.dart';
import 'package:flutter/material.dart';

class MyResponsive extends StatelessWidget {
  final Widget Function(BuildContext, BoxConstraints, MyScreenMediaType)
  builder;

  const MyResponsive({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => builder(
            context,
            constraints,
            MyScreenMedia.getTypeFromWidth(MediaQuery.of(context).size.width)));
  }
}