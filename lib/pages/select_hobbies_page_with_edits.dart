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
    'Running',
    'Painting',
    'Drawing',
    'Cycling',
    'Baking',
    'Cooking',
    'Self-improvement',
    'Shopping',
    'Volunteering'
  ];

  Set<String> selectedHobbies = Set<String>();

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
                const SizedBox(height: 50),
                Text(
                  'Choose your interests\n(one or more):',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0), // Add padding around the Wrap
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 6.0,
                    children: hobbies.map((hobby) {
                      final isSelected = selectedHobbies.contains(hobby);

                      return InputChip(
                        label: Text(
                          hobby,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                        backgroundColor: isSelected ? Color.fromARGB(255, 0, 8, 255) : Colors.grey[300],
                        selected: isSelected,
                        elevation: 6,
                        onPressed: () {
                          setState(() {
                            if (isSelected) {
                              selectedHobbies.remove(hobby);
                            } else {
                              selectedHobbies.add(hobby);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30),
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
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
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
