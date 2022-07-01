import 'package:flutter/material.dart';
import 'package:solarsystem/models/planets_model.dart';
import 'package:solarsystem/widgets/detail_foto_widget.dart';

class DetailCabecalhoWidget extends StatelessWidget {
  const DetailCabecalhoWidget({Key? key, required this.planet}) : super(key: key);
  final Planets planet;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: planet.baseColor,
        child: Column(
          children: [
            
            SizedBox(
              height: 310,
              width: double.infinity,
              child:  DetailFotoListWidget(planet: planet),
              ),
            
          ],
        ),
      ),
    );
  }
}