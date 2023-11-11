import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserDashboard(),
    );
  }
}

class UserDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Dashboard', style: GoogleFonts.playfairDisplay(fontSize: 30, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Gradient Background
          Container(
            width: double.infinity,
            height: double.infinity,
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
          ),
          // Image
          Positioned.fill(
            child: Image.asset(
              'assets/AdobeStock_523517509.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'Welcome back!',
                  style: GoogleFonts.playfairDisplay(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to details page
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 80),
                        primary: Colors.black,
                        elevation: 10,
                        side: BorderSide(color: Color.fromARGB(255, 0, 5, 9), width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('DETAILS', style: GoogleFonts.roboto(fontSize: 20)),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the schedule call page
                        Navigator.pushNamed(context, '/user_schedule_page');
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 80),
                        primary: Colors.black,
                        elevation: 10,
                        side: BorderSide(color: Color.fromARGB(255, 0, 5, 9), width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('YOUR SCHEDULE', style: GoogleFonts.roboto(fontSize: 20)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                   Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle the click action for "Your Daily Progress"
                          // You can navigate to a new screen or perform any other action.
                           Navigator.pushNamed(context, '/activity_begin');
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(400, 300),
                          primary: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/AdobeStock_505636066.png', // Add your PNG here
                                //fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 250,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        /*border: Border.all(
                                          color: Colors.black, // Set the border color
                                          width: 3.0,
                                          //height: 10.0, // Set the border width
                                        ),*/
                                      ),
                                      
                                      child: Center ( child: Text(
                                        'ACTIVITIES',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.roboto(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w500),
                                      ), ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 50),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle the click action for "Your Daily Progress"
                          // You can navigate to a new screen or perform any other action.
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(400, 300),
                          primary: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/AdobeStock_505636066.png', // Add your PNG here
                                //fit: BoxFit.cover,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 250,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        /*border: Border.all(
                                          color: Colors.black, // Set the border color
                                          width: 3.0,
                                          //height: 10.0, // Set the border width
                                        ),*/
                                      ),
                                      child: Center ( child: Text(
                                        'DAILY PROGRESS',
                                        style: GoogleFonts.roboto(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color desaturateColor(Color color, double saturationFactor) {
    final HSLColor hslColor = HSLColor.fromColor(color);
    final double saturation = hslColor.saturation * saturationFactor;
    return hslColor.withSaturation(saturation).toColor();
  }
}
