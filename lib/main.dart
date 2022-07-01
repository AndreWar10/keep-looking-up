import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solarsystem/pages/home_page.dart';
import 'package:solarsystem/pages/login_page.dart';
import 'package:solarsystem/pages/register_page.dart';
import 'package:solarsystem/pages/splash_page.dart';
import 'package:solarsystem/pages/terms_and_conditions_page.dart';
import 'pages/get_started_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    //vai funcionar apenas na vertical
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
