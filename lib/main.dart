import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class ResponsiveSize {
  final BuildContext context;
  final ratio = 0.5;
  ResponsiveSize(this.context);

  double get width => MediaQuery.of(this.context).size.width * ratio;
  double get height => MediaQuery.of(this.context).size.width * ratio;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final lightText = Colors.black;
    final fontFamilyText = GoogleFonts.lato;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        textTheme: TextTheme(
            headline1: fontFamilyText(fontSize: 24, color: lightText),
            headline3: fontFamilyText(
                fontSize: 20, color: lightText, fontWeight: FontWeight.w300)),

        // GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
        primaryColor: Colors.indigo,
        primaryColorLight: Colors.white,
        backgroundColor: Colors.white,
        // backgroundColor: Color.fromRGBO(46, 72, 87, 1),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomePage(),
    );
  }
}

// class SecondPage extends StatelessWidget {
//   @override
//   _SecondPage create() => _SecondPage();
// }

class WelcomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final responsive = ResponsiveSize(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: WelcomeSlide(),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(20.0),
        width: responsive.width,
        child: FloatingActionButton.extended(
            onPressed: () {
              // Add your onPressed code here!
            },
            elevation: 1,
            label: Text('Get Started'),
            backgroundColor: Colors.pink),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class WelcomeSlide extends StatefulWidget {
  WelcomeSlide({Key key}) : super(key: key);

  @override
  _FirstWelcomeSlide createState() => _FirstWelcomeSlide();
}

class _FirstWelcomeSlide extends State<WelcomeSlide> {
  final PageController ctrl = PageController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: PageView(
      scrollDirection: Axis.horizontal,
      controller: ctrl,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 4 / 12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                        image: AssetImage('assets/images/welcome.png'),
                        fit: BoxFit.fill),
                    Text("Welcome to Momento",
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center),
                    Text(
                      "We schedule your activity",
                      style: Theme.of(context).textTheme.headline3,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Expanded(
              child: AspectRatio(
            aspectRatio: 4 / 12,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                      image: AssetImage('assets/images/welcome-2.png'),
                      fit: BoxFit.fill),
                  Text("Organize your life is easier more than you think",
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center),
                  Text("Support voice command to make easier",
                      style: Theme.of(context).textTheme.headline3,
                      textAlign: TextAlign.center),
                ]),
          ))
        ]),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 4 / 12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/welcome-3.png'),
                      fit: BoxFit.fill,
                    ),
                    Text("We sync your notes to another device",
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center),
                    Text("Android, iOS, and Web support",
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
            )
          ],
        )
      ],
    ));
  }
}
