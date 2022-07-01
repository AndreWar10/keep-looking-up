import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solarsystem/models/planets_model.dart';

class DetailFotoListWidget extends StatelessWidget {
  const DetailFotoListWidget({Key? key, required this.planet})
      : super(key: key);
  final Planets planet;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.network(
        planet.image,
        height: 250,
      ),
    );
  }
}
