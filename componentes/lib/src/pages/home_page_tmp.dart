import 'package:flutter/material.dart';

class HomePageTmp extends StatelessWidget {
  final options = ['banana', 'manzana', 'naranja', 'fresa'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      // body: ListView(children: _createItems()),
      body: ListView(children: _createShortItems()),
    );
  }

  List<Widget> _createItems() {
    List<Widget> items = <Widget>[];

    for (String option in options) {
      final tempWidget = ListTile(title: Text(option));

      items
        ..add(tempWidget)
        ..add(Divider());
    }
    return items;
  }

  List<Widget> _createShortItems() {
    return options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item),
            subtitle: Text('Subtitle'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
        ],
      );
    }).toList();
  }
}
