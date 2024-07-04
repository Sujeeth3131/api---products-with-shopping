import 'dart:convert';

import 'package:flutter/material.dart';

import 'jewelleryapimodel.dart';

import 'package:http/http.dart' as http;

Future<Jewellery> fetchAlbum() async {

  final response = await http
      .get(Uri.parse('https://fakestoreapi.com/products/category/jewelery'));

  if (response.statusCode == 200) {

    return Jewellery.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {

    throw Exception('Failed to load album');
  }
}

class JewelleryKing extends StatefulWidget {
  const JewelleryKing({super.key});

  @override
  State<JewelleryKing> createState() => _JewelleryState();
}

class _JewelleryState extends State<JewelleryKing> {
  late Future<Jewellery> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Jewellery>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Text(snapshot.data!.id?.toInt() as String),
                    Text(snapshot.data!.title.toString()),
                    Text(snapshot.data!.price?.toInt() as String),
                    Text(snapshot.data!.description.toString()),
                    Text(snapshot.data!.category.toString()),
                    Text(snapshot.data!.image.toString()),
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
