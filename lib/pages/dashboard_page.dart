import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  final Set<String> selectedHobbies;

  DashboardPage({required this.selectedHobbies});

  @override
  _DashboardPageState createState() => _DashboardPageState(selectedHobbies);
}

class _DashboardPageState extends State<DashboardPage> {
  final Set<String> selectedHobbies;
  Map<String, List<String>> hobbyRecommendations = {
    'Nature': ['Go for a hike in the nearby park.', 'Take a relaxing walk by the river.'],
    'Reading': ['Start a new book from your favorite author.', 'Visit a local library for a change of scenery.'],
    'Crafts': ['Try knitting, crocheting, or cross-stitching.', 'Join a crafting workshop to learn new techniques.'],
    'Performing Arts': ['Attend a local theater performance.', 'Practice a short monologue or dance routine.'],
    'Gardening': ['Spend some time in your garden, plant new flowers.', 'Start a mini herb garden on your balcony.'],
    'Music': ['Listen to your favorite music and relax.', 'Learn to play a new musical instrument.'],
    'Sports': ['Join a local sports club for a game of your choice.', 'Organize a friendly sports match with friends.'],
  };

  Map<String, List<bool>> recommendationCheckStatus = {};
  PageController _pageController = PageController();

  _DashboardPageState(this.selectedHobbies) {
    for (var hobby in selectedHobbies) {
      recommendationCheckStatus[hobby] = List.filled(hobbyRecommendations[hobby]!.length, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              'Welcome PLACEHOLDER!',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
           /* const SizedBox(height: 50),
           / Text(
              'Scroll right for more!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),*/
            //),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: selectedHobbies.map((hobby) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(8),
                            //padding: const EdgeInsets.all(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Center(
                                child: Text(
                                  hobby,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ...List.generate(hobbyRecommendations[hobby]!.length, (index) {
                                return Row(
                                  children: [
                                    Checkbox(
                                      value: recommendationCheckStatus[hobby]![index],
                                      onChanged: (value) {
                                        setState(() {
                                          recommendationCheckStatus[hobby]![index] = value!;
                                        });
                                      },
                                      activeColor: Colors.purple, // Set the check mark color to purple
                                    ),
                                    Text(hobbyRecommendations[hobby]![index]),
                                  ],
                                );
                              }),
                              const SizedBox(height: 2),
                              Center(
                                child: Container(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black, // Set the button background color to black
                                    ),
                                    onPressed: () {
                                      // Implement the "Add to Schedule" functionality
                                    },
                                    child: Text(
                                      'Add to Schedule',
                                      style: TextStyle(color: Colors.white), // Text color
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
