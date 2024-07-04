import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model_class.dart';
Future<Cartsonly> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://fakestoreapi.com/carts'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Cartsonly.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Work_Class_API extends StatefulWidget {
  const Work_Class_API({super.key});

  @override
  State<Work_Class_API> createState() => _Work_Class_APIState();
}

class _Work_Class_APIState extends State<Work_Class_API> {
  late Future<Cartsonly> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Cartsonly>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return
                  Column(
                    children: [
                      Text(snapshot.data!.id.toString()),
                      Text(snapshot.data!.userId.toString()),
                      //
                    ],
                  );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
