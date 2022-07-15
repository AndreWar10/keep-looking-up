import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  //salvar
  static const String _key = 'key';

  static save(String user) async {
    var prefs = await SharedPreferences.getInstance(); //getInstance garante que em qualquer outro lugar da aplicação será a mesma instancia
    prefs.setString(
      _key,
      //vai transformar esse mapa numa string de Json
      jsonEncode({"user": user, "isAuth": true}),
    );
  }

  //verificar ase ta autenticado ou nao
  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance(); 

    var jsonResult = prefs.getString(_key);

    if(jsonResult != null) {
      var mapUser = jsonDecode(jsonResult);
      return mapUser['isAuth'];
    }

    return false;

  }

  static logout() async {
    var prefs = await SharedPreferences.getInstance(); //getInstance garante que em qualquer outro lugar da aplicação será a mesma instancia
    await prefs.remove(_key);
  }


}