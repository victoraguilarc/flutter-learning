import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextStyle textStyle = TextStyle(fontSize: 22);
  final conteo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de Clicks',
              style: textStyle,
            ),
            Text('$conteo', style: textStyle),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one_rounded),
          onPressed: () {
            print('contado!!');
          }),
    );
  }
}
