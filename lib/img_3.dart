import 'package:flutter/material.dart';
import 'package:freeapiintegration/running_APImodel.dart';
import 'package:freeapiintegration/running_APIwork.dart';
class Image_3 extends StatefulWidget {
  const Image_3({super.key});

  @override
  State<Image_3> createState() => _Image_3State();
}

class _Image_3State extends State<Image_3> {
  late Future<RunningAPI> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Running(),),);
        },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: Colors.black26,
            )),
      ),

      body:
      Column(
        children: [
          Container(
              child: Center(
                child: Image(
                    height: 200,
                    width: 250,
                    image: AssetImage("img/mobile.jpg")),
              )),
          FutureBuilder<RunningAPI>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          GestureDetector;
                          {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => Image_3(),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "View fullProduct description",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        )),

                    SizedBox(
                      height: 20,
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Id = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(),
                              TextSpan(
                                text: snapshot.data!.data!.price.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   "Id "+snapshot.data!.data!.sId.toString(),
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text:'Title = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(),
                              TextSpan(
                                text: snapshot.data!.data!.title.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Price = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: snapshot.data!.data!.price.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'sId = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: snapshot.data!.data!.category!.sId.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Category Name = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text:
                                snapshot.data!.data!.category!.name.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Category Slug = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text:
                                snapshot.data!.data!.category!.slug.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Description= ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: snapshot.data!.data!.description.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Role = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text:
                                snapshot.data!.data!.createdBy!.role.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'sId = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: snapshot.data!.data!.category!.sId.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Name= ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text:
                                snapshot.data!.data!.category!.name.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Created at = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: snapshot.data!.data!.createdAt.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Slug = ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                            children: [
                              TextSpan(
                                text: snapshot.data!.data!.slug.toString(),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
    );
  }
}
