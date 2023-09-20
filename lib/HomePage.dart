import 'package:flutter/material.dart';

import 'acc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 150, // Hauteur de la photo de couverture
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('acc.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Se Connecter ',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Etudiant / Enseignant / Administration',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Numéro de CIN',
                      border: OutlineInputBorder(), // Ajoute une bordure
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(), // Ajoute une bordure
                    ),
                    obscureText: true, // Masque le texte pour le mot de passe
                  ),
                  SizedBox(height: 20.0),
                  // Champ pour le captcha (personnalisez selon vos besoins)
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Captcha',
                      border: OutlineInputBorder(), // Ajoute une bordure
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 26, 255),
                    ),
                    child: Text('Se connecter'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
