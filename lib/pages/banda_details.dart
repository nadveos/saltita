import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/banda_model.dart';

class BandaDetails extends StatelessWidget {
  const BandaDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Item bandaDet = ModalRoute.of(context)!.settings.arguments as Item;
    final Uri face  = Uri.parse('${bandaDet.facebook}');
    final Uri insta = Uri.parse('${bandaDet.instagram}');
    final Uri you   = Uri.parse('${bandaDet.youtube}');
    final Uri spot  = Uri.parse('${bandaDet.spotify}');
    final Uri apple = Uri.parse('${bandaDet.apple}');

    return Scaffold(
      backgroundColor: const Color.fromRGBO(52, 54, 101, 1.0),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            collapsedHeight: 60,
            expandedHeight: 200,
            backgroundColor: const Color.fromRGBO(52, 54, 101, 1) ,
            actions: [
              IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Agregado a favoritos'),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    size: 30,
                  )),
            ],
            
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                bandaDet.name.toUpperCase(),
                style: GoogleFonts.aladin(
                  textStyle: const TextStyle(
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(3.5, 3.5),
                      ),
                    ],
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              background: Image.network(
                bandaDet.getImageUrl(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      launchUrl(face);
                    },
                    icon: const Icon(FontAwesomeIcons.facebook),
                    color: Colors.white,
                    iconSize: 35,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      launchUrl(insta);
                    },
                    icon: const Icon(FontAwesomeIcons.instagram),
                    color: Colors.white,
                    iconSize: 35,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      launchUrl(you);
                    
                    },
                    icon: const Icon(FontAwesomeIcons.youtube),
                    color: Colors.white,
                    iconSize: 35,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      launchUrl(spot);
                    
                    },
                    icon: const Icon(FontAwesomeIcons.spotify),
                    color: Colors.white,
                    iconSize: 35,
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      launchUrl(apple);
                    
                    },
                    icon: const Icon(FontAwesomeIcons.apple),
                    color: Colors.white,
                    iconSize: 35,
                  ),
                ),
              ],
            ),
          ),
          
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Chip(
                        label: Text(bandaDet.genre),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Trayectoria',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        bandaDet.desc,
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
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
    );
  }
}
