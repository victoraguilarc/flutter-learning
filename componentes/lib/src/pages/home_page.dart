import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components XX'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    print(menuProvider.options);

    return FutureBuilder(
        future: menuProvider.loadData(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
            children: _createListItems(snapshot.data, context),
          );
        });
  }

  List<Widget> _createListItems(List<dynamic>? data, BuildContext context) {
    final List<Widget> options = [];
    if (data != null) {
      data.forEach((option) {
        final widgetTemp = ListTile(
            title: Text(option['title']),
            leading: getIcon(option['icon']),
            trailing: getIcon('keyboard_arrow_right'),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => AlertPage());
              Navigator.pushNamed(context, option['route']);
            });
        options
          ..add(widgetTemp)
          ..add(Divider());
      });
    }

    return options;
  }
}
