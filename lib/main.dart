import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://api.weatherapi.com/v1/current.json?key=856428df1ccd4f52a4f75237231909&q=chennai&aqi=no'));

    Map user = jsonDecode(response.body);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        toolbarHeight: 150,
        title: const Text(
          'WEATHER BROADCASTING ',
          style: TextStyle(letterSpacing: 5.0),
        ),
      ),
      body: FutureBuilder(
          future: apicall(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Map user1 = snapshot.data;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 50,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: Text(
                                      user1['location']['name'].toString(),
                                      style: const TextStyle(fontSize: 30),
                                    ),
                                  )),
                              Container(
                                  height: 50,
                                  width: 170,
                                  child: Text(
                                    user1['location']['region'].toString(),
                                    style: GoogleFonts.roboto(fontSize: 30),
                                  )),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  size: 45,
                                ),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 2.0,
                          color: Colors.black87,
                        ),
                      ],
                    )),
                    Stack(children: [
                      Container(
                        color: Colors.blue,
                        child: Image.network(
                          'https://img.freepik.com/free-photo/sunshine-clouds-sky-during-morning-background-blue-white-pastel-heaven-soft-focus-lens-flare-sunlight-abstract-blurred-cyan-gradient-peaceful-nature-open-view-out-windows-beautiful-summer-spring_1253-1092.jpg?size=626&ext=jpg&ga=GA1.1.386372595.1697673600&semt=ais',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          left: 50,
                          top: 100,
                          child: Text(
                            user1['current']['temp_c'].toString(),
                            style: const TextStyle(fontSize: 50),
                          )),
                      const Positioned(
                          left: 150,
                          top: 100,
                          child: Text(
                            'C',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      const Positioned(
                          left: 50,
                          top: 150,
                          child: Text(
                            'Temperature',
                            style: TextStyle(fontSize: 20),
                          )),
                      Positioned(
                          right: 150,
                          top: 100,
                          child: Text(
                            user1['current']['humidity'].toString(),
                            style: const TextStyle(fontSize: 25),
                          )),
                      const Positioned(
                          right: 27,
                          top: 100,
                          child: Text(
                            '| Humidity',
                            style: TextStyle(fontSize: 25),
                          )),
                      Positioned(
                          right: 150,
                          top: 125,
                          child: Text(
                            user1['current']['temp_f'].toString(),
                            style: const TextStyle(fontSize: 25),
                          )),
                      const Positioned(
                          right: 10,
                          top: 125,
                          child: Text(
                            '| Fahrenheit',
                            style: TextStyle(fontSize: 25),
                          )),
                      Positioned(
                          top: 150,
                          right: 150,
                          child: Text(
                            user1['current']['cloud'].toString(),
                            style: const TextStyle(fontSize: 25),
                          )),
                      const Positioned(
                          right: 60,
                          top: 150,
                          child: Text(
                            '| Cloud',
                            style: TextStyle(fontSize: 25),
                          )),
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 250),
                          child: Text(
                            'Location : ',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Country :',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                user1['location']['country'].toString(),
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Latitude :',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                user1['location']['lat'].toString(),
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Longitude :',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                user1['location']['lon'].toString(),
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 200),
                          child: Text('Current Details : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25)),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Wind Degree :',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                user1['current']['wind_degree'].toString(),
                                style: const TextStyle(fontSize: 25),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Pressure :',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Text(
                                user1['current']['pressure_mb'].toString(),
                                style: const TextStyle(fontSize: 25),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Wind Direction :',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                user1['current']['wind_dir'].toString(),
                                style: const TextStyle(fontSize: 25),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Local Time Epoch :',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                user1['location']['localtime_epoch'].toString(),
                                style: const TextStyle(fontSize: 25),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                'Local Time :',
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text(
                                user1['location']['localtime'].toString(),
                                style: const TextStyle(fontSize: 25),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
