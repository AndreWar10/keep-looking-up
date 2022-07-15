import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solarsystem/models/planets_model.dart';
import 'package:solarsystem/pages/detail_page.dart';

class PlanetItemWidget extends StatelessWidget {
  const PlanetItemWidget({Key? key, required this.planet, required this.index})
      : super(key: key);

  final Planets planet;
  //final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String planeta = planet.name;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailPage(planet: planet),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 12, top: 32),
            child: Container(
              height: 240,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [planet.baseColor!, planet.baseColor2!],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  //color: planet.baseColor!.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(26)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 80),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              planet.name,
                              style: GoogleFonts.montserrat(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            '#${planet.id}',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.4),
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: [
                          Text(
                            planet.resume!,
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Row(
                      //   children:  [
                      //     Text(
                      //       'Saiba mais',
                      //       style: GoogleFonts.montserrat(
                      //     fontSize: 12,
                      //     //fontWeight: FontWeight.bold,
                      //     color: Colors.white,
                      //   )
                      //     ),
                      //   ],
                      // )
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(15.0, 20.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          primary: Color.fromARGB(255, 233, 233, 233),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailPage(planet: planet),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Text(
                                'Saiba mais',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: Icon(
                                Icons.play_arrow,
                                size: 14,
                                color: Color.fromARGB(255, 49, 49, 49),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Image.asset(
              'assets/planets/$planeta.png',
              width: 115,
              height: 115,
            ),
            // SvgPicture.network(
            //   planet.image,
            //   allowDrawingOutsideViewBox: true,
            //   height: 120,
            // ),
          ),
        ],
      ),
    );
  }
}
