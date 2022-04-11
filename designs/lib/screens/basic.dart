import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image(image: AssetImage('assets/land.jpg')),
          Title(),
          BottomSection(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text('Ut ullamco ex duis aliqua id dolor et tempor quis do. Incididunt sint labore elit labore dolore duis aute ipsum mollit tempor exercitation. Velit nulla duis cupidatat ut excepteur nisi.'),
          )
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Somehthing Camp Group',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Grant Canion, Texas',
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.star, color: Colors.red),
          Text('41'),
        ],
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomIcon(
            icon: Icons.call,
            text: 'Call',
          ),
          BottomIcon(
            icon: Icons.map_sharp,
            text: 'Route',
          ),
          BottomIcon(
            icon: Icons.share,
            text: 'Share',
          ),
        ],
      ),
    );
  }
}

class BottomIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const BottomIcon({
    Key? key, 
    required this.icon, 
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(this.icon, color: Colors.blue),
        Text(this.text, style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}
