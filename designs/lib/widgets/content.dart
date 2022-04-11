import 'package:designs/widgets/card_table.dart';
import 'package:designs/widgets/page_title.dart';
import 'package:flutter/material.dart';


class HomeContent extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitleWidget(),
          CardTable(),
        ],
      ),
    );
  }
}