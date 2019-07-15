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

  /*factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      idmanifiesto: json['userId'],
      cchofer: json['id'],
      cfechasalida: json['title'],
      cnumero: json['body'],
      cruta: json['userId'],
      cvehiculo: json['id'],
      corigen: json['title'],
      cdestino: json['body'],
      nbulto: json['userId'],
      npeso: json['id'],
      nimporte: json['title'],
    );
  }*/
}



/*
Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    //print(response.body);
    return Post.fromJson(json.decode(response.body));    
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

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
                      Text(snapshot.data.userId.toString()),
                      Text(snapshot.data.id.toString()),
                     // Text(snapshot.data.title),
                      //Text(snapshot.data.body),
                    ],
                  );                  
                }else if (snapshot.hasError) {
                  print('Esta cargando');
                //return Text("${snapshot.error}");
                }
              },
            )
          ],
        )
         /*Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.id.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),*/
      ),
    );
  }
}*/
