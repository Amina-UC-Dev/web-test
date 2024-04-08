import 'package:beonchat_admin/const/colors.dart';
import 'package:beonchat_admin/screen/dashboard/widget/drawer.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key, required this.type});

  final int type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours().black,
      appBar: AppBar(
        title: Text(
            "H O M E    ${type == 1 ? "M O B I L E" : type == 2 ? "T A B L E T" : "D E S K T O P"}"),
        centerTitle: true,
      ),
      drawer: type != 3
          ? HomeDrawer(
              type: type,
            )
          : null,
      body: Row(
        children: [
         type == 3 ? HomeDrawer(
            type: type,
          ) : Container(width: 0,),
          Expanded(
            child: Container(
              color: Colours().grey2,
            ),
          ),
        ],
      ),
    );
  }
}
