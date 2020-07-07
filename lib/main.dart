import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final lightText = Colors.white;
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
        backgroundColor: Color.fromRGBO(46, 72, 87, 1),
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: WelcomeSlide(),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Add your onPressed code here!
          },
          elevation: 1,
          label: Text('Get Started'),
          backgroundColor: Colors.pink),
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
  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
      onHorizontalDragStart: (DragStartDetails detailsStart) {
        print("Start");
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        print(details);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage('assets/images/welcome.png'),
            height: 200,
            width: 200,
          ),
          Text(
            "Welcome to Momento",
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            "We schedule your activity",
            style: Theme.of(context).textTheme.headline3,
          )
        ],
      ),
    ));
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

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 1;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add_circle, size: 20),
            ),
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: Icon(Icons.remove_circle),
            )
          ],
        )

        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
