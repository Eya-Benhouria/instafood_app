import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignOut extends StatelessWidget {
  SignOut({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
