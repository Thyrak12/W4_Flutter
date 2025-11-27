import 'package:flutter/material.dart';
import 'package:w4_app/W8_Practice/EXERCISE-4/data/joker_data.dart';
import 'package:w4_app/W8_Practice/EXERCISE-4/ui/joker_ui.dart';

Color appColor = Colors.green[300] as Color;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JokePage(),
    );
  }
}

class JokePage extends StatefulWidget {
  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  void setFavorite(int index) {
    setState(() {
      for (var joke in jokes) {
        joke.isFavorite = false;
      }
      jokes[index].isFavorite = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            jokeModel: jokes[index],
            onTapFavorite: () => setFavorite(index),
          );
        },
      ),
    );
  }
}
