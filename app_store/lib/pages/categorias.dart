import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  @override
  Widget build(BuildContext context) {
    getAd();
    return Scaffold(
        appBar: AppBar(
          title: Text('Categorias'),
        ),
        body: FutureBuilder(
          future: getAd(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data[index]['nome']),
                );
              },
            );
          },
        ));
  }
}

Future getAd() async {
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  var categories = await db.collection('Categorias').get();
  return categories.docs;
}
