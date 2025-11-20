import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 400, height: 100, child: CustomButton()),
            const SizedBox(height: 20),
            SizedBox(width: 400, height: 100, child: CustomButton()),
            const SizedBox(height: 20),
            SizedBox(width: 400, height: 100, child: CustomButton()),
            const SizedBox(height: 20),
            SizedBox(width: 400, height: 100, child: CustomButton()),
          ],
        ),
      ),
    ),
  ),
);

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isClick = false;
  void buttonSelect() {
    setState(() {
      isClick = !isClick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonSelect,
      style: ElevatedButton.styleFrom(
        backgroundColor: isClick ? Colors.blue[500] : Colors.blue[50],
      ),
      child: Center(
        child: Text(
          isClick ? "Selected" : "Not Selected",
          style: TextStyle(color: isClick ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
