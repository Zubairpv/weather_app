import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/getlocation.dart';
import 'package:weather_app/weather_data.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var client = weatherData();

  var data;

  info() async {
    var position = await getPosition();
    data =
        await client.getData("${position.latitude}", "${position.longitude}");
    return data;
  }

  @override
  void initState() {
    super.initState();

    info();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Geolocator.requestPermission();
    return Scaffold(
      body: FutureBuilder(
          future: info(),
          builder: (context, snapshot) {
            return SizedBox(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.7,
                    width: size.width,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    padding: EdgeInsets.only(top: size.height * .07),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(size.height * 0.03),
                          bottomRight: Radius.circular(size.height * 0.03)),
                      gradient: LinearGradient(
                          colors: [Colors.purple, Colors.blue],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0.2, 0.8]),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${data?.cityName}',
                          style: GoogleFonts.mavenPro(
                              color: Colors.white,
                              fontSize: size.height * .040),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        Text(
                          "${DateTime.now()}",
                          style: GoogleFonts.mavenPro(
                              color: Colors.white,
                              fontSize: size.height * .020),
                        ),
                        Image.asset(
                          '${data?.icon}',
                          width: size.width * .4,
                        ),
                        Text(
                          '${data?.condition}',
                          style: GoogleFonts.hubballi(
                              color: Colors.white,
                              fontSize: size.height * .045,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${data?.temp}',
                          style: GoogleFonts.hubballi(
                              color: Colors.white,
                              fontSize: size.height * .060,
                              fontWeight: FontWeight.w800),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/wind.png',
                                    width: size.width * .15,
                                  ),
                                  Text(
                                    '${data?.wind}',
                                    style: GoogleFonts.hubballi(
                                        color: Colors.white,
                                        fontSize: size.height * .023,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Wind',
                                    style: GoogleFonts.mavenPro(
                                        color: Colors.white,
                                        fontSize: size.height * .020,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Image.asset(
                                  'assets/humidity.png',
                                  width: size.width * .15,
                                ),
                                Text(
                                  '${data?.humidity}',
                                  style: GoogleFonts.hubballi(
                                      color: Colors.white,
                                      fontSize: size.height * .023,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Humidity',
                                  style: GoogleFonts.mavenPro(
                                      color: Colors.white,
                                      fontSize: size.height * .020,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                            Expanded(
                                child: Column(
                              children: [
                                Image.asset(
                                  'assets/direction.png',
                                  width: size.width * .15,
                                ),
                                Text(
                                  '${data?.windDir}',
                                  style: GoogleFonts.hubballi(
                                      color: Colors.white,
                                      fontSize: size.height * .023,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Wind Direction',
                                  style: GoogleFonts.mavenPro(
                                      color: Colors.white,
                                      fontSize: size.height * .018,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.circle,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Gust',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: size.height * .020),
                          ),
                          SizedBox(
                            height: size.height * .007,
                          ),
                          Text(
                            '${data?.gust} kp/h',
                            style: GoogleFonts.mavenPro(
                                fontSize: size.height * .026,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: size.height * .023,
                          ),
                          Text(
                            'Pressure',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: size.height * .020),
                          ),
                          SizedBox(
                            height: size.height * .007,
                          ),
                          Text(
                            '${data?.pressure} hpa',
                            style: GoogleFonts.mavenPro(
                                fontSize: size.height * .026,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'UV',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: size.height * .020),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.uv}',
                            style: GoogleFonts.mavenPro(
                                fontSize: size.height * .026,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Precipitation',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: size.height * .020),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.precipe} mm',
                            style: GoogleFonts.mavenPro(
                                fontSize: size.height * .026,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            'Wind',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: size.height * .020),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.wind}Km/h',
                            style: GoogleFonts.mavenPro(
                                fontSize: size.height * .026,
                                color: Colors.white.withOpacity(0.5)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Last Update',
                            style: GoogleFonts.mavenPro(
                                color: Colors.white,
                                fontSize: size.height * .020),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${data?.lastUpdate}',
                            style: GoogleFonts.mavenPro(
                                fontSize: size.height * .020,
                                color: Color.fromARGB(255, 12, 124, 36)
                                    .withOpacity(0.5)),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.circle,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
