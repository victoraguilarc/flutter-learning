import 'package:designs/widgets/background.dart';
import 'package:designs/widgets/bottom_navigation.dart';
import 'package:designs/widgets/content.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundWidget(),
          HomeContent(),
        ],
      ),  
      bottomNavigationBar: CMNavigationBar(),
   );
  }
}

