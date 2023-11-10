import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(home: WhatIsYourGoalPage()));

class WhatIsYourGoalPage extends StatefulWidget {
  @override
  _WhatIsYourGoalPageState createState() => _WhatIsYourGoalPageState();
}

class _WhatIsYourGoalPageState extends State<WhatIsYourGoalPage> {
  List<bool> isSelected = List.generate(12, (index) => false);

  List<String> goals = [
    'Reduce my screen time',
    'Become more productive',
    'Better my time-management skills',
    'Improve my mental health',
    'Get more sleep',
    'Find more hobbies',
    'Become less reliant on my devices',
    'Do better in school',
    'Be able to have more time',
    'Spend more time with friends',
    'Improve my physical health',
    'Have more energy'
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
                  'What is your main reason for using TechAddict? \n(choose one or more)',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: goals.map((goal) {
                    int index = goals.indexOf(goal);
                    return InputChip(
                      label: Text(
                        goal,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected[index] ? Colors.white : Colors.black,
                        ),
                      ),
                      selected: isSelected[index],
                      onSelected: (selected) {
                        setState(() {
                          isSelected[index] = selected;
                        });
                      },
                      backgroundColor: isSelected[index] ? Colors.black : Colors.grey[300],
                      elevation: isSelected[index] ? 6.0 : 0.0,
                      pressElevation: isSelected[index] ? 10.0 : 0.0,
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                Container(
                  width: 250.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: navigateToNextPage,
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
                const SizedBox(height: 100),
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
