import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth.dart';
import 'navigate.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
  var initializationSettingsAndroid =
      new AndroidInitializationSettings('@mipmap/ic_launcher');
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidRecieveLocalNotification);

    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) {
        print('on message ${message}');
        displayNotification(message);
      },
      onResume: (Map<String, dynamic> message) {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) {
        print('on launch $message');
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      print(token);
    });
  }

  Future displayNotification(Map<String, dynamic> message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'channelid', 'Recyclops', 'channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      message['notification']['title'],
      message['notification']['body'],
      platformChannelSpecifics,
      payload: 'hello',
    );
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Fluttertoast.showToast(
        msg: "Notification Clicked",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future onDidRecieveLocalNotification(
      int id, String title, String body, String payload) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => new CupertinoAlertDialog(
        title: new Text(title),
        content: new Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: new Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Fluttertoast.showToast(
                  msg: "Notification Clicked",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.black54,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/logo2.png"),
              height: 250.0,
            ),
            SizedBox(height: 30),
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
          Navigator.pushNamed(context, 'home');
        }
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
