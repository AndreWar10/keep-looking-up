import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solarsystem/models/planets_model.dart';

class PlanetsController {

ValueNotifier<List<Planets>?> planets = ValueNotifier<List<Planets>?>([]);

callAPI() async {
      var client = http.Client();
      var response = await client.get(Uri.parse('https://api-solar-system.herokuapp.com/planets'),);
      var decodedResponse = jsonDecode(response.body) as List; //retorno tipado como lista
      //print(decodedResponse[2]);
      return planets.value = decodedResponse.map((e) => Planets.fromJson(e)).toList(); //map = mapeamento../interação e retornando um objeto de lista no final
      
      //await Future.delayed(Duration(seconds: 2));

      //print(posts);
      //client.close();
    
  }





}