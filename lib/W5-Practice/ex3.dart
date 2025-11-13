import 'package:flutter/material.dart';

enum Product {
  dart(
    title: "Dart",
    description: 'The best object language',
    image: 'assets/ex3/dart.png',
  ),
  flutter(
    title: "Flutter",
    description: "The best mobile framework ",
    image: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: "Firebase",
    description: "The cloud database language ",
    image: 'assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Products")),
        body: Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.firebase),
              ProductCard(product: Product.flutter),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 4, offset: Offset(0, 2)),
        ],
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(product.image), width: 100, height: 100),
          const SizedBox(height: 5),

          Text(
            product.title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),

          Text(product.description),
        ],
      ),
    );
  }
}