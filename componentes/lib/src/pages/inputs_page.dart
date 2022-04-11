import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _name = '';
  String _email = '';
  String _date = '';
  String _selectedPower = 'fly';
  List<String> _powers = ['superspeed', 'laser', 'strenght', 'fly'];

  TextEditingController _dateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs')),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _createInput1(),
          Divider(),
          _createEmail(),
          Divider(),
          _createPassword(),
          Divider(),
          _createDate(context),
          Divider(),
          _createDropdown(),
          Divider(),
          _createPerson(),
        ],
      ),
    );
  }

  Widget _createInput1() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      onChanged: (value) {
        setState(() {
          _name = value;
        });
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          counter: Text('Letras ${_name.length}'),
          hintText: 'Nombre',
          labelText: 'Nombre',
          helperText: 'Put your fckg name',
          suffix: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) => setState(() {
        _email = value;
      }),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Email',
          labelText: 'Email',
          helperText: 'Put your fckg email',
          suffix: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      onChanged: (value) => setState(() {}),
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Password',
          labelText: 'Password',
          helperText: 'Put your fckg password',
          suffix: Icon(Icons.lock_outline),
          icon: Icon(Icons.lock)),
    );
  }

  Widget _createDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: true,
      controller: _dateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Born Date',
          labelText: 'Born Date',
          helperText: 'Put your fckg password',
          suffix: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        locale: Locale('es'),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2040));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _dateController.text = _date;
      });
    }
  }

  Widget _createDropdown() {
    return Row(children: [
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      Expanded(
        child: DropdownButton(
          value: _selectedPower,
          items: getMenuItems(),
          onChanged: (item) {
            print('Power: $item');
            setState(() {
              _selectedPower = '$item';
            });
          },
        ),
      )
    ]);
  }

  List<DropdownMenuItem<String>> getMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    _powers.forEach((element) {
      items.add(DropdownMenuItem(
        child: Text(element),
        value: element,
      ));
    });

    return items;
  }

  Widget _createPerson() {
    return ListTile(
      title: Text('Name: $_name'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Power: $_selectedPower'),
    );
  }
}
