import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rendez_vous/screens/patient/acceuil.dart';
import 'package:rendez_vous/screens/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormBuilderState>();

  //final _emailController = TextEditingController();
  //final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
                    "S'authentifier",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Text("Hey bienvenue vous nous aviez manqué"),
              ),
              FormBuilder(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: FormBuilderTextField(
                        name: "email",
                       // controller: _emailController,
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
                        //controller: _passwordController,
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
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 21, bottom: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Mot de passe oublié",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                              color: Colors.blue),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 20),
                      child: GFButton(
                        onPressed: () async {
                           CollectionReference usersRef = await FirebaseFirestore.instance.collection("Users");
                          usersRef.add({
                            
                               // 'email': _emailController.text,
                              //'password': _passwordController.text
                          });
                        },
                        shape: GFButtonShape.pills,
                        fullWidthButton: true,
                        textColor: Colors.white,
                        size: GFSize.LARGE,
                        color: GFColors.PRIMARY,
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        text: "Connexion",
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
                          child: Text("Ou connectez-vous avec"),
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
                    Text("Pas encore de compte ?"),
                    GestureDetector(
                      onTap: () {
                        Get.to(Signup());
                      },
                      child: Text(
                        "S'inscrire",
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
    ));
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
