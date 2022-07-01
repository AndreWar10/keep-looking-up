import 'package:flutter/material.dart';
import 'package:solarsystem/controllers/planets_controller.dart';
import 'package:solarsystem/models/planets_model.dart';
import 'package:solarsystem/widgets/planet_item_widget.dart';

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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.menu_open,
                      color: Color.fromARGB(255, 218, 218, 218),
                      size: 50,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Explore',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Solar System',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 218, 218, 218)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  //onChanged: _controller.onChanged,
                  decoration: InputDecoration(
                    fillColor: Colors.white, filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14)),
                    hintText: "Pesquisar",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.deepPurple,
                    ), //icon at head of input
                    //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too
                    //prefisIcon sets Icon inside the TextField border, 'icon' sets outside border.
                    //suffixIcon: Icon(Icons.cancel) //icon at tail of input
                  ),
                ),
              ),
              SizedBox(height: 40),
              list.isEmpty //verifica se tem dados
                  ? CircularProgressIndicator()
                  : GridView.builder(
                      physics:
                          NeverScrollableScrollPhysics(), //desabilitamos o scroll da list
                      shrinkWrap: true, //tamanho ocupar asó a qtd da lista
                      itemCount: list.length, //pegar tamanho da lista
                      itemBuilder: (context, idx) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Text(list[idx].id),
                          //Text(list[idx].name),
                          //SvgPicture.network(list[idx].image, height: 120),

                          PlanetItemWidget(planet: list[idx], index: idx)
                        ],
                        //idx do index
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 6 / 9,
                              mainAxisSpacing: 1),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
