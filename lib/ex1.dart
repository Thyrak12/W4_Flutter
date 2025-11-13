
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              CustomCard(title: 'Hello 1'),
              CustomCard(title: 'Hello 2'),
              CustomCard(title: 'Hello 3'),
            ],
          ),
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String title;
  const CustomCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: LinearGradient(
            colors: [Color(0xff4E7DF5), Color(0xff0335B6)],
            stops: [0, 1],
          ),
        ),
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.all(20),
        child: Text(title, style: TextStyle(fontSize: 35, color: Colors.white)),
      ),
    );
  }
}
