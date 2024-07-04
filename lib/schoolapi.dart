import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freeapiintegration/schoolapimodelclass.dart';
import 'package:http/http.dart' as http;
Future<School> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://fakestoreapi.com/products?sort=desc'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return School.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
class SchoolFunction extends StatefulWidget {
  const SchoolFunction({super.key});

  @override
  State<SchoolFunction> createState() => _SchoolState();
}

class _SchoolState extends State<SchoolFunction> {
  late Future<School> futureAlbum;

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
          child: FutureBuilder<School>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    children: [
                      Text(
                          snapshot.data!.id?.toInt() as String),

                      Text(snapshot.data!.title.toString()),
                      Text(snapshot.data!.price?.toDouble() as String),
                      Text(snapshot.data!.description.toString()),
                      Text(snapshot.data!.category.toString()),
                      Text(snapshot.data!.image.toString()),
                      Text(snapshot.data!.rating.toString()),
                    ],
                  ),
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
