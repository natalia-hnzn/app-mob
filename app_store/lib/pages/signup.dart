import 'package:app_store/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      // You can do additional user setup here if needed
      print('User registered: ${userCredential.user?.email}');
    } catch (e) {
      print('Error registering user: $e');
      // Handle the registration error, e.g., display an error message.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up'.toUpperCase(),
          style: TextStyle(
            color: Color(0xFF212529),
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25),
        child: Column(children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              String email = emailController.text;
              String password = passwordController.text;

              await signUpWithEmailAndPassword(email, password);

              // You can navigate to another page upon successful registration.
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Login(),
                ),
              );
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                color: Color(0xFF212529), // Button text color
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
