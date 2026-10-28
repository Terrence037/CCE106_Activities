
import 'package:flutter/material.dart';

class Task5Menu extends StatelessWidget {
  const Task5Menu({super.key});

  Widget boxes() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 40, height: 40, color: Colors.red),
        Container(width: 40, height: 40, color: Colors.yellow),
        Container(width: 40, height: 40, color: Colors.blue),
      ],
    );
  }

  Widget mainRow(String name, MainAxisAlignment alignment) {
    return Column(
      children: [
        Text(
          'MainAxisAlignment in Row - $name',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: alignment,
            children: [
              Container(width: 40, height: 40, color: Colors.red),
              Container(width: 40, height: 40, color: Colors.yellow),
              Container(width: 40, height: 40, color: Colors.blue),
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget mainColumn(String name, MainAxisAlignment alignment) {
    return Column(
      children: [
        Text(
          'MainAxisAlignment in Column - $name',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: alignment,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 40, height: 40, color: Colors.red),
              Container(width: 40, height: 40, color: Colors.yellow),
              Container(width: 40, height: 40, color: Colors.blue),
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget crossRow(String name, CrossAxisAlignment alignment) {
    return Column(
      children: [
        Text(
          'CrossAxisAlignment in Row - $name',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 80,
          width: double.infinity,
          child: Row(
            crossAxisAlignment: alignment,
            children: [
              Container(width: 40, height: 30, color: Colors.red),
              Container(width: 40, height: 50, color: Colors.yellow),
              Container(width: 40, height: 40, color: Colors.blue),
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget crossColumn(String name, CrossAxisAlignment alignment) {
    return Column(
      children: [
        Text(
          'CrossAxisAlignment in Column - $name',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 130,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Container(width: 70, height: 30, color: Colors.red),
              Container(width: 110, height: 30, color: Colors.yellow),
              Container(width: 90, height: 30, color: Colors.blue),
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  Widget baselineRow() {
    return Column(
      children: [
        const Text(
          'CrossAxisAlignment in Row - Baseline',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        const SizedBox(
          height: 60,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('Small', style: TextStyle(fontSize: 14)),
              Text('Medium', style: TextStyle(fontSize: 24)),
              Text('Large', style: TextStyle(fontSize: 36)),
            ],
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Congson Activity - Task 5'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            mainRow('Center', MainAxisAlignment.center),
            mainRow('SpaceAround', MainAxisAlignment.spaceAround),
            mainRow('SpaceBetween', MainAxisAlignment.spaceBetween),
            mainRow('SpaceEvenly', MainAxisAlignment.spaceEvenly),
            mainRow('Start', MainAxisAlignment.start),
            mainRow('End', MainAxisAlignment.end),

            mainColumn('Center', MainAxisAlignment.center),
            mainColumn('SpaceAround', MainAxisAlignment.spaceAround),
            mainColumn('SpaceBetween', MainAxisAlignment.spaceBetween),
            mainColumn('SpaceEvenly', MainAxisAlignment.spaceEvenly),
            mainColumn('Start', MainAxisAlignment.start),
            mainColumn('End', MainAxisAlignment.end),

            crossRow('Start', CrossAxisAlignment.start),
            crossRow('End', CrossAxisAlignment.end),
            baselineRow(),
            crossRow('Center', CrossAxisAlignment.center),
            crossRow('Stretch', CrossAxisAlignment.stretch),

            crossColumn('Start', CrossAxisAlignment.start),
            crossColumn('End', CrossAxisAlignment.end),
            crossColumn('Center', CrossAxisAlignment.center),
            crossColumn('Stretch', CrossAxisAlignment.stretch),
          ],
        ),
      ),
    );
  }
}
