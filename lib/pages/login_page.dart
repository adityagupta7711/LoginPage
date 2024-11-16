import 'package:flutter/material.dart';
import 'package:login_page_auth/components/my_button.dart';
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
              const SizedBox(height: 5),

              //forgot password
              Text(
                'Forgot Password ?',
                style: TextStyle(color: Colors.black),
              ),

              //sign in button
              const SizedBox(height: 25),
              MyButton(
                onTap: signUserIn,
              ),

              //or continue with
              const SizedBox(height: 25),
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
              //google + apple sign-in
              Row(
                children: [
                  //google button
                  Image.asset('lib/assets/google.png',
                  height: 70,
                  )
                ],
              )

              //not a member? register now
            ],
          ),
        ),
      ),
    );
  }
}
