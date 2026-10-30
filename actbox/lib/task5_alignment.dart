
import 'package:flutter/material.dart';

class Task5Menu extends StatefulWidget {
  const Task5Menu({super.key});

  @override
  State<Task5Menu> createState() => _Task5MenuState();
}

class _Task5MenuState extends State<Task5Menu> {
  int currentPage = 0;

  static const double boxSize = 90;

  final List<AlignmentDemo> pages = [
    // MAIN AXIS - COLUMN
    AlignmentDemo(
      alignment: 'Start',
      type: 'MainAxisAlignment',
      direction: 'Column',
      description: 'Places children at the top.',
      main: MainAxisAlignment.start,
      cross: CrossAxisAlignment.center,
      isColumn: true,
    ),
    AlignmentDemo(
      alignment: 'Center',
      type: 'MainAxisAlignment',
      direction: 'Column',
      description: 'Places children at the center.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.center,
      isColumn: true,
    ),
    AlignmentDemo(
      alignment: 'End',
      type: 'MainAxisAlignment',
      direction: 'Column',
      description: 'Places children at the bottom.',
      main: MainAxisAlignment.end,
      cross: CrossAxisAlignment.center,
      isColumn: true,
    ),
    AlignmentDemo(
      alignment: 'Space Between',
      type: 'MainAxisAlignment',
      direction: 'Column',
      description: 'Equal space between children.',
      main: MainAxisAlignment.spaceBetween,
      cross: CrossAxisAlignment.center,
      isColumn: true,
    ),
    AlignmentDemo(
      alignment: 'Space Around',
      type: 'MainAxisAlignment',
      direction: 'Column',
      description: 'Equal space around each child.',
      main: MainAxisAlignment.spaceAround,
      cross: CrossAxisAlignment.center,
      isColumn: true,
    ),
    AlignmentDemo(
      alignment: 'Space Evenly',
      type: 'MainAxisAlignment',
      direction: 'Column',
      description: 'Equal spacing between and around children.',
      main: MainAxisAlignment.spaceEvenly,
      cross: CrossAxisAlignment.center,
      isColumn: true,
    ),

    // MAIN AXIS - ROW
    AlignmentDemo(
      alignment: 'Start',
      type: 'MainAxisAlignment',
      direction: 'Row',
      description: 'Places children at the left.',
      main: MainAxisAlignment.start,
      cross: CrossAxisAlignment.center,
      isColumn: false,
    ),
    AlignmentDemo(
      alignment: 'Center',
      type: 'MainAxisAlignment',
      direction: 'Row',
      description: 'Places children at the center.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.center,
      isColumn: false,
    ),
    AlignmentDemo(
      alignment: 'End',
      type: 'MainAxisAlignment',
      direction: 'Row',
      description: 'Places children at the right.',
      main: MainAxisAlignment.end,
      cross: CrossAxisAlignment.center,
      isColumn: false,
    ),
    AlignmentDemo(
      alignment: 'Space Between',
      type: 'MainAxisAlignment',
      direction: 'Row',
      description: 'Equal space between children.',
      main: MainAxisAlignment.spaceBetween,
      cross: CrossAxisAlignment.center,
      isColumn: false,
    ),
    AlignmentDemo(
      alignment: 'Space Around',
      type: 'MainAxisAlignment',
      direction: 'Row',
      description: 'Equal space around each child.',
      main: MainAxisAlignment.spaceAround,
      cross: CrossAxisAlignment.center,
      isColumn: false,
    ),
    AlignmentDemo(
      alignment: 'Space Evenly',
      type: 'MainAxisAlignment',
      direction: 'Row',
      description: 'Equal spacing between and around children.',
      main: MainAxisAlignment.spaceEvenly,
      cross: CrossAxisAlignment.center,
      isColumn: false,
    ),

    // CROSS AXIS - COLUMN
    AlignmentDemo(
      alignment: 'Start',
      type: 'CrossAxisAlignment',
      direction: 'Column',
      description: 'Aligns children to the left.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.start,
      isColumn: true,
    ),
    AlignmentDemo(
      alignment: 'Center',
      type: 'CrossAxisAlignment',
      direction: 'Column',
      description: 'Aligns children horizontally at the center.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.center,
      isColumn: true,
    ),
    AlignmentDemo(
      alignment: 'End',
      type: 'CrossAxisAlignment',
      direction: 'Column',
      description: 'Aligns children to the right.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.end,
      isColumn: true,
    ),
    AlignmentDemo(
      alignment: 'Stretch',
      type: 'CrossAxisAlignment',
      direction: 'Column',
      description: 'Stretches children across the available width.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.stretch,
      isColumn: true,
    ),
    AlignmentDemo(
      alignment: 'Baseline',
      type: 'CrossAxisAlignment',
      direction: 'Column',
      description: 'Aligns children using their text baseline.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.baseline,
      isColumn: true,
    ),

    // CROSS AXIS - ROW
    AlignmentDemo(
      alignment: 'Start',
      type: 'CrossAxisAlignment',
      direction: 'Row',
      description: 'Aligns children to the top.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.start,
      isColumn: false,
    ),
    AlignmentDemo(
      alignment: 'Center',
      type: 'CrossAxisAlignment',
      direction: 'Row',
      description: 'Aligns children vertically at the center.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.center,
      isColumn: false,
    ),
    AlignmentDemo(
      alignment: 'End',
      type: 'CrossAxisAlignment',
      direction: 'Row',
      description: 'Aligns children to the bottom.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.end,
      isColumn: false,
    ),
    AlignmentDemo(
      alignment: 'Stretch',
      type: 'CrossAxisAlignment',
      direction: 'Row',
      description: 'Stretches children across the available height.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.stretch,
      isColumn: false,
    ),
    AlignmentDemo(
      alignment: 'Baseline',
      type: 'CrossAxisAlignment',
      direction: 'Row',
      description: 'Aligns children using their text baseline.',
      main: MainAxisAlignment.center,
      cross: CrossAxisAlignment.baseline,
      isColumn: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final page = pages[currentPage];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Congson - Task5'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 25),

              Text(
                page.direction,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              Text(
                page.type,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                page.alignment,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  page.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: SizedBox.expand(
                      child: page.isColumn
                          ? Column(
                              mainAxisAlignment: page.main,
                              crossAxisAlignment: page.cross,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                buildDemoBox(Colors.red),
                                buildDemoBox(Colors.yellow),
                                buildDemoBox(Colors.blue),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: page.main,
                              crossAxisAlignment: page.cross,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                buildDemoBox(Colors.red),
                                buildDemoBox(Colors.yellow),
                                buildDemoBox(Colors.blue),
                              ],
                            ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 45),
            ],
          ),

          // Bottom-right navigation arrows
          Positioned(
            bottom: 10,
            right: 8,
            child: Opacity(
              opacity: 0.4,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 18,
                    onPressed: currentPage > 0
                        ? () {
                            setState(() {
                              currentPage--;
                            });
                          }
                        : null,
                  ),

                  Text(
                    '${currentPage + 1}/${pages.length}',
                    style: const TextStyle(fontSize: 11),
                  ),

                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    iconSize: 18,
                    onPressed: currentPage < pages.length - 1
                        ? () {
                            setState(() {
                              currentPage++;
                            });
                          }
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDemoBox(Color color) {
    return Container(
      width: boxSize,
      height: boxSize,
      color: color,
    );
  }
}

class AlignmentDemo {
  final String alignment;
  final String type;
  final String direction;
  final String description;
  final MainAxisAlignment main;
  final CrossAxisAlignment cross;
  final bool isColumn;

  const AlignmentDemo({
    required this.alignment,
    required this.type,
    required this.direction,
    required this.description,
    required this.main,
    required this.cross,
    required this.isColumn,
  });
}
