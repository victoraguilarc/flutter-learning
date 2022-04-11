import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          onPressed: () => _showAlert(context),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, // background
              onPrimary: Colors.blueAccent, // foreground
              shape: StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            title: Text('Titulo Alerta'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Contenido Alerta 1'),
                Text('Contenido Alerta 2'),
                FlutterLogo(
                  size: 50.0,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('OK')),
              TextButton(onPressed: () {}, child: Text('Cancelar')),
            ],
          );
        });
  }
}
