import 'package:flutter/material.dart';
import 'package:login_page_auth/components/my_button.dart';
import 'package:login_page_auth/components/square_tile.dart';
import 'package:login_page_auth/components/textfield.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  //text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 241, 9),
      body: SafeArea(
        //makes the ui avoid the notch area
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),

              //logo
              const Icon(
                Icons.person,
                size: 100,
                color: Colors.deepOrange,
              ),
              const SizedBox(height: 50),

              //welcome back !

              const Text(
                'Welcome back user!',
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
              const SizedBox(height: 25),

              //username textfield
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),

              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 20),

              //forgot password
              Text(
                'Forgot Password ?',
                style: TextStyle(color: Colors.black),
              ),

              //sign in button
              const SizedBox(height: 35),
              MyButton(
                onTap: signUserIn,
              ),

              //or continue with
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black45,
                      ),
                    ),
                    Text(
                      'continue with',
                      style: TextStyle(color: Colors.black87),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //google + apple sign-in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'lib/assets/google.png'),

                  const SizedBox(width: 10),

                  //apple button
                  SquareTile(imagePath: 'lib/assets/apple.png')
                ],
              ),

              const SizedBox(
                height: 40,
              ),
              //not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Color.fromRGBO(128, 0, 0, 1)),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Register Now',
                    style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.underline),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
