import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PriseRendezVous extends StatefulWidget {
  const PriseRendezVous({super.key});

  @override
  State<PriseRendezVous> createState() => _PriseRendezVousState();
}

class _PriseRendezVousState extends State<PriseRendezVous> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Prise de rendez-vous"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: buildCardDocteur(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Container(
                        height: 0.5,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildRond(
                                icon: Icon(
                                  Icons.accessibility_new,
                                  size: 40,
                                ),
                                dim: 50,
                              ),
                              Text("7 500+",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Patients",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildRond(
                                icon: Icon(
                                  Icons.favorite,
                                  size: 40,
                                ),
                                dim: 50,
                              ),
                              Text("7 500+",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Patients",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildRond(
                                icon: Icon(
                                  Icons.scatter_plot,
                                  size: 40,
                                ),
                                dim: 50,
                              ),
                              Text("7 500+",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Patients",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildRond(
                                icon: FaIcon(
                                  FontAwesomeIcons.tooth,
                                  size: 35,
                                ),
                                dim: 50,
                              ),
                              Text("7 500+",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text("Patients",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12))
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Réservation de rendez-vous".toUpperCase(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget buildRond(
      {double dim = 40,
      double border = 30,
      required dynamic icon,
      Color couleur = Colors.black,
      double opac = 0.1}) {
    return Container(
      height: dim,
      width: dim,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border),
        color: couleur.withOpacity(opac),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon],
      ),
    );
  }

  Widget buildCardDocteur() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(40),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/images/cellou.jpg'))),
                  ),
                ),
                Positioned(
                  height: 120,
                  width: 141,
                  child: Icon(
                    Icons.verified,
                    color: Colors.blue.shade700,
                  ),
                )
              ],
            ),
          ],
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dr. Jane Cooper",
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Text(
                "Dentiste",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.6), fontSize: 17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        "New York, United Stats",
                        style: TextStyle(fontSize: 12),
                      ),
                      Icon(Icons.map_outlined),
                    ],
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
