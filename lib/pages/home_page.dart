import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solarsystem/controllers/planets_controller.dart';
import 'package:solarsystem/models/planets_model.dart';
import 'package:solarsystem/pages/loading_page.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:solarsystem/pages/splash_page.dart';
import 'package:solarsystem/services/prefs_service.dart';
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

  void searchPlanet(String query) {
    // ignore: unused_local_variable
    final suggestions = list.where((planet) {
      final planetName = planet.name.toLowerCase();
      final input = query.toLowerCase();

      return planetName.contains(input);
    }).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: list.isEmpty //verifica se tem dados
            ? LoadingPage()
            : Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/background/bg-2.png',
                  ),
                  fit: BoxFit.cover,
                )),
                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: const [
                //       Color.fromARGB(255, 109, 96, 158),
                //       Color.fromARGB(255, 77, 64, 122),
                //       Color.fromARGB(255, 48, 39, 83),
                //       Color.fromARGB(255, 37, 27, 77),
                //     ],
                //     stops: const [0.1, 0.4, 0.7, 0.9],
                //   ),
                // ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  //botão de logout
                                  PrefsService.logout();
                                  Navigator.of(context)
                                      //remove todas as paginas anteriores e volta para login
                                      .pushNamedAndRemoveUntil(
                                          '/login', (route) => true);
                                },
                                icon: Icon(
                                  Icons.logout,
                                  color: Color.fromARGB(255, 218, 218, 218),
                                  size: 40,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Explore',
                              style: GoogleFonts.montserrat(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
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
                          children: [
                            Text(
                              'Solar System',
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                color: Color.fromARGB(255, 218, 218, 218),
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12),

                            child: TypeAheadField<Planet?>(
                              hideSuggestionsOnKeyboardHide: true,
                              debounceDuration: Duration(milliseconds: 500),
                              textFieldConfiguration: TextFieldConfiguration(
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.purple,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(14)),
                                    hintText: 'Search Planet'),
                              ),
                              suggestionsCallback: PlanetApi.getUserSuggestions,
                              itemBuilder: (context, Planet? suggestion) {
                                final planeta = suggestion!;

                                return ListTile(
                                  title: Text(planeta.name),
                                );
                              },
                              noItemsFoundBuilder: (context) => SizedBox(
                                  height: 50,
                                  child: Center(
                                    child: Text('no itens'),
                                  )),
                              onSuggestionSelected: (Planet? suggestion) {
                                final planeta = suggestion!;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SplashPage(),
                                  ),
                                );

                                ScaffoldMessenger.of(context)
                                  ..removeCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(
                                      content: Text('Selected ${planeta.name}'),
                                    ),
                                  );
                              },
                            ),

                            // TextField(
                            //   style: TextStyle(
                            //     color: Colors.black,
                            //   ),
                            //   //onChanged: _controller.onChanged,
                            //   decoration: InputDecoration(
                            //     fillColor: Colors.white, filled: true,
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(14)),
                            //     hintText: "Pesquisar",
                            //     prefixIcon: Icon(
                            //       Icons.search,
                            //       color: Colors.deepPurple,
                            //     ), //icon at head of input
                            //     //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too
                            //     //prefisIcon sets Icon inside the TextField border, 'icon' sets outside border.
                            //     //suffixIcon: Icon(Icons.cancel) //icon at tail of input
                            //   ),
                            //   onChanged: searchPlanet,
                            // ),
                          ),
                          SizedBox(height: 40),
                          GridView.builder(
                            physics:
                                NeverScrollableScrollPhysics(), //desabilitamos o scroll da list
                            shrinkWrap:
                                true, //tamanho ocupar asó a qtd da lista
                            itemCount: list.length, //pegar tamanho da lista
                            itemBuilder: (context, idx) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
