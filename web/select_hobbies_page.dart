import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(home: SelectHobbiesPage()));

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
        title: Text(
          'TechAddict',
          style: GoogleFonts.playfairDisplay(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 10,
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                Text(
                  'Choose your interests\n(one or more):',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80),
                Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: hobbies.map((hobby) {
                    final isSelected = selectedHobbies.contains(hobby);

                    return InputChip(
                      label: Text(
                        hobby,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedHobbies.add(hobby);
                          } else {
                            selectedHobbies.remove(hobby);
                          }
                        });
                      },
                      backgroundColor: isSelected ? Colors.black : Colors.grey[300],
                      elevation: isSelected ? 6.0 : 0.0,
                      pressElevation: isSelected ? 10.0 : 0.0,
                    );
                  }).toList(),
                ),
                SizedBox(height: 75),
                ElevatedButton(
                  onPressed: navigateToDashboard,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 25),
                  ),
                  child: Text(
                    'NEXT',
                    style: GoogleFonts.roboto(
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
