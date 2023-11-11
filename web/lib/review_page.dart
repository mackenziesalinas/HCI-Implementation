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
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Review Activity',
          style: GoogleFonts.playfairDisplay(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
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
                  style: GoogleFonts.playfairDisplay(fontSize: 30, fontWeight: FontWeight.w500),
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
                          color: i <= rating ? Colors.transparent : null,
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
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/');
                       Navigator.pushNamed(context, '/user_dashboard_page');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                      elevation: 30,
                      side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text('RETURN HOME', style: GoogleFonts.roboto(fontSize: 18)),
                  ),
                ),
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
