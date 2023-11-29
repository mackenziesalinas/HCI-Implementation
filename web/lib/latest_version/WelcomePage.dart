import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';


class WelcomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
       return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 10,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {
                // Handle button press for "Button 1" here
                Navigator.pushNamed(context, '/user_dashboard_page');
              },
              child: Text(
                'Account',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {
                // Handle button press for "Button 2" here
                Navigator.pushNamed(context, '/sign_up_page');
              },
              child: Text(
                'Sign Up',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextButton(
              onPressed: () {
                // Handle button press for "Button 3" here
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Login',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
   title: Align(
          alignment: Alignment.topLeft,
          child: TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text(
              'TechAddict',
              style: GoogleFonts.playfairDisplay(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    body: Stack(
        children: [
          // Place the gradient
          Container(
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
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  // Place the image in front of the gradient
                  SizedBox(height: 100),
                  Image.asset(
                    'assets/AdobeStock_563966226.png',
                    fit: BoxFit.cover,
                    height: 175, // Set the height as per your requirement
                  ),
                  //SizedBox(height: 16),
                  Text(
                    'WELCOME,',
                    style: GoogleFonts.playfairDisplaySc(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'We are excited you are here.',
                    style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: 250.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        _showSignUpLoginDialog(context);
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
                      child: Text('GET STARTED'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSignUpLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      Color backgroundColor = desaturateColor(Color.fromARGB(255, 253, 191, 241), 0.25);
      return AlertDialog(
        //backgroundColor: Color.fromARGB(255, 253, 191, 241), // Set background color here
        //desaturateColor(Color.fromARGB(255, 253, 191, 241), 0.5),
        backgroundColor: backgroundColor,
        content: Container(
          height: 750,
          width: 750.0, // Set your desired width here
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close, size: 25), // Close icon
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                  ),
                ],
              ),
              SizedBox(height: 150),
              Text(
                'Join TechAddict',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign_up_page');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  elevation: 30,
                  side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  fixedSize: Size(200, 60), // Set your desired button size here
                ),
                child: Text('SIGN UP', style: GoogleFonts.roboto(fontSize: 20)),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  elevation: 30,
                  side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  fixedSize: Size(200, 60), // Set your desired button size here
                ),
                child: Text('LOGIN',  style: GoogleFonts.roboto(fontSize: 20)),
              ),
            ],
          ),
        ),
      );
    },
  );
}


  Color desaturateColor(Color color, double saturationFactor) {
    final HSLColor hslColor = HSLColor.fromColor(color);
    final double saturation = hslColor.saturation * saturationFactor;
    return hslColor.withSaturation(saturation).toColor();
  }
}
