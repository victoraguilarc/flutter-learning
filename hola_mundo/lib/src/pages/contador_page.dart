import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContadorPageState();
  }
}

class _ContadorPageState extends State<ContadorPage> {
  final TextStyle _textStyle = TextStyle(fontSize: 22);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo LOL'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Numero de Clicks',
              style: _textStyle,
            ),
            Text('$_conteo', style: _textStyle),
          ],
        ),
      ),
      floatingActionButton: _createButtons(),
    );
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            child: Icon(Icons.exposure_zero), onPressed: _resetCounter),
        Expanded(child: SizedBox()),
        FloatingActionButton(
            child: Icon(Icons.remove), onPressed: _minusCounter),
        SizedBox(width: 5.0),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _addCounter),
      ],
    );

    // FloatingActionButton(
    //   child: Icon(Icons.plus_one_rounded),
    //   onPressed: () {
    //     print('Hola Mundo: !!');

    //     setState(() {
    //       _conteo++;
    //     });
    //   }
    // );
  }

  void _addCounter() {
    setState(() => _conteo++);
  }

  void _minusCounter() {
    setState(() => _conteo--);
  }

  void _resetCounter() {
    setState(() => _conteo = 0);
  }
}
