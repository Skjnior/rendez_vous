import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rendez_vous/screens/login.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final int totalDots = 3;
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 8, right: 8),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(Login());
                  },
                  child: Text(
                  "Sauter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 15,
                    decoration: TextDecoration.none,
                  ),
                ),
                )
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (int index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                children: [
                  buildPage(
                    image: "assets/images/onboarding_1.svg",
                    titre: "Découvrir des médecins expérimentés",
                    sousTitre:
                        "Trouvez les meilleurs médecins dans votre région",
                  ),
                  buildPage(
                    image: "assets/images/onboarding_2.svg",
                    titre: "Prise de rendez-vous sans effort",
                    sousTitre:
                        "Programmez vos consultations médicales en un clin d'œil",
                  ),
                  buildPage(
                    image: "assets/images/onboarding_3.svg",
                    titre: "Renseignez-vous sur vos médecins",
                    sousTitre:
                        "Découvrez le parcours de vos praticiens de confiance",
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  (currentPageIndex == 0) ? SizedBox() : buildFleche(false, 1),
                  Row(
                    children: List.generate(
                      totalDots,
                      (index) => buildDot(index == currentPageIndex),
                    ),
                  ),
                  (currentPageIndex == totalDots - 1)
                      ? buildFleche(true, 2)
                      : buildFleche(false, 2),
                ]
              ),
            ),
            SizedBox(
              height: 40,
              child: ColoredBox(color: Colors.white,),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFleche(bool end, int pos) {
    return Container(
      height: 30,
      width: 30,
      child: Icon(
        (pos == 1) ? Icons.arrow_back_outlined : Icons.arrow_forward_outlined,
        color: end ? Colors.white : Colors.blue,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        color: end ? Colors.blue : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  Widget buildDot(bool isActive) {
    return Container(
      height: 10,
      width: isActive ? 20 : 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.blue.withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget buildPage({
    required String image,
    required String titre,
    required String sousTitre,
  }) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Container(
                      child: SvgPicture.asset(
                        image,
                        height: 380,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    titre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 15),
                  Text(
                    sousTitre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      fontSize: 15,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
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
