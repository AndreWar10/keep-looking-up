import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:solarsystem/models/planets_model.dart';
import 'package:solarsystem/widgets/detail_app_bar_widget.dart';
import 'package:solarsystem/widgets/detail_cabecalho_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.planet}) : super(key: key);
  final Planets planet;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scrollController.position.pixels > 360) {
              isOnTop = false;
            } else if (scrollController.position.pixels <= 359) {
              isOnTop = true;
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              planet: widget.planet,
              isOnTop: isOnTop,
            ),
            DetailCabecalhoWidget(
              planet: widget.planet,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height, //tela inteira
                child: Stack(
                  children: [
                    Container(
                      color: widget.planet.baseColor,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            //Icon(Icons.horizontal_rule,size: 30,),
                            Text(
                              '__________',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black54),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Overview',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.planet.name,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 44,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2),
                                  child: IconButton(
                                    icon: Icon(Icons.share),
                                    color: Color.fromARGB(255, 109, 108, 108),
                                    iconSize: 40,
                                    onPressed: () async {
                                      var urlPreview =
                                          widget.planet.video!.toString();
                                      await Share.share(
                                          'Veja que vídeo interessante que obtive gratuitamente no App da SolarSystem 👇 \n\n$urlPreview');
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.planet.description!,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    primary: Colors.black,
                                  ),
                                  onPressed: () async {
                                    final Uri url =
                                        Uri.parse(widget.planet.video!);
                                    await launchUrl(url);
                                  },
                                  child: Row(
                                    children: const [
                                      Text('Assistir vídeo'),
                                      Icon(Icons.play_arrow),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Wrap(
                              children: [
                                Text(
                                  widget.planet.subtitle!,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.planet.features.diameter!,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  widget.planet.features.sunDistance!,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Diâmetro',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Distância do Sol',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.planet.features.satellites!.number
                                      .toString(),
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  widget.planet.features.orbitalPeriod!.last,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Satélites',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Duração do ano',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.planet.features.rotationDuration
                                      .toString(),
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  widget.planet.features.orbitalSpeed,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Período de rotação',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Velocidade da órbita',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.planet.features.temperature.toString(),
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  widget.planet.features.radius!,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temperatura',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'Raio do planeta',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
