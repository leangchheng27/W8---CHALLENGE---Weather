import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ),
);

enum WearTher {
  summer("assets/images/summer.jpeg"),
  autumn("assets/images/autumn.avif"),
  winter("assets/images/winter.jpg"),
  spring("assets/images/spring.jpg");

  final String imagePath;

  const WearTher(this.imagePath);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SeasonsCard();
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
      franceSeasonIndex = (franceSeasonIndex + 1) % WearTher.values.length;
    });
  }

  void _changeCambodiaSeason() {
    setState(() {
      cambodiaSeasonIndex = (cambodiaSeasonIndex + 1) % WearTher.values.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final franceSeason = WearTher.values[franceSeasonIndex];
    final cambodiaSeason = WearTher.values[cambodiaSeasonIndex];

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SeasonHeader(title: 'SEASONS'),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SeasonCard(
                    country: 'FRANCE',
                    season: franceSeason,
                    onTap: _changeFranceSeason,
                  ),
                  const SizedBox(width: 20),
                  SeasonCard(
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

class SeasonHeader extends StatelessWidget {
  final String title;

  const SeasonHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SeasonCard extends StatelessWidget {
  final String country;
  final WearTher season;
  final VoidCallback onTap;

  const SeasonCard({
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
            width: 120,
            height: 120,
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
