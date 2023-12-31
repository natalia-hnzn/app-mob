import 'package:app_store/view/CreateAD.dart';
import 'package:app_store/view/categorias.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_store/view/catalog.dart';
import 'package:app_store/view/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FirebaseFirestore db = FirebaseFirestore.instance;
  // db.collection('Anuncios').doc('001').set({
  //   'nome': 'Gol quadrado',
  //   'preco': 20000,
  //   'descricao': 'lorem lorem lorem lorem'
  // });

  // FirebaseAuth auth = FirebaseAuth.instance;
  // auth
  //     .signInWithEmailAndPassword(
  //         email: 'nataliaheinzen@gmail.com', password: '123Senha.')
  //     .then((value) {
  //   print('Usuário logado com sucesso $value');
  // }).catchError((error) {
  //   print('Ocorreram os seguintes erros $error');
  // });
  // auth.createUserWithEmailAndPassword(
  //     email: 'teste@email.com', password: 'teste123');

  runApp(
    MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        debugShowCheckedModeBanner: false,
        home: CreateAD()),
  );
}
