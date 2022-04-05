import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instafood_app/core/init/navigate.dart';
import 'package:instafood_app/views/auth/connexion.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  late String email;

  Color greenColor = const Color(0xFF00AF19);

  get onTap => this;

  BuildContext get context => context;

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  //To Validate email
  String? validateEmail(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Email incorrect';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildResetForm())));
  }

  _buildResetForm() {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: ListView(children: [
          const SizedBox(height: 75.0),
          Container(
              height: 125.0,
              width: 200.0,
              alignment: Alignment.center,
              child: Stack(
                children: const [
                  Text(
                    'Modifier Mot de passe  ',
                    style: TextStyle(fontFamily: 'system-ui', fontSize: 40.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          const SizedBox(height: 25.0),
          TextFormField(
              decoration: InputDecoration(
                  labelText: 'EMAIL',
                  labelStyle: TextStyle(
                      fontFamily: 'Trueno',
                      fontSize: 20.0,
                      color: Colors.grey.withOpacity(0.5)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: greenColor),
                  )),
              onChanged: (value) {
                email = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Email is required' : validateEmail(value)),
          const SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.sendPasswordResetEmail(email: email);
              Navigator.of(context).pop();
            },
            child: SizedBox(
                height: 50.0,
                child: Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: greenColor,
                    elevation: 5.0,
                    child: const Center(
                        child: Text('Soumettre',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20))))),
          ),
          const SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
                onTap: this.onTap,
                child: Text('Retour',
                    style: TextStyle(
                      color: greenColor,
                      fontFamily: 'Trueno',
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                    )))
          ])
        ]));
  }
}
