import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  int rating = 0;
  TextEditingController feedbackController = TextEditingController();
  FocusNode _feedbackFocusNode = FocusNode();

  void rateApp(int stars) {
    setState(() {
      rating = stars;
    });
  }

  @override
  void dispose() {
    _feedbackFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'How would you rate this activity?',
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 1; i <= 5; i++)
                      GestureDetector(
                        onTap: () {
                          rateApp(i);
                        },
                        child: Container(
                          color: i <= rating ? Colors.white : null,
                          child: Icon(
                            i <= rating ? Icons.star : Icons.star_border,
                            size: 40,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'You rated this activity: $rating stars',
                  style: GoogleFonts.roboto(fontSize: 18),
                ),
                SizedBox(height: 20),
                Focus(
                  focusNode: _feedbackFocusNode,
                  child: TextField(
                    controller: feedbackController,
                    decoration: InputDecoration(
                      hintText: 'Type your feedback here...',
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Change the border color here
                      ),
                    ),
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed : (){

                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 8, 255),
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Text(
                      'RETURN TO DASHBOARD',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color desaturateColor(Color color, double amount) {
  return Color.fromARGB(
    color.alpha,
    (color.red + ((128 - color.red) * amount)).round(),
    (color.green + ((128 - color.green) * amount)).round(),
    (color.blue + ((128 - color.blue) * amount)).round(),
  );
}
