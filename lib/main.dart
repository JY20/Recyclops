import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'navigate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recyclops',
      initialRoute: 'initial',
      routes: {
        'initial': (context) => MyHomePage(),
        'home': (context) => Navigate(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.account_circle, size: 200, color: Colors.amber),
            SizedBox(height: 50),
            Text(
              'Welcome To Recyclops',
              style: TextStyle(fontSize: 30, color: Colors.yellow[900]),
            ),
            SizedBox(height: 50),
            _signInButton(),
          ],
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }

  Widget _signInButton() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 0.9, color: Colors.grey[850]),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        if (authservice.signIn12() != null) {
          print('ss');
          Navigator.pushNamed(context, 'home');
        }
        print('null');
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image(
              image: AssetImage("assets/google_logo.png"),
              height: 35.0,
            ),
            Padding(padding: const EdgeInsets.only(left: 10)),
            Text(
              'Sign in with Google',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
