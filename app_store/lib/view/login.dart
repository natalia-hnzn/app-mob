import 'package:flutter/material.dart';
import 'package:app_store/view/catalog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_store/view/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Store'.toUpperCase(),
          style: TextStyle(
            color: Color(0xFF212529),
            fontSize: 24,
          ),
        ),
        centerTitle: true, // Center the title
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
              labelText: 'Senha',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              String email = emailController.text;
              String password = passwordController.text;

              User? user = await signInWithEmailAndPassword(email, password);

              if (user != null) {
                // Authentication successful, navigate to the catalog page.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Catalog(),
                  ),
                );
              } else {
                // Handle authentication failure (show an error message, etc.).
                // You can display an error message on the login page.
              }
            },
            child: Text(
              'Login',
              style: TextStyle(
                color: Color(0xFF212529), // Button text color
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                // Redirect to the SignUp page when the "Sign Up" text link is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => SignUp(),
                  ),
                );
              },
              child: Text(
                "Don't have an account? Register!",
                style: TextStyle(
                  color: Color(0xFF212529), // Text link color
                  decoration: TextDecoration.underline, // Button text color
                ),
              ))
        ]),
      ),
    );
  }
}

Future<User?> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  } catch (e) {
    print('Error signing in: $e');
    return null;
  }
}
