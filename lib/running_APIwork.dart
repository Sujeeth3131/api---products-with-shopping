import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freeapiintegration/running_APImodel.dart';
import 'package:http/http.dart' as http;

import 'img_1.dart';
import 'img_2.dart';
import 'img_3.dart';
import 'img_4.dart';

Future<RunningAPI> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://api.storerestapi.com/products/running-sneaker'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return RunningAPI.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Running extends StatefulWidget {
  const Running({super.key});

  @override
  State<Running> createState() => _RunningState();
}

class _RunningState extends State<Running> {
  late Future<RunningAPI> futureAlbum;

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

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Text("Products List",style: TextStyle(color: Colors.blueAccent,fontSize: 28,fontWeight: FontWeight.bold),),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Image_1(),
                          ),
                        );
                      },
                      child: Container(
                          child: Image(
                              height: 200,
                              width: 250,
                              image: AssetImage("img/running_2.jpg"))),
                    )
                  ],
                ),
                FutureBuilder<RunningAPI>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          ElevatedButton(onPressed: (){GestureDetector;{
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Image_1(),),);
                          }}, child:Text("View fullProduct description",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),)),


                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return const CircularProgressIndicator();
                  },
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Image_3(),
                          ),
                        );
                      },
                      child: Container(
                          child: Image(
                              height: 200,
                              width: 250,
                              image: AssetImage("img/mobile.jpg"))),
                    ),
                    SizedBox(height: 20,),
                    FutureBuilder<RunningAPI>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              ElevatedButton(onPressed: (){GestureDetector;{
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Image_3(),),);
                              }}, child:Text("View fullProduct description",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),)),


                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),

                  ],
                ),




                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Image_4(),
                          ),
                        );
                      },
                      child: Container(
                          child: Image(
                              height: 200,
                              width: 250,
                              image: AssetImage("img/mobile phone 1.jpg"))),
                    ),
                    SizedBox(height: 20,),
                    FutureBuilder<RunningAPI>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              ElevatedButton(onPressed: (){GestureDetector;{
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Image_4(),),);
                              }}, child:Text("View fullProduct description",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),)),


                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Image_3(),
                              ),
                            );
                          },
                          child: Container(
                              child: Image(
                                  height: 200,
                                  width: 250,
                                  image: AssetImage("img/shoe_2.jpg"))),
                        ),
                        SizedBox(height: 20,),
                        FutureBuilder<RunningAPI>(
                          future: futureAlbum,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  ElevatedButton(onPressed: (){GestureDetector;{
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Image_2(),),);
                                  }}, child:Text("View fullProduct description",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24),)),


                                ],
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }

                            // By default, show a loading spinner.
                            return const CircularProgressIndicator();
                          },
                        ),

                      ],
                    ),


                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
