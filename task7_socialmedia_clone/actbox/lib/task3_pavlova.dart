
import 'package:flutter/material.dart';

class PavlovaPage extends StatelessWidget {
  const PavlovaPage({super.key});

  final String description =
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
      'Anna Pavlova. This version features a crisp crust and soft, light inside, '
      'topped with fresh sweet mango and whipped cream.';

  Widget buildColumn() => Column(
        children: [
          Image.asset('assets/mango_pavlova.webp'),
          const SizedBox(height: 10),
          const Text(
            'Mango Pavlova',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.all(15),
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 19),
            ),
          ),
        ],
      );

  Widget buildStar(int rating, int numReviews) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 1; i <= rating; i++)
            const Icon(Icons.star, color: Colors.green, size: 24),
          for (int i = 1; i <= 5 - rating; i++)
            const Icon(Icons.star, size: 24),
          const SizedBox(width: 20),
          Text(
            '$numReviews Reviews',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      );

  Widget buildIconTab(
    IconData iconValue,
    String title,
    String time,
  ) =>
      Column(
        children: [
          Icon(iconValue, color: Colors.green),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            time,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      );

  Widget buildRowTabs() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildIconTab(Icons.kitchen, 'PREP', '25 min'),
          buildIconTab(Icons.timer, 'COOK', '1 hr'),
          buildIconTab(Icons.restaurant, 'FEEDS', '4-6'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TASK 3 - Congson'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          buildColumn(),
          buildStar(2, 90),
          const SizedBox(height: 20),
          buildRowTabs(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
