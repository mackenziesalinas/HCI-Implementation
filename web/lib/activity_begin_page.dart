import 'package:flutter/material.dart';
import 'activity_timer_page.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivityBeginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Let's Begin",
                style: GoogleFonts.playfairDisplay(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Text(
                  'Menu',
                  style: GoogleFonts.playfairDisplay(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Dashboard', style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
                // Add functionality for the first menu option
              },
            ),
            ListTile(
              title: Text('Account', style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pop(context);
                // Add functionality for the second menu option
              },
            ),
          ],
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'Ready to Begin Your Activity?',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 50,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Icon(Icons.flash_on_outlined, size: 35.0, color: Colors.yellow),
                ],
              ),
              SizedBox(height: 100),
              Container(
                width: 250.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/activity_timer');
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
                  child: Text('START ACTIVITY', style: GoogleFonts.roboto(fontSize: 20)),
                ),
              ),
            ],
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
