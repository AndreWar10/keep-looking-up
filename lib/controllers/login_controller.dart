import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginController {
  String? email;
  String? senha;

  final formkey = GlobalKey<FormState>();
  final VoidCallback onSucessLogin;
  final VoidCallback onUpdate;

  LoginController({required this.onSucessLogin, required this.onUpdate});

  void login() async{
    final response = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email!, password: senha!);
    if (response.user != null) {
      onSucessLogin();
    }
  }

  bool validate() {
    final form = formkey.currentState!;
    if(form.validate()){
      form.save();
      return true;
    }
    else {
      return false;
    }
  }

  String? validacaoEmail(String? email) {
    email = null;
    return null;
  }

  String? validacaoSenha(String? senha) {
    senha != null && senha.length >= 6 ? null : 'Erro senha';
    return null;
  }

  bool validacaoF({required String email, required String senha}) {
    return true;
  }
}

