// create_ad.dart
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'ad_page.dart';
import 'categorias.dart';

class CreateAD extends StatefulWidget {
  const CreateAD({Key? key});

  @override
  State<CreateAD> createState() => _CreateADState();
}

class _CreateADState extends State<CreateAD> {
  var image = null;
  var nameController = TextEditingController();
  var priceController = TextEditingController();

  loadImage() async {
    var picker = ImagePicker();
    var uploadImage = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      image = uploadImage;
    });
  }

  createADS(image) async {
    await Firebase.initializeApp();
    Reference root = FirebaseStorage.instance
        .ref()
        .child('Fotos')
        .child('${DateTime.now().millisecondsSinceEpoch}.jpg');
    var progress = await root.putFile(File(image.path));
    var urlImage = await progress.ref.getDownloadURL();

    // Use the imported addAd method
    addAd(nameController.text, double.parse(priceController.text), urlImage);

    // Navigate to the AdPage with the added data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdPage(
          name: nameController.text,
          price: double.parse(priceController.text),
          imageUrl: urlImage,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Anúncio'),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            color: Colors.grey,
            child: image == null
                ? TextButton.icon(
                    onPressed: loadImage,
                    icon: Icon(Icons.photo_camera),
                    label: Text('Carregar imagem'))
                : Image.file(
                    File(image.path),
                    fit: BoxFit.cover,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome do anúncio'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Preço'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              createADS(image);
            },
            child: Text('Criar anúncio'),
          ),
        ],
      ),
    );
  }
}
