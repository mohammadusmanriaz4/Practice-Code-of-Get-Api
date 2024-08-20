import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class ReuseableWidget extends StatelessWidget {
  String title;
  var value;
  ReuseableWidget({super.key, required this.title, required  this.value});

  @override
  Widget build(BuildContext context) {
  return Padding(
  padding: EdgeInsets.all(8),

  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text(
  title,
  style: TextStyle(
  fontWeight: FontWeight.bold,
  ),
   ),
  Text(value),
  ],
  ),




  ); 
  }
}





class HomeScreen4 extends StatefulWidget {
  static const String id = 'HomeScreen4';
  HomeScreen4({super.key});

  @override
  State<HomeScreen4> createState() => _HomeScreen4State();
}

class _HomeScreen4State extends State<HomeScreen4> {

  var data;

  Future<void> getUserApi () async 
  {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200)
    {
      data = jsonDecode(response.body.toString());
    }
    else
    {

    }
  }

  @override
  Widget build(BuildContext context) {
  return SafeArea(
  child: Scaffold(
  appBar: AppBar(
  backgroundColor: Colors.teal,
  title: Text(
  'User Api without Model',
  style: TextStyle(
  color: Colors.white,
  ),
  ),
  ),

  body: Column(
  children: [
  Expanded(
  child: FutureBuilder(
  future: getUserApi(), 
  builder: (context , snapshot)
  {
    if(snapshot.connectionState == ConnectionState.waiting)
    {
      return Text('Loading....');
    }
    else
    {
      return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index)
      {
        return Card(
        child: Column(
        children: [
          ReuseableWidget(title: 'Id', value:data[index]['id'].toString()),
          ReuseableWidget(title: 'Name', value:data[index]['name'].toString()),
          ReuseableWidget(title: 'User Name', value: data[index]['username'].toString()),
          ReuseableWidget(title: 'Email', value: data[index]['email'].toString()),
          ReuseableWidget(title: 'City', value: data[index]['address']['city'].toString()),
          ReuseableWidget(title: 'Street', value: data[index]['address']['street'].toString()),
          ReuseableWidget(title: 'Suite', value: data[index]['address']['suite'].toString()),
          ReuseableWidget(title: 'Zip Code', value: data[index]['address']['zipcode'].toString()),
          ReuseableWidget(title: 'Geo', value: data[index]['address']['geo'].toString()),
          ReuseableWidget(title: 'Geo Lat', value: data[index]['address']['geo']['lat'].toString()),
          ReuseableWidget(title: 'Geo Lng', value: data[index]['address']['geo']['lng'].toString()),
          ReuseableWidget(title: 'Phone', value: data[index]['phone'].toString()),
          ReuseableWidget(title: 'Website', value: data[index]['website'].toString()),
          ReuseableWidget(title: 'Company', value: data[index]['company']['name'].toString()),
          ReuseableWidget(title: '', value: data[index]['company']['catchPhrase'].toString()),
          ReuseableWidget(title: '', value: data[index]['company']['bs'].toString()),

        ],
        ),
        );
      }
      
      );
      
    }
    
  }
  ),
  ),



  ],
  ),
  ),
  );
  }
}