import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:solarsystem/pages/home_page.dart';
import 'package:solarsystem/pages/login_page.dart';
import 'package:solarsystem/pages/register_page.dart';
import 'package:solarsystem/pages/splash_page.dart';
import 'package:solarsystem/pages/terms_and_conditions_page.dart';
import 'package:solarsystem/provider/google_sign_in.dart';
import 'pages/get_started_page.dart';

//Future<void> main() async {
  Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  SystemChrome.setPreferredOrientations([
    //vai funcionar apenas na vertical
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // runApp(ChangeNotifierProvider(
  //   create: (context) => ApplicationState(),
  //   builder: (context, _) => MyApp(),
  // ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'Keep Looking Up',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        initialRoute: '/splash',
        routes: {
          '/splash': (_) => SplashPage(),
          '/start': (_) => const GetStartedPage(),
          '/register': (_) => const RegisterPage(),
          '/terms': (_) => const TermsPage(),
          '/login': (_) => const LoginPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
