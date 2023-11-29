import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'activity_timer_page.dart'; // Import the ActivityTimerPage if not already imported

class ActivityTimerPage extends StatefulWidget {
  @override
  _ActivityTimerPageState createState() => _ActivityTimerPageState();
}

class _ActivityTimerPageState extends State<ActivityTimerPage> {
  int _totalSeconds = 0;
  int _minutes = 0;
  int _seconds = 0;
  bool _isRunning = false;
  bool _isPaused = false;

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
          'Activity Timer',
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300.0,
                height: 300.0,
                child: Stack(
                  children: [
                    Center(
                      child: Transform.scale(
                        scale: 5.0,
                        child: CircularProgressIndicator(
                          value: _totalSeconds / (30 * 60),
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                          strokeWidth: 2.5,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        '${_formatTime(_minutes)}:${_formatTime(_seconds)}',
                        style: GoogleFonts.roboto(fontSize: 30, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 100.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    if (_isRunning) {
                      if (_isPaused) {
                        _resumeTimer();
                      } else {
                        _pauseTimer();
                      }
                    } else {
                      _startTimer();
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
                  ),
                  child: Text(
                    _isRunning ? (_isPaused ? 'RESUME' : 'PAUSE') : 'START',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 100.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/finished_activity');
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
                  child: Text('DONE', style: GoogleFonts.roboto(fontSize: 15)),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 100.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    _startAgain();
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
                  child: Text('RESTART', style: GoogleFonts.roboto(fontSize: 15)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(int time) {
    return time < 10 ? '0$time' : '$time';
  }

  void _startAgain() {
    setState(() {
      _isRunning = true;
      _isPaused = false;
      _totalSeconds = 0;
      _minutes = 0;
      _seconds = 0;
      _timerCallback();
    });
  }

  void _timerCallback() {
    Future.delayed(Duration(seconds: 1), () {
      if (_isRunning && !_isPaused) {
        setState(() {
          _totalSeconds++;
          _minutes = _totalSeconds ~/ 60;
          _seconds = _totalSeconds % 60;
        });

        if (_totalSeconds < 30 * 60) {
          _timerCallback();
        }
      }
    });
  }

  void _startTimer() {
    if (!_isRunning) {
      setState(() {
        _isRunning = true;
        _isPaused = false;
        _timerCallback();
      });
    }
  }

  void _pauseTimer() {
    if (_isRunning && !_isPaused) {
      setState(() {
        _isPaused = true;
      });
    }
  }

  void _resumeTimer() {
    if (_isRunning && _isPaused) {
      setState(() {
        _isPaused = false;
        _timerCallback();
      });
    }
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
      _isPaused = false;
      _totalSeconds = 0;
      _minutes = 0;
      _seconds = 0;
    });
  }

  Color desaturateColor(Color color, double saturationFactor) {
    final HSLColor hslColor = HSLColor.fromColor(color);
    final double saturation = hslColor.saturation * saturationFactor;
    return hslColor.withSaturation(saturation).toColor();
  }
}
