import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rendez_vous/screens/patient/acceuil.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

String? dropdownValue = null;
bool? checked = false;

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Text(
                    textAlign: TextAlign.center,
                    "Renseignez vos informations en dessous ou inscrivez-vous avec votre compte social"),
              ),
              DropdownButton(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                value: dropdownValue,
                elevation: 0,
                isExpanded: true,
                alignment: Alignment.center,
                borderRadius: BorderRadius.circular(20),
                hint: Text("S'inscrire en tant que"),
                items: ['Medecin', 'Saloo']
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(value),
                          ),
                        ))
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
              ),
              FormBuilder(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        name: "nom",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.1),
                          labelText: "Nom",
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: "Entrez votre nom",
                          // prefixIcon: Icon(Icons.mail),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: FormBuilderTextField(
                        name: "prenom",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.1),
                          labelText: "Prenom",
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: "Entrez votre prenom",
                          // prefixIcon: Icon(Icons.mail),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: FormBuilderTextField(
                        name: "email",
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.black.withOpacity(0.1),
                          labelText: "Email",
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: "Entrez votre email",
                          // prefixIcon: Icon(Icons.mail),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: FormBuilderTextField(
                        name: "password",
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                            filled: true,
                            fillColor: Colors.black.withOpacity(0.1),
                            labelText: "Mot de passe",
                            labelStyle: TextStyle(fontSize: 20),
                            hintText: "Entrez votre mot de passe",
                            suffixIcon: Icon(Icons.visibility_off),
                            // prefixIcon: Icon(Icons.lock),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10)),
                      ),
                    ),
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        "J'accepte les termes et conditions",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue,
                            color: Colors.blue),
                      ),
                      value: checked,
                      onChanged: (value) {
                        setState(() {
                          checked = value;
                        });
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 20),
                      child: GFButton(
                        onPressed: () {
                          Get.to(AccueilPatient());
                        },
                        shape: GFButtonShape.pills,
                        fullWidthButton: true,
                        textColor: Colors.white,
                        size: GFSize.LARGE,
                        color: GFColors.PRIMARY,
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        text: "Sinscrire",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 0.5,
                          width: 60,
                          child: ColoredBox(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 10),
                          child: Text("Ou inscrivez-vous avec"),
                        ),
                        SizedBox(
                          height: 0.5,
                          width: 60,
                          child: ColoredBox(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: Padding(
                          padding: EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildSocial(
                                  image:
                                      Image.asset("assets/images/apple.png")),
                              buildSocial(
                                  image:
                                      Image.asset("assets/images/google.png")),
                              buildSocial(
                                  image:
                                      Image.asset("assets/images/facebook.png"))
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Vous avez un compte ?"),
                    GestureDetector(
                      onTap: () {
                        Get.to(Signup());
                      },
                      child: Text(
                        " Se connnecter",
                        style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    )));
  }

  Widget buildSocial({required Image image}) {
    return Container(
      height: 70,
      width: 70,
      padding: EdgeInsets.all(20),
      child: image,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
