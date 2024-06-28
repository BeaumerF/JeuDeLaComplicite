import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lejeudelacomplicite/Parameters.dart';
import 'package:lejeudelacomplicite/constants/ListPhrases.dart';
import 'GamePage.dart';
import 'Rules.dart';
import 'textfieldbubble.dart';
import 'package:share/share.dart';
import 'package:in_app_review/in_app_review.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:appodeal_flutter/appodeal_flutter.dart';

class Routes {
  static const String firstPage = '/';
}

final InAppReview inAppReview = InAppReview.instance;

var playerList = ["", "", "", ""];
List<String> playerRedList;
List<String> playerYellowList;
int scoreA = 0;
int scoreB = 0;
int scoreMax = 4;
double globaleRefreshPossible = 2;

bool isSportChecked = true;
bool isAnimalChecked = true;
bool isStarChecked = true;
bool isItemsChecked = true;
bool isMoviesChecked = true;
bool isCountriesChecked = true;
bool isJobChecked = true;
bool isFoodChecked = true;
bool isColorChecked = true;
bool isTransportChecked = true;

bool isGameAlreadyPlayed = false;
bool isTutorialMenu = false;
bool isCheating = false;

int step = 1;

void changeList() {
  listPhrases = new List<String>();

  if (isSportChecked) listPhrases.addAll(ListSports);
  if (isAnimalChecked) listPhrases.addAll(listAnimals);
  if (isCountriesChecked) listPhrases.addAll(listCountries);
  if (isItemsChecked) listPhrases.addAll(listItems);
  if (isMoviesChecked) listPhrases.addAll(listMovies);
  if (isStarChecked) listPhrases.addAll(listStars);

  if (isFoodChecked) listPhrases.addAll(listFood);
  if (isColorChecked) listPhrases.addAll(listColors);
  if (isJobChecked) listPhrases.addAll(listJobs);
  if (isTransportChecked) listPhrases.addAll(listTransport);
}

bool isGameOver = false;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  playerRedList = new List<String>();
  playerYellowList = new List<String>();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

// final BannerAd myBanner = BannerAd(
//   // adUnitId: 'ca-app-pub-3940256099942544/6300978111', //testmode
//   adUnitId: 'ca-app-pub-9876543056881069/4635619470',
//   size: AdSize.fullBanner,
//   request: AdRequest(),
//   listener: AdListener(),
// );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle style21 = new TextStyle(
      inherit: true,
      color: Colors.white,
      fontSize: 21.0,
    );

    return new MaterialApp(
      title: 'Le jeu de la complicité',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Home Page'),
      // routes: <String, WidgetBuilder>{
      //   "/GamePage": (BuildContext context) => new GamePage(),
      // },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    // UnityAds.init(
    //   gameId: "4049679",
    //   testMode: false,
    //   listener: (state, args) => print('Init Listener: $state => $args'),
    // );

    changeList();

    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 10),
    );

    // myBanner.load();
    animationController.repeat();

    Appodeal.setAppKeys(
      androidAppKey: '',
      iosAppKey: '',
    );

    // Defining the callbacks
    Appodeal.setBannerCallback(
        (event) => print('Banner ad triggered the event $event'));
    Appodeal.setMrecCallback(
        (event) => print('MREC ad triggered the event $event'));
    Appodeal.setInterstitialCallback(
        (event) => print('Interstitial ad triggered the event $event'));
    Appodeal.setRewardCallback(
        (event) => print('Reward ad triggered the event $event'));
    Appodeal.setNonSkippableCallback(
        (event) => print('Non-skippable ad triggered the event $event'));

    Appodeal.initialize(
        hasConsent: false, adTypes: [AdType.BANNER, AdType.INTERSTITIAL]);
  }

  Widget build(BuildContext context) {
    @override
    int scoreA = 0;
    int scoreB = 0;

    TextStyle style21 = new TextStyle(
      inherit: true,
      color: Colors.white,
      fontSize: 21.0,
    );
    TextStyle style14 = new TextStyle(
      inherit: true,
      color: Colors.white,
      fontSize: 14.0,
    );
    TextStyle colora = new TextStyle(
      inherit: true,
      color: new Color(0xffe84c3d),
      fontSize: 21.0,
    );
    TextStyle colorb = new TextStyle(
      inherit: true,
      color: new Color(0xfff1c40f),
      fontSize: 21.0,
    );
    TextStyle coloramini = new TextStyle(
      inherit: true,
      color: new Color(0xffe84c3d),
      fontSize: 12.0,
    );
    TextStyle colorbmini = new TextStyle(
      inherit: true,
      color: new Color(0xfff1c40f),
      fontSize: 12.0,
    );
    TextStyle coloraminibold = new TextStyle(
      inherit: true,
      fontWeight: FontWeight.bold,
      color: new Color(0xffe84c3d),
      fontSize: 12.0,
    );
    TextStyle colorbminibold = new TextStyle(
      inherit: true,
      fontWeight: FontWeight.bold,
      color: new Color(0xfff1c40f),
      fontSize: 12.0,
    );
    Text button = new Text(
      'Go',
      style: style21,
    );

    Widget _buildPopupDialog(BuildContext context) {
      return new AlertDialog(
        title: const Text('Minimum requis'),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Il faut minimum 2 joueurs dans chaque équipe."),
          ],
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Ok'),
          ),
        ],
      );
    }

    Widget _buildPopupDialogPhrases(BuildContext context) {
      return new AlertDialog(
        title: const Text('Oups'),
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

    ;

    return new Scaffold(
      backgroundColor: new Color(0xff39465a),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
              padding: const EdgeInsets.only(top: 35.0, bottom: 30),
              child: Stack(alignment: Alignment.center, children: <Widget>[
                new AnimatedBuilder(
                  animation: animationController,
                  child: new Container(
                    height: 100.0,
                    width: 100.0,
                    child: new Image.asset('assets/images/around.png'),
                  ),
                  builder: (BuildContext context, Widget _widget) {
                    return new Transform.rotate(
                      angle: animationController.value * 6.3,
                      child: _widget,
                    );
                  },
                ),
                new Image(
                  image: new AssetImage('assets/images/hands.png'),
                  height: 90.00,
                  width: 90.00,
                ),
              ]),
              // new Image(
              //   image: new AssetImage('assets/images/logo2.png'),
              //   height: 100.00,
              //   width: 100.00,
              // ),
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                new Container(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
                  child: Textfieldbubble(
                      textFieldStyler: TextFieldStyler(
                        contentPadding: const EdgeInsets.only(
                            left: 10, right: 0, top: 25, bottom: 25),
                        // label: "Équipe rouge",

                        //These are properties you can tweek for customization
                        textFieldFilled: false,
                        helperText: "",
                        hintText: "Ajouter des joueurs",
                        hintStyle: coloramini,
                        textStyle: style14,
                        textFieldEnabled: true,
                        textFieldBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        textFieldFocusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xffe84c3d)),
                        ),
                      ),
                      tagsStyler: TagsStyler(
                        tagTextStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        tagDecoration: BoxDecoration(
                          color: Color(0xffe84c3d),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        tagCancelIcon: Icon(Icons.cancel,
                            size: 16.0,
                            color: Color.fromARGB(255, 235, 214, 214)),
                        tagPadding: const EdgeInsets.all(10.0),
                        //These are properties you can tweek for customization

                        // showHashtag = false,
                        // EdgeInsets tagPadding = const EdgeInsets.all(4.0),
                        // EdgeInsets tagMargin = const EdgeInsets.symmetric(horizontal: 4.0),
                        // BoxDecoration tagDecoration = const BoxDecoration(color: Color.fromARGB(255, 74, 137, 92)),
                        // TextStyle tagTextStyle,
                        // Icon tagCancelIcon = const Icon(Icons.cancel, size: 18.0, color: Colors.green)
                      ),
                      onTag: (tag) {
                        if (!playerRedList.contains(tag))
                          playerRedList.add(tag);

                        debugPrint(playerRedList.length.toString());
                        //This give you the tag that was entered

                        //print(tag)
                      },
                      onDelete: (tag) {
                        if (playerRedList.contains(tag))
                          playerRedList.remove(tag);
                        debugPrint(playerRedList.length.toString());
                        //This gives you the tag that was deleted

                        //print(tag)
                      }),
                ),
                Container(
                  color: new Color(0xff39465a),
                  child: Text(
                    " Équipe rouge ",
                    style: coloraminibold,
                  ),
                ),
              ],
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                new Container(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 25.0, right: 25.0, bottom: 10),
                  child: Textfieldbubble(
                      textFieldStyler: TextFieldStyler(
                        contentPadding: const EdgeInsets.only(
                            left: 10, right: 0, top: 25, bottom: 25),
                        // label: "Équipe rouge",

                        //These are properties you can tweek for customization
                        textFieldFilled: false,
                        helperText: "",
                        hintText: "Ajouter des joueurs",
                        hintStyle: colorbmini,
                        textStyle: style14,
                        textFieldEnabled: true,
                        textFieldBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        textFieldFocusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(90.0),
                          borderSide: BorderSide(
                            width: 1,
                            color: Color(0xfff1c40f),
                          ),
                        ),
                      ),
                      tagsStyler: TagsStyler(
                        tagTextStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        tagDecoration: BoxDecoration(
                          color: Color(0xfff1c40f),
                          borderRadius: BorderRadius.circular(90.0),
                        ),
                        tagCancelIcon: Icon(Icons.cancel,
                            size: 16.0,
                            color: Color.fromARGB(255, 235, 214, 214)),
                        tagPadding: const EdgeInsets.all(10.0),
                        //These are properties you can tweek for customization

                        // showHashtag = false,
                        // EdgeInsets tagPadding = const EdgeInsets.all(4.0),
                        // EdgeInsets tagMargin = const EdgeInsets.symmetric(horizontal: 4.0),
                        // BoxDecoration tagDecoration = const BoxDecoration(color: Color.fromARGB(255, 74, 137, 92)),
                        // TextStyle tagTextStyle,
                        // Icon tagCancelIcon = const Icon(Icons.cancel, size: 18.0, color: Colors.green)
                      ),
                      onTag: (tag) {
                        if (!playerYellowList.contains(tag))
                          playerYellowList.add(tag);

                        debugPrint(playerYellowList.length.toString());
                        //This give you the tag that was entered

                        //print(tag)
                      },
                      onDelete: (tag) {
                        if (playerYellowList.contains(tag))
                          playerYellowList.remove(tag);
                        debugPrint(playerRedList.length.toString());
                        //This gives you the tag that was deleted

                        //print(tag)
                      }),
                ),
                Container(
                  color: new Color(0xff39465a),
                  child: Text(
                    " Équipe jaune ",
                    style: colorbminibold,
                  ),
                ),
              ],
            ),
            // new Container(
            //   padding:
            //       const EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
            //   child: new TextFormField(
            //     maxLength: 25,
            //     onChanged: (String text) => setState(() {
            //       playerList[0] = text;
            //     }),
            //     decoration: new InputDecoration(
            //         counterText: '',
            //         hintText: "Joueur 1, équipe rouge",
            //         hintStyle: colora),
            //     style: colora,
            //   ),
            // ),
            // new Container(
            //   padding:
            //       const EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
            //   child: new TextField(
            //     maxLength: 25,
            //     onChanged: (String text) => setState(() {
            //       playerList[1] = text;
            //     }),
            //     decoration: new InputDecoration(
            //         counterText: '',
            //         hintText: "Joueur 2, équipe rouge",
            //         hintStyle: colora),
            //     style: colora,
            //   ),
            // ),
            // new Container(
            //   padding: const EdgeInsets.only(top: 5.0, left: 25.0, right: 25.0),
            //   child: new TextField(
            //     maxLength: 25,
            //     onChanged: (String text) => setState(() {
            //       playerList[2] = text;
            //     }),
            //     decoration: new InputDecoration(
            //         counterText: '',
            //         hintText: "Joueur 1, équipe jaune",
            //         hintStyle: colorb),
            //     style: colorb,
            //   ),
            // ),
            // new Container(
            //   padding: const EdgeInsets.only(
            //       top: 5.0, left: 25.0, right: 25.0, bottom: 25.0),
            //   child: new TextField(
            //     maxLength: 25,
            //     onChanged: (String text) => setState(() {
            //       playerList[3] = text;
            //     }),
            //     decoration: new InputDecoration(
            //         counterText: '',
            //         hintText: "Joueur 2, équipe jaune",
            //         hintStyle: colorb),
            //     style: colorb,
            //   ),
            // ),

            // new Container(
            //   padding: const EdgeInsets.only(top: 35.0),
            //   child: new FlatButton(
            //     child: button,
            //     onPressed: () {
            //       if (playerList[0] == "" ||
            //           playerList[1] == "" ||
            //           playerList[2] == "" ||
            //           playerList[3] == "") {
            //         showDialog(
            //           context: context,
            //           builder: (BuildContext context) =>
            //               _buildPopupDialog(context),
            //         );
            //         return;
            //       }
            //       scoreB = 0;
            //       scoreA = 0;
            //       Navigator.push(
            //           context,
            //           new MaterialPageRoute(
            //               builder: (BuildContext context) => new GamePage()));
            //     },
            //   ),
            // ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton.extended(
                  heroTag: "btn0",
                  backgroundColor: new Color(0xffffffff),
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new Parameters()));
                  },
                  tooltip: 'Personnaliser les règles.',
                  label: Text("Options",
                      style: TextStyle(
                        color: new Color(0xff39465a),
                      )),
                  icon: Icon(
                    Icons.settings,
                    color: new Color(0xff39465a),
                  ),
                ),
                FloatingActionButton.extended(
                  heroTag: "btn1",
                  backgroundColor: new Color(0xffffffff),
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
                    if (playerRedList.length < 2 ||
                        playerYellowList.length < 2) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context),
                      );
                      return;
                    }
                    if (listPhrases.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialogPhrases(context),
                      );
                      return;
                    }

                    scoreB = 0;
                    scoreA = 0;
                    if (!isGameAlreadyPlayed) {
                      isTutorialMenu = false;
                      step = 1;
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) => new Rules()));
                    } else
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new GamePage()));
                  },
                  tooltip: 'Démarrer le jeu.',
                  label: Text("Jouer",
                      style: TextStyle(
                        color: new Color(0xffe84c3d),
                      )),
                  icon: Icon(
                    Icons.videogame_asset,
                    color: new Color(0xfff1c40f),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 30.0),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: FlatButton(
                  color: Colors.transparent,
                  textColor: Colors.white,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new Icon(Icons.info, color: Colors.white),
                        new Text('  Règles du jeu', style: style14),
                      ]),
                  onPressed: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
                    step = 1;
                    isTutorialMenu = true;
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) => new Rules()));
                  },
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: FlatButton(
                color: Colors.transparent,
                textColor: Colors.white,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  new Icon(Icons.share, color: Colors.white),
                  new Text('  Partager', style: style14),
                ]),
                onPressed: () {
                  Share.share(
                      'A votre tour de tester votre complicité avec https://play.google.com/store/apps/details?id=com.pimang.lejeudelacomplicite');
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: FlatButton(
                color: Colors.transparent,
                hoverColor: Colors.transparent,
                textColor: Colors.white,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  new Icon(Icons.star, color: Colors.white),
                  new Text('  Noter l\'application', style: style14),
                ]),
                onPressed: () {
                  inAppReview.requestReview();
                },
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: AppodealBanner(
                    placementName: "banner",
                  ),
                ),
              ),
            ),

            // UnityBannerAd(
            //   placementId: "Banner_Android",
            //   listener: (state, args) {
            //     print('Banner Listener: $state => $args');
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
