 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  Widget buildIconRectangle(List<Icon> iconList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (Icon icon in iconList)
              Padding(
                padding: const EdgeInsets.all(8.0), // Adjust the spacing as needed
                child: icon,
              ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Icon> iconList = [
      Icon(Icons.star_border_outlined, size: 20.0, color: Colors.blue),
      Icon(Icons.favorite, size: 20.0, color: Colors.red),
      Icon(Icons.flash_on_outlined, size: 20.0, color: Colors.orange),
      Icon(Icons.sentiment_satisfied, size: 20.0, color: Colors.green),
      Icon(Icons.favorite_border_outlined, size: 20.0, color: Colors.purple),
      Icon(Icons.star, size: 20.0, color: Colors.yellow),
    ];
    return Material(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildIconRectangle(iconList),
                ],
              ),
              Text(
                //elevation: 20,
                'WELCOME\nTO\nTECHADDICT',
                style: GoogleFonts.abel(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(255, 0, 8, 255),
                ),
                textAlign: TextAlign.center,
              ),
              Row( mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[ buildIconRectangle(iconList), ], ),
              SizedBox(height: 200),
              Container(
                width: 250.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to another page or perform an action
                    Navigator.pushNamed(context, '/sign_up_page');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 8, 255),
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('SIGN UP'),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 250.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 0, 8, 255),
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text('LOGIN'),
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