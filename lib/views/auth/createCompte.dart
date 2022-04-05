// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:instafood_app/views/auth/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instafood_app/views/views_shelf.dart';

import '../../core/theme/colors.dart';
import '../../core/widgets/buttons/solid_button.dart';

class CreateCompte extends StatelessWidget {
  CreateCompte({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
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
    // ignore: non_constant_identifier_names
    final NameField = TextFormField(
      autofocus: false,
      controller: namecontroller,
      keyboardType: TextInputType.emailAddress,
      //validator
      validator: (value) {
        RegExp regexp = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("le nom ne doit pas etre vide ");
        }
        if (!regexp.hasMatch(value)) {
          return ("le nom doirt etre au moins 3 caracteres");
        }
        return null;
      },

      //changed
      onChanged: (value) {
        namecontroller.text = value;
        namecontroller.selection =
            TextSelection.collapsed(offset: namecontroller.text.length);
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Nom",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      //validator
      validator: (value) => value!.isEmpty
          ? "l'email ne doit pas etre vide "
          : validateEmail(value),
      //changed
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
            borderRadius: BorderRadius.circular(30),
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
      //changed
      onChanged: (value) {
        passwordcontroller.text = value;
        passwordcontroller.selection =
            TextSelection.collapsed(offset: passwordcontroller.text.length);
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.https),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Mot de passe",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
    final confirmpasswordField = TextFormField(
      autofocus: false,
      controller: confirmpasswordcontroller,
      obscureText: true,
      //validator
      validator: (value) {
        if (confirmpasswordcontroller.text != passwordcontroller.text) {
          return "mots de passe different";
        }
        return null;
      },

      //changed
      onChanged: (value) {
        confirmpasswordcontroller.text = value;
        confirmpasswordcontroller.selection = TextSelection.collapsed(
            offset: confirmpasswordcontroller.text.length);
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.https),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Répeter Mot de passe",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          )),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
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
                    SizedBox(
                        height: 170,
                        child: Image.asset(
                          "assets/logo.png",
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 30),
                    //SignText,
                    NameField,
                    const SizedBox(height: 30),
                    emailField,
                    const SizedBox(height: 30),
                    passwordField,
                    const SizedBox(height: 30),
                    confirmpasswordField,
                    const SizedBox(height: 30),
                    SolidBorderedButton(
                      text: "Connexion",
                      bgColor: AppColors.food,
                      borderColor: AppColors.food,
                      textColor: AppColors.white,
                      onTap: () {
                        signUp(emailcontroller.text, passwordcontroller.text);
                      },
                    ),
                    //const SizedBox(height: 10),
                  ],
                )),
          ),
        ),
      )),
    );
  }

  void signUp(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => postDetailsToFirestore())
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message.toString());
      });
    }
  }

  postDetailsToFirestore() async {
    //FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = namecontroller.text;

    await users.doc(user.email).set(userModel.toMap());
    //
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }
}
