import 'package:flutter/material.dart';

class PavlovaPage extends StatelessWidget {
  const PavlovaPage({super.key});

  final String description =
      'Pavlova is a meringue-based dessert named after the Russian ballerina '
      'Anna Pavlova. This version features a crisp crust and soft, light inside, '
      'topped with fresh sweet mango and whipped cream.';

  buildcolumn() => Column(children: [
        Image.asset('assets/mango_pavlova.webp'),
        const SizedBox(height: 10),
        const Text('Mango Pavlova',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.all(15),
          child: Text(description,
              textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 19)),
        ),
      ]);

  buildStar(int rating, int numreviews) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 1; i <= rating; i++)
            const Icon(Icons.star, color: Colors.green, size: 24),
          for (int i = 1; i <= (5 - rating); i++)
            const Icon(Icons.star, size: 24),
          const SizedBox(width: 20),
          Text('$numreviews Reviews',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      );

  buildicontab(IconData iconval, String title, String time) => Column(
        children: [
          Icon(iconval, color: Colors.green),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      );

  buildRowTabs() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildicontab(Icons.kitchen, 'PREP', '25 min'),
          buildicontab(Icons.timer, 'COOK', '1 hr'),
          buildicontab(Icons.restaurant, 'FEEDS', '4-6'),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YOUR APP BAR CONGSON')),
      body: Center(
        child: ListView(children: [
          buildcolumn(),
          buildStar(2, 90),
          const SizedBox(height: 20),
          buildRowTabs(),
        ]),
      ),
    );
  }
}