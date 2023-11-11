import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                desaturateColor(const Color.fromARGB(255, 147, 205, 253), 0.5),
                desaturateColor(const Color.fromARGB(255, 144, 161, 255), 0.5),
                desaturateColor(const Color.fromARGB(255, 253, 191, 241), 0.5),
                desaturateColor(const Color.fromARGB(255, 255, 255, 255), 0.5),
              ],
            ),
          ),
          child: Column(children: <Widget>[
            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 20.0),
                child: Image.asset('images/profile_picture.png',
                    fit: BoxFit.scaleDown, height: 70, width: 70),
              ),
              SizedBox(width: 180, height: 4),
              Text(
                'Level: 1\nAwards: 1\nShares: 0',
                style: GoogleFonts.playfairDisplay(
                    textStyle: TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ]),
            Align(
              alignment: Alignment(-0.7, -1.0),
              child: Text(
                "User's Dashboard",
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 20,
                  animation: true,
                  lineHeight: 20.0,
                  animationDuration: 2000,
                  percent: 0.15,
                  barRadius: const Radius.circular(16),
                  backgroundColor: Color(0XFFCBC3C3),
                  progressColor: Colors.black,
                )),
            SizedBox(width: 10, height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        child: Text('Details',
                            style: GoogleFonts.playfairDisplay()))),
                SizedBox(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        child: Text('Schedule',
                            style: GoogleFonts.playfairDisplay()))),
              ],
            ),
            SizedBox(height: 30, width: 4),
            Column(
              children: <Widget>[
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Image.network(
                        'https://www.rei.com/dam/day_hiking_checklist_lg3.jpg?t=ea16by9xs',
                        fit: BoxFit.cover,
                      ),
                      Text('Activity 1: Come join us for a hike and brunch!',
                          style: GoogleFonts.playfairDisplay()),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
                SizedBox(height: 8, width: 5),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Image.network(
                        'https://i.ytimg.com/vi/FHytoCvj90w/maxresdefault.jpg',
                        fit: BoxFit.cover,
                      ),
                      Text(
                          'Activity 2: Let your dogs run free and chat with other dog owners!',
                          style: GoogleFonts.playfairDisplay()),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
                SizedBox(height: 8, width: 5),
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Image.network(
                        'https://fplct.librarymarket.com/sites/default/files/2019-07/kid%20book%20club_0.jpg',
                        fit: BoxFit.cover,
                      ),
                      Text(
                          'Activity 3: Grab your favorite book and head over to the Books and Nooks Book Club!',
                          style: GoogleFonts.playfairDisplay()),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ],
            ),
          ])),
    );
  }

  Color desaturateColor(Color color, double saturationFactor) {
    final HSLColor hslColor = HSLColor.fromColor(color);
    final double saturation = hslColor.saturation * saturationFactor;
    return hslColor.withSaturation(saturation).toColor();
  }
}
