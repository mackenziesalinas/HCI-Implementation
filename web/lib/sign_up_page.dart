import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_textfield.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        title: Text(
          'Sign Up',
          style: GoogleFonts.playfairDisplay(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0), // Adjust the padding as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Create Account',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10.0), // Adjust the width of the SizedBox for spacing
                      Icon(Icons.star, size: 35.0, color: Colors.yellow),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: firstNameController,
                  hintText: 'First Name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: lastNameController,
                  hintText: 'Last Name',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Checkbox(
                          value: agreedToTerms,
                          onChanged: (value) {
                            setState(() {
                              agreedToTerms = value!;
                            });
                          },
                        ),
                      ),
                      Text(
                        "I agree to TechAddict's terms and conditions.",
                        style: GoogleFonts.roboto(fontSize: 16),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    final firstName = firstNameController.text;
                    final lastName = lastNameController.text;
                    final email = emailController.text;
                    final password = passwordController.text;

                    if (agreedToTerms) {
                      // Do something with the captured data, e.g., sign up the user
                      Navigator.pushNamed(context, '/get_to_know_you_page');
                    } else {
                      // Show an alert or message that the user must agree to the terms
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(300, 65),
                  ),
                  child: Text('SIGN UP', style: GoogleFonts.roboto(fontSize: 18)),
                ),
              ],
            ),
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
    );
  }

  Color desaturateColor(Color color, double saturationFactor) {
    final HSLColor hslColor = HSLColor.fromColor(color);
    final double saturation = hslColor.saturation * saturationFactor;
    return hslColor.withSaturation(saturation).toColor();
  }
}

void main() => runApp(MaterialApp(home: SignUpPage()));
