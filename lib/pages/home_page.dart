import 'package:flutter/material.dart';
import 'package:solarsystem/controllers/planets_controller.dart';
import 'package:solarsystem/models/planets_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Planets> list = [];

  @override
  void initState() {
    super.initState();
    _getPlanets();
  }

  void _getPlanets() async {
    list = await PlanetsController().callAPI();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          ),
        ),
        child: Column(
          children: [
            list.isEmpty //verifica se tem dados
                ? CircularProgressIndicator()
                : ListView.builder(
                    physics:
                        NeverScrollableScrollPhysics(), //desabilitamos o scroll da list
                    shrinkWrap: true, //tamanho ocupar asó a qtd da lista
                    itemCount: list.length, //pegar tamanho da lista
                    itemBuilder: (_, idx) => Column(
                      children: [
                        Text(list[idx].id),
                        Text(list[idx].features.orbitalSpeed),
                        //Image.network(list[idx].image)
                      ],
                      //idx do index
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
