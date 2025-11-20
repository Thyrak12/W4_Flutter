import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // To hide debug at the corner
      home: CarouselCard(),
    ));

class CarouselCard extends StatefulWidget {
  const CarouselCard({
    super.key,
  });

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {
  int activeImageIndex = 0;
  void backButton(){
    setState(() {
      if (activeImageIndex == 0){
        activeImageIndex = images.length-1;
      }else{
        activeImageIndex--;
      }
    });
  }
  void nextButton(){
    setState(() {
      if (activeImageIndex == images.length - 1){
        activeImageIndex = 0;
      }else{
        activeImageIndex++;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: backButton,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextButton,
            ),
          ),
        ],
      ),
      body: Image.asset(images[activeImageIndex]),
    );
  }
}
