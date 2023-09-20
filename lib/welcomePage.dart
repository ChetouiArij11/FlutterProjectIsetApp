import 'package:flutter/material.dart';

import 'HomePage.dart';
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ISET de Tozeur'),
        backgroundColor:Color.fromARGB(255, 0, 26, 255),
        leading: IconButton(
    icon: Image.asset('iset.jpg'),
    onPressed: () {
      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),);
     
    },
  ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('hh.png'), 
            SizedBox(height: 20.0),
            Text(
              'Bienvenue\nVous pouvez utiliser cette application à tout moment sans connexion aussi.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
                style: ElevatedButton.styleFrom(
    primary: Color.fromARGB(255, 0, 26, 255), 
  ),
              child: Text('Accéder à l\'espace extranet'),
              
            ),
          ],
        ),
      ),
    );
  }
}


