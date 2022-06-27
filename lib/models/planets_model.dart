// To parse this JSON data, do
//
//     final planets = planetsFromJson(jsonString);
import 'dart:convert';

List<Planets> planetsFromJson(String str) => List<Planets>.from(json.decode(str).map((x) => Planets.fromJson(x)));

String planetsToJson(List<Planets>? data) => json.encode(List<dynamic>.from(data!.map((x) => x.toJson())));

class Planets {
    Planets({
        required this.id,
        required this.name,
        required this.resume,
        required this.introduction,
        required this.image,
        required this.searchTags,
        required this.features,
        required this.geography,
    });

    final String id;
    final String name;
    final String resume;
    final String introduction;
    final String image;
    final List<String> searchTags;
    final Features features;
    final String geography;

    Planets copyWith({
        String? id,
        String? name,
        String? resume,
        String? introduction,
        String? image,
        List<String>? searchTags,
        Features? features,
        String? geography,
    }) => 
        Planets(
            id: id ?? this.id,
            name: name ?? this.name,
            resume: resume ?? this.resume,
            introduction: introduction ?? this.introduction,
            image: image ?? this.image,
            searchTags: searchTags ?? this.searchTags,
            features: features ?? this.features,
            geography: geography ?? this.geography,
        );

    factory Planets.fromJson(Map<String, dynamic> json) => Planets(
        id: json["id"],
        name: json["name"],
        resume: json["resume"],
        introduction: json["introduction"],
        image: json["image"],
        searchTags: List<String>.from(json["searchTags"].map((x) => x)),
        features: Features.fromJson(json["features"]),
        geography: json["geography"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "resume": resume,
        "introduction": introduction,
        "image": image,
        "searchTags": List<dynamic>.from(searchTags.map((x) => x)),
        "features": features.toJson(),
        "geography": geography,
    };
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
