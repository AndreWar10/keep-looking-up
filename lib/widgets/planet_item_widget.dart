import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  color: planet.baseColor!.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(26)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
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
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
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
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Purrisima',
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 25,),
                      Row(children:const [Text('Saiba mais', style: TextStyle(color: Colors.white),),],)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: SvgPicture.network(
              planet.image, 
              allowDrawingOutsideViewBox: true,             
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
