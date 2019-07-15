import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'link.dart';


void main() => runApp(MyApp(post: fetchPost()));

class MyApp extends StatelessWidget {
  final Future<Post> post;

  MyApp({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Column(
          children: <Widget>[
            Text('Hola'),
            FutureBuilder<Post>(
              future: post,
              builder: (context, snapshot){
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      Text(snapshot.data.idmanifiesto.toString()),
                      Text(snapshot.data.cchofer),
                    ],
                  );                  
                }else if (snapshot.hasError) {
                return Text("${snapshot.error}");
                }
              },
            )
          ],
        )
      ),
    );
  }
}

Future<Post> fetchPost() async {
  final response =
      await http.get(link);

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    //print(response.body);
    //return Post.fromJson(json.decode(response.body));
    List convert = (jsonDecode(response.body));
    print(convert);
    return Post.fromJson(convert);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }

}

class Post {
  final int idmanifiesto;
  final String cchofer;
  final DateTime cfechasalida;
  final String cnumero;
  final String cruta;
  final String cvehiculo;
  final String corigen;
  final String cdestino;
  final num nbulto;
  final num npeso;
  final num nimporte;


  Post({this.idmanifiesto, this.cchofer, this.cfechasalida, this.cnumero,
  this.cruta, this.cvehiculo, this.corigen, this.cdestino,
  this.nbulto, this.npeso, this.nimporte,});

  factory Post.fromJson(List json) {
    return Post(
      idmanifiesto: json[0]['userId'],
      cchofer: json[0]['id'],
      cfechasalida: json[0]['title'],
      cnumero: json[0]['body'],
      cruta: json[0]['userId'],
      cvehiculo: json[0]['id'],
      corigen: json[0]['title'],
      cdestino: json[0]['body'],
      nbulto: json[0]['userId'],
      npeso: json[0]['id'],
      nimporte: json[0]['title'],
    );
  }

  
