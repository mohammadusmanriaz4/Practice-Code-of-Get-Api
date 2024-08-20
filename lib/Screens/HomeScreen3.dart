import 'package:api_app/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';




class HomeScreen3 extends StatefulWidget {
  static const String id = 'HomeScreen3';
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  List <UserModel>  photosList = [];

  Future<List<UserModel>> getUserModelApis () async 
  {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200)
    { 
      photosList.clear();

      for(Map<String , dynamic> i in data) 
      {
        photosList.add(UserModel.fromJson(i));
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
  'User Api with Model',
  style: TextStyle(
  color: Colors.white,
  ),
  ),
  ),

  body: Column(
  children: [
  
  Expanded(
  child: FutureBuilder(
  future: getUserModelApis(), 
  builder: (context , AsyncSnapshot<List<UserModel>> snapshot)
  {
    return ListView.builder(
    itemCount: photosList.length,
    itemBuilder: (context , index)
    {
      return Card(
      child: Column(
      children: [
      

      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      const Text(
      'Id:', 
      style: TextStyle(
      fontWeight: FontWeight.bold,
      ),
      ),
      Text(
      snapshot.data![index].id.toString(),
      ),
      ],
      ),

      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      const Text(  
      'Name:', 
      style: TextStyle(
      fontWeight: FontWeight.bold,
      ),
      ),
      Text(
      snapshot.data![index].name.toString(),
      ),
      ],
      ),

      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      const Text(
      'User Name:', 
      style: TextStyle(
      fontWeight: FontWeight.bold,
      ),
      ),
      Text(
      snapshot.data![index].username.toString(),
      ),
      ],
      ),

      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      const Text(
      'User Email:', 
      style: TextStyle(
      fontWeight: FontWeight.bold,
      ),
      ),
      Text(
      snapshot.data![index].email.toString(),
      ),
      ],
      ),
      

      ],
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