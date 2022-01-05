//Import flutter helper libraries
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

//App will be rerender some times but we don't want the data to be reset so ...
class App extends StatefulWidget{
  createState(){
    return AppState();
  }
}

//Ici est conservé toutes les données de App qui statefull.
//... we create another class, the AppState which contain the base data for 
class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

void fetchImage() async{
  counter++;
  //http request
  var response = await get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
  var imageModel = ImageModel.fromJson(json.decode(response.body));
  setState(() {
      images.add(imageModel);
  });
}

    //Build method that returns the widgets
    Widget build(context) {
      return MaterialApp(
      home: Scaffold(//Widget Scafold
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchImage();
            //setState(() {counter++;}); //setState est un observer ???
          }, child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text('RogueGM')
        ),
      ),
    );
  }
}

