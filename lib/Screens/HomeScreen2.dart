import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:api_app/Models/photos_model.dart';




class HomeScreen2 extends StatefulWidget {
  static const String id = 'HomeScreen2';
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {

  List <PhotosModel>  photosList = [];

  Future<List<PhotosModel>> getPhotosApi () async 
  {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200)
    { 
      photosList.clear();

      for(Map<String , dynamic> i in data) 
      {
        photosList.add(PhotosModel.fromJson(i));
      }
      return photosList;
    }
    else
    {
      return photosList;
    }
  }



  @override
  Widget build(BuildContext context) {
  
  return SafeArea(
  child: Scaffold(
  appBar: AppBar(
  backgroundColor: Colors.teal,
  title: const Text(
  'Photos Api with Model', 
  style: TextStyle(
  color: Colors.white,
  ),
  ),
  ),

  body: Column(
  children: [
  
  Expanded(
  child: FutureBuilder(
  future: getPhotosApi(), 
  builder: (context , AsyncSnapshot<List<PhotosModel>> snapshot)
  {
    return ListView.builder(
    itemCount: photosList.length,
    itemBuilder: (context , index)
    {
      return ListTile(
      leading: CircleAvatar(
      radius: 24,
      backgroundImage: NetworkImage(
      snapshot.data![index].thumbnailUrl.toString(),
      ),
      ),
      title: Text(
      snapshot.data![index].id.toString(),
      ),
      subtitle: Text(
      snapshot.data![index].title.toString(),
      ),
      );
    }

    );
  }
  
  
  ),
  ),
  ]
  ),
  ),
  );
  }
}