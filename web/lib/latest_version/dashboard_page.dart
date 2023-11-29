import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  final Set<String>? selectedHobbies;

  DashboardPage({required this.selectedHobbies});

  @override
  _DashboardPageState createState() => _DashboardPageState(selectedHobbies);
}

class _DashboardPageState extends State<DashboardPage> {
  final Set<String>? selectedHobbies;
  Map<String, List<String>> hobbyRecommendations = {
    'Nature': ['Go for a hike in the nearby park.', 'Take a relaxing walk by the river.'],
    'Reading': ['Start a new book from your favorite author.', 'Visit a local library for a change of scenery.'],
    'Crafts': ['Try knitting, crocheting, or cross-stitching.', 'Join a crafting workshop to learn new techniques.'],
    'Performing Arts': ['Attend a local theater performance.', 'Practice a short monologue or dance routine.'],
    'Gardening': ['Spend some time in your garden, plant new flowers.', 'Start a mini herb garden on your balcony.'],
    'Music': ['Listen to your favorite music and relax.', 'Learn to play a new musical instrument.'],
    'Sports': ['Join a local sports club for a game of your choice.', 'Organize a friendly sports match with friends.'],
  };

  _DashboardPageState(this.selectedHobbies);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Recommendations', style: GoogleFonts.playfairDisplay(fontSize: 30, fontWeight: FontWeight.w500)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Based on your interests, here are some activities we think you might enjoy.',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: selectedHobbies?.map((hobby) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Center(
                                  child: Text(
                                    hobby,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                ...(hobbyRecommendations[hobby] ?? []).map((recommendation) {
                                  return Row(
                                    children: [
                                      Icon(Icons.check, color: Colors.black),
                                      Text(recommendation, style: GoogleFonts.roboto(fontSize: 20)),
                                    ],
                                  );
                                }).toList(),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        );
                      })?.toList() ??
                      [],
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to return to the dashboard
                  Navigator.pushNamed(context, '/user_dashboard_page');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0), // Adjust the value to make the button more or less rounded
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 30), // Adjust the padding for width and height
                ),
                child: Text(
                  'RETURN TO DASHBOARD',
                  style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}

Color desaturateColor(Color color, double saturationFactor) {
  final HSLColor hslColor = HSLColor.fromColor(color);
  final double saturation = hslColor.saturation * saturationFactor;
  return hslColor.withSaturation(saturation).toColor();
}
