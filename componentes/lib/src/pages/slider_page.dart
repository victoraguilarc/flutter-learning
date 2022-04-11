import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _currentValue = 50.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders')),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Image',
      onChanged: (_blockCheck)
          ? null
          : (value) {
              setState(() {
                _currentValue = value;
              });
            },
      value: _currentValue,
      min: 50.0,
      max: 500.0,
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://m.media-amazon.com/images/I/41BhW7ZpAXL._AC_.jpg'),
      width: _currentValue,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckBox() {
    return CheckboxListTile(
        title: Text('Block Slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value!;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Block Slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }
}
