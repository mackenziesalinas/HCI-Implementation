import 'package:flutter/material.dart';
import 'package:modernlogintute/components/my_button.dart';
import 'package:modernlogintute/components/my_textfield.dart';
import 'package:modernlogintute/components/square_tile.dart';

class LoginPage extends StatelessWidget{
  //const LoginPage({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
       child:Center(
         child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
          //logo
          const SizedBox(height: 50),

          const Icon(
            Icons.local_activity,
            size:100,
            color: Colors.purple,
          ),
          
          const SizedBox(height: 50),
       
          //welcome back
          Text(
            'Welcome to Tech Addicts!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 25),
          //username textfield
          MyTextField(
            controller: usernameController,
            hintText: 'Username',
            obscureText: false,
          ),
       
          const SizedBox(height: 10),
          //password textfield
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),
       
          //forgot password?
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
       
       
          //sign in button
          const SizedBox(height: 25),
          MyButton(
            onTap: () {
              Navigator.pushNamed(context, '/select_hobbies_page');
            },
          ),
       
          //or continue with
          const SizedBox(height: 50),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0) ,
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
                  child: Text('Or continue with',
                  style: TextStyle(color: Colors.grey[700])
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

          const SizedBox(height:50),
          //google + apple sign in buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              //google button
              SquareTile(imagePath: 'lib/images/google.png'),

              SizedBox(width: 10),

              //apple button
              SquareTile(imagePath: 'lib/images/apple.png'),

            ],
            ),
       
          //not a member? sign up
          const SizedBox(height:50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              'Not a member?',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(width: 4),
            const Text(
              'Sign up now',
               style: TextStyle(
                color: Colors.blue, 
                fontWeight: FontWeight.bold
                ),
              ),
              
            ],
          )

          
          
          
          
          
          
          ]),
       ),
      ),
    );
  }
}
