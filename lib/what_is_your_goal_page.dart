import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(home: WhatIsYourGoalPage()));

class WhatIsYourGoalPage extends StatefulWidget {
  @override
  _WhatIsYourGoalPageState createState() => _WhatIsYourGoalPageState();
}

class _WhatIsYourGoalPageState extends State<WhatIsYourGoalPage> {
  List<bool> isSelected = List.generate(6, (index) => false);

  List<String> goals = [
    'Reduce my screen time',
    'Become more productive',
    'Better my time-management skills',
    'Improve my mental health',
    'Get more sleep',
  ];

  void navigateToNextPage() {
    // Handle button press with selected goals
    List<String> selectedGoals = [];
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i]) {
        selectedGoals.add(goals[i]);
      }
    }
    print('Selected Goals: $selectedGoals');

    // Navigate to the next page (replace 'NextPage' with the actual page you want to navigate to).
    Navigator.pushNamed(context, '/select_hobbies_page');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 100),
                  Text(
                    'What is your main reason for using TechAddict? (choose one or more)',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected[index] = !isSelected[index];
                          });
                        },
                        child: SizedBox(
                          width: 100,  // Adjust the width as needed
                          height: 50,  // Adjust the height as needed
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: isSelected[index] ? 6 : 3, // Adjust the elevation
                            color: isSelected[index] ? Color.fromARGB(255, 0, 8, 255) : null,
                            child: Center(
                              child: Text(
                                goals[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: isSelected[index] ? Colors.white : Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 250.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: navigateToNextPage,
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 8, 255),
                        onPrimary: Colors.white,
                        elevation: 30,
                        side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Color desaturateColor(Color color, double saturationFactor) {
  final HSLColor hslColor = HSLColor.fromColor(color);
  final double saturation = hslColor.saturation * saturationFactor;
  return hslColor.withSaturation(saturation).toColor();
}