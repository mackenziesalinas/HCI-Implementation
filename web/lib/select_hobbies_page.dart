import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_addict/dashboard_page.dart';

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

  void _navigateToDashboardPage() {
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); // Call _showMenuDialog here
              },
            );
          },
        ),
        title: Text(
          'User Interests',
          style: GoogleFonts.playfairDisplay(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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
                const SizedBox(height: 100),
                Text(
                  'Choose your interests (one or more):',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: hobbies.map((hobby) {
                      final isSelected = selectedHobbies.contains(hobby);

                      return InputChip(
                        label: Text(
                          hobby,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontSize: 18,
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
                    }).toList(), // Convert the set to a list using toList()
                  ),
                ),

                SizedBox(height: 50),
                Container(
                  width: 50,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: _navigateToDashboardPage, // Use _navigateToDashboardPage instead of navigateToDashboard
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      elevation: 30,
                      side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
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
