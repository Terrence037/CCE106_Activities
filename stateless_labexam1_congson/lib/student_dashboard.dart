import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              print('Logout button pressed');
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student Profile
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/yeahmehn.png'),
                ),

                const SizedBox(width: 15),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Congson, Terrence Clyde B.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Student ID: 554676', style: TextStyle(fontSize: 13)),
                    Text('BSIT 3rd Year', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25),

            // List View
            Expanded(
              child: Column(
                children: const [
                  Card(
                    child: ListTile(
                      title: Text('terrence.congson37@gmail.com'),
                      leading: Icon(Icons.email),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      title: Text('+63 991 650 9958'),
                      leading: Icon(Icons.phone),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      title: Text('Davao City, Philippines'),
                      leading: Icon(Icons.house),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const [
                  Text(
                    'Subjects:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Card(
                    child: ListTile(
                      title: Text('Mobile App Development'),
                      subtitle: Text(
                        'Instructor: Michael Velez \nSchedule: 10:00 AM - 12:00 NN',
                      ),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      title: Text('Project Development'),
                      subtitle: Text(
                        'Instructor: Meljohn Aborde \nSchedule: 1:30 PM - 3:30 PM',
                      ),
                    ),
                  ),

                  Card(
                    child: ListTile(
                      title: Text('Desktop Programming'),
                      subtitle: Text(
                        'Instructor: Renz Arriola \nSchedule: 5:30 PM - 7:30 PM',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Add Subject Clicked!');
        },
        child: const Icon(Icons.add),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
