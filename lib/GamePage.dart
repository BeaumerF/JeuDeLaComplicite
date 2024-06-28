import 'package:flutter/material.dart';
import 'dart:math';
import 'package:lejeudelacomplicite/main.dart';
import "constants/ListPhrases.dart";
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:appodeal_flutter/appodeal_flutter.dart';

// <--
// GamePage here
// -->

class GamePage extends StatefulWidget {
  @override
  GamePage();
  _GamePage createState() => _GamePage();
}

class _GamePage extends State<GamePage> {
  _GamePage();

  double refreshPossible = globaleRefreshPossible;

  List<int> nbAlreadyDoneA;
  List<int> nbAlreadyDoneB;

  List<String> pl;
  bool isTeamAPlaying = true;
  bool isStep1Phone = false;
  bool isRefreshDisplayable = false;
  // String randomPhrase = listPhrases[Random().nextInt(listPhrases.length)];

  String randomPhrase;
  String randomPlayer;

  int random = -1;
  Color randomBackgroundColor = new Color(0xff39465a);
  Color randomContentColor = new Color(0xfff1c40f);
  Color randomButtonColor = new Color(0xfff1c40f);

  TextStyle teamA = new TextStyle(
    inherit: true,
    color: new Color(0xffe84c3d),
    fontSize: 10.0,
  );
  TextStyle teamB = new TextStyle(
    inherit: true,
    color: new Color(0xfff1c40f),
    fontSize: 10.0,
  );

  String player1 = "";
  String player2 = "";
  String player3 = "";
  String player4 = "";

  bool isHidden = false;
  bool _isVisibility = false;
  Color colorCopy;
  IconData iconDisplay;

  @override
  void initState() {
    // UnityAds.init(
    //   gameId: "4049679",
    //   testMode: false,
    //   listener: (state, args) => print('Init Listener: $state => $args'),
    // );
    // MobileAds.instance.initialize();
    // if (isCheating) {
    //   myInterstitial_.load();
    // }
    isGameOver = false;
    _isVisibility = false;
    isHidden = false;
    iconDisplay = Icons.visibility_off_outlined;

    if (playerRedList.length >= playerYellowList.length)
      scoreMax = playerRedList.length;
    else
      scoreMax = playerYellowList.length;

    // pl = new List<String>();
    if (playerRedList.length > 2) {
      player1 = "Équipe Rouge";
      player2 = "";
    } else {
      player1 = playerRedList[0];
      player2 = playerRedList[1];
    }
    if (playerYellowList.length > 2) {
      player3 = "Équipe Jaune";
      player4 = "";
    } else {
      player3 = playerYellowList[0];
      player4 = playerYellowList[1];
    }

    scoreA = 0;
    scoreB = 0;
    // print(pl[0] + pl[1] + pl[2] + pl[3]);
    int randomTeam = Random().nextInt(2);
    nbAlreadyDoneA = new List<int>();
    nbAlreadyDoneB = new List<int>();
    print("1ère étape" +
        nbAlreadyDoneA.length.toString() +
        " / " +
        playerRedList.length.toString());
    print(nbAlreadyDoneB.length.toString() +
        " / " +
        playerYellowList.length.toString());
    if (randomTeam == 1) {
      random = Random().nextInt(playerRedList.length);
      nbAlreadyDoneA.add(random);
      randomContentColor = new Color(0xffe84c3d);
      randomButtonColor = new Color(0xffe84c3d);
      randomPlayer = playerRedList[random] + " doit prendre le téléphone.";
      randomPhrase = "";
    } else {
      random = Random().nextInt(playerYellowList.length);
      isTeamAPlaying = false;
      nbAlreadyDoneB.add(random);
      randomContentColor = new Color(0xfff1c40f);
      randomButtonColor = new Color(0xfff1c40f);
      randomPlayer = playerYellowList[random] + " doit prendre le téléphone.";
      randomPhrase = "";
    }
    print("2nd étape" +
        nbAlreadyDoneA.length.toString() +
        " / " +
        playerRedList.length.toString());
    print(nbAlreadyDoneB.length.toString() +
        " / " +
        playerYellowList.length.toString());
    colorCopy = randomContentColor;
    // myInterstitial.load();
    super.initState();
  }

  // final InterstitialAd myInterstitial_ = InterstitialAd(
  //   // adUnitId: 'ca-app-pub-3940256099942544/8691691433', //testmode
  //   adUnitId: 'ca-app-pub-9876543056881069/8159427908',
  //   request: AdRequest(),
  //   listener: AdListener(),
  // );

  // final InterstitialAd myInterstitial = InterstitialAd(
  //   // adUnitId: 'ca-app-pub-3940256099942544/8691691433', //testmode
  //   adUnitId: 'ca-app-pub-9876543056881069/4552693140',
  //   request: AdRequest(),
  //   listener: AdListener(),
  // );

  void whoPlay() {
    isTeamAPlaying = !isTeamAPlaying;
    isRefreshDisplayable = false;
    refreshPossible = globaleRefreshPossible;

    print("WhoPlay2, scoremax:" + scoreMax.toString());
    if (scoreA + scoreB == scoreMax * 2) {
      if (scoreA > scoreB) {
        randomContentColor = new Color(0xffe84c3d);
        randomButtonColor = new Color(0xffe84c3d);
        colorCopy = new Color(0xffe84c3d);
        randomPlayer = "L'équipe rouge gagne !";
        randomPhrase = "";
      } else if (scoreB > scoreA) {
        randomContentColor = new Color(0xfff1c40f);
        randomButtonColor = new Color(0xfff1c40f);
        colorCopy = new Color(0xfff1c40f);
        randomPlayer = "L'équipe jaune gagne !";
        randomPhrase = "";
      } else {
        randomButtonColor = randomContentColor;
        randomContentColor = new Color(0xffffffff);
        randomPlayer = "Match nul, une autre partie ?";
        randomPhrase = "";
      }

      print("CHEATING ???");
      // isCheating = true;
      isGameOver = true;
      return; // EXIT
    }

    print("need to be sure it's returned");

    print(nbAlreadyDoneA.length.toString() +
        " / " +
        playerRedList.length.toString());
    print(nbAlreadyDoneB.length.toString() +
        " / " +
        playerYellowList.length.toString());
    if (nbAlreadyDoneA.length == playerRedList.length) nbAlreadyDoneA.clear();
    if (nbAlreadyDoneB.length == playerYellowList.length)
      nbAlreadyDoneB.clear();

    if (isTeamAPlaying) {
      random = Random().nextInt(playerRedList.length);
      while (nbAlreadyDoneA.contains(random)) {
        random = Random().nextInt(playerRedList.length);
        print("random is: " + random.toString());
      }
      nbAlreadyDoneA.add(random);
      print(playerRedList[random]);
      randomPlayer = playerRedList[random] + " doit prendre le téléphone.";
      randomPhrase = "";
      randomContentColor = new Color(0xffe84c3d);
      randomButtonColor = new Color(0xffe84c3d);
    } else {
      random = Random().nextInt(playerYellowList.length);
      while (nbAlreadyDoneB.contains(random)) {
        random = Random().nextInt(playerYellowList.length);
        print("random is: " + random.toString());
      }
      nbAlreadyDoneB.add(random);
      print(playerYellowList[random]);
      randomPlayer = playerYellowList[random] + " doit prendre le téléphone.";
      randomPhrase = "";
      randomContentColor = new Color(0xfff1c40f);
      randomButtonColor = new Color(0xfff1c40f);
    }
  }

  void whoNowPlaying() {
    print("whoNowPlaying");
    isRefreshDisplayable = false;
    if (refreshPossible-- > 0) {
      isRefreshDisplayable = true;
    }

    String mate = "";
    if (isTeamAPlaying) {
      if (playerRedList.length > 2) {
        mate = "l'équipe Rouge";
      } else {
        if (random == 0)
          mate = playerRedList[1];
        else
          mate = playerRedList[0];
      }
    } else {
      if (playerYellowList.length > 2) {
        mate = "l'équipe Jaune";
      } else {
        if (random == 0)
          mate = playerYellowList[1];
        else
          mate = playerYellowList[0];
      }
    }
    print("whoNowPlaying step2" + random.toString());
    String player = "";
    if (isTeamAPlaying && random < playerRedList.length) {
      player = playerRedList[random];
    } else if (!isTeamAPlaying && random < playerYellowList.length)
      player = playerYellowList[random];

    print("whoNowPlaying step3");

    var value = listPhrases[Random().nextInt(listPhrases.length)];
    value = "${value[0].toUpperCase()}${value.substring(1)}";

    randomPlayer =
        player + ", avec complicité, tu dois faire deviner à " + mate + ":\n";
    randomPhrase = value + "\n";
  }

  void _changePhrase() {
    setState(() {
      whoNowPlaying();
    });
  }

  void _changeGameStep() {
    setState(() {
      print("_changeGameStep");

      // if (isCheating && !isGameOver) {
      //   myInterstitial.show();
      //   isCheating = false;

      //   print("CHEATED");
      // }

      if (isGameOver) {
        // myInterstitial.show();
        Appodeal.show(AdType.INTERSTITIAL, placementName: "inter");
        isCheating = false;

        print("NOT CHEATING");
        scoreA = 0;
        scoreB = 0;
        //add Unity ads
        // Navigator.pop(context);
        Navigator.popUntil(context, (r) => r.settings.name == Routes.firstPage);
        isGameOver = false;
        return;
      }

      if (isStep1Phone) {
        _isVisibility = false;
        isHidden = false;
        iconDisplay = Icons.visibility_off_outlined;
        whoPlay();
      } else {
        _isVisibility = true;
        isHidden = false;
        iconDisplay = Icons.visibility_off_outlined;
        whoNowPlaying();
      }

      isStep1Phone = !isStep1Phone;

      if (isStep1Phone)
        print("true");
      else
        print("false");

      if (!isGameOver) {
        randomBackgroundColor = new Color(0xff39465a);
        if (isTeamAPlaying) {
          randomContentColor = new Color(0xffe84c3d);
          randomButtonColor = new Color(0xffe84c3d);
        } else {
          randomContentColor = new Color(0xfff1c40f);
          randomButtonColor = new Color(0xfff1c40f);
        }
      }

      if (isCheating && scoreA + scoreB == 0) {
        Appodeal.show(AdType.INTERSTITIAL, placementName: "inter");
      }
      isCheating = true;
    });
  }

  void _changeGameStepSuccess() {
    print("1sucess");
    setState(() {
      randomContentColor = colorCopy;
      if (isTeamAPlaying)
        ++scoreA;
      else
        ++scoreB;

      print("2sucess");

      print(isStep1Phone.toString());
      // if (isStep1Phone)
      //   whoPlay();
      // else
      //   whoNowPlaying();

      if (isStep1Phone) {
        _isVisibility = false;
        isHidden = false;
        whoPlay();
      } else {
        _isVisibility = true;
        isHidden = false;
        whoNowPlaying();
      }

      isStep1Phone = !isStep1Phone;
      if (!isGameOver) {
        randomBackgroundColor = new Color(0xff39465a);
        if (isTeamAPlaying) {
          randomContentColor = new Color(0xffe84c3d);
          randomButtonColor = new Color(0xffe84c3d);
        } else {
          randomContentColor = new Color(0xfff1c40f);
          randomButtonColor = new Color(0xfff1c40f);
        }
      }
    });
  }

  void _changeGameStepEchec() {
    setState(() {
      randomContentColor = colorCopy;
      if (!isTeamAPlaying)
        ++scoreA;
      else
        ++scoreB;

      if (isStep1Phone) {
        _isVisibility = false;
        isHidden = false;
        iconDisplay = Icons.visibility_off_outlined;
        whoPlay();
      } else {
        _isVisibility = true;
        isHidden = false;
        iconDisplay = Icons.visibility_off_outlined;
        whoNowPlaying();
      }

      isStep1Phone = !isStep1Phone;
      if (!isGameOver) {
        randomBackgroundColor = new Color(0xff39465a);
        if (isTeamAPlaying) {
          randomContentColor = new Color(0xffe84c3d);
          randomButtonColor = new Color(0xffe84c3d);
        } else {
          randomContentColor = new Color(0xfff1c40f);
          randomButtonColor = new Color(0xfff1c40f);
        }
      }
    });
  }

// void _IsButtonToShow(bool visibility) {
//     setState(() {
//         visibilityTag = visibility;
//       }
//     });
//   }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: randomBackgroundColor,
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Stack(alignment: Alignment.center, children: <Widget>[
                        new Image(
                          image: new AssetImage('assets/images/redlogo.png'),
                          height: 42.00,
                          width: 42.00,
                        ),
                        Text(
                          '$scoreA',
                          style: TextStyle(
                              fontFamily: "Modelica",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: new Color(0xff39465a)),
                        ),
                      ]),
                      Text(
                        '$player1',
                        style: teamA,
                      ),
                      Text(
                        '$player2',
                        style: teamA,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          new Image(
                            image:
                                new AssetImage('assets/images/yellowlogo.png'),
                            height: 42.00,
                            width: 42.00,
                          ),
                          Text(
                            '$scoreB',
                            style: TextStyle(
                                fontFamily: "Modelica",
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: new Color(0xff39465a)),
                          ),
                        ],
                      ),
                      Text(
                        '$player3',
                        style: teamB,
                      ),
                      Text(
                        '$player4',
                        style: teamB,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              '$randomPlayer',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 35,
                color: randomButtonColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$randomPhrase',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 35,
                color: randomContentColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            Visibility(
              visible: _isVisibility,
              child: IconButton(
                icon: Icon(
                  iconDisplay,
                  color: Colors.white,
                ),
                tooltip: 'Montrer/Cacher le mot',
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                    if (isHidden) {
                      iconDisplay = Icons.remove_red_eye_outlined;
                      colorCopy = randomContentColor;
                      randomContentColor = randomBackgroundColor;
                      print("je cache");
                    } else {
                      print("je montre");
                      iconDisplay = Icons.visibility_off_outlined;
                      randomContentColor = colorCopy;
                    }
                  });
                },
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
                      onPressed: _changeGameStep,
                      tooltip: 'Commencer à jouer',
                      label: Text("Prêt",
                          style: TextStyle(color: randomButtonColor)),
                      icon: Icon(
                        Icons.play_circle_fill,
                        color: randomButtonColor,
                      ),
                    ),
                    visible: !isStep1Phone,
                  ),
                  Visibility(
                    child: FloatingActionButton.extended(
                      heroTag: "btn2",
                      backgroundColor: new Color(0xffffffff),
                      onPressed: _changeGameStepEchec,
                      tooltip: 'Ajoute un point à l\'équipe adverse',
                      label: Text("Echec",
                          style: TextStyle(color: randomButtonColor)),
                      icon: Icon(
                        Icons.cancel,
                        color: randomButtonColor,
                      ),
                    ),
                    visible: isStep1Phone,
                  ),
                  Visibility(
                    child: FloatingActionButton.extended(
                      heroTag: "btn3",
                      backgroundColor: new Color(0xffffffff),
                      onPressed: _changeGameStepSuccess,
                      tooltip: 'Ajoute un point à votre équipe',
                      label: Text("Succès",
                          style: TextStyle(color: randomButtonColor)),
                      icon: Icon(
                        Icons.check_circle,
                        // Icons.verified,
                        color: randomButtonColor,
                      ),
                    ),
                    visible: isStep1Phone,
                  ), // This trailing comma makes auto-formatting nicer for build methods.
                  Visibility(
                    child: FloatingActionButton(
                      heroTag: "btn4",
                      backgroundColor: new Color(0xffffffff),
                      onPressed: _changePhrase,
                      tooltip: 'Repioche un mot',
                      child: Icon(
                        Icons.cached,
                        color: randomButtonColor,
                      ),
                    ),
                    visible: isRefreshDisplayable,
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
