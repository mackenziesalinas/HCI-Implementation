import 'package:flutter/material.dart';
import 'my_button.dart';
import 'my_textfield.dart';
import 'square_tile.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

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
        'Login',
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
              children: [
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      const SizedBox(height: 5),
                      Text(
                        'Welcome Back!',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      const Icon(
                        Icons.sentiment_very_satisfied_outlined,
                        size: 40,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
                // Icon(Icons.favorite_outline, size: 35.0, color: Colors.red),
                const SizedBox(height: 30),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/user_dashboard_page');
                  },
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: GoogleFonts.roboto(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'assets/google.png'),
                    const SizedBox(width: 10),
                    SquareTile(imagePath: 'assets/apple.png'),
                  ],
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: GoogleFonts.roboto(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Sign up now',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
