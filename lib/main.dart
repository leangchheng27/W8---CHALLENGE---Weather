import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ),
);

enum Weather {
  summer("assets/summer.jpeg"),
  autumn("assets/autumn.jpg"),
  winter("assets/winter.jpg"),
  spring("assets/spring.jpg");

  final String imagePath;

  const Weather(this.imagePath);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SeasonsCard();
  }
}

class Card extends StatelessWidget {
  final String country;
  final Weather season;
  final VoidCallback onTap;

  const Card({
    super.key,
    required this.country,
    required this.season,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image(
            image: AssetImage(season.imagePath),
            width: 300,
            height: 500,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          country,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SeasonsCard extends StatefulWidget {
  const SeasonsCard({super.key});

  @override
  State<SeasonsCard> createState() => _SeasonsCardState();
}

class _SeasonsCardState extends State<SeasonsCard> {
  int franceSeasonIndex = 0;
  int cambodiaSeasonIndex = 0;

  void _changeFranceSeason() {
    setState(() {
      franceSeasonIndex = (franceSeasonIndex + 1) % Weather.values.length;
    });
  }

  void _changeCambodiaSeason() {
    setState(() {
      cambodiaSeasonIndex = (cambodiaSeasonIndex + 1) % Weather.values.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final franceSeason = Weather.values[franceSeasonIndex];
    final cambodiaSeason = Weather.values[cambodiaSeasonIndex];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'SEASONS',
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    country: 'FRANCE',
                    season: franceSeason,
                    onTap: _changeFranceSeason,
                  ),
                  const SizedBox(width: 20),
                  Card(
                    country: 'CAMBODIA',
                    season: cambodiaSeason,
                    onTap: _changeCambodiaSeason,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


