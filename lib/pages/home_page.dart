import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modelsaltita/data/api_data.dart';

import '../models/banda_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ServicesApi data = ServicesApi();

  List<Item> bandas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(52, 54, 101, 1.0),
      body: SafeArea(
        child: Stack(
          children: [artistas()],
        ),
      ),
    );
  }

  Widget artistas() {
    
    return FutureBuilder(
      future: data.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          bandas = snapshot.data!.items;

          return ListView.builder(
            itemCount: bandas.length,
            itemBuilder: (context, index) {
              return Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'detalle',
                          arguments: bandas[index]);
                    },
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(bandas[index].getImageUrl()),
                          fit: BoxFit.cover,
                          colorFilter:  const ColorFilter.matrix(
                            <double>[
                              0.2126, 0.7152, 0.0722, 0, 0,
                              0.2126, 0.7152, 0.0722, 0, 0,
                              0.2126, 0.7152, 0.0722, 0, 0,
                              0, 0, 0, 1, 0,
                            ],
                          ),
                        ),
                      ),
                      child: Text(
                        bandas[index].name.toUpperCase(),
                        style: GoogleFonts.aladin(
                            color: const Color.fromARGB(255, 253, 253, 253),
                            fontSize: 40,
                            letterSpacing: 2,
                            decoration: TextDecoration.none,
                            shadows: const [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(3.0, 3.0),
                              ),
                            ]
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 5,
                    child: OutlinedButton(
                      onPressed: () {},
                      child:
                          Chip(label: Text(bandas[index].genre.toUpperCase())),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
