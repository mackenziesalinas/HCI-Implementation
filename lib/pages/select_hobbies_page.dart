import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class SelectHobbiesPage extends StatefulWidget {
  @override
  _SelectHobbiesPageState createState() => _SelectHobbiesPageState();
}

class _SelectHobbiesPageState extends State<SelectHobbiesPage> {
  List<String> hobbies = [
    'Nature',
    'Reading',
    'Crafts',
    'Performing Arts',
    'Gardening',
    'Music',
    'Sports',
  ];

  Set<String> selectedHobbies = Set<String>();

  Map<String, String> hobbyImages = {
    'Nature': 'lib/images/hobby_nature.png',
    'Reading': 'lib/images/hobby_reading.png',
    'Crafts': 'lib/images/hobby_crafts.png',
    'Performing Arts': 'lib/images/hobby_performing_arts.png',
    'Gardening': 'lib/images/hobby_gardening.png',
    'Music': 'lib/images/hobby_music.png',
    'Sports': 'lib/images/hobby_sports.png',
  };

  void navigateToDashboard() {
    // Navigate to the dashboard page here.
    // You can use Navigator to push a new route.
    // For example:
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardPage(selectedHobbies: selectedHobbies),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text(
                  'What are your interests/hobbies?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.only(bottom: 33),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: hobbies.map((hobby) {
                      final isSelected = selectedHobbies.contains(hobby);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedHobbies.remove(hobby);
                            } else {
                              selectedHobbies.add(hobby);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(16),
                            color: isSelected ? Colors.purple : Colors.grey[200],
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                hobbyImages[hobby]!,
                                height: 120,
                              ),
                              SizedBox(height: 10),
                              Text(
                                hobby,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                ElevatedButton(
                  onPressed: navigateToDashboard,
                  style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Set the button background color to black
                  ),
                  child: Text('Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,          
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

