import 'package:flutter/material.dart';
import 'package:lejeudelacomplicite/main.dart';
import 'GamePage.dart';

// <--
// GamePage here
// -->

class Rules extends StatefulWidget {
  @override
  Rules();
  _Rules createState() => _Rules();
}

class _Rules extends State<Rules> {
  _Rules();

  String Consignes =
      "Dans ce jeu, l'un de vous va piocher un mot aléatoirement.\n\nCelui-ci va devoir le faire deviner à son complice par n'importe quel moyen oral.\n\nAttention, les adversaires doivent aussi tenter de le trouver.\n\nLa première équipe à démasquer le mot remporte la manche.";

  Widget build(BuildContext context) {
    TextStyle style21 = new TextStyle(
      inherit: true,
      color: Colors.white,
      fontSize: 21.0,
      fontWeight: FontWeight.bold,
    );

    TextStyle style14 = new TextStyle(
      inherit: true,
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    );

    TextStyle style14nobold = new TextStyle(
      inherit: true,
      color: Colors.white,
      fontSize: 13.0,
    );

    void NextStep() {
      setState(() {
        ++step;
        if (step == 2) {
          Consignes = "Exemple: Le mot pioché est \"Titanic\"" +
              "\n\n❌ \"C'est un film avec Leonardo Di Caprio\" est un indice trop global. Il peut donc aider les adversaires à trouver." +
              "\n\n✔️ \"Rappelle toi, le mois dernier on a vu un film ensemble, on mangeait du popcorn sucré devant\" est un souvenir partagé avec le complice que l'équipe adverse peut difficilement comprendre." +
              "\n\nÀ vous de jouer !";
        } else if (step == 3) {
          step = 1;
          isGameAlreadyPlayed = true;
          if (isTutorialMenu) {
            isTutorialMenu = false;
            Navigator.of(context).pop();
          } else {
            Navigator.of(context).pop();
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) => new GamePage()));
          }
        }
      });
    }

    return Scaffold(
      backgroundColor: Color(0xff39465a),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).

          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 50.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.info,
                  color: new Color(0xffffffff),
                ),
                Text(
                  '  Règles du jeu',
                  style: style21,
                )
              ]),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                '$Consignes',
                style: TextStyle(
                    fontFamily: "Modelica",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Visibility(
                    child: FloatingActionButton.extended(
                      heroTag: "btn1",
                      backgroundColor: new Color(0xffffffff),
                      onPressed: () {
                        NextStep();
                      },
                      tooltip: 'Passer à l\'étape suivante.',
                      label: Text("Suivant",
                          style: TextStyle(color: Color(0xff39465a))),
                      icon: Icon(
                        Icons.play_circle_fill,
                        color: Color(0xff39465a),
                      ),
                    ),
                    visible: true,
                  ),
                  Visibility(
                    child: FloatingActionButton.extended(
                      heroTag: "btn2",
                      backgroundColor: new Color(0xffffffff),
                      onPressed: null,
                      tooltip: 'Ajoute un point à l\'équipe adverse',
                      label:
                          Text("Echec", style: TextStyle(color: Colors.pink)),
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.pink,
                      ),
                    ),
                    visible: false,
                  ),
                  Visibility(
                    child: FloatingActionButton.extended(
                      heroTag: "btn3",
                      backgroundColor: new Color(0xffffffff),
                      onPressed: null,
                      tooltip: 'Ajoute un point à votre équipe',
                      label:
                          Text("Succès", style: TextStyle(color: Colors.pink)),
                      icon: Icon(
                        Icons.check_circle,
                        // Icons.verified,
                        color: Colors.pink,
                      ),
                    ),
                    visible: false,
                  ), // This trailing comma makes auto-formatting nicer for build methods.
                  Visibility(
                    child: FloatingActionButton(
                      heroTag: "btn4",
                      backgroundColor: new Color(0xffffffff),
                      onPressed: null,
                      tooltip: 'Repiocher un mot',
                      child: Icon(
                        Icons.cached,
                        color: Colors.pink,
                      ),
                    ),
                    visible: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
