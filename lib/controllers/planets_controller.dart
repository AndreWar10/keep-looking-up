import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solarsystem/models/planets_model.dart';

abstract class IPlanetRepository{
    Future<List<Planets>> callAPI();
}

class PlanetsController {

ValueNotifier<List<Planets>?> planets = ValueNotifier<List<Planets>?>([]);

Future<List<Planets>> callAPI() async {
      var client = http.Client();
      var response = await client.get(Uri.parse('https://api-solar-system.herokuapp.com/planets'),);
      var decodedResponse = jsonDecode(response.body) as List; //retorno tipado como lista
      //final list = json['planet'] as list<dynamic>;
      return planets.value = decodedResponse.map((e) => Planets.fromJson(e)).toList(); //map = mapeamento../interação e retornando um objeto de lista no final
      
      //await Future.delayed(Duration(seconds: 2));

      //print(posts);
      //client.close();
    
  }





}