import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rendez_vous/rendez_vous/prise.dart';

class AccueilPatient extends StatefulWidget {
  const AccueilPatient({super.key});

  @override
  State<AccueilPatient> createState() => _AccueilPatientState();
}

class _AccueilPatientState extends State<AccueilPatient> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Localisation",
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on),
                            Text("Conakry, Guinée"),
                            Icon(Icons.arrow_drop_down),
                          ],
                        )
                      ]),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black.withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Icon(Icons.notifications),
                            Positioned(
                                child: Container(
                              height: 7,
                              width: 7,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            )),
                            Positioned(
                                child: Container(
                              height: 5,
                              width: 5,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ))
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
              child: FormBuilderTextField(
                name: "recherche",
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.black.withOpacity(0.1),
                    hintText: "Rechercher...",
                    hintStyle: TextStyle(fontSize: 18),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list_outlined),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Rendez-vous prochain",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      buildRond(
                          icon: Text("8"),
                          dim: 25,
                          couleur: Colors.blue,
                          opac: 0.5)
                    ],
                  ),
                  Text(
                    "Voir tout",
                    style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
              child: Container(
                  height: 137,
                  decoration: BoxDecoration(
                    // border: Border.all(),
                    color: Colors.blue.withOpacity(0.5),

                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/apple.png"),
                        ),
                        title: Text("Dr. Ousmane Diakhaby"),
                        subtitle: Text("Consultation Dentiste"),
                        trailing: Icon(Icons.phone),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                // border: Border.all(),
                                color: Colors.black.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5, right: 6),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month_outlined),
                                      Text("Lundi, 26 Juillet")
                                    ],
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: 1,
                                    child: ColoredBox(
                                      color: Colors.black.withOpacity(0.2),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time),
                                      Text("09:00 - 10:00")
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
              child: buildSousTitre(phrase: "Specialités des medecins"),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 15,
              ),
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
                      Text("Neurologie",
                          style: TextStyle(fontWeight: FontWeight.bold))
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
                      Text("Cardiologie",
                          style: TextStyle(fontWeight: FontWeight.bold))
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
                      Text("Orthopédie",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildRond(
                        icon: FaIcon(FontAwesomeIcons.tooth, size: 35,),
                        dim: 50,
                      ),
                      Text("Dentiste",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: buildSousTitre(phrase: "Hopitaux proches"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) {
                    return buildCardHopital();
                  }),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: buildSousTitre(phrase: "Top spécialistes"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Column(
                children: [
                  buildCardDocteur(),
                  buildCardDocteur(),
                  buildCardDocteur(),
                  buildCardDocteur(),
                  ],
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Reservation"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil")
          ]),
    ));
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

  Widget buildSousTitre({required String phrase}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          phrase,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "Voir tout",
          style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue),
        )
      ],
    );
  }

  Widget buildCardHopital() {
    return Card(
      elevation: 4.0, // Effet d'ombre
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Coins arrondis
      ),
      margin: EdgeInsets.all(8.0), // Marge autour de la carte
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // En-tête avec une image
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Positioned(
                child: Container(
                  height: 120,
                  width: 192,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/cellou.jpg'), // Chemin de l'image
                      fit: BoxFit.fill, // Ajustement de l'image
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Container(
                    height: 30.0,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star),
                        Text("4.8"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Titre
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Titre de la carte',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          // Sous-titre
          Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Row(
              children: [
                Icon(Icons.access_time_rounded),
                Text(
                  "15min",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                Text(
                  "1.5Km",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCardDocteur() {
    return Card(
      elevation: 4, // Effet d'ombre
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Coins arrondis
      ),
      child: Container(
        color: Colors.white.withOpacity(0.5),
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage('assets/images/apple.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 3, right: 3, top: 1, bottom: 1),
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.verified),
                            SizedBox(width: 5),
                            Text(
                              "Docteur professionnel",
                              style: TextStyle(
                                color: Colors.blue,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            "Dr. Jane Cooper",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 5),
                          Icon(Icons.favorite_border_outlined),
                        ],
                      ),
                      Text(
                        "Dentiste",
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Text("4.8")
                            ],
                          ),
                          SizedBox(
                            height: 25,
                            width: 1,
                            child: ColoredBox(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          Text("49 Visites")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 3, right: 3, top: 1, bottom: 1),
              height: 40,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.badge_outlined),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      Get.to(PriseRendezVous());
                    },
                    child: Text(
                    "Prendre rendez-vous",
                    style: TextStyle(
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
