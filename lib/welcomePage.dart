import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'HomePage.dart';

class WelcomePage extends StatelessWidget {
  TextEditingController cinController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ISET de Tozeur'),
        backgroundColor: Color.fromARGB(255, 0, 26, 255),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/hh.png',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome to our application \nHave a nice day ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: cinController,
                decoration: InputDecoration(
                  labelText: 'CIN',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Call your backend API for sign-in
                signInUser(cinController.text, passwordController.text, context);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 26, 255),
              ),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInUser(String cin, String password, BuildContext context) async {
    final String apiUrl = 'http://localhost:5050/login/etudiant';

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        body: {'cin': cin, 'password': password},
      );

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sign In Failed'),
              content: Text('Invalid CIN or password. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
