import 'package:flutter/material.dart';
import 'package:app_store/pages/catalog.dart';

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
            onPressed: () {
              // Perform login logic here
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Catalog(),
                ),
              );
            },
            child: Text(
              'Login',
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
