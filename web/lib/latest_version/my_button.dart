import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  final Function()? onTap;
  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onTap,
    child: Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 75), // Adjust padding
          primary: Colors.black,
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(
              color: Color.fromARGB(255, 0, 5, 9),
            ),
          ),
          elevation: 20, // Adjust elevation
        ),
        onPressed: onTap,
        child: Text(
          "SIGN IN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}

}