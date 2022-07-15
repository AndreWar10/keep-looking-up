import 'package:faker/faker.dart';

class Planet {
  final String name;
  const Planet({required this.name});
}

class PlanetData {
  static final faker = Faker();
  static final List<Planet> planets = List.generate(
      50,
      (index) => Planet(
            name: faker.person.name(),
          ));

  static List<Planet> getSuggestions(String query) =>
      List.of(planets).where((planet) {
        final nameLower = planet.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
}
