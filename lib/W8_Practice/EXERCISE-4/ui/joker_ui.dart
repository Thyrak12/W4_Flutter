import 'package:flutter/material.dart';
import '../model/joker_model.dart';

Color appColor = Colors.green[300] as Color;

class FavoriteCard extends StatelessWidget {
  final JokeModel jokeModel;
  final VoidCallback onTapFavorite;

  const FavoriteCard({
    super.key,
    required this.jokeModel,
    required this.onTapFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: .5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(jokeModel.title,
                    style: TextStyle(fontWeight: FontWeight.bold, color: appColor)),
                const SizedBox(height: 8),
                Text(jokeModel.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onTapFavorite,
            icon: Icon(
              jokeModel.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: jokeModel.isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
