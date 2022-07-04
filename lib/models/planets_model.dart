// To parse this JSON data, do
//
//     final planets = planetsFromJson(jsonString);
import 'dart:convert';
import 'package:flutter/material.dart';

List<Planets> planetsFromJson(String str) => List<Planets>.from(json.decode(str).map((x) => Planets.fromJson(x)));

String planetsToJson(List<Planets>? data) => json.encode(List<dynamic>.from(data!.map((x) => x.toJson())));

class Planets {
    Planets({
        required this.id,
        required this.name,
        required this.introduction,
        required this.image,
        required this.searchTags,
        required this.features,
        required this.geography,
    });

    final String id;
    final String name;
    final String introduction;
    final String image;
    final List<String> searchTags;
    final Features features;
    final String geography;

    Planets copyWith({
        String? id,
        String? name,
        String? introduction,
        String? image,
        List<String>? searchTags,
        Features? features,
        String? geography,
    }) => 
        Planets(
            id: id ?? this.id,
            name: name ?? this.name,
            introduction: introduction ?? this.introduction,
            image: image ?? this.image,
            searchTags: searchTags ?? this.searchTags,
            features: features ?? this.features,
            geography: geography ?? this.geography,
        );

    factory Planets.fromJson(Map<String, dynamic> json) => Planets(
        id: json["id"],
        name: json["name"],
        introduction: json["introduction"],
        image: json["image"],
        searchTags: List<String>.from(json["searchTags"].map((x) => x)),
        features: Features.fromJson(json["features"]),
        geography: json["geography"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "introduction": introduction,
        "image": image,
        "searchTags": List<dynamic>.from(searchTags.map((x) => x)),
        "features": features.toJson(),
        "geography": geography,
    };

    String? get description => _stringDes(id: id[0]);

    static String? _stringDes({required String id}) {
    switch (id) {
      case '0':
        return 'Estrela Central do Sistema Solar';
      case '1':
        return 'Menor e mais interno do Sistema Solar';
      case '2':
        return 'Segundo planeta do Sistema Solar';
      case '3':
        return 'Nosso grande Planeta Azul';
      case '4':
        return 'O grande Planeta Vermelho';
      case '5':
        return 'O maior planeta do Sistema Solar';
      case '6':
        return 'O planeta com mais Luas';
      case '7':
        return 'O planeta mais frio ';
      case '8':
        return 'O último planeta do sistema solar';
      case '9':
        return 'O planeta Anão ';
      default:
        return '';
    }
  }

    String? get subtitle => _stringSub(id: id[0]);

    static String? _stringSub({required String id}) {
    switch (id) {
      case '0':
        return 'O Sol é a estrela central do Sistema Solar. Todos os outros corpos do Sistema Solar, como planetas, planetas anões, asteroides, cometas e poeira, bem como todos os satélites associados a estes corpos, giram ao seu redor.';
      case '1':
        return 'Mercúrio é o menor e mais interno planeta do Sistema Solar, orbitando o Sol a cada 87,969 dias terrestres. A sua órbita tem a maior excentricidade e o seu eixo apresenta a menor inclinação em relação ao plano da órbita dentre todos.';
      case '2':
        return 'Vénus  ou Vênus  é o segundo planeta do Sistema Solar em ordem de distância a partir do Sol, orbitando-o a cada 224,7 dias.Recebeu seu nome em homenagem à deusa romana do amor e da beleza Vénus, equivalente a Afrodite.';
      case '3':
        return 'A Terra é o terceiro planeta mais próximo do Sol, o mais denso e o quinto maior dos oito planetas do Sistema Solar. É também o maior dos quatro planetas telúricos. É por vezes designada como Mundo ou Planeta Azul.';
      case '4':
        return 'Marte é o quarto planeta a partir do Sol, o segundo menor do Sistema Solar. Batizado em homenagem ao deus romano da guerra, muitas vezes é descrito como o "Planeta Vermelho", porque predominante sua superfície lhe dá uma aparência avermelhada.';
      case '5':
        return 'Júpiter é o maior planeta do Sistema Solar, tanto em diâmetro quanto em massa, e é o quinto mais próximo do Sol.[11] Possui menos de um milésimo da massa solar, contudo tem 2,5 vezes a massa de todos os outros planetas em conjunto.';
      case '6':
        return 'Saturno é o sexto planeta a partir do Sol e o segundo maior do Sistema Solar atrás de Júpiter. Pertencente ao grupo dos gigantes gasosos, possui cerca de 95 massas terrestres e orbita a uma distância média de 9,5 unidades astronômicas. ';
      case '7':
        return 'Urano é o sétimo planeta a partir do Sol, o terceiro maior e o quarto mais massivo dos oito planetas do Sistema Solar. Foi nomeado em homenagem ao deus grego do céu, Urano. Urano foi também o primeiro planeta a ser descoberto por meio de um telescópio. ';
      case '8':
        return 'Netuno é o oitavo planeta do Sistema Solar, o último a partir do Sol desde a reclassificação de Plutão para a categoria de planeta anão, em 2006. Netuno orbita o Sol a uma distância média de 30,1 unidades astronômicas.';
      case '9':
        return 'Plutão, formalmente designado 134340 Plutão é um planeta anão do Sistema Solar e o nono maior e décimo mais massivo objeto observado diretamente orbitando o Sol.Plutão é atualmente o maior membro conhecido do cinturão de Kuiper ';
      default:
        return 'h';
    }
  }

    String? get resume => _string(id: id[0]);

    static String? _string({required String id}) {
    switch (id) {
      case '0':
        return 'É a estrela central do Sistema Solar. Todos os outros corpos';
      case '1':
        return 'Mercúrio é o menor e mais interno planeta do Sistema Solar';
      case '2':
        return 'Vénus ou Vênus é o segundo planeta do Sistema Solar em ';
      case '3':
        return 'A Terra é o terceiro planeta mais próximo do Sol, o mais denso';
      case '4':
        return 'Marte é o quarto planeta a partir do Sol, o segundo menor';
      case '5':
        return 'Júpiter é o maior planeta do Sistema Solar, tanto em ';
      case '6':
        return 'Saturno é o sexto planeta a partir do Sol e o segundo ';
      case '7':
        return 'Urano é o sétimo planeta a partir do Sol e o terceiro maior';
      case '8':
        return 'Netuno ou Neptuno é o oitavo planeta do Sistema Solar, o ';
      case '9':
        return 'Plutão, designado 134340 Plutão é um planeta anão ';
      default:
        return 'h';
    }
  }


    Color? get baseColor => _color(id: id[0]);

    static Color? _color({required String id}) {
    switch (id) {
      case '0':
        return Color.fromARGB(255, 238, 188, 23);
      case '1':
        return Color.fromARGB(255, 148, 148, 148);
      case '2':
        return Color.fromARGB(255, 255, 201, 121);
      case '3':
        return Color.fromARGB(255, 121, 231, 186);
      case '4':
        return Color.fromARGB(255, 243, 138, 52);
      case '5':
        return Color.fromARGB(255, 234, 149, 255);
      case '6':
        return Color.fromARGB(255, 253, 255, 139);
      case '7':
        return Color.fromARGB(255, 133, 210, 255);
      case '8':
        return Color.fromARGB(255, 173, 137, 255);
      case '9':
        return Color.fromARGB(255, 184, 195, 252);
      default:
        return Color.fromARGB(255, 255, 0, 179);
    }
  }

}

class Features {
    Features({
        required this.orbitalPeriod,
        required this.orbitalSpeed,
        required this.rotationDuration,
        required this.radius,
        required this.diameter,
        required this.sunDistance,
        required this.satellites,
        required this.temperature,
    });

    final List<String>? orbitalPeriod;
    final String orbitalSpeed;
    final String? rotationDuration;
    final String? radius;
    final String? diameter;
    final String? sunDistance;
    final Satellites? satellites;
    final String? temperature;

    Features copyWith({
        List<String>? orbitalPeriod,
        String? orbitalSpeed,
        String? rotationDuration,
        String? radius,
        String? diameter,
        String? sunDistance,
        Satellites? satellites,
        String? temperature,
    }) => 
        Features(
            orbitalPeriod: orbitalPeriod ?? this.orbitalPeriod,
            orbitalSpeed: orbitalSpeed ?? this.orbitalSpeed,
            rotationDuration: rotationDuration ?? this.rotationDuration,
            radius: radius ?? this.radius,
            diameter: diameter ?? this.diameter,
            sunDistance: sunDistance ?? this.sunDistance,
            satellites: satellites ?? this.satellites,
            temperature: temperature ?? this.temperature,
        );

    factory Features.fromJson(Map<String, dynamic> json) => Features(
        orbitalPeriod: List<String>.from(json["orbitalPeriod"].map((x) => x)),
        orbitalSpeed: json["orbitalSpeed"],
        rotationDuration: json["rotationDuration"],
        radius: json["radius"],
        diameter: json["Diameter"],
        sunDistance: json["sunDistance"],
        satellites: Satellites.fromJson(json["satellites"]),
        temperature: json["temperature"],
    );

    Map<String, dynamic> toJson() => {
        "orbitalPeriod": List<dynamic>.from(orbitalPeriod!.map((x) => x)),
        "orbitalSpeed": orbitalSpeed,
        "rotationDuration": rotationDuration,
        "radius": radius,
        "Diameter": diameter,
        "sunDistance": sunDistance,
        "satellites": satellites!.toJson(),
        "temperature": temperature,
    };
}

class Satellites {
    Satellites({
        required this.number,
        required this.names,
    });

    final int number;
    final List<String> names;

    Satellites copyWith({
        int? number,
        List<String>? names,
    }) => 
        Satellites(
            number: number ?? this.number,
            names: names ?? this.names,
        );

    factory Satellites.fromJson(Map<String, dynamic> json) => Satellites(
        number: json["number"],
        names: List<String>.from(json["names"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "names": List<dynamic>.from(names.map((x) => x)),
    };
}
