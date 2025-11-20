import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Hobby'),
        ),
        backgroundColor: Colors.grey,
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomCard(
                title: 'Travelling',
                color: Colors.green[400]!,
                icon: Icon(Icons.travel_explore,color: Colors.white,),
              ),
              CustomCard(
                title: 'Skating',
                color: Colors.blueGrey,
                icon: Icon(Icons.skateboarding, color: Colors.white,),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String title;
  final Color color;
  final Icon icon;
  const CustomCard({
    super.key,
    required this.title,
    this.color = Colors.blue,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: color,
      ),
      margin: EdgeInsets.all(10),
      child: Center(
        child: Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(30)),
            icon,
            Padding(padding: EdgeInsets.all(20)),
            Text(title, style: TextStyle(fontSize: 30, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
