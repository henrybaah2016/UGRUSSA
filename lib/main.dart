import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ugrussa/document_upload/news_upload.dart';
import 'package:ugrussa/home/home.dart';
import 'package:ugrussa/login/login.dart';
import 'package:ugrussa/signup/signup.dart';
import 'package:ugrussa/splash/splash.dart';
import 'package:ugrussa/student/details.dart';
import 'package:ugrussa/student/join.dart';
import 'package:ugrussa/student/list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' ',
      theme: ThemeData(
        // fontFamily: 'SanFrancisco',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Splash(),
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        SignupPage.routeName: (ctx) => SignupPage(),
        LoginPage.routeName: (ctx) => LoginPage(),
        DetailsPage.routeName: (ctx) => DetailsPage(),
        JoinPage.routeName: (ctx) => JoinPage(),
        ListPage.routeName: (ctx) => ListPage(),
        Splash.routeName: (ctx) => Splash(),
        NewsUpload.routeName: (ctx) => NewsUpload(),
      },
    );
  }
}
