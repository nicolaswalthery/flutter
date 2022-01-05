import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> images;

  ImageList(this.images);

  Widget build(context) {
    return ListView.builder(
      itemCount: images.length, //Nombre d'item que le widget va créer.
      itemBuilder: (context, int index){
        return buildImage(images[index]);
      }
    );
  }

  Widget buildImage(ImageModel image){
     return Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            ),
          //Activate html render -> https://protocoderspoint.com/failed-to-load-network-image-flutter-web/  
          child: Column(//Met les data les unes après les autres
            children: [
              Padding(//Pour ajouter du padding entre l'image et le titre
                child: Image.network(image.url),
                padding: EdgeInsets.only(bottom: 8.0)
              ),
              Text(image.title), //Affiche le titre
            ],) 
        );
  }
}
