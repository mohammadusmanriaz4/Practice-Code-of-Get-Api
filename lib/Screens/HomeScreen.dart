import 'dart:convert';
import 'package:api_app/Screens/HomeScreen2.dart';
import 'package:api_app/Screens/HomeScreen3.dart';
import 'package:api_app/Screens/HomeScreen4.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_app/Models/posts_model.dart';


//Install Package of http in pubspec.yaml file


class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  List <PostsModel>  postList = [];

  Future<List<PostsModel>> getPostApi () async 
  {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200)
    { 
      postList.clear();

      for(Map<String , dynamic> i in data) 
      {
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }
    else
    {
      return postList;
    }
  }
  
  
  
  @override
  Widget build(BuildContext context) {
  
  return SafeArea(
  child: Scaffold(
  drawer:  Drawer(
  
  child: ListView(
  children:  [
  UserAccountsDrawerHeader(
  decoration: BoxDecoration(
  color: Colors.teal,
  ),
    
  
  accountName: Text(
  'Get Apis Integration',
  style: TextStyle(
  fontSize: 24,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  ),
  ), 
  accountEmail: Text(
  'Using Models and \nwithout Models',
  style: TextStyle(
  fontSize: 16,
  color: Colors.white,
  ),
  ),
  ),

 ListTile(
  title: Text(
  'Select Api Model Here:',
  style: TextStyle(
  fontSize: 18,
  color: Colors.white,
  ),
  ),
  tileColor: Colors.pink,
 ),

const SizedBox(
  height: 10,
  ),
    
ListTile(
  tileColor: Colors.pink,
  title: const Text(
  'Posts Api with Model',
  style: TextStyle(
  fontSize: 18,
  color: Colors.white,
  ),
  ),
  onTap: () {
  Navigator.pushNamed(context, HomeScreen.id);
  },
),

const SizedBox(
height: 10,
),
    
ListTile(
  tileColor: Colors.pink,
  title: const Text(
  'Photos Api with Model',
  style: TextStyle(
  fontSize: 18,
  color: Colors.white,
  ),
  ),
  onTap: () {
  Navigator.pushNamed(context, HomeScreen2.id);
  },
),

const SizedBox(
height: 10,
),

ListTile(
  tileColor: Colors.pink,
  title: const Text(
  'User Api with Model',
  style: TextStyle(
  fontSize: 18,
  color: Colors.white,
  ),
  ),
  onTap: () {
  Navigator.pushNamed(context, HomeScreen3.id);
  },
),

const SizedBox(
height: 10,
),

  ListTile(
  tileColor: Colors.pink,
  title: const Text(
  'User Api without Model',
  style: TextStyle(
  fontSize: 18,
  color: Colors.white,
  ),
  ),
  onTap: () {
  Navigator.pushNamed(context, HomeScreen4.id);
  },
  ),



  ],
  ),
  ),






  appBar: AppBar(
  backgroundColor: Colors.teal,
  title: Text(
  'Posts Apis with Model',
  style: TextStyle(
  color: Colors.white,
  ),
  ),
  ),

  body: Column(
  children: [
  
  Expanded(
  child: FutureBuilder(
  future: getPostApi(), 
  builder: (context, snapshot)
  {
    if(!snapshot.hasData)
    {
      return  Text('Loading');
    }
    else
    { 
      return ListView.builder(
      itemCount: postList.length,
      itemBuilder: (context, index)
      {
        return Card(
        child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Text(
        'Title', 
        style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        ),
        ),

        Text(postList[index].title.toString()),

        const SizedBox(height: 10,),


        const Text(
        'Description', 
        style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        ),
        ),

        Text(postList[index].body.toString()),

        ],
        ),
        ),
        );
      }
      );
    }
  }
  ),
  ),
  
  
  
  ]
  ),
  ),
  );
  }
}