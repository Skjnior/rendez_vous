import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rendez_vous/rendez_vous/prise.dart';

class Methodes{
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

  
}