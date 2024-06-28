import 'package:flutter/material.dart';
import 'package:lejeudelacomplicite/main.dart';
import "constants/ListPhrases.dart";
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:appodeal_flutter/appodeal_flutter.dart';

// <--
// GamePage here
// -->

class Parameters extends StatefulWidget {
  @override
  Parameters();
  _Parameters createState() => _Parameters();
}

class _Parameters extends State<Parameters> {
  _Parameters();

  void initState() {
    // UnityAds.init(
    //   gameId: "4049679",
    //   testMode: false,
    //   listener: (state, args) => print('Init Listener: $state => $args'),
    // );

    // MobileAds.instance.initialize();

    // paramBanner.load();
    super.initState();
  }

  // final BannerAd paramBanner = BannerAd(
  //   // adUnitId: 'ca-app-pub-3940256099942544/6300978111', //testmode
  //   adUnitId: 'ca-app-pub-9876543056881069/9212803516',
  //   size: AdSize.fullBanner,
  //   request: AdRequest(),
  //   listener: AdListener(),
  // );

  Widget build(BuildContext context) {
    Widget _buildPopupDialog(BuildContext context) {
      return new AlertDialog(
        title: const Text('Raté !'),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Sélectionne au moins une catégorie de mots pour jouer."),
          ],
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Ok, j\'ai compris'),
          ),
        ],
      );
    }

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

    return new Scaffold(
      backgroundColor: new Color(0xff39465a),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 50.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(
                  Icons.settings,
                  color: new Color(0xffffffff),
                ),
                Text(
                  '   Options',
                  style: style21,
                )
              ]),
            ),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 42.0, left: 7.5, right: 7.5),
                child: Text(
                  'Sélectionner le nombre de repioches possibles.',
                  style: style14,
                ),
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: new Color(0xfff1c40f),
                disabledActiveTickMarkColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                inactiveTickMarkColor: new Color(0xff39465a),
                trackHeight: 3.0,
                thumbColor: new Color(0xfff1c40f),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
                overlayColor: new Color(0xfff1c40f).withAlpha(32),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
              ),
              child: Slider(
                value: globaleRefreshPossible,
                min: 0,
                max: 10,
                divisions: 10,
                label: globaleRefreshPossible.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    globaleRefreshPossible = value;
                  });
                },
              ),
            ),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.only(top: 21.0, left: 7.5, right: 7.5),
                child: Text(
                  'Sélectionner les catégories de mots avec lesquelles jouer.',
                  style: style14,
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isAnimalChecked,
                  onChanged: (value) {
                    setState(() {
                      isAnimalChecked = !isAnimalChecked;
                      changeList();
                    });
                  },
                ),
                Container(
                  width: 110,
                  child: Text('Animaux', style: style14nobold),
                ),
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isItemsChecked,
                  onChanged: (value) {
                    setState(() {
                      isItemsChecked = !isItemsChecked;
                      changeList();
                    });
                  },
                ),
                Text('Objets', style: style14nobold),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isSportChecked,
                  onChanged: (value) {
                    setState(() {
                      isSportChecked = !isSportChecked;
                      changeList();
                    });
                  },
                ),
                Container(
                    width: 110, child: Text('Sports', style: style14nobold)),
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isCountriesChecked,
                  onChanged: (value) {
                    setState(() {
                      isCountriesChecked = !isCountriesChecked;
                      changeList();
                    });
                  },
                ),
                Text('Pays', style: style14nobold),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isMoviesChecked,
                  onChanged: (value) {
                    setState(() {
                      isMoviesChecked = !isMoviesChecked;
                      changeList();
                    });
                  },
                ),
                Container(
                  width: 110,
                  child: Text('Films/Séries', style: style14nobold),
                ),
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isStarChecked,
                  onChanged: (value) {
                    setState(() {
                      isStarChecked = !isStarChecked;
                      changeList();
                    });
                  },
                ),
                Text('Célébrités', style: style14nobold),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isFoodChecked,
                  onChanged: (value) {
                    setState(() {
                      isFoodChecked = !isFoodChecked;
                      changeList();
                    });
                  },
                ),
                Container(
                  width: 110,
                  child: Text('Nourriture', style: style14nobold),
                ),
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isJobChecked,
                  onChanged: (value) {
                    setState(() {
                      isJobChecked = !isJobChecked;
                      changeList();
                    });
                  },
                ),
                Text('Métiers', style: style14nobold),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isColorChecked,
                  onChanged: (value) {
                    setState(() {
                      isColorChecked = !isColorChecked;
                      changeList();
                    });
                  },
                ),
                Container(
                  width: 110,
                  child: Text('Couleurs', style: style14nobold),
                ),
                Checkbox(
                  activeColor: new Color(0xffe84c3d),
                  value: isTransportChecked,
                  onChanged: (value) {
                    setState(() {
                      isTransportChecked = !isTransportChecked;
                      changeList();
                    });
                  },
                ),
                Text('Transports', style: style14nobold),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 21.0),
              child: FloatingActionButton.extended(
                heroTag: "btn00",
                backgroundColor: new Color(0xffffffff),
                onPressed: () {
                  if (listPhrases.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                    return;
                  } else
                    Navigator.pop(context);
                },
                label: Text("Retour au menu",
                    style: TextStyle(
                      color: new Color(0xff39465a),
                    )),
                icon: Icon(
                  Icons.keyboard_return,
                  color: new Color(0xff39465a),
                ),
              ),
            ),
            // Expanded(child: Column()),
            // Expanded(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       UnityBannerAd(
            //         placementId: "Banner_Android",
            //         listener: (state, args) {
            //           print('Banner Listener: $state => $args');
            //         },
            //       )
            //     ],
            //   ),
            // ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: AppodealBanner(placementName: "banner"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
