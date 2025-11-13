import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom buttons')),
        body: Column(
          children: [
            CustomCard(
              city: 'Phnom Penh',
              color: [
                Colors.purple,
                const Color.fromARGB(255, 174, 138, 180),
              ],
              temp: 12.2,
              minMax: [10, 40.0],
              imagePath: 'assets/ex4/cloudy.png',
            ),
            CustomCard(
              city: 'Paris',
              color: [
                Colors.greenAccent,
                const Color.fromARGB(255, 190, 246, 219),
              ],
              temp: 22.2,
              minMax: [10, 40.0],
              imagePath: 'assets/ex4/sunnyCloudy.png',
            ),
            CustomCard(
              city: 'Rome',
              color: [
                Colors.redAccent,
                const Color.fromARGB(255, 252, 190, 190),
              ],
              temp: 45.2,
              minMax: [10, 40.0],
              imagePath: 'assets/ex4/sunny.png',
            ),
            CustomCard(
              city: 'New York',
              color: [
                Colors.orangeAccent,
                const Color.fromARGB(255, 251, 221, 183),
              ],
              temp: 45.5,
              minMax: [10, 40.0],
              imagePath: 'assets/ex4/veryCloudy.png',
            ),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String city;
  final List<Color> color;
  final double temp;
  final List<double> minMax;
  final String imagePath;

  const CustomCard({
    super.key,
    required this.city,
    required this.color,
    required this.temp,
    required this.minMax,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(4, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: -10,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color[0].withOpacity(0.3)
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      imagePath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20),

                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          city,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Min: ${minMax[0]}°',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Max: ${minMax[1]}°',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    '$temp°C',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
