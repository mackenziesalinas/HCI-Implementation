import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  Map<String, String> interestEmojis = {
    'Nature': '🌿',
    'Reading': '📚',
    'Crafts': '✂️',
    'Performing Arts': '🎭',
    'Gardening': '🌷',
    'Music': '🎵',
    'Sports': '⚽',
  };

  void navigateToDashboard() {
    // Navigate to the dashboard page here.
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              desaturateColor(const Color.fromARGB(255, 147, 205, 253), 0.5),
              desaturateColor(const Color.fromARGB(255, 144, 161, 255), 0.5),
              desaturateColor(Color.fromARGB(255, 253, 191, 241), 0.5),
              desaturateColor(Color.fromARGB(255, 255, 255, 255), 0.5),
            ],
          ),
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 75),
                Text(
                  'Choose your interests (one or more):',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: hobbies.map((hobby) {
                    final isSelected = selectedHobbies.contains(hobby);

                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedHobbies.remove(hobby);
                              } else {
                                selectedHobbies.add(hobby);
                              }
                            });
                          },
                          child: Card(
                            elevation: isSelected ? 6 : 3, // Add elevation
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0), // Make it more circular
                            ),
                            color: isSelected ? Color.fromARGB(255, 0, 8, 255) : Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0), // Add padding
                              child: Column(
                                children: [
                                  Text(
                                    interestEmojis[hobby]!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: isSelected ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      hobby,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: navigateToDashboard,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 8, 255),
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 75, vertical: 30),
                  ),
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color desaturateColor(Color color, double saturationFactor) {
    final HSLColor hslColor = HSLColor.fromColor(color);
    final double saturation = hslColor.saturation * saturationFactor;
    return hslColor.withSaturation(saturation).toColor();
  }
}

class DashboardPage extends StatelessWidget {
  final Set<String> selectedHobbies;

  DashboardPage({required this.selectedHobbies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Selected Hobbies:',
              style: TextStyle(fontSize: 24),
            ),
            Column(
              children: selectedHobbies
                  .map((hobby) => Text(
                        hobby,
                        style: TextStyle(fontSize: 20),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
