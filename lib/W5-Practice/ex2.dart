import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom buttons'),
        ),
        body : Column(
          children: [
            CustomCard(title: 'Submit',color: Colors.blue, icon: Icon(Icons.check)),
            CustomCard(title: 'Time',color: Colors.green, icon: Icon(Icons.lock_clock)),
            CustomCard(title: 'Account',color: Colors.grey, icon: Icon(Icons.account_balance)),
          ],
        )
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
