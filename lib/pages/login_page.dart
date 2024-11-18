import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_page_auth/components/my_button.dart';
import 'package:login_page_auth/components/square_tile.dart';
import 'package:login_page_auth/components/textfield.dart';
import 'package:login_page_auth/pages/auth_page.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  //text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn(BuildContext context) async {
    try {
      // Perform Firebase sign-in
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Navigate to another page on successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AuthPage()), // Replace `HomePage` with your target page
      );
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      print('FirebaseAuthException: ${e.message}');
      showErrorDialog(context, e.message ?? 'Authentication failed.');
    } catch (e) {
      // Handle other errors
      print('Unexpected error: $e');
      showErrorDialog(context, 'An unexpected error occurred: $e');
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 252, 159, 113),
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
                size: 120,
                color: Color.fromARGB(255, 255, 26, 26),
              ),
              const SizedBox(height: 50),

              //welcome back !

              const Text(
                'Welcome back user!',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25),

              //email textfield
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),

              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 15),

              //forgot password
              const Text(
                'Forgot Password ?',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              //sign in button
              const SizedBox(height: 30),
              MyButton(
                onTap: (context) => signUserIn(context),
              ),

              const SizedBox(height: 30),
              //or continue with
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.black45,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'or continue with',
                        style: TextStyle(color: Colors.black87),
                      ),
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'lib/assets/google.png'),

                  SizedBox(width: 10),

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
                  const Text(
                    'Not a member?',
                    style: TextStyle(color: Color.fromRGBO(128, 0, 0, 1)),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
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
