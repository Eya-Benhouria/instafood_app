// ignore_for_file: avoid_print, file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instafood_app/views/auth/createCompte.dart';
import 'package:instafood_app/views/auth/reset.dart';
import 'package:instafood_app/views/auth/signwithfacebook.dart';

import '../../core/init/navigate.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/text_theme.dart';
import '../../core/widgets/buttons/solid_button.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  //editing cntroller
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  Color greenColor = const Color(0xFF00AF19);
  final _auth = FirebaseAuth.instance;

  //To Validate email
  String? validateEmail(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Email incorrect';
    }
    if (!regExp.hasMatch(value)) {
      return 'Email incorrect';
    } else {
      return null;
    }
  }

  String? validatepassword(String value) {
    RegExp regexp = RegExp(r'^.{6,}$');
    if (!regexp.hasMatch(value)) {
      return 'mot de passe ne peut pas etre inferieur à 6 caracters';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      //validator
      validator: (value) => value!.isEmpty
          ? "l'email ne doit pas etre vide "
          : validateEmail(value),
      onChanged: (value) {
        emailcontroller.text = value;
        emailcontroller.selection =
            TextSelection.collapsed(offset: emailcontroller.text.length);
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordcontroller,
      obscureText: true,
      //validator
      validator: (value) => value!.isEmpty
          ? 'le mot de passe ne doit pas etre vide '
          : validatepassword(value),
      onChanged: (value) {
        passwordcontroller.text = value;
        passwordcontroller.selection =
            TextSelection.collapsed(offset: passwordcontroller.text.length);
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.https),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Mot de passe",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
    void SignIn(String email, String password) async {
      if (_formkey.currentState!.validate()) {
        try {
          await _auth
              .signInWithEmailAndPassword(email: email, password: password)
              .then((uid) => {
                    Fluttertoast.showToast(msg: "login Successful"),
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()))
                  });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            Fluttertoast.showToast(
                msg: "Informations d'identification non valides",
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 3,
                fontSize: 16.0,
                backgroundColor: greenColor);
          } else if (e.code == 'wrong-password') {
            Fluttertoast.showToast(
                msg: 'mot de passe incorrect.',
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 3,
                backgroundColor: greenColor);
          } else {
            Fluttertoast.showToast(
                msg: e.message.toString(),
                gravity: ToastGravity.TOP,
                backgroundColor: greenColor);
          }
        }
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.food,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: const [
                          Text(
                            '        Bienvenue 👋',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.food,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ],
                      ),
                      //salutation,
                      //SizedBox(
                      // height: 170,
                      //child: Image.asset(
                      //"img/logo.png",
                      //fit: BoxFit.contain,
                      //)),
                      const SizedBox(height: 40),
                      emailField,
                      const SizedBox(height: 30),
                      passwordField,
                      const SizedBox(height: 30),
                      SolidBorderedButton(
                        text: "Connexion",
                        bgColor: AppColors.food,
                        borderColor: AppColors.food,
                        textColor: AppColors.white,
                        onTap: () {
                          SignIn(emailcontroller.text, passwordcontroller.text);
                        },
                      ),

                      //const SizedBox(height: 10),
                      //resrt,
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ResetPassword()));
                          },
                          child: Container(
                              alignment: Alignment(1.0, 0.0),
                              padding: EdgeInsets.only(top: 15.0, left: 20.0),
                              child: InkWell(
                                  child: Text(
                                'Mot de passe obliée',
                                style: body(context, AppColors.food),
                              )))),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Pas du Compte?",
                            style: body(context, AppColors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CreateCompte()));
                            },
                            child: Text(
                              "Créer Compte",
                              style: body(context, AppColors.food),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 35),
                      Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "-------------------------",
                                style: TextStyle(
                                    color: Colors.grey[500], fontSize: 20),
                                children: [
                                  TextSpan(
                                      text: "OR",
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  TextSpan(
                                    text: "----------------------------",
                                    style: TextStyle(
                                        color: Colors.grey[500], fontSize: 20),
                                  )
                                ])),
                      ),
                      const SizedBox(height: 35),
                      SolidBorderedButton(
                        text: "Connecter avec Facebook",
                        bgColor: AppColors.white,
                        borderColor: AppColors.food,
                        textColor: Colors.blue,
                        onTap: () {
                          AuthService().fbSignIn();
                        },
                      ),
                    ],
                  )),
            ),
          ),
        )));

    // ignore: non_constant_identifier_names, dead_cod
  }
}
