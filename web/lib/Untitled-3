import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(home: GetToKnowYouPage()));

class GetToKnowYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              desaturateColor(Color.fromARGB(255, 147, 205, 253), 0.5),
              desaturateColor(Color.fromARGB(255, 144, 161, 255), 0.5),
              desaturateColor(Color.fromARGB(255, 253, 191, 241), 0.5),
              desaturateColor(Color.fromARGB(255, 255, 255, 255), 0.5),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Icon(Icons.flash_on_outlined, size: 75.0, color: Colors.red),
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0),
                    child: Text(
                      'Let\'s Get to Know You Better!',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Answer a few questions to let us get to know you better to personalize your experience.',
                style: GoogleFonts.playfairDisplay(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/what_is_your_goal_page');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 25),
                  side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'LET\'S BEGIN',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
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
