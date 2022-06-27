import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
import 'package:solarsystem/pages/get_started_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    Future.delayed(Duration(seconds: 6)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => GetStartedPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: const [
            Color.fromARGB(255, 109, 96, 158),
            Color.fromARGB(255, 77, 64, 122),
            Color.fromARGB(255, 48, 39, 83),
            Color.fromARGB(255, 37, 27, 77),
          ],
          stops: const [0.1, 0.4, 0.7, 0.9],
        )),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Lottie.asset('assets/lottie.json'),
          ),
        ));
  }
}
