import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
import 'package:solarsystem/services/prefs_service.dart';

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

 Future.wait([
      PrefsService.isAuth(),
      Future.delayed(Duration(seconds: 6))])
      .then((value) => value[0] //se o user ja foi autenticado ele retorna um boll <0>
        ? Navigator.of(context).pushReplacementNamed('/home')
        : Navigator.of(context).pushReplacementNamed('/start'));

    //Tempo de espera quando inicia o App, e depois direcionar para a primeira pagina do App, usando
    //pushReplacementNamed para nao dar ao usuario a opção de voltar a tela inicial, sobrepondo a Splash

    // Future.delayed(Duration(seconds: 3)).then(
    //   (_) => Navigator.of(context).pushReplacementNamed('/login'),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background/bg.png', 
            ),
            fit: BoxFit.cover,
          ),),
        
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Lottie.asset('assets/lottie.json'),
          ),
        ));
  }
}







